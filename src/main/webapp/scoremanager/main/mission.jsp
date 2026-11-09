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

					<a href="Mission.action"
						class="btn btn-primary w-100">

						未クリア

					</a>

				</div>

				<div class="col-6">

					<a href="MissionClear.action"
						class="btn btn-secondary w-100">

						クリア済み

					</a>

				</div>

			</div>

			<!-- ミッション達成メッセージ -->

			<c:if test="${not empty missionMessage}">

				<div class="alert alert-success mx-5 mb-4">

					<div class="fw-bold">

						${missionMessage}

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

			<c:forEach var="m"
				items="${missions}">

				<div class="bg-light rounded p-3 mb-3 mx-5 text-start">

					<c:choose>

						<c:when test="${m.missionType == 1}">

							<span class="badge bg-primary me-2">

								デイリー

							</span>

						</c:when>

						<c:otherwise>

							<span class="badge bg-secondary me-2">

								ワンタイム

							</span>

						</c:otherwise>

					</c:choose>

					<strong>

						<c:choose>

							<c:when test="${m.targetType == 1}">

								${m.targetValue}km歩こう

							</c:when>

							<c:when test="${m.targetType == 2}">

								脳トレで${m.targetValue}点以上

							</c:when>

						</c:choose>

					</strong>

					<div class="mt-2">

						<span class="badge bg-success">

							EXP +${m.rewardExp}

						</span>

						<span class="badge bg-warning text-dark ms-2">

							P +${m.rewardPoint}

						</span>

					</div>

				</div>

			</c:forEach>

			<div class="mx-5 mt-4">

				<a href="Top.action"
					class="btn btn-secondary w-100">

					トップ画面に戻る

				</a>

			</div>

		</section>

	</c:param>

</c:import>