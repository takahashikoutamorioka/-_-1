<!-- ユーザー一覧 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ユーザー一覧</title>
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
.table-area {
    background: #eef7f2;
    padding: 12px;
    border-radius: 8px;
    overflow-x: auto;
}
.user-table {
    width: 100%;
    border-collapse: collapse;
    font-size: 12px;
}
.user-table th,
.user-table td {
    text-align: left;
    padding: 10px 6px;
    border-bottom: 1px solid #d4e3dc;
}
.user-table th {
    white-space: nowrap;
}
.user-table td {
    overflow-wrap: anywhere;
}
.user-table tr:last-child td {
    border-bottom: none;
}
.error-message {
    background: #fff0f0;
    border: 1px solid #ef8888;
    color: #d93025;
    padding: 12px;
    border-radius: 6px;
    font-size: 13px;
}
.back-btn {
    display: block;
    margin-top: 14px;
    padding: 12px;
    background: #e3e3e6;
    border-radius: 6px;
    text-align: center;
    text-decoration: none;
    color: #1f3a33;
    font-size: 14px;
    font-weight: bold;
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
        <h2>ユーザー一覧</h2>
        <p class="description">登録されているユーザーです</p>

        <c:choose>
            <c:when test="${not empty userList}">
                <div class="table-area">
                    <table class="user-table">
                        <thead>
                            <tr>
                                <th>名前</th>
                                <th>メールアドレス</th>
                                <th>電話番号</th>
                                <th>パスワード</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${userList}">
                                <tr>
                                    <td><c:out value="${user.name}"/></td>
                                    <td><c:out value="${user.mail}"/></td>
                                    <td><c:out value="${user.tel}"/></td>
                                    <td>●●●●●●●●</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:when>
            <c:otherwise>
                <p class="error-message">
                    <c:out value="${errorMsg}"
                           default="登録されているユーザーはいません"/>
                </p>
            </c:otherwise>
        </c:choose>

        <a href="adminTop.jsp" class="back-btn">管理者画面に戻る</a>
    </div>
</main>

<footer>&copy; 2024 認知症予防トレーニングアプリ</footer>
</body>
</html>
