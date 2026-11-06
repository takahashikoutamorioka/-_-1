<!-- ギフト券交換 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">

    <c:param name="title">
        ギフト券交換一覧
    </c:param>

    <c:param name="content">

        <section class="w-75 m-auto border rounded bg-white p-4">

            <h2 class="h2 fw-bold text-center mt-3">
                ギフト券交換一覧
            </h2>

            <p class="text-secondary text-center mb-4">
                ギフト券を交換したユーザーです
            </p>

            <c:choose>

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

                                        <td>
                                            <c:out value="${exchange.userName}"/>
                                        </td>

                                        <td>
                                            <c:out value="${exchange.productName}"/>
                                        </td>

                                        <td>
                                            <c:out value="${exchange.exchangeDate}"/>
                                        </td>

                                        <td>
                                            <c:out value="${exchange.amount}"/>円
                                        </td>

                                    </tr>

                                </c:forEach>

                            </tbody>

                        </table>

                    </div>

                </c:when>

                <c:otherwise>

                    <div class="alert alert-danger">
                        <c:out value="${errorMsg}"
                               default="ギフト券を交換したユーザーはいません"/>
                    </div>

                </c:otherwise>

            </c:choose>

            <a href="adminTop.jsp"
               class="btn btn-secondary w-100 mt-4">
                管理者画面に戻る
            </a>

        </section>

    </c:param>

</c:import>
