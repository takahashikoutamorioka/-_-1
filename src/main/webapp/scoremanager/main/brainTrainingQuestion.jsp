<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">

    <c:param name="title">
        脳トレ問題
    </c:param>

    <c:param name="content">

        <section class="w-75 text-center m-auto border pb-4">

            <div id="wrap_box">

                <h2 class="h3 mb-2 fw-bold bg-warning py-2">
                    ${trainingName}
                </h2>

                <p class="text-secondary mb-4">
                    問題 ${questionNo} / 10
                </p>

                <form action="BrainTrainingPlay.action" method="post">

                    <input type="hidden"
                        name="trainingType"
                        value="${trainingType}">

                    <input type="hidden"
                        name="questionNo"
                        value="${questionNo}">

                    <div class="mx-5">

                        <div class="border rounded p-4 bg-light mb-4">

                            <h4 class="mb-0">
                                ${question.questionText}
                            </h4>

                        </div>

                        <div class="text-start">

                            <label class="d-block border rounded p-3 mb-2">

                                <input type="radio"
                                    name="answer"
                                    value="1"
                                    required>

                                ${question.choice1}

                            </label>

                            <label class="d-block border rounded p-3 mb-2">

                                <input type="radio"
                                    name="answer"
                                    value="2">

                                ${question.choice2}

                            </label>

                            <label class="d-block border rounded p-3 mb-2">

                                <input type="radio"
                                    name="answer"
                                    value="3">

                                ${question.choice3}

                            </label>

                            <label class="d-block border rounded p-3 mb-4">

                                <input type="radio"
                                    name="answer"
                                    value="4">

                                ${question.choice4}

                            </label>

                        </div>

                    </div>

                    <div class="row mx-5">

                        <div class="col-md-6">

                            <input type="submit"
                                value="回答する"
                                class="btn btn-primary w-100">

                        </div>

                        <div class="col-md-6">

                            <a href="BrainTrainingSelect.action"
                                class="btn btn-secondary w-100">

                                やめる

                            </a>

                        </div>

                    </div>

                </form>

            </div>

        </section>

    </c:param>

</c:import>