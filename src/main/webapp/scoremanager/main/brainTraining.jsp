<!-- 脳トレ画面 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">

	<c:param name="title">
		認知症予防トレーニングアプリ
	</c:param>

	<c:param name="content">

		<section class="w-75 text-center m-auto border pb-4">

			<div id="wrap_box">

				<h2 class="h3 mb-2 fw-bold bg-warning py-2">
					脳トレ
				</h2>

				<p class="text-secondary mb-4">
					受ける脳トレを1つ選んでください
				</p>

				<c:if test="${not empty trainingError}">
					<div class="alert alert-danger mx-5 py-2">
						選択してください。
					</div>
				</c:if>

				<form action="BrainTrainingSelect.action" method="post">

					<div class="mx-5 text-start">

						<p class="fw-bold mb-2">
							脳トレを選択してください
						</p>

						<div class="border rounded p-3 mb-2 bg-light">

							<input
								type="radio"
								name="trainingType"
								id="calc"
								value="calculation">

							<label for="calc">

								計算

								<span class="text-secondary small ms-2">
									約10点満点
								</span>

							</label>

						</div>

						<div class="border rounded p-3 mb-2 bg-light">

							<input
								type="radio"
								name="trainingType"
								id="memory"
								value="memory">

							<label for="memory">

								記憶力

								<span class="text-secondary small ms-2">
									約10点満点
								</span>

							</label>

						</div>

						<div class="border rounded p-3 mb-2 bg-light">

							<input
								type="radio"
								name="trainingType"
								id="judgment"
								value="judgment">

							<label for="judgment">

								神経衰弱

								<span class="text-secondary small ms-2">
									約10点満点
								</span>

							</label>

						</div>

						<div class="border rounded p-3 mb-4 bg-light">

							<input
								type="radio"
								name="trainingType"
								id="quiz"
								value="quiz">

							<label for="quiz">

								クイズ

								<span class="text-secondary small ms-2">
									約10点満点
								</span>

							</label>

						</div>

					</div>

					<div class="row mx-5">

						<div class="col-md-6 mb-2">

							<input
								type="submit"
								value="受ける"
								class="btn btn-primary w-100">

						</div>

						<div class="col-md-6 mb-2">

							<a href="top.jsp"
								class="btn btn-secondary w-100">

								トップ画面に戻る

							</a>

						</div>

					</div>

				</form>

			</div>

		</section>

	</c:param>

</c:import>