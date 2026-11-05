<!-- ミッション画面 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">

	<c:param name="title">
		認知症予防トレーニングアプリ
	</c:param>

	<c:param name="content">

		<section class="w-75 text-center m-auto border pb-4">

			<h2 class="h3 mt-4 mb-3 fw-bold">
				<span class="bg-warning px-2">
					ミッション
				</span>
			</h2>

			<p class="text-secondary mb-4">
				条件を達成してクリアを目指しましょう
			</p>

			<div class="row mx-5 mb-4">

				<div class="col-6">
					<a href="Mission.action?status=0"
						class="btn btn-primary w-100">
						未クリア
					</a>
				</div>

				<div class="col-6">
					<a href="missionclear.jsp"
						class="btn btn-secondary w-100">
						クリア
					</a>
				</div>

			</div>

			<!-- 達成時のみ表示 -->

			<c:if test="${not empty message}">

				<div class="alert alert-success mx-5 mb-4">

					<div class="fw-bold">
						 ミッション達成！
					</div>

					<div>
						${message}
					</div>

					<div class="mt-2">

						<span class="badge bg-primary">
							EXP +${rewardExp}
						</span>

						<span class="badge bg-warning text-dark ms-2">
							P +${rewardPoint}
						</span>

					</div>

				</div>

			</c:if>

			<!-- ミッション一覧 -->

			<div class="bg-light rounded p-3 mb-3 mx-5 text-start">
				<span class="badge bg-primary me-2">
					デイリー
				</span>

				<strong>
					3km歩く
				</strong>
			</div>

			<div class="bg-light rounded p-3 mb-3 mx-5 text-start">
				<span class="badge bg-primary me-2">
					デイリー
				</span>

				<strong>
					脳トレで70点以上を取る
				</strong>
			</div>

			<div class="bg-light rounded p-3 mb-3 mx-5 text-start">
				<span class="badge bg-secondary me-2">
					ワンタイム
				</span>

				<strong>
					4km歩く
				</strong>
			</div>

			<div class="bg-light rounded p-3 mb-4 mx-5 text-start">
				<span class="badge bg-secondary me-2">
					ワンタイム
				</span>

				<strong>
					脳トレで75点以上を取る
				</strong>
			</div>

			<div class="mx-5">

				<a href="top.jsp"
					class="btn btn-secondary w-100">

					トップ画面に戻る

				</a>

			</div>

		</section>

	</c:param>

</c:import>