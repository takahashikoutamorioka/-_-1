<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<%-- 共通レイアウトの読み込み --%>
<c:import url="/common/base.jsp">

    <%-- ページタイトル --%>
    <c:param name="title" value="ログアウト確認" />

    <%-- 画面内容 --%>
    <c:param name="content">

        <div class="container">

            <div class="row justify-content-center">

                <div class="col-md-6">

                    <div class="card shadow-sm">

                        <div class="card-body text-center p-5">

                            <%-- 見出し --%>
                            <h2 class="h4 fw-bold mb-4">
                                ログアウト確認
                            </h2>

                            <%-- 確認メッセージ --%>
                            <p class="text-secondary mb-4">
                                ログアウトしますか？
                            </p>

                            <%-- ボタン --%>
                            <div class="d-flex justify-content-center gap-3">

                                <%-- ログアウトボタン --%>
                                <form
                                    action="${pageContext.request.contextPath}/scoremanager/main/Logout.action"
                                    method="post">

                                    <button type="submit"
                                        class="btn btn-primary btn-lg">
                                        ログアウトする
                                    </button>

                                </form>

                                <%-- キャンセルボタン --%>
                                <a
                                    href="${pageContext.request.contextPath}/scoremanager/main/Top.action"
                                    class="btn btn-outline-secondary btn-lg">

                                    キャンセル

                                </a>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </c:param>

</c:import>