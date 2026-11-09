package scoremanager.main;

import bean.account;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class AccountEditAction extends Action {

    @Override
    public void execute(HttpServletRequest req,
            HttpServletResponse res) throws Exception {

        HttpSession session = req.getSession(false);

        if (session == null ||
                !(session.getAttribute("account") instanceof account)) {
            res.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        req.getRequestDispatcher("accountEdit.jsp").forward(req, res);
    }
}
