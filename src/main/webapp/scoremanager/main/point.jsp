<!-- ポイント -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">

    <%-- ページタイトル --%>
    <c:param name="title" value="ポイント" />

    <%-- 画面内容 --%>
    <c:param name="content">

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-10 col-lg-9">

                    <div class="card shadow-sm">
                        <div class="card-body text-center p-5">

                            <%-- 見出し --%>
                            <h2 class="h3 fw-bold mb-2">
                                ポイント
                            </h2>

                            <p class="text-secondary mb-3">
                                現在のポイント
                            </p>

                            <%-- 所持ポイント表示 --%>
                            <h3 class="display-5 fw-bold text-success-emphasis mb-4">
                                <c:choose>
                                    <c:when test="${not empty pointBean}">
                                        <c:out value="${pointBean.pointCount}" /> pt
                                    </c:when>
                                    <c:otherwise>
                                        0 pt
                                    </c:otherwise>
                                </c:choose>
                            </h3>

                            <%-- ポイントが0の場合 --%>
                            <c:if test="${empty pointBean or pointBean.points == 0}">
                                <div class="alert alert-danger text-start mb-4">
                                    ポイントがありません
                                </div>
                            </c:if>

                            <%-- ボタン --%>
                            <div class="d-flex justify-content-center gap-3">

                                <%-- ポイント交換 --%>
                                <a href="${pageContext.request.contextPath}/PointExchangeAction"
                                   class="btn btn-primary btn-lg flex-fill py-3">
                                    ポイントを交換する
                                </a>

                                <%-- トップ画面へ戻る --%>
                                <a href="${pageContext.request.contextPath}/scoremanager/main/top.jsp"
                                   class="btn btn-secondary btn-lg flex-fill py-3">
                                    トップ画面に戻る
                                </a>

                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>

    </c:param>

</c:import>