<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">

    <c:param name="title" value="ポイント交換履歴" />

    <c:param name="content">

        <div class="container">

            <div class="row justify-content-center">

                <div class="col-md-10 col-lg-9">

                    <div class="card shadow-sm">

                        <div class="card-body p-4 p-md-5">

                            <%-- タイトル --%>
                            <h2 class="h3 fw-bold text-center mb-2">
                                ポイント交換履歴
                            </h2>

                            <p class="text-secondary text-center mb-4">
                                これまでのポイント交換履歴を確認できます。
                            </p>

                            <%-- 履歴が存在しない場合 --%>
                            <c:if test="${empty giftHistoryList}">

                                <div class="alert alert-info text-center mb-4">
                                    ポイント交換履歴はありません。
                                </div>

                            </c:if>

                            <%-- 履歴が存在する場合 --%>
                            <c:if test="${not empty giftHistoryList}">

                                <div class="table-responsive">

                                    <table class="table table-bordered table-hover text-center align-middle">

                                        <thead class="table-success">

                                            <tr>
                                                <th>交換日時</th>
                                                <th>ギフト券</th>
                                                <th>使用ポイント</th>
                                                <th>金額</th>
                                            </tr>

                                        </thead>

                                        <tbody>

                                            <c:forEach var="gift" items="${giftHistoryList}">

                                                <tr>

                                                    <td>
                                                        <c:out value="${gift.excAt}" />
                                                    </td>

                                                    <td>
                                                        <c:out value="${gift.giftName}" />
                                                    </td>

                                                    <td>
                                                        <c:out value="${gift.usedPoint}" /> pt
                                                    </td>

                                                    <td>
                                                        <c:out value="${gift.giftAmount}" /> 円
                                                    </td>

                                                </tr>

                                            </c:forEach>

                                        </tbody>

                                    </table>

                                </div>

                            </c:if>

                            <%-- ポイント画面に戻るボタン --%>
                            <div class="d-flex justify-content-center mt-4">

                                <a href="${pageContext.request.contextPath}/scoremanager/main/Point.action"
                                   class="btn btn-primary btn-lg px-5 py-3">
                                    ポイント画面に戻る
                                </a>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </c:param>

</c:import>