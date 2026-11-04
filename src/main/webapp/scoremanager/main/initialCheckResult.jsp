<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">

	<c:param name="title">
		認知症予防トレーニングアプリ
	</c:param>

	<c:param name="content">

		<section class="w-75 text-center m-auto border pb-5">

			<div id="wrap_box">

				<h2 class="h3 fw-bold bg-warning d-inline-block px-3 mt-3">
					認知力チェック結果
				</h2>

				<p class="text-secondary mt-2">
					今のあなたの認知年齢です
				</p>

				<div class="my-5">

					<h1 class="display-3 fw-bold text-success">

						【${cognitiveAge}】歳

					</h1>

				</div>

				<div class="mx-5 mb-5">

					<hr>

					<div
						class="d-flex justify-content-between text-secondary">

						<span>
							総合スコア
						</span>

						<span class="fw-bold">

							【${totalScore}】点

						</span>

					</div>

				</div>

				<div class="mx-5">

					<a href="login.jsp"
						class="btn btn-primary w-100">

						ログイン画面に戻る

					</a>

				</div>

			</div>

		</section>

	</c:param>

</c:import>