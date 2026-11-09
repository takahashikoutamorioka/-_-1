package scoremanager.main;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class PointExchangeCompleteAction extends Action {

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

        // ポイント交換完了画面へ遷移
        req.getRequestDispatcher(
            "/scoremanager/main/pointExchangeComplete.jsp")
            .forward(req, res);
    }
}