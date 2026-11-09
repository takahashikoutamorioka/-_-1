<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">

	<c:param name="title" value="ポイント" />

	<c:param name="content">

		<div class="container">

			<div class="row justify-content-center">

				<div class="col-md-10 col-lg-9">

					<div class="card shadow-sm">

						<div class="card-body text-center p-5">

							<h2 class="h3 fw-bold mb-2">
								ポイント
							</h2>

							<p class="text-secondary mb-3">
								現在のポイント
							</p>

							<!-- システムエラー -->
							<c:if test="${not empty systemError}">
								<div class="alert alert-danger text-start mb-4">
									<c:out value="${systemError}" />
								</div>
							</c:if>

							<!-- ポイント表示 -->
							<h3 class="display-5 fw-bold text-success-emphasis mb-2">
								<c:choose>
									<c:when test="${not empty pointBean}">
										<c:out value="${pointBean.pointCount}" />
										pt
									</c:when>
									<c:otherwise>
										0 pt
									</c:otherwise>
								</c:choose>
							</h3>

							<p class="text-muted mb-4">
								ミッション達成や脳トレでポイントを獲得できます
							</p>

							<!-- 0ポイント -->
							<c:if test="${empty pointBean or pointBean.pointCount == 0}">
								<div class="alert alert-info text-start mb-4">
									現在ポイントはありません。<br>
									運動記録やミッション達成でポイントを獲得しましょう。
								</div>
							</c:if>

							<!-- ポイントがある場合 -->
							<c:if test="${not empty pointBean and pointBean.pointCount > 0}">
								<div class="alert alert-success text-start mb-4">
									ポイントを利用して景品と交換できます。
								</div>
							</c:if>

							<!-- ボタン -->
							<div class="d-flex justify-content-center flex-wrap gap-3">

								<!-- ポイント交換 -->
								<a
									href="${pageContext.request.contextPath}/scoremanager/main/PointExchange.action"
									class="btn btn-primary btn-lg flex-fill py-3">
									ポイントを交換する
								</a>

								<!-- 交換履歴 -->
								<a
									href="${pageContext.request.contextPath}/scoremanager/main/PointHistory.action"
									class="btn btn-outline-success btn-lg flex-fill py-3">
									交換履歴を見る
								</a>

								<!-- トップ画面に戻る -->
								<a
									href="${pageContext.request.contextPath}/scoremanager/main/Top.action"
									class="btn btn-secondary btn-lg flex-fill py-3">
									トップ画面に戻る
								</a>

							</div>

						</div>

					</div>

				</div>

			</div>

		</div>

	</c:param>

</c:import>