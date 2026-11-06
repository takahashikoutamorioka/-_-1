<!-- アカウント情報変更 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">

    <c:param name="title">
        アカウント情報変更
    </c:param>

    <c:param name="content">

        <section class="w-75 m-auto border rounded bg-white p-4">

            <h2 class="h2 fw-bold text-center mt-3">
                アカウント情報変更
            </h2>

            <p class="text-secondary text-center mb-4">
                変更したい項目を入力してください
            </p>

            <form action="AccountUpdate.action" method="post"
                  class="mx-4">

                <div class="mb-3">
                    <label for="name" class="form-label fw-bold">
                        名前
                    </label>

                    <input type="text"
                           class="form-control"
                           id="name"
                           name="user_name"
                           maxlength="50"
                           value="<c:out value='${sessionScope.account.name}'/>"
                           required>
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label fw-bold">
                        メールアドレス
                    </label>

                    <input type="email"
                           class="form-control"
                           id="email"
                           name="email"
                           maxlength="254"
                           placeholder="メールアドレスを入力"
                           required>
                </div>

                <div class="mb-3">
                    <label for="tel" class="form-label fw-bold">
                        電話番号
                    </label>

                    <input type="tel"
                           class="form-control"
                           id="tel"
                           name="tel"
                           maxlength="15"
                           placeholder="電話番号を入力"
                           required>
                </div>

                <div class="mb-3">
                    <label for="password" class="form-label fw-bold">
                        新しいパスワード
                    </label>

                    <input type="password"
                           class="form-control"
                           id="password"
                           name="password"
                           placeholder="変更する場合のみ入力">
                </div>

                <c:if test="${not empty errorMsg}">
                    <p class="text-danger">
                        <c:out value="${errorMsg}"/>
                    </p>
                </c:if>

                <div class="d-flex gap-3 mt-4">

                    <button type="submit"
                            class="btn btn-primary w-50">
                        保存する
                    </button>

                    <a href="accountInfo.jsp"
                       class="btn btn-secondary w-50">
                        キャンセル
                    </a>

                </div>

            </form>

        </section>

    </c:param>

</c:import>
