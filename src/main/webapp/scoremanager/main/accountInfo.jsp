<!-- アカウント情報画面 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">

    <c:param name="title">
        アカウント情報
    </c:param>

    <c:param name="content">

        <section class="w-75 m-auto border rounded bg-white p-4">

            <h2 class="h2 fw-bold text-center mt-3">
                アカウント情報
            </h2>

            <p class="text-secondary text-center mb-4">
                登録されている内容です
            </p>

            <div class="mx-4">

                <div class="d-flex justify-content-between border-bottom py-3">
                    <strong>名前</strong>
                    <span>                       
                        <c:out value="${sessionScope.account.userName}"
                          default="未設定"/>

                    </span>
                </div>

                <div class="d-flex justify-content-between border-bottom py-3">
                    <strong>メールアドレス</strong>
                    <span>
                        <c:out value="${sessionScope.account.email}"
                               default="未設定"/>
                    </span>
                </div>

                <div class="d-flex justify-content-between border-bottom py-3">
                    <strong>電話番号</strong>
                    <span>
                        <c:out value="${sessionScope.account.tel}"
                                default="未設定"/>
                    </span>
                </div>

                <div class="d-flex justify-content-between border-bottom py-3">
                    <strong>パスワード</strong>
                    <span>●●●●●●●●</span>
                </div>               
                <div class="d-flex justify-content-between border-bottom py-3">
                    <strong>脳年齢</strong>
                    <span>
                      <c:choose>
                       <c:when test="${sessionScope.account.brainAge != null && sessionScope.account.brainAge > 0}">
                         <c:out value="${sessionScope.account.brainAge}"/>歳
                       </c:when>
                       <c:otherwise>
                          未判定
                       </c:otherwise>
                     </c:choose>
                   </span>
                </div>
                <div class="d-flex justify-content-between border-bottom py-3">
                    <strong>ランク</strong>
                    <span>
                         <c:out value="${sessionScope.account.userRank}"/>
                    </span>
                </div> 
                <div class="d-flex gap-3 mt-4 mb-3">

                    <a href="AccountEdit.action"
                       class="btn btn-primary w-50">
                        変更する
                    </a>

                    <a href="top.jsp"
                       class="btn btn-secondary w-50">
                        トップ画面に戻る
                    </a>

                </div>

            </div>

        </section>

    </c:param>

</c:import>
