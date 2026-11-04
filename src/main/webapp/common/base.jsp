<%-- 共通レイアウト（common/base.jsp） --%>
<%-- 各画面から c:import で呼び出し、title / scripts / content を受け取る --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>${param.title}</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
	<!-- ヘッダー -->
	<header class="bg-white border-bottom">
		<div class="container py-3 d-flex justify-content-between align-items-center">
			<h1 class="h4 m-0 text-success-emphasis">認知症予防トレーニングアプリ</h1>
			<!--<span class="text-secondary small">いつまでも いきいきとした毎日を</span>-->
		</div>
	</header>

	<!-- 本文 -->
	<main class="container py-4">
		${param.content}
	</main>

	<!-- フッター -->
	<footer class="py-3 text-center text-secondary small">
		&copy; 2024 認知症予防トレーニングアプリ
	</footer>

	<!-- jQuery と Bootstrap（各画面の scripts より先に読み込む） -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	${param.scripts}
</body>
</html>
