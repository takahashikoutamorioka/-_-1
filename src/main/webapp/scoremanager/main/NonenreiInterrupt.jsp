<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/common/base.jsp">
  <c:param name="title">
    脳年齢テスト | 認知症予防トレーニングアプリ
  </c:param>

  <c:param name="scripts"></c:param>

  <c:param name="content">
    <section class="me-4">
      <h2 class="h3 mb-3 fw-normal bg-secondary bg-opacity-10 py-2 px-4 text-center">脳年齢テスト</h2>
      <p class="text-center mb-4">問題に答えて、今の脳年齢を確認しましょう</p>

      <div class="px-4">
        <!-- No.1 確認メッセージ -->
        <div class="p-3 mb-4 rounded bg-success bg-opacity-10">
          <p class="mb-1">テストを終了しますか？</p>
          <p class="mb-0">終了すると、結果は残りません。</p>
        </div>

        <div class="d-flex flex-column flex-md-row gap-3">
          <!-- No.2 終了する -->
          <form class="flex-fill d-flex"
                action="${pageContext.request.contextPath}/scoremanager/main/BrainAgeTestEnd.action"
                method="post">
            <button type="submit" class="btn btn-primary flex-fill py-3 fw-bold">終了する</button>
          </form>

          <!-- No.3 続ける -->
          <form class="flex-fill d-flex"
                action="${pageContext.request.contextPath}/scoremanager/main/BrainAgeTestContinue.action"
                method="post">
            <button type="submit" class="btn btn-secondary flex-fill py-3">続ける</button>
          </form>
        </div>
      </div>
    </section>
  </c:param>
</c:import>