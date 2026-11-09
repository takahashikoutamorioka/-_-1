<!-- 運動記録 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>

<c:import url="/common/base.jsp">

	<c:param name="title">
		認知症予防トレーニングアプリ
	</c:param>

	<c:param name="content">

		<section class="w-75 text-center m-auto border pb-4">

			<div id="wrap_box">

				<h2 class="h3 mb-3 fw-bold bg-warning py-2">
					運動記録
				</h2>

				<p class="text-secondary">
					今日歩いた距離を入力してください
				</p>

				<!-- 入力エラー -->

				<c:if test="${not empty error}">

					<div class="alert alert-danger mx-5">

						${fn:escapeXml(error)}

					</div>

				</c:if>

				<!-- 保存成功 -->

				<c:if test="${not empty message}">

					<div class="alert alert-success mx-5">

						${fn:escapeXml(message)}

					</div>

				</c:if>

				

				<form action="ExerciseRecord.action"
					method="post">

					<div class="mx-5 mt-4 text-start">

						<label class="form-label fw-bold">

							歩行距離（km）

						</label>

						<input
							type="text"
							name="walkingDistance"
							class="form-control ${not empty distanceError ? 'is-invalid' : ''}"
							placeholder="例：3.5"
							value="${fn:escapeXml(distance)}">

						<c:if test="${not empty distanceError}">

							<div class="text-danger small mt-1">

								${fn:escapeXml(distanceError)}

							</div>

						</c:if>

					</div>

					<div class="row mx-5 mt-4">

						<div class="col-md-6 mb-2">

							<input
								type="submit"
								value="記録する"
								class="btn btn-primary w-100">

						</div>

						<div class="col-md-6 mb-2">

							<a href="Top.action"
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