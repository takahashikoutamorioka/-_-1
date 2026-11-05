<%-- 新規登録 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>

<c:import url="/common/base.jsp">

	<c:param name="title">
		認知症予防トレーニングアプリ
	</c:param>

	<c:param name="content">

		<section class="w-75 text-center m-auto border pb-4">

			<form action="Register.action" method="post">

				<div id="wrap_box">

					<h2 class="h3 mb-2 fw-bold bg-secondary bg-opacity-10 py-2">
						新規登録
					</h2>

					<p class="text-secondary mb-4">
						アカウントを作成して、はじめましょう
					</p>

					<!-- 名前 -->
					<div class="mx-5 mb-3 text-start">
						<label class="form-label fw-bold">名前</label>

						<input
							type="text"
							name="name"
							class="form-control ${not empty nameError ? 'is-invalid' : ''}"
							placeholder="名前を入力してください"
							value="${fn:escapeXml(name)}">

						<c:if test="${not empty nameError}">
							<div class="text-danger small mt-1">
								${fn:escapeXml(nameError)}
							</div>
						</c:if>
					</div>

					<!-- メールアドレス -->
					<div class="mx-5 mb-3 text-start">
						<label class="form-label fw-bold">メールアドレス</label>

						<input
							type="email"
							name="mail"
							class="form-control ${not empty mailError ? 'is-invalid' : ''}"
							placeholder="メールアドレスを入力してください"
							value="${fn:escapeXml(mail)}">

						<c:if test="${not empty mailError}">
							<div class="text-danger small mt-1">
								${fn:escapeXml(mailError)}
							</div>
						</c:if>
					</div>

					<!-- 電話番号 -->
					<div class="mx-5 mb-3 text-start">
						<label class="form-label fw-bold">電話番号</label>

						<input
							type="text"
							name="tel"
							class="form-control ${not empty telError ? 'is-invalid' : ''}"
							placeholder="例：09012345678"
							value="${fn:escapeXml(tel)}">

						<c:if test="${not empty telError}">
							<div class="text-danger small mt-1">
								${fn:escapeXml(telError)}
							</div>
						</c:if>
					</div>

					<!-- パスワード -->
					<div class="mx-5 mb-3 text-start">
						<label class="form-label fw-bold">パスワード</label>

						<input
							type="password"
							name="password"
							class="form-control ${not empty passwordError ? 'is-invalid' : ''}"
							placeholder="半角英数字8文字以上">

						<c:if test="${not empty passwordError}">
							<div class="text-danger small mt-1">
								${fn:escapeXml(passwordError)}
							</div>
						</c:if>
					</div>

					<!-- パスワード確認 -->
					<div class="mx-5 mb-4 text-start">
						<label class="form-label fw-bold">パスワード確認</label>

						<input
							type="password"
							name="confirmPassword"
							class="form-control ${not empty confirmPasswordError ? 'is-invalid' : ''}"
							placeholder="もう一度パスワードを入力してください">

						<c:if test="${not empty confirmPasswordError}">
							<div class="text-danger small mt-1">
								${fn:escapeXml(confirmPasswordError)}
							</div>
						</c:if>
					</div>

					<!-- ボタン -->
					<div class="row mx-5">

						<div class="col-md-6 mb-2">
							<input
								type="submit"
								value="登録する"
								class="btn btn-primary w-100">
						</div>

						<div class="col-md-6 mb-2">
							<a href="loginForm.jsp"
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