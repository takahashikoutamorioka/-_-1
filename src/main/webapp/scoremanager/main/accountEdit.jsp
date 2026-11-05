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
    font-family: "Meiryo", "Hiragino Kaku Gothic ProN", sans-serif;
    color: #1f3a33;
    background: linear-gradient(to bottom, #d9ecf5, #e4f3e4);
    display: flex;
    flex-direction: column;
}
header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 24px;
    background: rgba(255, 255, 255, 0.7);
}
.app-title {
    display: flex;
    align-items: center;
    gap: 10px;
    font-size: 20px;
    font-weight: bold;
}
.app-logo {
    width: 32px;
    height: 32px;
    border-radius: 50%;
    background: #2e9e74;
    color: #fff;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 18px;
    flex-shrink: 0;
}
.header-right {
    display: flex;
    align-items: center;
    gap: 16px;
    font-size: 14px;
}
.logout {
    padding: 10px 28px;
    font-size: 18px;
    font-weight: bold;
    color: #222;
    background: #e3e3e6;
    border-radius: 6px;
    text-decoration: none;
    white-space: nowrap;
}
.logout:hover {
    background: #d3d3d8;
}
main {
    flex: 1;
    display: flex;
    justify-content: center;
    padding: 24px 16px;
}
.container {
    width: 100%;
    max-width: 550px;
    background: white;
    padding: 30px 25px;
    border-radius: 12px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.12);
    align-self: flex-start;
}
h2 {
    margin: 0 0 8px;
    text-align: center;
    font-size: 22px;
}
.description {
    text-align: center;
    font-size: 13px;
    margin-bottom: 24px;
}
.form-row {
    margin-bottom: 16px;
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
    border: 1px solid #aebfc6;
    border-radius: 6px;
    font-size: 14px;
}
.form-row input:focus {
    outline: none;
    border-color: #2164dc;
    box-shadow: 0 0 0 2px #2164dc22;
}
.error-message {
    color: #d93025;
    font-size: 13px;
}
.buttons {
    display: flex;
    gap: 10px;
    margin-top: 24px;
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
    color: #1f3a33;
}
.btn:hover {
    opacity: 0.85;
}
footer {
    padding: 16px;
    text-align: center;
    font-size: 12px;
    color: #55706a;
}
@media (max-width: 640px) {
    header {
        padding: 10px 12px;
        gap: 8px;
    }
    .app-title {
        font-size: 13px;
        gap: 6px;
    }
    .header-right {
        gap: 6px;
        font-size: 11px;
    }
    .logout {
        padding: 8px;
        font-size: 12px;
    }
    .buttons {
        flex-direction: column;
    }
}
</style>
</head>
<body>

<header>
    <div class="app-title">
        <span class="app-logo">&#10047;</span>
        <span>認知症予防トレーニングアプリ</span>
    </div>
    <div class="header-right">
        <span>
            <c:out value="${sessionScope.account.name}" default="ユーザー"/>さん
        </span>
        <a class="logout"
           href="${pageContext.request.contextPath}/scoremanager/main/Logout.action">
            ログアウト
        </a>
    </div>
</header>

<main>
    <div class="container">
        <h2>アカウント情報変更</h2>
        <p class="description">変更したい項目を入力してください</p>

        <form action="AccountUpdate.action" method="post">
            <div class="form-row">
                <label for="name">名前</label>
                <input type="text" id="name" name="user_name"
                       maxlength="50"
                       value="<c:out value='${sessionScope.account.name}'/>"
                       required>
            </div>

            <div class="form-row">
                <label for="email">メールアドレス</label>
                <input type="email" id="email" name="email"
                       maxlength="254"
                       placeholder="メールアドレスを入力"
                       required>
            </div>

            <div class="form-row">
                <label for="tel">電話番号</label>
                <input type="tel" id="tel" name="tel"
                       maxlength="15"
                       placeholder="電話番号を入力"
                       required>
            </div>

            <div class="form-row">
                <label for="password">新しいパスワード</label>
                <input type="password" id="password" name="password"
                       placeholder="変更する場合のみ入力">
            </div>

            <c:if test="${not empty errorMsg}">
                <p class="error-message">
                    <c:out value="${errorMsg}"/>
                </p>
            </c:if>

            <div class="buttons">
                <button type="submit" class="btn save-btn">保存する</button>
                <a href="accountInfo.jsp" class="btn back-btn">キャンセル</a>
            </div>
        </form>
    </div>
</main>

<footer>&copy; 2024 認知症予防トレーニングアプリ</footer>
</body>
</html>
