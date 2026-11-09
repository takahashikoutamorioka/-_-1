package scoremanager.main;

import java.util.List;

import bean.gift;
import dao.GiftDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class PointHistoryAction extends Action {

    @Override
    public void execute(HttpServletRequest req,
            HttpServletResponse res) throws Exception {

        // セッション確認
        HttpSession session = req.getSession(false);

        if (session == null
                || session.getAttribute("accountId") == null) {

            res.sendRedirect(
                req.getContextPath() + "/scoremanager/login.jsp");

            return;
        }

        try {

            // アカウントID取得
            int accountId =
                    (Integer) session.getAttribute("accountId");

            // DAOから交換履歴を取得
            GiftDAO dao = new GiftDAO();

            List<gift> giftHistoryList =
                    dao.selectByAccountId(accountId);

            // JSPに履歴情報を渡す
            req.setAttribute(
                    "giftHistoryList",
                    giftHistoryList);

            // ポイント交換履歴画面へ遷移
            req.getRequestDispatcher(
                "/scoremanager/main/pointHistory.jsp")
                .forward(req, res);

        } catch (Exception e) {

            e.printStackTrace();

            req.setAttribute(
                    "systemError",
                    "ポイント交換履歴の取得に失敗しました。");

            req.getRequestDispatcher(
                "/scoremanager/main/pointHistory.jsp")
                .forward(req, res);
        }
    }
}