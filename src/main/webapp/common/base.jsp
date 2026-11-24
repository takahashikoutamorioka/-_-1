<%@ page language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>

<!DOCTYPE html>

<html lang="ja">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>${param.title}</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<%-- 共通スタイル（Bootstrap の後に書く）。style.css と同じ内容 --%>
<style>

/* =========================================================
   認知症予防トレーニングアプリ 共通スタイル
   読み込み順：Bootstrap の後に読み込むこと
   高齢者の方が見やすいよう、文字・ボタンを大きめにしている
   ========================================================= */

/* ---------- 文字サイズ ----------
   Bootstrap は rem 基準なので、ここを変えると全体が一括で変わる。
   100% = 16px / 125% = 20px / 137.5% = 22px / 150% = 24px
   大きすぎる・小さすぎる場合は、この数値だけを調整する。 */
html {
	font-size: 137.5%;
}

body {
	font-family: "Hiragino Sans", "Yu Gothic UI", "Meiryo", sans-serif;
	line-height: 1.8;
	/* 背景：上の薄い緑から、下のごく淡いクリーム色へ変わるグラデーション */
	background: linear-gradient(160deg, #e3f4e8 0%, #f4faf0 55%, #fff9ec 100%);
	background-attachment: fixed;
	color: #14211a;            /* 黒に近い濃い色で読みやすく */
}

/* ---------- 見出し ---------- */
h1, .h1 { font-size: 2.2rem; }
h2, .h2 { font-size: 2rem; font-weight: 700; color: #1b5e3c; }
h3, .h3 { font-size: 1.7rem; font-weight: 700; }
h4, .h4 { font-size: 1.5rem; }
h5, .h5 { font-size: 1.35rem; }

/* ---------- 補足テキスト ---------- */
small, .small {
	font-size: 1rem;
}
.text-secondary {
	color: #33443a !important; /* 薄いグレーを避け、はっきり読める濃さに */
}

/* ---------- ヘッダー ---------- */
.app-header {
	border-bottom: 4px solid #2e9e6b !important;
}
/* 文字が大きくなっても右側が崩れないよう、収まらない分は折り返す */
.app-header > div {
	flex-wrap: wrap;
	row-gap: .5rem;
}
.app-header .badge {
	font-size: 1.1rem !important;
	padding: .45em .8em;
}

/* ---------- ボタン・入力欄 ---------- */
.btn {
	font-size: 1.15rem;
	padding: .65rem 1.3rem;
	border-radius: 12px;
}
.btn-sm {
	font-size: 1.05rem;
	padding: .5rem 1rem;
}
.btn-lg {
	font-size: 1.35rem;
	padding: .9rem 1.8rem;
}

.form-control,
.form-select {
	font-size: 1.25rem;
	min-height: 3.6rem;
}
.form-floating > label {
	font-size: 1.1rem;
}
.form-check-input {
	width: 1.4em;
	height: 1.4em;
}
.form-check-label {
	font-size: 1.15rem;
}

/* ---------- カード・リスト ---------- */
main .card,
main a.card,
main .list-group-item {
	background-color: #ffffff;
	border: 1px solid #c9e3d0;
	border-radius: 16px;
	box-shadow: 0 2px 8px rgba(46, 158, 107, 0.12);
	transition: transform .15s ease, box-shadow .15s ease;
}
main .card:hover,
main a.card:hover {
	transform: translateY(-3px);
	box-shadow: 0 8px 18px rgba(46, 158, 107, 0.22);
}
.card-title {
	font-size: 1.6rem;
	font-weight: 700;
}
.card-text {
	font-size: 1.15rem;
}

/* ---------- スライドメニュー ---------- */
.offcanvas {
	--bs-offcanvas-width: 22rem;
}
.offcanvas .list-group-item {
	font-size: 1.3rem;
	padding: 1.2rem 1.4rem;
	border-radius: 0;
	box-shadow: none;
}
.offcanvas-title {
	font-size: 1.5rem;
}

/* ---------- 表・アラート ---------- */
table {
	font-size: 1.15rem;
}
.alert {
	font-size: 1.15rem;
}

/* ---------- フッター ---------- */
footer {
	font-size: 1rem;
}

</style>

</head>

<body class="d-flex flex-column min-vh-100">

	<%-- ヘッダー --%>
	<header class="app-header bg-white shadow-sm">

		<div
			class="container-fluid px-4 py-3 d-flex justify-content-between align-items-center">

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

			<%-- ログイン後のみ表示 --%>
			<c:if test="${not empty sessionScope.account}">

				<div class="d-flex align-items-center gap-3">

					<span class="fw-semibold">
						${fn:escapeXml(sessionScope.account.userName)} さん
					</span>

					<span class="badge bg-warning text-dark fs-6">
						ランク ${sessionScope.account.userRank}
					</span>

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

	<main class="container py-5 flex-grow-1">

		${param.content}

	</main>

	<footer class="text-center text-secondary small py-3">

		© 認知症予防トレーニングアプリ

	</footer>

	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

	${param.scripts}

</body>

</html>
