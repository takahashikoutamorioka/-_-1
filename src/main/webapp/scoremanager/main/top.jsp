<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/common/base.jsp">
  <c:param name="title">
    トップ画面 | 認知症予防トレーニングアプリ
  </c:param>

  <c:param name="scripts"></c:param>

  <c:param name="content">
    <section class="me-4">
      <!-- 画面項目No.1:画面タイトル(h2) -->
      <h2 class="h3 mb-3 fw-normal bg-secondary bg-opacity-10 py-2 px-4 text-center">トップ画面</h2>
      <p class="text-center mb-4">今日も一緒に、脳を元気にしましょう</p>

      <div class="row g-3 px-4">
        <!-- No.2 運動記録(イベント6) -->
        <div class="col-12 col-md-4">
          <a class="d-block p-3 rounded bg-success bg-opacity-10 text-decoration-none text-reset h-100"
             href="ExerciseRecord.action">
            <span class="d-block fs-5 fw-bold mb-2">運動記録</span>
            <span class="d-block small text-muted">歩行距離を記録する</span>
          </a>
        </div>

        <!-- No.3 脳トレ(イベント7) -->
        <div class="col-12 col-md-4">
          <a class="d-block p-3 rounded bg-success bg-opacity-10 text-decoration-none text-reset h-100"
             href="brainTraining.action">
            <span class="d-block fs-5 fw-bold mb-2">脳トレ</span>
            <span class="d-block small text-muted">4種類から選んで挑戦</span>
          </a>
        </div>

        <!-- No.4 脳年齢テスト(イベント10) -->
        <div class="col-12 col-md-4">
          <a class="d-block p-3 rounded bg-success bg-opacity-10 text-decoration-none text-reset h-100"
             href="NonenreiStart.action">
            <span class="d-block fs-5 fw-bold mb-2">脳年齢テスト</span>
            <span class="d-block small text-muted">今の脳年齢を確認</span>
          </a>
        </div>

        <!-- No.5 ミッション(イベント12) -->
        <div class="col-12 col-md-4">
          <a class="d-block p-3 rounded bg-success bg-opacity-10 text-decoration-none text-reset h-100"
             href="mission.action">
            <span class="d-block fs-5 fw-bold mb-2">ミッション</span>
            <span class="d-block small text-muted">今日の目標を確認</span>
          </a>
        </div>

        <!-- No.6 ポイント(イベント14) -->
        <div class="col-12 col-md-4">
          <a class="d-block p-3 rounded bg-success bg-opacity-10 text-decoration-none text-reset h-100"
             href="point.action">
            <span class="d-block fs-5 fw-bold mb-2">ポイント</span>
            <span class="d-block small text-muted">ポイントの確認と交換</span>
          </a>
        </div>

        <!-- No.7 アカウント情報(イベント17) -->
        <div class="col-12 col-md-4">
          <a class="d-block p-3 rounded bg-success bg-opacity-10 text-decoration-none text-reset h-100"
             href="accountInfo.action">
            <span class="d-block fs-5 fw-bold mb-2">アカウント情報</span>
            <span class="d-block small text-muted">登録内容の確認と変更</span>
          </a>
        </div>
      </div>
    </section>
  </c:param>
</c:import>s