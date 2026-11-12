<!-- ワーキングメモリ -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:import url="/common/base.jsp">
    <c:param name="title">ワーキングメモリ</c:param>

    <c:param name="content">
        <section class="bg-white border rounded p-4 mx-auto"
                 style="max-width: 650px;">

            <h2 class="text-center fw-bold mb-3">
                ワーキングメモリ
            </h2>

            <p class="text-center text-secondary">
                光ったマスの順番を覚えて、
                同じ順番で押してください。
            </p>

            <div id="ageArea" class="text-center mb-4">
                <label for="ageInput" class="form-label fw-bold">
                    実年齢を入力してください
                </label>

                <div class="input-group mx-auto mb-2"
                     style="max-width: 220px;">
                    <input type="number" id="ageInput"
                           class="form-control"
                           min="1" max="120"
                           placeholder="例：65">
                    <span class="input-group-text">歳</span>
                </div>

                <p id="ageError" class="text-danger small"></p>

                <button class="btn btn-success px-5"
                        onclick="startGame()">
                    ゲームスタート
                </button>
            </div>

            <div id="gameArea" style="display:none;">

                <div class="d-flex justify-content-between mb-3">
                    <strong id="level">レベル：1</strong>
                    <strong id="chance">残りチャンス：2</strong>
                </div>

                <p id="message" class="text-center fw-bold">
                    順番を覚えてください
                </p>

                <div id="gameBoard" class="mx-auto mb-4"
                     style="
                        display:grid;
                        grid-template-columns:repeat(5,1fr);
                        gap:6px;
                        max-width:400px;
                     ">
                </div>
            </div>

            <div class="text-center mt-4">
                <a href="brainTraining.jsp"
                   class="btn btn-secondary">
                    脳トレ一覧に戻る
                </a>
            </div>
        </section>
    </c:param>

    <c:param name="scripts">
        <script>
            const board = document.getElementById("gameBoard");
            const message = document.getElementById("message");
            const levelText = document.getElementById("level");
            const chanceText = document.getElementById("chance");

            let sequence = [];
            let answerIndex = 0;
            let level = 1;
            let chances = 2;
            let age = 0;
            let isAnswering = false;
            let gameId = 0;

            const sleep = ms =>
                new Promise(resolve => setTimeout(resolve, ms));

            // 25マスを作成
            for (let i = 0; i < 25; i++) {
                const cell = document.createElement("button");
                cell.type = "button";
                cell.className = "border rounded";
                cell.style.aspectRatio = "1";
                cell.style.backgroundColor = "#e9ecef";
                cell.style.cursor = "pointer";

                cell.addEventListener("click", () => selectCell(i));
                board.appendChild(cell);
            }

            const cells = board.children;

            function resetColors() {
                for (const cell of cells) {
                    cell.style.backgroundColor = "#e9ecef";
                }
            }

            function updateStatus() {
                levelText.textContent = "レベル：" + level;
                chanceText.textContent = "残りチャンス：" + chances;
            }

            function addRandomCell() {
                sequence.push(Math.floor(Math.random() * 25));
            }

            async function startGame() {
                const input = document.getElementById("ageInput");
                const ageError = document.getElementById("ageError");
                const enteredAge = Number(input.value);

                if (input.value.trim() === "" ||
                    !Number.isInteger(enteredAge) ||
                    enteredAge < 1 || enteredAge > 120) {
                    ageError.textContent =
                        "1～120歳の整数で入力してください。";
                    return;
                }

                age = enteredAge;
                ageError.textContent = "";

                document.getElementById("ageArea").style.display = "none";
                document.getElementById("gameArea").style.display = "block";

                gameId++;
                const currentGame = gameId;

                sequence = [];
                answerIndex = 0;
                level = 1;
                chances = 2;
                isAnswering = false;

                resetColors();
                updateStatus();

                addRandomCell();
                addRandomCell();

                await showSequence(currentGame);
            }

            async function showSequence(currentGame) {
                isAnswering = false;
                answerIndex = 0;

                resetColors();
                message.textContent = "順番を覚えてください";

                await sleep(700);

                for (const position of sequence) {
                    if (currentGame !== gameId) return;

                    cells[position].style.backgroundColor = "#38b878";
                    await sleep(650);

                    if (currentGame !== gameId) return;

                    cells[position].style.backgroundColor = "#e9ecef";
                    await sleep(350);
                }

                if (currentGame !== gameId) return;

                message.textContent =
                    "覚えた順番でマスを押してください";
                isAnswering = true;
            }

            async function selectCell(index) {
                if (!isAnswering) return;

                isAnswering = false;

                if (index === sequence[answerIndex]) {
                    cells[index].style.backgroundColor = "#438be6";

                    await sleep(300);
                    cells[index].style.backgroundColor = "#e9ecef";

                    answerIndex++;

                    if (answerIndex === sequence.length) {
                        if (level === 10) {
                            finishGame();
                            return;
                        }

                        level++;
                        updateStatus();

                        message.textContent = "正解！次のレベルへ！";
                        addRandomCell();

                        await sleep(1000);
                        await showSequence(gameId);
                    } else {
                        isAnswering = true;
                    }

                } else {
                    cells[index].style.backgroundColor = "#e05252";
                    chances--;
                    updateStatus();

                    await sleep(700);

                    if (chances === 0) {
                        finishGame();
                    } else {
                        message.textContent =
                            "残念！新しい問題に挑戦しましょう";
                        sequence = [];

                        for (let i = 0; i < level + 1; i++) {
                            addRandomCell();
                        }

                        await sleep(900);
                        await showSequence(gameId);
                    }
                }
            }

            // 年齢別の仮の目標レベル
            function getTargetLevel(age) {
                if (age < 40) return 10;
                if (age < 60) return 9;
                if (age < 75) return 8;
                return 7;
            }

            // 100点満点の参考スコア
            function calculateScore(cleared, mistakes) {
                const target = getTargetLevel(age);

                const baseScore = (cleared / target) * 100;
                const penalty = mistakes * 5;

                return Math.max(
                    0,
                    Math.min(100, Math.round(baseScore - penalty))
                );
            }

            function finishGame() {
                isAnswering = false;

                const cleared = chances === 0
                    ? level - 1
                    : level;

                const mistakes = 2 - chances;
                const score = calculateScore(cleared, mistakes);

                const result = {
                    age: age,
                    level: level,
                    cleared: cleared,
                    mistakes: mistakes,
                    score: score
                };

                sessionStorage.setItem(
                    "workingMemoryResult",
                    JSON.stringify(result)
                );

                window.location.href = "workingMemoryResult.jsp";
            }
        </script>
    </c:param>
</c:import>
