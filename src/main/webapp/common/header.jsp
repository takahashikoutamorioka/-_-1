<%-- ヘッダー --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<div class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
    <h1 class="fs-1">認知症予防トレーニングアプリ</h1>
</div>
<c:if test="${user.isAuthenticated()}">
    <div class="nav align-self-end">
        <span class="nav-item px-2">${user.getName()}様</span>
        <%-- ログアウト確認画面へ移動 --%>
        <a class="nav-item px-2"
            href="${pageContext.request.contextPath}/scoremanager/main/logout.jsp">
            ログアウト
        </a>
    </div>
