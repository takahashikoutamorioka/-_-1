<!-- クリアミッション画面 -->
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
				クリアした
				<span class="bg-warning px-2">
					ミッション
				</span>
			</h2>

			<p class="text-secondary mb-4">
				達成したミッション一覧です
			</p>

			<div class="row mx-5 mb-4">

				<div class="col-6">
					<a href="mission.jsp"
						class="btn btn-secondary w-100">

						未クリア

					</a>
				</div>

				<div class="col-6">
					<a href="missionClear.jsp"
						class="btn btn-primary w-100">

						クリア

					</a>
				</div>

			</div>

			<%-- Action完成後はここを使用 --%>
			<c:forEach var="m" items="${clearMissionList}">

				<div class="bg-light rounded p-3 mb-3 mx-5 text-start">

					<span class="badge bg-primary me-2">
						${m.missionType == 1 ? 'デイリー' : 'ワンタイム'}
					</span>

					<strong>
						${m.missionName}
					</strong>

				</div>

			</c:forEach>

			<%-- 画面確認用サンプル --%>

			<c:if test="${clearMissionList == null}">

				<div class="bg-light rounded p-3 mb-3 mx-5 text-start">

					<span class="badge bg-primary me-2">
						デイリー
					</span>

					<strong>
						3km歩く
					</strong>

				</div>

				<div class="bg-light rounded p-3 mb-4 mx-5 text-start">

					<span class="badge bg-secondary me-2">
						ワンタイム
					</span>

					<strong>
						4km歩く
					</strong>

				</div>

			</c:if>

			<div class="mx-5 mt-4">

				<a href="top.jsp"
					class="btn btn-secondary w-100">

					トップ画面に戻る

				</a>

			</div>

		</section>

	</c:param>

</c:import>