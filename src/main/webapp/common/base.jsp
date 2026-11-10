<%@ page language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
	uri="jakarta.tags.core"%>

<!DOCTYPE html>

<html lang="ja">

<head>

<meta charset="UTF-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1">

<title>

	${param.title}

</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

</head>

<body
	class="bg-success-subtle d-flex flex-column min-vh-100">

	<header
		class="bg-white border-bottom shadow-sm">

		<div
			class="container-fluid px-4 py-3 d-flex justify-content-between align-items-center">

			<h1
				class="h4 fw-bold text-success m-0">

				認知症予防トレーニングアプリ

			</h1>

			<c:if test="${not empty sessionScope.account}">

				<div
					class="d-flex align-items-center gap-3">

					<span
						class="fw-semibold">

						${sessionScope.account.userName}
						さん

					</span>

					<span
						class="badge bg-warning text-dark fs-6">

						ランク
						${sessionScope.account.userRank}

					</span>

						<a
					   		 href="${pageContext.request.contextPath}/scoremanager/main/logout.jsp"
					    		class="btn btn-outline-danger btn-sm">
					    		ログアウト
						</a>

				</div>

			</c:if>

		</div>

	</header>

	<main
		class="container py-5 flex-grow-1">

		${param.content}

	</main>

	<footer
		class="text-center text-secondary small py-3">

		© 2024 認知症予防トレーニングアプリ

	</footer>

	<script
		src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

	${param.scripts}

</body>

</html>