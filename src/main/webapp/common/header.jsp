<%-- ヘッダー（ハンバーガーメニュー付き）。base.jsp から読み込まれる --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>

<header class="app-header bg-white shadow-sm">

	<div
		class="container-fluid px-4 py-3 d-flex justify-content-between align-items-center">

		<%-- アプリ名：押すとトップ画面へ（未ログイン時はログイン画面へ） --%>
		<h1 class="h4 fw-bold m-0">
			<c:choose>
				<c:when test="${not empty sessionScope.account}">
					<a class="text-success text-decoration-none"
						href="${pageContext.request.contextPath}/scoremanager/main/Top.action">認知症予防トレーニングアプリ</a>
				</c:when>
				<c:otherwise>
					<a class="text-success text-decoration-none"
						href="${pageContext.request.contextPath}/scoremanager/login.jsp">認知症予防トレーニングアプリ</a>
				</c:otherwise>
			</c:choose>
		</h1>

		<%-- ログイン後のみ表示：ユーザー名・ランク・ログアウト・ハンバーガー --%>
		<c:if test="${not empty sessionScope.account}">

			<div class="d-flex align-items-center gap-3">

				<span class="fw-semibold">
					${fn:escapeXml(sessionScope.account.userName)} さん
				</span>

				<span class="badge bg-warning text-dark fs-6">
					ランク ${sessionScope.account.userRank}
				</span>

				<%-- ログアウト確認画面へ移動 --%>
				<a href="${pageContext.request.contextPath}/scoremanager/main/logout.jsp"
					class="btn btn-outline-danger btn-sm">ログアウト</a>

				<%-- ハンバーガーボタン --%>
				<button class="btn btn-outline-success d-flex align-items-center p-2"
					type="button" data-bs-toggle="offcanvas" data-bs-target="#sideMenu"
					aria-controls="sideMenu" aria-label="メニューを開く">
					<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28"
						fill="none" stroke="currentColor" stroke-width="2.5"
						stroke-linecap="round" viewBox="0 0 24 24" aria-hidden="true">
						<line x1="4" y1="6" x2="20" y2="6" />
						<line x1="4" y1="12" x2="20" y2="12" />
						<line x1="4" y1="18" x2="20" y2="18" />
					</svg>
				</button>

			</div>

		</c:if>

	</div>

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
				<a class="list-group-item list-group-item-action"
					href="${pageContext.request.contextPath}/scoremanager/main/ExerciseRecord.action">運動記録</a>
				<a class="list-group-item list-group-item-action"
					href="${pageContext.request.contextPath}/scoremanager/main/BrainTrainingSelect.action">脳トレ</a>
				<a class="list-group-item list-group-item-action"
					href="${pageContext.request.contextPath}/scoremanager/main/NonenreiStart.action">脳年齢テスト</a>
				<a class="list-group-item list-group-item-action"
					href="${pageContext.request.contextPath}/scoremanager/main/Mission.action">ミッション</a>
				<a class="list-group-item list-group-item-action"
					href="${pageContext.request.contextPath}/scoremanager/main/Point.action">ポイント</a>
				<a class="list-group-item list-group-item-action"
					href="${pageContext.request.contextPath}/scoremanager/main/AccountInfo.action">アカウント情報</a>
			</div>
		</div>
	</div>
</c:if>
