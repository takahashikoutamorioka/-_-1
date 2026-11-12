<!-- 認知力チェック開始 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">

	<c:param name="title">
		認知症予防トレーニングアプリ
	</c:param>

	<c:param name="content">

		<section class="w-75 text-center m-auto border pb-4">

			<h2 class="h3 mb-3 fw-bold bg-warning py-2">
				認知力チェック
			</h2>

			<p class="text-secondary">
				登録ありがとうございます。まず、現在の認知状態を確認しましょう。
			</p>

			<div class="alert alert-success text-start mx-5 mt-4">

				<ul class="mb-0">
					<li>全15問の問題に回答すると診断結果が表示されます。</li>
					<li>診断結果から脳年齢を算出します。</li>
					<li>診断完了後、脳年齢が登録されます。</li>
					<li>途中で終了した場合は未実施として扱われます。</li>
					<li>後からマイページより再度受験できます。</li>
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

			<div class="mt-3">

				<form action="../login.jsp" method="get">

					<input
						type="submit"
						value="今は実施しない"
						class="btn btn-outline-secondary w-75">

				</form>

			</div>

		</section>

	</c:param>

</c:import>