<%-- ログイン画面（login.jsp） --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<c:import url="/common/base.jsp">
	<c:param name="title">
		認知症予防トレーニングアプリ
	</c:param>

	<c:param name="scripts">
		<script type="text/javascript">
			$(function() {
				// 「パスワードを表示する」が変更された時の処理
				$('#password-display').change(function() {
					if ($(this).prop('checked')) {
						// チェックが入っている場合
						// パスワード入力欄をテキストにする
						$('#password-input').attr('type', 'text');
					} else {
						// チェックが外れている場合
						// パスワード入力欄をパスワードにする
						$('#password-input').attr('type', 'password');
					}
				});
			});
		</script>
	</c:param>

	<c:param name="content">
		<section class="w-75 text-center m-auto border pb-3">
			<%-- ログイン処理（LoginAction）にPOSTで送る --%>
			<form action="Login.action" method="post">
				<div id="wrap_box">
					<h2 class="h3 mb-3 fw-normal bg-secondary bg-opacity-10 py-2">ログイン</h2>
					<p class="text-secondary">アカウントにログインして、サービスをご利用ください</p>

					<%-- エラーメッセージ（LoginActionが request に errors を設定する） --%>
					<c:if test="${not empty errors}">
						<div class="alert alert-danger text-start mx-5">
							<ul class="mb-0">
								<c:forEach var="error" items="${errors}">
									<li>${fn:escapeXml(error)}</li>
								</c:forEach>
							</ul>
						</div>
					</c:if>

					<div>
						<!-- ユーザー名 -->
						<div class="form-floating mx-5">
							<input class="form-control px-5 fs-5" autocomplete="off"
								id="name-input" maxlength="50" name="name"
								placeholder="ユーザー名を入力してください" type="text"
								value="${fn:escapeXml(name)}" required />
							<label for="name-input">ユーザー名</label>
						</div>
						<!-- パスワード -->
						<div class="form-floating mx-5 mt-3">
							<input class="form-control px-5 fs-5" autocomplete="off"
								id="password-input" maxlength="20" name="password"
								placeholder="パスワードを入力してください" type="password" required />
							<label for="password-input">パスワード</label>
						</div>
						<!-- パスワードを表示する -->
						<div class="form-check mt-3 d-inline-block">
							<label class="form-check-label" for="password-display">
								<input class="form-check-input" id="password-display"
									name="chk_d_ps" type="checkbox" />
								パスワードを表示する
							</label>
						</div>
					</div>

					<!-- ログインボタン -->
					<div class="mt-4">
						<input class="w-50 btn btn-lg btn-primary" type="submit"
							name="login" value="ログイン" />
					</div>

					<!-- 新規登録へ -->
					<div class="mt-4">
						<div class="text-secondary mb-2">または</div>
						<a href="main/register.jsp">新規登録はこちら</a>
					</div>
				</div>
			</form>
		</section>
	</c:param>
</c:import>
