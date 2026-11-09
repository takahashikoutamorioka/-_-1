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

                            <h2 class="h3 fw-bold text-success mb-4">
                                ポイント交換完了
                            </h2>


                            <div class="alert alert-success">

                                ポイント交換が正常に完了しました。

                            </div>


                            <p class="mb-4">
                                Amazonギフト券500円分の交換を受け付けました。
                            </p>


                            <div class="d-flex justify-content-center gap-3">

                                <a href="${pageContext.request.contextPath}/scoremanager/main/Point.action"
                                   class="btn btn-primary btn-lg flex-fill py-3">

                                    ポイント画面へ

                                </a>


                                <a href="${pageContext.request.contextPath}/top.jsp"
                                   class="btn btn-secondary btn-lg flex-fill py-3">

                                    トップ画面へ

                                </a>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </c:param>

</c:import>