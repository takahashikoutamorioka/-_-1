<!-- 結果表示 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:import url="/common/base.jsp">
    <c:param name="title">ワーキングメモリ結果</c:param>

    <c:param name="content">
        <section class="bg-white border rounded p-4 mx-auto"
                 style="max-width: 650px;">

            <h2 class="text-center fw-bold mb-4">
                ワーキングメモリ 結果
            </h2>

            <div id="resultArea" class="text-center">
                <h3 class="text-success fw-bold">
                    <span id="score">0</span> / 100点
                </h3>

                <hr>

                <p>実年齢：<span id="age"></span>歳</p>
                <p>到達レベル：<span id="level"></span></p>
                <p>クリアしたレベル：<span id="cleared"></span></p>
                <p>ミス回数：<span id="mistakes"></span>回</p>

                <p class="small text-secondary">
                    ※この点数はゲーム独自の参考スコアであり、
                    医学的な認知機能の評価ではありません。
                </p>
            </div>

            <div class="d-flex gap-3 mt-4">
                <a href="workingMemory.jsp"
                   class="btn btn-success w-50">
                    もう一度挑戦
                </a>

                <a href="brainTraining.jsp"
                   class="btn btn-secondary w-50">
                    脳トレ一覧に戻る
                </a>
            </div>
        </section>
    </c:param>

    <c:param name="scripts">
        <script>
            const result = JSON.parse(
                sessionStorage.getItem("workingMemoryResult") || "null"
            );

            if (!result) {
                document.getElementById("resultArea").textContent =
                    "結果がありません。ゲームから挑戦してください。";
            } else {
                document.getElementById("score").textContent = result.score;
                document.getElementById("age").textContent = result.age;
                document.getElementById("level").textContent = result.level;
                document.getElementById("cleared").textContent = result.cleared;
                document.getElementById("mistakes").textContent = result.mistakes;
            }
        </script>
    </c:param>
</c:import>
