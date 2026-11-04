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
                            <h2 class="h4 mb-4">
                                ログアウト確認
                            </h2>

                            <%-- 確認メッセージ --%>
                            <p class="mb-4">
                                ログアウトしますか？
                            </p>

                            <%-- ボタンを横並びに配置 --%>
                            <div class="d-flex justify-content-center gap-3">

                                <%-- ログアウトボタン --%>
                                <form action="${pageContext.request.contextPath}/LogoutAction"
                                      method="post">

                                    <button type="submit"
                                        class="btn btn-primary">
                                        ログアウトする
                                    </button>

                                </form>

                                <%-- キャンセルボタン --%>
                                <a href="${pageContext.request.contextPath}/top.jsp"
                                   class="btn btn-outline-secondary">
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