<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">

    <c:param name="title" value="ポイント交換" />

    <c:param name="content">

        <div class="container">

            <div class="row justify-content-center">

                <div class="col-md-10 col-lg-9">

                    <div class="card shadow-sm">

                        <div class="card-body text-center p-5">

                            <h2 class="h3 fw-bold mb-4">
                                ポイント交換
                            </h2>


                            <%-- エラーメッセージ --%>
                            <c:if test="${not empty exchangeError}">

                                <div class="alert alert-danger text-start mb-4">
                                    <c:out value="${exchangeError}" />
                                </div>

                            </c:if>


                            <%-- 現在のポイント --%>
                            <p class="text-secondary mb-2">
                                現在の所持ポイント
                            </p>

                            <h3 class="display-5 fw-bold text-success-emphasis mb-4">

                                <c:out value="${pointBean.pointCount}" /> pt

                            </h3>


                            <%-- 交換内容 --%>
                            <div class="border rounded p-4 mb-4">

                                <h4 class="h5 fw-bold mb-3">
                                    交換内容
                                </h4>

                                <p class="mb-2">
                                    Amazonギフト券 500円分
                                </p>

                                <p class="text-secondary mb-0">
                                    必要ポイント：500 pt
                                </p>

                            </div>


                            <%-- ポイント不足の場合 --%>
                            <c:choose>

                                <c:when test="${pointBean.pointCount >= 500}">

                                    <%-- 交換確定 --%>
                                    <form action="${pageContext.request.contextPath}/scoremanager/main/PointExchange.action"
                                          method="post">

                                        <input type="hidden"
                                               name="action"
                                               value="confirm">

                                        <button type="submit"
                                                class="btn btn-primary btn-lg w-100 mb-3">

                                            交換を確定する

                                        </button>

                                    </form>

                                </c:when>


                                <c:otherwise>

                                    <div class="alert alert-warning">
                                        ポイントが不足しています。
                                    </div>

                                    <button type="button"
                                            class="btn btn-primary btn-lg w-100 mb-3"
                                            disabled>

                                        交換する

                                    </button>

                                </c:otherwise>

                            </c:choose>


                            <%-- キャンセル --%>
                            <form action="${pageContext.request.contextPath}/scoremanager/main/PointExchange.action"
                                  method="post">

                                <input type="hidden"
                                       name="action"
                                       value="cancel">

                                <button type="submit"
                                        class="btn btn-secondary btn-lg w-100">

                                    キャンセル

                                </button>

                            </form>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </c:param>

</c:import>