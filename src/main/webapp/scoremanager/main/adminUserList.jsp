<!-- ユーザー一覧 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">

    <c:param name="title">
        ユーザー一覧
    </c:param>

    <c:param name="content">

        <section class="w-75 m-auto border rounded bg-white p-4">

            <h2 class="h2 fw-bold text-center mt-3">
                ユーザー一覧
            </h2>

            <p class="text-secondary text-center mb-4">
                登録されているユーザーです
            </p>

            <c:choose>

                <c:when test="${not empty userList}">

                    <div class="table-responsive bg-success-subtle rounded p-3">

                        <table class="table table-borderless align-middle mb-0">

                            <thead>
                                <tr class="border-bottom">
                                    <th>名前</th>
                                    <th>メールアドレス</th>
                                    <th>電話番号</th>
                                    <th>パスワード</th>
                                </tr>
                            </thead>

                            <tbody>

                                <c:forEach var="user" items="${userList}">

                                    <tr class="border-bottom">

                                        <td>
                                            <c:out value="${user.name}"/>
                                        </td>

                                        <td>
                                            <c:out value="${user.mail}"/>
                                        </td>

                                        <td>
                                            <c:out value="${user.tel}"/>
                                        </td>

                                        <td>●●●●●●●●</td>

                                    </tr>

                                </c:forEach>

                            </tbody>

                        </table>

                    </div>

                </c:when>

                <c:otherwise>

                    <div class="alert alert-danger">
                        <c:out value="${errorMsg}"
                               default="登録されているユーザーはいません"/>
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
