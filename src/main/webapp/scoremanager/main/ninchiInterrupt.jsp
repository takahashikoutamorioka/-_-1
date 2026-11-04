<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">

	<c:param name="title">
		認知症予防トレーニングアプリ｜中断確認
	</c:param>

	<c:param name="content">

		<section class="w-75 text-center m-auto border pb-4">

			<h2 class="h3 mb-3 fw-bold bg-warning py-2">
				認知力チェック
			</h2>

			<p class="text-secondary">
				テストを終了しますか？
			</p>

			<div class="alert alert-warning text-start mx-5 mt-4">

				<ul class="mb-0">
					<li>終了すると未実施として記録されます。</li>
					<li>途中の回答は保存されません。</li>
				</ul>

			</div>

			<div class="row mx-5 mt-4">

				<div class="col-6">

					<form action="NinchiFinish.action"
						method="post">

						<input
							type="submit"
							value="終了する"
							class="btn btn-primary w-100">

					</form>

				</div>

				<div class="col-6">

					<a
						href="ninchiQuestion.jsp"
						class="btn btn-secondary w-100">

						続ける

					</a>

				</div>

			</div>

		</section>

	</c:param>

</c:import>