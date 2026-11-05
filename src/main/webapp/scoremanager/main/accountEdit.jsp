<!-- アカウント情報変更 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>アカウント情報変更</title>

<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    min-height: 100vh;
    font-family: "Meiryo", sans-serif;
    color: #173b45;
    background: linear-gradient(
        to bottom, #d9ecf5, #e4f3e4
    );
}

header {
    background: #f7fbfd;
    padding: 15px 30px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.app-title {
    font-size: 18px;
    font-weight: bold;
}

.header-right {
    display: flex;
    align-items: center;
    gap: 15px;
}

.logout {
    background: #e3e3e6;
    color: #173b45;
    padding: 10px 20px;
    border-radius: 6px;
    text-decoration: none;
    font-weight: bold;
}

.container {
    width: 550px;
    max-width: calc(100% - 32px);
    background: white;
    margin: 25px auto;
    padding: 30px 25px;
    border-radius: 10px;
    box-shadow: 0 3px 12px #0002;
}

h2 {
    text-align: center;
    font-size: 22px;
    margin: 0 0 8px;
}

.description {
    text-align: center;
    font-size: 13px;
    color: #56717a;
    margin-bottom: 25px;
}

.form-row {
    margin-bottom: 15px;
}

.form-row label {
    display: block;
    font-size: 14px;
    font-weight: bold;
    margin-bottom: 6px;
}

.form-row input {
    width: 100%;
    padding: 12px;
    font-size: 14px;
    border: 1px solid #aebfc6;
    border-radius: 6px;
    outline: none;
}

.form-row input:focus {
    border-color: #2164dc;
    box-shadow: 0 0 0 2px #2164dc22;
}

.error-message {
    color: #d93025;
    font-size: 13px;
    margin-bottom: 12px;
}

.buttons {
    display: flex;
    gap: 10px;
    margin-top: 20px;
}

.btn {
    flex: 1;
    padding: 12px;
    border: none;
    border-radius: 6px;
    font-size: 14px;
    font-weight: bold;
    text-align: center;
    text-decoration: none;
    cursor: pointer;
}

.save-btn {
    background: #2164dc;
    color: white;
}

.back-btn {
    background: #e3e3e6;
    color: #173b45;
}

.btn:hover {
    opacity: 0.85;
}

/* フッター */
footer {
    text-align: center;
    font-size: 11px;
    padding: 10px;
    color: #56717a;
}

@media (max-width: 600px) {
    header {
        padding: 12px;
    }

    .app-title {
        font-size: 13px;
    }

    .header-right {
        gap: 6px;
        font-size: 11px;
    }

    .logout {
        padding: 8px;
    }

    .container {
        padding: 25px 20px;
    }

    .buttons {
        flex-direction: column;
    }
}
</style>
</head>

<body>

<!-- ヘッダー -->
<header>
    <div class="app-title">
        🟢 認知症予防トレーニングアプリ
    </div>

    <div class="header-right">
        <span>
            <c:out value="${sessionScope.account.name}"
                   default="ユーザー" />さん
        </span>

        <a href="Logout.action" class="logout">
            ログアウト
        </a>
    </div>
</header>

<!-- アカウント情報変更 -->
<div class="container">

    <h2>アカウント情報変更</h2>

    <p class="description">
        変更したい項目を入力してください
    </p>

    <form action="AccountUpdate.action" method="post">

        <!-- 名前 -->
        <div class="form-row">
            <label for="name">名前</label>
            <input
                type="text"
                id="name"
                name="user_name"
                maxlength="50"
                value="<c:out value='${sessionScope.account.name}'/>"
                placeholder="現在の名前"
                required>
        </div>

        <!-- メールアドレス -->
        <div class="form-row">
            <label for="email">メールアドレス</label>
            <input
                type="email"
                id="email"
                name="email"
                maxlength="254"
                placeholder="現在のメールアドレス"
                required>
        </div>

        <!-- 電話番号 -->
        <div class="form-row">
            <label for="tel">電話番号</label>
            <input
                type="tel"
                id="tel"
                name="tel"
                maxlength="15"
                placeholder="現在の電話番号"
                required>
        </div>

        <!-- パスワード -->
        <div class="form-row">
            <label for="password">パスワード</label>
            <input
                type="password"
                id="password"
                name="password"
                placeholder="新しいパスワード">
        </div>

        <!-- エラーメッセージ -->
        <c:if test="${not empty errorMsg}">
            <p class="error-message">
                <c:out value="${errorMsg}" />
            </p>
        </c:if>

        <!-- ボタン -->
        <div class="buttons">

            <button
                type="submit"
                name="save"
                class="btn save-btn">
                保存する
            </button>

            <a href="accountInfo.jsp"
               class="btn back-btn">
                キャンセル
            </a>

        </div>

    </form>

</div>

<!-- フッター -->
<footer>
    &copy; 2024 認知症予防トレーニングアプリ
</footer>

</body>
</html>
