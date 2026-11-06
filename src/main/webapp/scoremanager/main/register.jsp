<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>

<c:import url="/common/base.jsp">

	<c:param name="title">
		認知症予防トレーニングアプリ｜新規登録
	</c:param>

	<c:param name="content">

		<section class="w-75 text-center m-auto border pb-3">

			<form action="Register.action" method="post">

				<div id="wrap_box">

					<h2 class="h3 mb-3 fw-normal bg-secondary bg-opacity-10 py-2">
						新規登録
					</h2>

					<p class="text-secondary">
						アカウント情報を入力してください
					</p>

					<c:if test="${not empty errors}">

						<div class="alert alert-danger text-start mx-5">

							<ul class="mb-0">

								<c:forEach var="error"
									items="${errors}">

									<li>
										${fn:escapeXml(error)}
									</li>

								</c:forEach>

							</ul>

						</div>

					</c:if>

					<!-- ユーザー名 -->

					<div class="form-floating mx-5 mb-3">

						<input
							type="text"
							class="form-control px-5 fs-5"
							id="userName-input"
							name="userName"
							maxlength="50"
							placeholder="ユーザー名"
							value="${fn:escapeXml(userName)}">

						<label for="userName-input">

							ユーザー名

						</label>

					</div>

					<!-- パスワード -->

					<div class="form-floating mx-5 mb-3">

						<input
							type="password"
							class="form-control px-5 fs-5"
							id="password-input"
							name="password"
							maxlength="20"
							placeholder="パスワード">

						<label for="password-input">

							パスワード

						</label>

					</div>

					<!-- 確認用パスワード -->

					<div class="form-floating mx-5 mb-3">

						<input
							type="password"
							class="form-control px-5 fs-5"
							id="confirmPassword-input"
							name="confirmPassword"
							maxlength="20"
							placeholder="確認用パスワード">

						<label for="confirmPassword-input">

							確認用パスワード

						</label>

					</div>

					<!-- メールアドレス -->

					<div class="form-floating mx-5 mb-3">

						<input
							type="email"
							class="form-control px-5 fs-5"
							id="email-input"
							name="email"
							maxlength="254"
							placeholder="メールアドレス"
							value="${fn:escapeXml(email)}">

						<label for="email-input">

							メールアドレス

						</label>

					</div>

					<!-- 電話番号 -->

					<div class="form-floating mx-5 mb-3">

						<input
							type="text"
							class="form-control px-5 fs-5"
							id="tel-input"
							name="tel"
							maxlength="15"
							placeholder="電話番号"
							value="${fn:escapeXml(tel)}">

						<label for="tel-input">

							電話番号

						</label>

					</div>

					<!-- ボタン -->

					<div class="row mx-5 mt-4">

						<div class="col-md-6 mb-2">

							<input
								class="btn btn-primary w-100"
								type="submit"
								value="登録">

						</div>

						<div class="col-md-6 mb-2">

							<a href="../login.jsp"
								class="btn btn-secondary w-100">

								キャンセル

							</a>

						</div>

					</div>

				</div>

			</form>

		</section>

	</c:param>

</c:import>