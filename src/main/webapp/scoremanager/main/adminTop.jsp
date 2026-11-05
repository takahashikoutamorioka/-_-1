<!-- 管理者画面 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>管理者画面</title>
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
    min-height: 360px;
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
.menu-list {
    display: flex;
    gap: 12px;
}
.menu-card {
    flex: 1;
    padding: 18px;
    background: #eaf5ee;
    border-radius: 8px;
    color: inherit;
    text-decoration: none;
}
.menu-card:hover {
    background: #d8eee1;
}
.menu-title {
    font-size: 17px;
    font-weight: bold;
    margin-bottom: 8px;
}
.menu-text {
    font-size: 12px;
    color: #3f5f55;
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
    .menu-list {
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
            <c:out value="${sessionScope.account.name}" default="管理者"/>さん
        </span>
        <a class="logout"
           href="${pageContext.request.contextPath}/scoremanager/main/Logout.action">
            ログアウト
        </a>
    </div>
</header>

<main>
    <div class="container">
        <h2>管理者画面</h2>
        <p class="description">管理する項目を選んでください</p>

        <div class="menu-list">
            <a href="adminUserList.jsp" class="menu-card">
                <div class="menu-title">ユーザー一覧</div>
                <div class="menu-text">登録されているユーザーを確認</div>
            </a>

            <a href="adminGiftExchangeList.jsp" class="menu-card">
                <div class="menu-title">ギフト券交換</div>
                <div class="menu-text">交換したユーザーを確認</div>
            </a>
        </div>
    </div>
</main>

<footer>&copy; 2024 認知症予防トレーニングアプリ</footer>
</body>
</html>
