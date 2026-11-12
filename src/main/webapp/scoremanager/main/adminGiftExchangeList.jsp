<%-- ギフト券交換一覧 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<%-- 共通レイアウトの読み込み --%>
<c:import url="/common/base.jsp">

    <%-- ページタイトル --%>
    <c:param name="title" value="ギフト券交換一覧" />

    <%-- 画面内容 --%>
    <c:param name="content">

        <section class="w-75 m-auto border rounded bg-white p-4">

            <%-- 見出し --%>
            <h2 class="h2 fw-bold text-center mt-3">
                ギフト券交換一覧
            </h2>

            <p class="text-secondary text-center mb-4">
                ギフト券を交換したユーザーです
            </p>

            <%-- 交換履歴表示 --%>
            <c:choose>

                <%-- 交換履歴が存在する場合 --%>
                <c:when test="${not empty tExchange}">

                    <div class="table-responsive bg-success-subtle rounded p-3">

                        <table class="table table-borderless align-middle mb-0">

                            <thead>
                                <tr class="border-bottom">
                                    <th>ユーザー名</th>
                                    <th>商品名</th>
                                    <th>交換日</th>
                                    <th>金額</th>
                                </tr>
                            </thead>

                            <tbody>

                                <c:forEach var="exchange" items="${tExchange}">

                                    <tr class="border-bottom">

                                        <%-- ユーザー名 --%>
                                        <td>
                                            <c:out value="${exchange.userName}"/>
                                        </td>

                                        <%-- 商品名 --%>
                                        <td>
                                            <c:out value="${exchange.giftName}"/>
                                        </td>

                                        <%-- 交換日 --%>
                                        <td>
                                            <c:out value="${exchange.excAt}"/>
                                        </td>

                                        <%-- 金額 --%>
                                        <td>
                                            <c:out value="${exchange.giftAmount}"/>円
                                        </td>

                                    </tr>

                                </c:forEach>

                            </tbody>

                        </table>

                    </div>

                </c:when>

                <%-- 交換履歴が存在しない場合 --%>
                <c:otherwise>

                    <div class="alert alert-danger">

                        <c:out value="${errorMsg}"
                               default="ギフト券を交換したユーザーはいません"/>

                    </div>

                </c:otherwise>

            </c:choose>

            <%-- 管理者画面に戻る --%>
            <a href="${pageContext.request.contextPath}/scoremanager/main/AdminTop.action"
               class="btn btn-secondary w-100 mt-4">

                管理者画面に戻る

            </a>

        </section>

    </c:param>

</c:import>