<%-- 管理者画面 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<%-- 共通レイアウトの読み込み --%>
<c:import url="/common/base.jsp">

    <%-- ページタイトル --%>
    <c:param name="title">
        管理者画面
    </c:param>

    <%-- 画面内容 --%>
    <c:param name="content">

        <section class="w-75 m-auto border rounded bg-white p-4">

            <%-- 見出し --%>
            <h2 class="h2 fw-bold text-center mt-3">
                管理者画面
            </h2>

            <p class="text-secondary text-center mb-4">
                管理する項目を選んでください
            </p>

            <%-- 管理メニュー --%>
            <div class="row g-3 mx-2 mb-4">

                <%-- ユーザー一覧 --%>
                <div class="col-md-6">

                    <a href="${pageContext.request.contextPath}/scoremanager/main/AdminUserList.action"
                       class="d-block bg-success-subtle rounded p-4 text-dark text-decoration-none h-100">

                        <h5 class="fw-bold">
                            ユーザー一覧
                        </h5>

                        <p class="text-secondary small mb-0">
                            登録されているユーザーを確認
                        </p>

                    </a>

                </div>

                <%-- ギフト券交換 --%>
                <div class="col-md-6">

                    <a href="${pageContext.request.contextPath}/scoremanager/main/AdminGiftExchange.action"
                       class="d-block bg-success-subtle rounded p-4 text-dark text-decoration-none h-100">

                        <h5 class="fw-bold">
                            ギフト券交換
                        </h5>

                        <p class="text-secondary small mb-0">
                            交換したユーザーを確認
                        </p>

                    </a>

                </div>

            </div>

        </section>

    </c:param>

</c:import>