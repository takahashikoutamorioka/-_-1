<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">

    <c:param name="title" value="ポイント交換完了" />

    <c:param name="content">

        <div class="container">

            <div class="row justify-content-center">

                <div class="col-md-10 col-lg-9">

                    <div class="card shadow-sm">

                        <div class="card-body text-center p-5">

                            <h2 class="h3 fw-bold mb-4">
                                ポイント交換完了
                            </h2>

                            <div class="alert alert-success mb-4">
                                ポイント交換が完了しました。
                            </div>

                            <p class="text-secondary mb-4">
                                Amazonギフト券への交換申請が完了しました。
                            </p>

                            <%-- トップ画面に戻るボタン --%>
                            <div class="d-flex justify-content-center">

                                <a href="${pageContext.request.contextPath}/scoremanager/main/Top.action"
                                   class="btn btn-secondary btn-lg px-5 py-3">
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