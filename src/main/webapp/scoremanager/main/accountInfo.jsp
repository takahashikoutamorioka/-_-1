<!-- アカウント情報画面 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>アカウント情報</title>

<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: "Meiryo", sans-serif;
    color: #173b45;
    background: linear-gradient(to bottom, #d9ecf5, #e4f3e4);
    min-height: 100vh;
}

header {
    background: #f7fbfd;
    padding: 15px 30px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.app-title {
    font-weight: bold;
    font-size: 18px;
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
    padding: 25px;
    border-radius: 10px;
    box-shadow: 0 3px 12px #0002;
}

h2 {
    text-align: center;
    font-size: 22px;
    margin-bottom: 8px;
}

h2 span {
    background: none;
    padding: 0;
}

.description {
    text-align: center;
    font-size: 13px;
    margin-bottom: 25px;
}

.info-row {
    display: flex;
    justify-content: space-between;
    padding: 12px 0;
    border-bottom: 1px solid #ddd;
    font-size: 14px;
}

.info-value {
    text-align: right;
}

.buttons {
    display: flex;
    gap: 10px;
    margin-top: 25px;
}

.btn {
    flex: 1;
    padding: 12px;
    border-radius: 6px;
    text-align: center;
    text-decoration: none;
    font-weight: bold;
    font-size: 14px;
}

.edit-btn {
    background: #2164dc;
    color: white;
}

.back-btn {
    background: #e3e3e6;
    color: #173b45;
}

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

    .buttons {
        flex-direction: column;
    }
}
</style>
</head>

<body>

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

<div class="container">

    <h2><span>アカウント情報</span></h2>
    <p class="description">登録されている内容です</p>

    <div class="info-row">
        <span>名前</span>
        <span class="info-value">
            <c:out value="${sessionScope.account.name}"
                   default="未設定"/>
        </span>
    </div>

    <div class="info-row">
        <span>メールアドレス</span>
        <span class="info-value">未設定</span>
    </div>

    <div class="info-row">
        <span>電話番号</span>
        <span class="info-value">未設定</span>
    </div>

    <div class="info-row">
        <span>パスワード</span>
        <span class="info-value">●●●●●●●●</span>
    </div>

    <div class="info-row">
        <span>脳年齢</span>
        <span class="info-value">未判定</span>
    </div>

    <div class="info-row">
        <span>ランク</span>
        <span class="info-value">未判定</span>
    </div>

    <div class="buttons">
        <a href="accountEdit.jsp" class="btn edit-btn">
            変更する
        </a>

        <a href="top.jsp" class="btn back-btn">
            トップ画面に戻る
        </a>
    </div>

</div>

<footer>
    &copy; 2024 認知症予防トレーニングアプリ
</footer>

</body>
</html>
