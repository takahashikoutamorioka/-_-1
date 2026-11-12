package scoremanager.main;

import bean.account;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class AdminTopAction extends Action {

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

        // 管理者画面へ遷移
        req.getRequestDispatcher(
            "/scoremanager/main/adminTop.jsp")
            .forward(req, res);
    }
}