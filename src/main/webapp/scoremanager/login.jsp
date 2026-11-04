<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<c:import url="/common/base.jsp">

    <c:param name="title">
        認知症予防トレーニングアプリ
    </c:param>

    <!-- JavaScript -->
    <c:param name="scripts">
        <script>
            $(function() {

                $('#password-display').change(function() {

                    if ($(this).prop('checked')) {
                        $('#password-input').attr('type', 'text');
                    } else {
                        $('#password-input').attr('type', 'password');
                    }

                });

            });
        </script>
    </c:param>

    <!-- CSS -->
    <c:param name="content">

        <style>
            body {
                background-color: #e8f3eb;
            }

            .login-card {
                max-width: 700px;
                margin: 60px auto;
                background: #fff;
                border-radius: 12px;
                padding: 40px;
                box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            }

            .login-title {
                font-size: 2rem;
                font-weight: bold;
            }

            .login-subtitle {
                color: #666;
                margin-bottom: 30px;
            }

            .password-area {
                background-color: #edf3ef;
                border-radius: 8px;
                padding: 12px 20px;
            }

            .btn-login {
                height: 48px;
                font-weight: bold;
            }

            .btn-register {
                background-color: #e9ecef;
                color: #333;
                height: 48px;
                font-weight: bold;
            }

            .error-message {
                color: red;
                text-align: left;
            }

            footer {
                text-align: center;
                margin-top: 30px;
                color: #888;
                font-size: 0.9rem;
            }
        </style>

        <section class="container">

            <div class="login-card">

                <div class="text-center">

                    <h2 class="login-title">
                        ログイン
                    </h2>

                    <p class="login-subtitle">
                        アカウントにログインして、サービスをご利用ください
                    </p>

                </div>

                <form action="LoginExecute.action" method="post">

                    <!-- エラー -->
                    <c:if test="${errors.size() > 0}">
                        <div class="alert alert-danger">

                            <ul class="mb-0">
                                <c:forEach var="error" items="${errors}">
                                    <li>${error}</li>
                                </c:forEach>
                            </ul>

                        </div>
                    </c:if>

                    <!-- ユーザー名 -->
                    <div class="mb-3">

                        <label class="form-label fw-bold">
                            ユーザー名
                        </label>

                        <input
                            type="text"
                            class="form-control"
                            name="id"
                            value="${id}"
                            maxlength="20"
                            placeholder="ユーザー名を入力してください"
                            required>

                    </div>

                    <!-- パスワード -->
                    <div class="mb-3">

                        <label class="form-label fw-bold">
                            パスワード
                        </label>

                        <input
                            type="password"
                            class="form-control"
                            id="password-input"
                            name="password"
                            maxlength="20"
                            placeholder="パスワードを入力してください"
                            required>

                    </div>

                    <!-- パスワード表示 -->
                    <div class="password-area mb-3">

                        <div class="form-check">

                            <input
                                type="checkbox"
                                class="form-check-input"
                                id="password-display">

                            <label
                                class="form-check-label fw-bold"
                                for="password-display">

                                パスワードを表示する

                            </label>

                        </div>

                    </div>

                    <!-- ログインボタン -->
                    <div class="d-grid mb-3">

                        <button
                            type="submit"
                            class="btn btn-primary btn-login">

                            ログイン

                        </button>

                    </div>

                    <!-- 新規登録 -->
                    <div class="d-grid">

                        <a
                            href="register.jsp"
                            class="btn btn-register">

                            新規登録はこちら

                        </a>

                    </div>

                </form>

            </div>

            <footer>
               	認知症予防トレーニングアプリ
            </footer>

        </section>

    </c:param>

</c:import>