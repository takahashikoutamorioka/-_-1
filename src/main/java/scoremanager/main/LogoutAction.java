package scoremanager.main;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class LogoutAction extends Action {

    @Override
    public void execute(HttpServletRequest req,
            HttpServletResponse res) throws Exception {

        // セッションを取得
        HttpSession session = req.getSession(false);

        // セッションが存在する場合は破棄
        if (session != null) {
            session.invalidate();
        }

        // ログイン画面へ遷移
        res.sendRedirect(
            req.getContextPath() + "/scoremanager/login.jsp"
        );
    }
}