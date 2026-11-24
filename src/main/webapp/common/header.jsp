<%-- ヘッダー --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>

<header class="bg-white shadow-sm px-3 py-2 d-flex align-items-center w-100">
	<%-- アプリ名 --%>
	<span class="fs-3 fw-bold text-success">認知症予防トレーニングアプリ</span>

	<%-- ログイン後のみ表示：ユーザー名・ランク・ログアウト・ハンバーガー --%>
	<c:if test="${not empty sessionScope.account}">
		<div class="ms-auto d-flex align-items-center">
			<%-- ※ getName() が無い場合は Bean のゲッター名に合わせて変更 --%>
			<span class="me-3">${fn:escapeXml(sessionScope.account.name)} さん</span>
			<%-- ※ ランクは仮の固定表示。取得できるようになったら差し替え --%>
			<span class="badge bg-warning text-dark fs-6 me-3">ランク 1</span>

			<%-- ログアウト確認画面へ移動 --%>
			<a class="btn btn-outline-danger btn-sm me-3"
				href="${pageContext.request.contextPath}/scoremanager/main/logout.jsp">ログアウト</a>

			<%-- ハンバーガーボタン --%>
			<button class="btn btn-outline-success" type="button"
				data-bs-toggle="offcanvas" data-bs-target="#sideMenu"
				aria-controls="sideMenu" aria-label="メニューを開く">
				<span class="navbar-toggler-icon"></span>
			</button>
		</div>
	</c:if>
</header>

<%-- スライドメニュー（右から出る）。ログイン後のみ --%>
<c:if test="${not empty sessionScope.account}">
	<div class="offcanvas offcanvas-end" tabindex="-1" id="sideMenu"
		aria-labelledby="sideMenuLabel">
		<div class="offcanvas-header bg-success bg-opacity-10">
			<h5 class="offcanvas-title" id="sideMenuLabel">メニュー</h5>
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
				aria-label="閉じる"></button>
		</div>
		<div class="offcanvas-body p-0">
			<div class="list-group list-group-flush">
				<%-- ※ リンク先の Action 名は実際のものに合わせて変更 --%>
				<a class="list-group-item list-group-item-action"
					href="${pageContext.request.contextPath}/scoremanager/main/Top.action">トップ画面</a>
				<a class="list-group-item list-group-item-action"
					href="${pageContext.request.contextPath}/scoremanager/main/Exercise.action">運動記録</a>
				<a class="list-group-item list-group-item-action"
					href="${pageContext.request.contextPath}/scoremanager/main/BrainTraining.action">脳トレ</a>
				<a class="list-group-item list-group-item-action"
					href="${pageContext.request.contextPath}/scoremanager/main/BrainAgeTest.action">脳年齢テスト</a>
				<a class="list-group-item list-group-item-action"
					href="${pageContext.request.contextPath}/scoremanager/main/Mission.action">ミッション</a>
				<a class="list-group-item list-group-item-action"
					href="${pageContext.request.contextPath}/scoremanager/main/Point.action">ポイント</a>
				<a class="list-group-item list-group-item-action"
					href="${pageContext.request.contextPath}/scoremanager/main/Account.action">アカウント情報</a>
			</div>
		</div>
	</div>
</c:if>
