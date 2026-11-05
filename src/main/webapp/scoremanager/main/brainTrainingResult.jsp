<!-- 脳トレ結果画面 -->
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

				<h2 class="h2 fw-bold mt-4">
					結果
				</h2>

				<p class="text-secondary mb-4">
					${trainingName}の得点です
				</p>

				<div class="my-5">

					<h1 class="display-2 fw-bold text-success">

						【${score}】点

					</h1>

				</div>

				<div class="text-secondary mb-5">

					100点満点

				</div>

				<div class="mx-5">

					<a href="top.jsp"
						class="btn btn-secondary w-100">

						トップ画面に戻る

					</a>

				</div>

			</div>

		</section>

	</c:param>

</c:import>