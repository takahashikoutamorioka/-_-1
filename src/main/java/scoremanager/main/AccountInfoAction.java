
package scoremanager.main;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class AccountInfoAction extends Action {

    @Override
    public void execute(HttpServletRequest req,
            HttpServletResponse res) throws Exception {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("account") == null) {
            res.sendRedirect(req.getContextPath() + "/loginForm.jsp");
            return;
        }

        req.getRequestDispatcher("accountInfo.jsp").forward(req, res);
    }
}
