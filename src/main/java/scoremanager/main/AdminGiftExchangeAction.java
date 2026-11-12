package scoremanager.main;

import java.util.List;

import bean.account;
import bean.gift;
import dao.GiftDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class AdminGiftExchangeAction extends Action {

    @Override
    public void execute(HttpServletRequest req,
            HttpServletResponse res) throws Exception {

        // セッションを取得
        HttpSession session = req.getSession(false);

        // ログイン確認
        if (session == null
                || session.getAttribute("account") == null) {

            res.sendRedirect(
                req.getContextPath() + "/scoremanager/login.jsp");

            return;
        }

        // ログインアカウントを取得
        account account =
                (account) session.getAttribute("account");

        // 管理者権限確認
        if (account.getAccountType() != 1) {

            // 一般ユーザーの場合は通常のトップ画面へ
            res.sendRedirect(
                req.getContextPath()
                + "/scoremanager/main/Top.action");

            return;
        }

        try {

            // GiftDAOを生成
            GiftDAO dao = new GiftDAO();

            // 全ユーザーのギフト券交換履歴を取得
            List<gift> tExchange =
                    dao.selectAllForAdmin();

            // JSPへ交換履歴を渡す
            req.setAttribute("tExchange", tExchange);

            // 交換履歴が存在しない場合
            if (tExchange.isEmpty()) {

                req.setAttribute(
                    "errorMsg",
                    "ギフト券を交換したユーザーはいません");
            }

            // ギフト券交換一覧画面へ遷移
            req.getRequestDispatcher(
                "/scoremanager/main/adminGiftExchangeList.jsp")
                .forward(req, res);

        } catch (Exception e) {

            e.printStackTrace();

            // エラーメッセージを設定
            req.setAttribute(
                "errorMsg",
                "ギフト券交換履歴の取得に失敗しました");

            // ギフト券交換一覧画面へ遷移
            req.getRequestDispatcher(
                "/scoremanager/main/adminGiftExchangeList.jsp")
                .forward(req, res);
        }
    }
}