<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>脳年齢テスト結果 | 認知症予防トレーニングアプリ</title>
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
  .app-name { display: flex; align-items: center; gap: 10px; font-size: 20px; font-weight: bold; }
  .app-name .logo {
    width: 32px; height: 32px; border-radius: 50%;
    background: #2e9e74; color: #fff;
    display: flex; align-items: center; justify-content: center; font-size: 18px;
  }
  .user-area { display: flex; align-items: center; gap: 16px; font-size: 14px; }
  .logout-btn {
    padding: 10px 28px; font-size: 18px; font-weight: bold;
    color: #222; background: #e3e3e6; border: none; border-radius: 6px; text-decoration: none;
  }
  .logout-btn:hover { background: #d3d3d8; }

  /* メイン */
  main { flex: 1; display: flex; justify-content: center; padding: 24px 16px; }
  .card {
    width: 100%; max-width: 760px;
    padding: 32px 36px 40px;
    background: #fff; border-radius: 12px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.12);
    align-self: flex-start;
  }
  h2 { margin: 0 0 8px; text-align: center; font-size: 22px; }
  .lead { margin: 0 0 16px; text-align: center; font-size: 14px; }

  /* No.1 脳年齢 */
  .brain-age {
    margin: 0 0 20px;
    text-align: center;
    font-size: 36px;
    font-weight: bold;
    color: #1d4a43;
  }

  /* No.2 総合スコア */
  .score {
    display: flex; justify-content: space-between; align-items: center;
    padding: 10px 4px; margin-bottom: 12px;
    border-bottom: 1px solid #e3e6e8;
    font-size: 14px;
  }

  /* No.3 戻るボタン */
  .back {
    display: block; padding: 14px;
    text-align: center; font-size: 15px; font-weight: bold;
    color: #fff; background: #1f64d8;
    border-radius: 6px; text-decoration: none;
  }
  .back:hover { background: #1a55b8; }

  footer { padding: 16px; text-align: center; font-size: 12px; color: #55706a; }
</style>
</head>
<body>

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
    <h2>脳年齢テスト結果</h2>
    <p class="lead">今回のテストの結果です</p>

    <!-- No.1 脳年齢 -->
    <p class="brain-age"><c:out value="${brainAge}" /> 歳</p>

    <!-- No.2 総合スコア -->
    <div class="score">
      <span>総合スコア</span>
      <span><c:out value="${totalScore}" /> 点</span>
    </div>

    <!-- No.3 トップ画面に戻る -->
    <a class="back" href="${pageContext.request.contextPath}/scoremanager/main/top.jsp">トップ画面に戻る</a>
  </div>
</main>

<footer>&copy; 2024 認知症予防トレーニングアプリ</footer>

</body>
</html>
