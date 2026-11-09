package scoremanager.main;

import bean.point;
import dao.PointDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class PointAction extends Action {

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

        try {
            // アカウントID取得
            int accountId = (Integer) session.getAttribute("accountId");

            // DAOからポイント情報を取得
            PointDAO dao = new PointDAO();
            point pointBean = dao.selectByAccountId(accountId);

            // ポイント情報が存在しない場合
            if (pointBean == null) {
                pointBean = new point();
                pointBean.setAccountId(accountId);
                pointBean.setPointCount(0);
            }

            // JSPに情報を渡す
            req.setAttribute("pointBean", pointBean);

            // ポイント画面へ遷移
            req.getRequestDispatcher(
                "/scoremanager/main/point.jsp").forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();

            req.setAttribute(
                "systemError",
                "ポイント情報の取得に失敗しました。");

            req.getRequestDispatcher(
                "/scoremanager/main/point.jsp").forward(req, res);
        }
    }
}