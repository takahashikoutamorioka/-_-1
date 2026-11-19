<%@ page language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
	uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">

	<c:param name="title">
		認知症予防トレーニングアプリ
	</c:param>

	<c:param name="content">

		<section class="w-75 text-center m-auto border pb-5">

			<div id="wrap_box">

				<h2 class="h2 fw-bold mt-4">
					脳年齢テスト結果
				</h2>

				<p class="text-secondary mb-4">
					認知力チェックの結果です
				</p>

				<div class="mb-4">

					<h4 class="fw-bold">
						正解数
					</h4>

					<h3 class="text-primary">
						${score} / 15問
					</h3>

				</div>

				<div class="my-5">

					<h4 class="fw-bold mb-3">
						あなたの推定脳年齢
					</h4>

					<h1 class="display-2 fw-bold text-success">
						${brainAge}歳
					</h1>

				</div>

				<c:choose>

					<c:when test="${brainAge == 40}">

						<h4 class="text-success mb-4">
							非常に良好な状態です！
						</h4>

					</c:when>

					<c:when test="${brainAge == 50}">

						<h4 class="text-primary mb-4">
							良好な状態です！
						</h4>

					</c:when>

					<c:when test="${brainAge == 60}">

						<h4 class="text-info mb-4">
							継続して脳トレに取り組みましょう！
						</h4>

					</c:when>

					<c:when test="${brainAge == 70}">

						<h4 class="text-warning mb-4">
							認知機能維持のため継続利用をおすすめします！
						</h4>

					</c:when>

					<c:otherwise>

						<h4 class="text-danger mb-4">
							脳トレを継続して認知機能向上を目指しましょう！
						</h4>

					</c:otherwise>

				</c:choose>

				<div class="text-secondary mb-4">
					結果はアカウント情報へ保存されました
				</div>

				<div class="mx-5">

					<a href="BrainTrainingSelect.action"
					   class="btn btn-primary w-100 mb-2">

						脳トレを始める

					</a>

					<a href="Top.action"
					   class="btn btn-secondary w-100">

						トップ画面に戻る

					</a>

				</div>

			</div>

		</section>

	</c:param>

</c:import>