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

		<section class="w-75 m-auto border pb-4">

			<h2 class="h3 text-center mb-4 fw-bold bg-warning py-2">
				認知力チェック
			</h2>

			<div class="mx-5">

				<!-- 問題番号 -->
				<div class="text-end mb-3">
					問題 ${questionNo} / 15
				</div>


				<div class="mb-4">

					<h4>
						${question.questionText}
					</h4>

				</div>

				<form action="NinchiAnswer.action"
					method="post">

					<div class="form-check mb-2">

						<input
							class="form-check-input"
							type="radio"
							name="answer"
							id="choice1"
							value="1"
							required>

						<label
							class="form-check-label"
							for="choice1">

							${question.choice1}

						</label>

					</div>

					<div class="form-check mb-2">

						<input
							class="form-check-input"
							type="radio"
							name="answer"
							id="choice2"
							value="2">

						<label
							class="form-check-label"
							for="choice2">

							${question.choice2}

						</label>

					</div>

					<div class="form-check mb-2">

						<input
							class="form-check-input"
							type="radio"
							name="answer"
							id="choice3"
							value="3">

						<label
							class="form-check-label"
							for="choice3">

							${question.choice3}

						</label>

					</div>

					<div class="form-check mb-2">

						<input
							class="form-check-input"
							type="radio"
							name="answer"
							id="choice4"
							value="4">

						<label
							class="form-check-label"
							for="choice4">

							${question.choice4}

						</label>

					</div>

					<div class="text-center mt-4">

						<input
							type="submit"
							value="回答する"
							class="btn btn-primary">

						<a
							href="ninchiInterrupt.jsp"
							class="btn btn-danger ms-2">

							中断する

						</a>

					</div>

				</form>

			</div>

		</section>

	</c:param>

</c:import>