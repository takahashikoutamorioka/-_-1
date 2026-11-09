<!-- アカウント情報変更 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">
    <c:param name="title">アカウント情報変更 | 認知症予防トレーニングアプリ</c:param>

    <c:param name="content">

        <section class="mx-auto" style="max-width: 700px;">

            <h2 class="h3 mb-4 fw-normal bg-secondary bg-opacity-10 py-2 px-4 text-center">
                アカウント情報変更
            </h2>

            <div class="bg-white rounded shadow-sm p-4">

                <h3 class="h5 fw-bold text-success mb-4">
                    登録情報の変更
                </h3>

                <c:if test="${not empty errors}">
                    <div class="alert alert-danger">
                        <c:forEach var="error" items="${errors}">
                            <div><c:out value="${error}"/></div>
                        </c:forEach>
                    </div>
                </c:if>

                <form action="AccountUpdate.action" method="post">

                    <div class="mb-3">
                        <label for="user_name" class="form-label fw-bold">
                            ユーザー名
                        </label>
                        <input type="text"
                               class="form-control"
                               id="user_name"
                               name="user_name"
                               maxlength="50"
                               value="<c:out value='${inputName != null ? inputName : sessionScope.account.userName}'/>"
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
                               value="<c:out value='${inputEmail != null ? inputEmail : sessionScope.account.email}'/>"
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
                               value="<c:out value='${inputTel != null ? inputTel : sessionScope.account.tel}'/>"
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
                               minlength="8"
                               autocomplete="new-password"
                               placeholder="変更する場合のみ入力">
                        <div class="form-text">
                            変更しない場合は空欄にしてください。
                            変更する場合は8文字以上で入力してください。
                        </div>
                    </div>

                    <div class="d-flex gap-3 mt-4">

                        <button type="submit"
                                class="btn btn-primary btn-lg flex-fill py-3">
                            保存する
                        </button>

                        <a href="accountInfo.jsp"
                           class="btn btn-secondary btn-lg flex-fill py-3 d-flex align-items-center justify-content-center">
                            キャンセル
                        </a>

                    </div>

                </form>

            </div>

        </section>

    </c:param>
</c:import>
