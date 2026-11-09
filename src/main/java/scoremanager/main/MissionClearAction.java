package scoremanager.main;

import java.util.List;

import bean.account;
import bean.mission;
import dao.MissionDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class MissionClearAction extends Action {

	@Override
	public void execute(
			HttpServletRequest req,
			HttpServletResponse res)
			throws Exception {

		HttpSession session =
				req.getSession();

		account user =
				(account) session.getAttribute(
						"account");

		// 未ログイン対策
		if (user == null) {

			res.sendRedirect(
					req.getContextPath()
					+ "/scoremanager/login.jsp");

			return;
		}

		MissionDAO dao =
				new MissionDAO();

		List<mission> missions =
				dao.selectClearedByAccountId(
						user.getAccountId());

		req.setAttribute(
				"missions",
				missions);

		req.getRequestDispatcher("missionclear.jsp").forward(req, res);
	}
}