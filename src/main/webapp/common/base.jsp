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

<style>
	/* 背景：明るい緑から淡いクリーム色へのやわらかいグラデーション */
	body {
		background: linear-gradient(160deg, #e3f4e8 0%, #f4faf0 55%, #fff9ec 100%);
		background-attachment: fixed;
		font-family: "Hiragino Sans", "Yu Gothic UI", "Meiryo", sans-serif;
	}

	/* ヘッダー：下に緑のラインを入れて引き締める */
	.app-header {
		border-bottom: 4px solid #2e9e6b !important;
	}

	/* カード類：角丸・白背景・影・マウスを乗せると少し浮く */
	main .card,
	main .list-group-item,
	main a.card {
		background-color: #ffffff;
		border: 1px solid #d8eadf;
		border-radius: 16px;
		box-shadow: 0 2px 8px rgba(46, 158, 107, 0.10);
		transition: transform .15s ease, box-shadow .15s ease;
	}
	main .card:hover,
	main a.card:hover {
		transform: translateY(-3px);
		box-shadow: 0 8px 18px rgba(46, 158, 107, 0.20);
	}

	/* 画面見出し（トップ画面など）を少し柔らかく */
	main h2 {
		font-weight: 700;
		color: #1f6f4a;
	}
</style>

</head>

<body class="d-flex flex-column min-vh-100">

	<%-- ヘッダー --%>
	<header class="app-header bg-white shadow-sm">

		<div
			class="container-fluid px-4 py-3 d-flex justify-content-between align-items-center">

			<h1 class="h4 fw-bold text-success m-0">認知症予防トレーニングアプリ</h1>

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
