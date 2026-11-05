<!-- 脳トレ問題画面	 -->
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

				<h2 class="h3 mb-2 fw-bold bg-warning py-2">
					${trainingName}
				</h2>

				<p class="text-secondary mb-4">
					問題 ${questionNo} / ${totalQuestion}
				</p>

				<c:if test="${not empty answerError}">
					<div class="alert alert-danger mx-5 py-2">
						${fn:escapeXml(answerError)}
					</div>
				</c:if>

				<form action="TrainingAnswer.action" method="post">

					<input type="hidden"
						name="trainingType"
						value="${trainingType}">

					<input type="hidden"
						name="questionNo"
						value="${questionNo}">

					<div class="mx-5 text-start">

						<div class="border rounded p-4 bg-light">

							<h5 class="fw-bold">
								${questionText}
							</h5>

						</div>

						<div class="border rounded p-3 mt-3 bg-light">

							<input type="radio"
								name="answer"
								id="choice1"
								value="1">

							<label for="choice1">
								${choice1}
							</label>

						</div>

						<div class="border rounded p-3 mt-2 bg-light">

							<input type="radio"
								name="answer"
								id="choice2"
								value="2">

							<label for="choice2">
								${choice2}
							</label>

						</div>

						<div class="border rounded p-3 mt-2 bg-light">

							<input type="radio"
								name="answer"
								id="choice3"
								value="3">

							<label for="choice3">
								${choice3}
							</label>

						</div>

						<div class="border rounded p-3 mt-2 bg-light">

							<input type="radio"
								name="answer"
								id="choice4"
								value="4">

							<label for="choice4">
								${choice4}
							</label>

						</div>

					</div>

					<div class="row mx-5 mt-4">

						<div class="col-md-6 mb-2">

							<input
								type="submit"
								value="回答する"
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