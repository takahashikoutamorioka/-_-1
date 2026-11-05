<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>トップ画面 | 認知症予防トレーニングアプリ</title>
<style>
  * { box-sizing: border-box; }
  body {
    margin: 0;
    min-height: 100vh;
    font-family: "Meiryo", "Hiragino Kaku Gothic ProN", sans-serif;
    color: #1f3a33;
    background: linear-gradient(to bottom, #d9ecf5, #e4f3e4);
    display: flex;
    flex-direction: column;
  }
  /* ヘッダー */
  header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 24px;
    background: rgba(255, 255, 255, 0.7);
  }
  .app-name {
    display: flex;
    align-items: center;
    gap: 10px;
    font-size: 20px;
    font-weight: bold;
  }
  .app-name .logo {
    width: 32px; height: 32px;
    border-radius: 50%;
    background: #2e9e74;
    color: #fff;
    display: flex; align-items: center; justify-content: center;
    font-size: 18px;
  }
  .user-area { display: flex; align-items: center; gap: 16px; font-size: 14px; }
  .logout-btn {
    padding: 10px 28px;
    font-size: 18px;
    font-weight: bold;
    color: #222;
    background: #e3e3e6;
    border: none;
    border-radius: 6px;
    text-decoration: none;
  }
  .logout-btn:hover { background: #d3d3d8; }

  /* メイン */
  main { flex: 1; display: flex; justify-content: center; padding: 24px 16px; }
  .card {
    width: 100%;
    max-width: 760px;
    padding: 32px 36px 40px;
    background: #fff;
    border-radius: 12px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.12);
    align-self: flex-start;
  }
  h2 { margin: 0 0 8px; text-align: center; font-size: 22px; }
  .lead { margin: 0 0 24px; text-align: center; font-size: 14px; }
  .menu {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 14px;
  }
  .menu a {
    display: block;
    padding: 16px 18px;
    background: #eaf5ee;
    border-radius: 8px;
    color: inherit;
    text-decoration: none;
  }
  .menu a:hover { background: #d8eee1; }
  .menu .title { display: block; font-size: 17px; font-weight: bold; margin-bottom: 8px; }
  .menu .desc  { display: block; font-size: 12px; color: #3f5f55; }

  footer { padding: 16px; text-align: center; font-size: 12px; color: #55706a; }

  @media (max-width: 640px) {
    .menu { grid-template-columns: 1fr; }
  }
</style>
</head>
<body>

<!-- ①アプリ名・ユーザー名・ログアウト -->
<header>
  <div class="app-name">
    <span class="logo">&#10047;</span>
    <span>認知症予防トレーニングアプリ</span>
  </div>
  <div class="user-area">
    <span><c:out value="${sessionScope.account.name}" />さん</span>
    <a class="logout-btn" href="${pageContext.request.contextPath}/scoremanager/main/Logout.action">ログアウト</a>
  </div>
</header>

<main>
  <div class="card">
    <!-- 画面項目No.1:画面タイトル(h2) -->
    <h2>トップ画面</h2>
    <p class="lead">今日も一緒に、脳を元気にしましょう</p>

    <div class="menu">
      <!-- No.2 運動記録(イベント6) -->
      <a href="${pageContext.request.contextPath}/scoremanager/main/ExerciseRecord.action">
        <span class="title">運動記録</span>
        <span class="desc">歩行距離を記録する</span>
      </a>
      <!-- No.3 脳トレ(イベント7) -->
      <a href="${pageContext.request.contextPath}/scoremanager/main/BrainTraining.action">
        <span class="title">脳トレ</span>
        <span class="desc">4種類から選んで挑戦</span>
      </a>
      <!-- No.4 脳年齢テスト(イベント10) -->
      <a href="${pageContext.request.contextPath}/scoremanager/main/BrainAgeTest.action">
        <span class="title">脳年齢テスト</span>
        <span class="desc">今の脳年齢を確認</span>
      </a>
      <!-- No.5 ミッション(イベント12) -->
      <a href="${pageContext.request.contextPath}/scoremanager/main/mission.jsp">
        <span class="title">ミッション</span>
        <span class="desc">今日の目標を確認</span>
      </a>
      <!-- No.6 ポイント(イベント14) -->
      <a href="${pageContext.request.contextPath}/scoremanager/main/Point.action">
        <span class="title">ポイント</span>
        <span class="desc">ポイントの確認と交換</span>
      </a>
      <!-- No.7 アカウント情報(イベント17) -->
      <a href="${pageContext.request.contextPath}/scoremanager/main/AccountInfo.action">
        <span class="title">アカウント情報</span>
        <span class="desc">登録内容の確認と変更</span>
      </a>
    </div>
  </div>
</main>

<footer>&copy; 2024 認知症予防トレーニングアプリ</footer>

</body>
</html>
