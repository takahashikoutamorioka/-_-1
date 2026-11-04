<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ミッション | 認知症予防トレーニングアプリ</title>
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
    padding: 32px 36px 36px;
    background: #fff; border-radius: 12px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.12);
    align-self: flex-start;
  }
  h2 { margin: 0 0 8px; text-align: center; font-size: 22px; }
  .lead { margin: 0 0 20px; text-align: center; font-size: 14px; }

  /* 切り替えボタン(No.1 未クリア / No.2 クリア) */
  .tabs { display: flex; gap: 12px; margin-bottom: 14px; }
  .tabs button {
    flex: 1; padding: 14px; font-size: 16px; font-weight: bold;
    border: none; border-radius: 6px; cursor: pointer;
    background: #e3e3e6; color: #222;
  }
  .tabs button.active { background: #1f64d8; color: #fff; }

  /* 達成メッセージ(No.5〜8) */
  .achieved {
    display: flex; align-items: center; justify-content: space-between; gap: 12px;
    margin-bottom: 14px; padding: 12px 16px;
    background: #eaf5ee; border: 1px solid #cfe6d6; border-radius: 8px;
  }
  .achieved .left { display: flex; align-items: center; gap: 12px; }
  .achieved .check {
    width: 40px; height: 40px; border-radius: 50%;
    background: #2e7d32; color: #fff; font-size: 22px;
    display: flex; align-items: center; justify-content: center; flex-shrink: 0;
  }
  .achieved .msg { margin: 0; font-size: 18px; font-weight: bold; color: #2e7d32; }
  .achieved .praise { margin: 2px 0 0; font-size: 12px; color: #3f5f55; }
  .rewards { display: flex; align-items: center; gap: 10px; font-weight: bold; }
  .badge-exp { padding: 3px 10px; background: #dbe8fb; border-radius: 6px; font-size: 13px; }
  .badge-p {
    display: inline-flex; align-items: center; justify-content: center;
    width: 22px; height: 22px; border-radius: 50%;
    background: #f2b92b; color: #fff; font-size: 13px;
  }

  /* ミッション一覧(No.3) */
  .mission {
    display: flex; align-items: center; gap: 12px;
    margin-bottom: 10px; padding: 14px 16px;
    background: #eef6f1; border-radius: 8px;
  }
  .mission .type {
    padding: 3px 10px; border-radius: 12px; font-size: 12px; font-weight: bold; white-space: nowrap;
    background: #dbe8fb; color: #1f3d73;
  }
  .mission .name { flex: 1; font-size: 16px; font-weight: bold; }
  .progress { width: 140px; text-align: center; font-size: 12px; }
  .bar { height: 8px; background: #dcdfe3; border-radius: 4px; overflow: hidden; margin-bottom: 4px; }
  .bar span { display: block; height: 100%; background: #3b82f6; }
  .bar span.done { background: #4caf50; }
  .cleared-label {
    padding: 4px 10px; background: #2e9e4f; color: #fff; border-radius: 6px;
    font-size: 12px; font-weight: bold; white-space: nowrap;
  }
  .empty { padding: 20px; text-align: center; color: #55706a; }

  /* 下部リンク(No.4) */
  .back {
    display: block; margin-top: 14px; padding: 14px;
    text-align: center; font-size: 15px; color: #333;
    background: #e3e3e6; border-radius: 6px; text-decoration: none;
  }
  .back:hover { background: #d3d3d8; }

  footer { padding: 16px; text-align: center; font-size: 12px; color: #55706a; }

  @media (max-width: 640px) {
    .mission { flex-wrap: wrap; }
    .progress { width: 100%; }
    .achieved { flex-direction: column; align-items: flex-start; }
  }
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
    <h2>ミッション</h2>
    <p class="lead">条件を達成してクリアを目指しましょう</p>

    <!-- No.1 未クリア / No.2 クリア(name=status、イベント12) -->
    <form action="${pageContext.request.contextPath}/scoremanager/main/Mission.action" method="get" class="tabs">
      <button type="submit" name="status" value="0" class="${param.status != '1' ? 'active' : ''}">未クリア</button>
      <button type="submit" name="status" value="1" class="${param.status == '1' ? 'active' : ''}">クリア</button>
    </form>

    <%-- 仮表示:Actionを通さず mission.jsp?cleared=1 で開いた時だけ達成画面の見本を出す。Action完成後は削除してOK --%>
    <c:if test="${missionList == null && param.cleared == '1'}">
      <c:set var="message" value="ミッション達成！" scope="request" />
      <c:set var="praiseMessage" value="継続は力なりです！この調子でがんばりましょう！" scope="request" />
      <c:set var="rewardExp" value="50" scope="request" />
      <c:set var="rewardPoint" value="100" scope="request" />
    </c:if>

    <!-- No.5〜8 ミッション達成メッセージ(message がある時のみ表示) -->
    <c:if test="${not empty message}">
      <div class="achieved">
        <div class="left">
          <div class="check">&#10003;</div>
          <div>
            <p class="msg"><c:out value="${message}" /></p>
            <p class="praise"><c:out value="${praiseMessage}" /></p>
          </div>
        </div>
        <div class="rewards">
          <span class="badge-exp">EXP</span><span>+<c:out value="${rewardExp}" /></span>
          <span class="badge-p">P</span><span>+<c:out value="${rewardPoint}" /></span>
        </div>
      </div>
    </c:if>

    <!-- No.3 ミッション表示(missionList を繰り返し表示) -->
    <c:forEach var="m" items="${missionList}">
      <div class="mission">
        <span class="type">${m.missionType == 1 ? 'デイリー' : 'ワンタイム'}</span>
        <span class="name"><c:out value="${m.missionName}" /></span>
        <c:if test="${m.cleared}"><span class="cleared-label">&#10003; クリア済み</span></c:if>
      </div>
    </c:forEach>
    <c:if test="${missionList != null && empty missionList}">
      <div class="empty">表示するミッションはありません</div>
    </c:if>

    <%-- 仮表示:Actionを通さずにJSPを直接開いた時(missionListが無い時)だけ出す。Action完成後は削除してOK --%>
    <c:if test="${missionList == null}">
      <div class="mission"><span class="type">デイリー</span><span class="name">3km歩く</span>
        <c:if test="${param.cleared == '1'}"><span class="cleared-label">&#10003; クリア済み</span></c:if>
      </div>
      <div class="mission"><span class="type">デイリー</span><span class="name">脳トレで70点以上を取る</span></div>
      <div class="mission"><span class="type">ワンタイム</span><span class="name">4km歩く</span></div>
      <div class="mission"><span class="type">ワンタイム</span><span class="name">脳トレで75点以上を取る</span></div>
    </c:if>

    <!-- No.4 リンク:通常はトップ画面へ、達成直後はクリア一覧へ -->
    <c:choose>
      <c:when test="${not empty message}">
        <a class="back" href="${pageContext.request.contextPath}/scoremanager/main/Mission.action?status=1">クリアしたミッションを見る</a>
      </c:when>
      <c:otherwise>
        <a class="back" href="${pageContext.request.contextPath}/scoremanager/main/top.jsp">トップ画面に戻る</a>
      </c:otherwise>
    </c:choose>
  </div>
</main>

<footer>&copy; 2024 認知症予防トレーニングアプリ</footer>

</body>
</html>
