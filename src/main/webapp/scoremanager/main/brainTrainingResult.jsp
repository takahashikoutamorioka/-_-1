<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">

    <c:param name="title">
        認知症予防トレーニングアプリ
    </c:param>

    <c:param name="content">

        <section class="w-75 text-center m-auto border pb-5">

            <div id="wrap_box">

                <h2 class="h2 fw-bold mt-4">
                    結果
                </h2>

                <p class="text-secondary mb-4">
                    ${trainingName}の結果です
                </p>

                <div class="mb-4">

                    <h4 class="fw-bold">
                        正解数
                    </h4>

                    <h3 class="text-primary">
                        ${correctCount} / ${totalQuestions}問
                    </h3>

                </div>

                <div class="my-5">

                    <h1 class="display-2 fw-bold text-success">
                        ${score}点
                    </h1>

                </div>

                <div class="text-secondary mb-4">
                    100点満点
                </div>

                <c:choose>

                    <c:when test="${score >= 90}">

                        <h4 class="text-success mb-4">
                            素晴らしいです！
                        </h4>

                    </c:when>

                    <c:when test="${score >= 70}">

                        <h4 class="text-primary mb-4">
                            よくできました！
                        </h4>

                    </c:when>

                    <c:otherwise>

                        <h4 class="text-warning mb-4">
                            次も頑張りましょう！
                        </h4>

                    </c:otherwise>

                </c:choose>

                <div class="mx-5">

                    <a href="BrainTrainingSelect.action"
                       class="btn btn-primary w-100 mb-2">

                        もう一度脳トレを受ける

                    </a>

                    <a href="top.jsp"
                       class="btn btn-secondary w-100">

                        トップ画面に戻る

                    </a>

                </div>

            </div>

        </section>

    </c:param>

</c:import>