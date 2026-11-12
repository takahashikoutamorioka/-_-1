package scoremanager.main;

import java.util.List;

import bean.account;
import dao.AccountDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class AdminUserListAction extends Action {

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

            // AccountDAOを生成
            AccountDAO dao = new AccountDAO();

            // 登録されているユーザーを取得
            List<account> userList =
                    dao.findAllUsers();

            // JSPへユーザー一覧を渡す
            req.setAttribute("userList", userList);

            // ユーザーが存在しない場合
            if (userList.isEmpty()) {

                req.setAttribute(
                    "errorMsg",
                    "登録されているユーザーはいません");
            }

            // ユーザー一覧画面へ遷移
            req.getRequestDispatcher(
                "/scoremanager/main/adminUserList.jsp")
                .forward(req, res);

        } catch (Exception e) {

            e.printStackTrace();

            // エラーメッセージを設定
            req.setAttribute(
                "errorMsg",
                "ユーザー情報の取得に失敗しました");

            // ユーザー一覧画面へ遷移
            req.getRequestDispatcher(
                "/scoremanager/main/adminUserList.jsp")
                .forward(req, res);
        }
    }
}