package scoremanager.main;

import bean.point;
import dao.PointDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class PointExchangeAction extends Action {

    @Override
    public void execute(HttpServletRequest req,
            HttpServletResponse res) throws Exception {

        // セッション確認
        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("accountId") == null) {
            res.sendRedirect(
                req.getContextPath() + "/scoremanager/login.jsp");
            return;
        }

        // アカウントID取得
        int accountId = (Integer) session.getAttribute("accountId");

        // DAO作成
        PointDAO dao = new PointDAO();

        try {

            // POST送信の場合
            if ("POST".equalsIgnoreCase(req.getMethod())) {

                String action = req.getParameter("action");

                // キャンセル
                if ("cancel".equals(action)) {

                    res.sendRedirect(
                        req.getContextPath()
                        + "/scoremanager/main/Point.action");

                    return;
                }

                // 交換確定
                if ("confirm".equals(action)) {

                    boolean result = dao.exchangeGift(accountId);

                    // 交換成功
                    if (result) {

                        res.sendRedirect(
                            req.getContextPath()
                            + "/scoremanager/main/PointExchangeComplete.action");

                        return;
                    }

                    // 交換失敗
                    point pointBean = dao.selectByAccountId(accountId);

                    if (pointBean == null) {
                        pointBean = new point();
                        pointBean.setAccountId(accountId);
                        pointBean.setPointCount(0);
                    }

                    req.setAttribute("pointBean", pointBean);

                    req.setAttribute(
                        "exchangeError",
                        "ポイントが不足しているか、交換に失敗しました。");

                    req.getRequestDispatcher(
                        "/scoremanager/main/pointExchange.jsp")
                        .forward(req, res);

                    return;
                }
            }

            // ポイント情報取得
            point pointBean = dao.selectByAccountId(accountId);

            if (pointBean == null) {
                pointBean = new point();
                pointBean.setAccountId(accountId);
                pointBean.setPointCount(0);
            }

            // JSPに情報を渡す
            req.setAttribute("pointBean", pointBean);

            // ポイント交換画面へ遷移
            req.getRequestDispatcher(
                "/scoremanager/main/pointExchange.jsp")
                .forward(req, res);

        } catch (Exception e) {

            e.printStackTrace();

            req.setAttribute(
                "exchangeError",
                "ポイント交換処理中にエラーが発生しました。");

            req.getRequestDispatcher(
                "/scoremanager/main/pointExchange.jsp")
                .forward(req, res);
        }
    }
}