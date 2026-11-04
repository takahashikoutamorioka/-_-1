<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">

	<c:param name="title">
		認知症予防トレーニングアプリ｜認知力チェック
	</c:param>

	<c:param name="content">

		<section class="w-75 text-center m-auto border pb-4">

			<h2 class="h3 mb-3 fw-bold bg-warning py-2">
				認知力チェック
			</h2>

			<p class="text-secondary">
				登録ありがとうございます。まず、今の認知状態を確認しましょう
			</p>

			<div class="alert alert-success text-start mx-5 mt-4">

				<ul class="mb-0">
					<li>全10問の問題に回答すると診断結果が表示されます。</li>
					<li>途中で終了した場合は未実施として記録されます。</li>
				</ul>

			</div>

			<div class="mt-4">

				<form action="NinchiStart.action" method="post">

					<input
						type="submit"
						value="テストを開始する"
						class="btn btn-primary w-75">

				</form>

			</div>

		</section>

	</c:param>

</c:import>