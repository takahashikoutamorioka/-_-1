<%-- ポイント交換完了画面 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<%-- 共通レイアウトの読み込み --%>
<c:import url="/common/base.jsp">

    <%-- ページタイトル --%>
    <c:param name="title" value="ポイント交換完了" />

    <%-- 画面内容 --%>
    <c:param name="content">

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-10 col-lg-9">

                    <div class="card shadow-sm">
                        <div class="card-body text-center p-5">

                            <%-- 見出し --%>
                            <h2 class="h3 fw-bold mb-2">
                                ポイント交換完了
                            </h2>

                            <%-- 説明文 --%>
                            <p class="text-secondary mb-4">
                                ありがとうございました
                            </p>

                            <%-- 交換完了メッセージ --%>
                            <div class="mx-auto mt-4 mb-4"
                                 style="width: 85%; max-width: 650px;">

                                <div class="alert alert-success py-4 mb-0">
                                    <p class="mb-0 fs-5">
                                        交換が完了しました
                                    </p>
                                </div>

                            </div>

                            <%-- トップ画面に戻るボタン --%>
                            <div class="mx-auto mt-4 mb-3"
                                 style="width: 85%; max-width: 650px;">

                                <a href="${pageContext.request.contextPath}/TopAction"
                                   class="btn btn-primary btn-lg w-100 py-3">
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




