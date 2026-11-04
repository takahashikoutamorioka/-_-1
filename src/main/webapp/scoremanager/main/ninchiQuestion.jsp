<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">

	<c:param name="title">
		認知症予防トレーニングアプリ｜問題
	</c:param>

	<c:param name="content">

		<section class="w-75 m-auto border pb-4">

			<h2 class="h3 text-center mb-4 fw-bold bg-warning py-2">
				認知力チェック
			</h2>

			<div class="mx-5">

				<div class="d-flex justify-content-between mb-3">

					<div>問題 1 / 10</div>

					<div>残り時間 05:00</div>

				</div>

				<div class="alert alert-light border">

					<h5>次の単語を覚えてください</h5>

					<ul>
						<li>りんご</li>
						<li>犬</li>
						<li>時計</li>
						<li>電車</li>
						<li>花</li>
					</ul>

				</div>

				<form action="NinchiAnswer.action" method="post">

					<div class="mt-4">

						<input
							type="submit"
							value="次へ"
							class="btn btn-primary">

						<a
							href="ninchiInterrupt.jsp"
							class="btn btn-danger ms-2">

							中断

						</a>

					</div>

				</form>

			</div>

		</section>

	</c:param>

</c:import>