<%-- ポイント交換画面 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<%-- 共通レイアウトの読み込み --%>
<c:import url="/common/base.jsp">

    <%-- ページタイトル --%>
    <c:param name="title" value="ポイント交換" />

    <%-- 画面内容 --%>
    <c:param name="content">

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-10 col-lg-9">

                    <div class="card shadow-sm">
                        <div class="card-body text-center p-5">

                            <%-- 見出し --%>
                            <h2 class="h3 fw-bold mb-2">
                                ポイント交換
                            </h2>

                            <p class="text-secondary mb-4">
                                ポイントをギフト券に交換できます
                            </p>

                            <%-- 交換情報 --%>
                            <div class="text-start mb-4">

                                <%-- 交換するギフト券 --%>
                                <div class="d-flex justify-content-between align-items-center border-bottom py-3">
                                    <span>交換するギフト券</span>
                                    <span>Amazonギフト券 500円分</span>
                                </div>

                                <%-- 必要ポイント --%>
                                <div class="d-flex justify-content-between align-items-center border-bottom py-3">
                                    <span>必要なポイント</span>
                                    <span class="fw-bold">500 pt</span>
                                </div>

                                <%-- 現在のポイント --%>
                                <div class="d-flex justify-content-between align-items-center border-bottom py-3">
                                    <span>現在のポイント</span>
                                    <span class="fw-bold">
                                        <c:choose>
                                            <c:when test="${not empty pointBean}">
                                                <c:out value="${pointBean.points}" /> pt
                                            </c:when>
                                            <c:otherwise>
                                                0 pt
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                </div>

                            </div>

                            <%-- ポイント不足の場合のエラーメッセージ --%>
                            <c:if test="${empty pointBean or pointBean.points lt 500}">
                                <div class="alert alert-danger text-danger fw-bold text-start border border-danger mb-4">
                                    ポイントが不足しています
                                </div>
                            </c:if>

                            <%-- ボタン --%>
                            <div class="d-flex justify-content-center gap-4 mx-auto mt-4 mb-3"
                                 style="width: 85%; max-width: 650px;">

                                <%-- 交換ボタン --%>
                                <form action="${pageContext.request.contextPath}/PointExchangeAction"
                                      method="post"
                                      class="flex-fill">

                                    <input type="hidden" name="action" value="confirm">

                                    <button type="submit"
                                        class="btn btn-primary btn-lg w-100 py-3"
                                        <c:if test="${empty pointBean or pointBean.points lt 500}">
                                            disabled
                                        </c:if>>
                                        交換する
                                    </button>

                                </form>

                                <%-- キャンセルボタン --%>
                                <form action="${pageContext.request.contextPath}/PointExchangeAction"
                                      method="post"
                                      class="flex-fill">

                                    <input type="hidden" name="action" value="cancel">

                                    <button type="submit"
                                        class="btn btn-secondary btn-lg w-100 py-3">
                                        キャンセル
                                    </button>

                                </form>

                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>

    </c:param>

</c:import>

