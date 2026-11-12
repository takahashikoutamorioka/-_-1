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

		<section class="w-75 text-center m-auto border pb-4">

			<h2 class="h3 mb-3 fw-bold bg-warning py-2">
				認知力チェック結果
			</h2>

			<div class="mx-5">

				<div class="alert alert-success">

					<h4>
						診断が完了しました
					</h4>

					<p class="mb-0">
						認知力チェックの結果を保存しました。
					</p>

				</div>

				<div class="border rounded p-4 mt-4">

					<h5 class="mb-3">
						正解数
					</h5>

					<p class="display-6 text-primary">
						${score} / 15問
					</p>

				</div>

				<div class="border rounded p-4 mt-4">

					<h5 class="mb-3">
						推定脳年齢
					</h5>

					<p class="display-4 text-danger fw-bold">
						${brainAge}歳
					</p>

				</div>

				<div class="border rounded p-4 mt-4">

					<h5 class="mb-3">
						診断結果
					</h5>

					<c:choose>

						<c:when test="${brainAge == 40}">
							<p class="text-success fw-bold">
								非常に良好な状態です
							</p>
						</c:when>
					
						<c:when test="${brainAge == 50}">
							<p class="text-primary fw-bold">
								良好な状態です
							</p>
						</c:when>
					
						<c:when test="${brainAge == 60}">
							<p class="text-warning fw-bold">
								継続して脳トレに取り組みましょう
							</p>
						</c:when>
					
						<c:when test="${brainAge == 70}">
							<p class="text-warning fw-bold">
								認知機能維持のため継続利用をおすすめします
							</p>
						</c:when>
					
						<c:otherwise>
							<p class="text-danger fw-bold">
								脳トレを継続して認知機能向上を目指しましょう
							</p>
						</c:otherwise>
					
					</c:choose>

				</div>

				<div class="mt-5">

					<a href="${pageContext.request.contextPath}/scoremanager/login.jsp"
						class="btn btn-primary w-50">

						ログイン画面へ

					</a>

				</div>

			</div>

		</section>

	</c:param>

</c:import>