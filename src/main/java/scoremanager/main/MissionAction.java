package scoremanager.main;

import java.util.List;

import bean.account;
import bean.mission;
import dao.MissionDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class MissionAction extends Action {

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

		if (user == null) {

			res.sendRedirect(
					req.getContextPath()
					+ "/scoremanager/login.jsp");

			return;
		}

		MissionDAO dao =
				new MissionDAO();

		List<mission> missions =
				dao.selectUnclearedByAccountId(
						user.getAccountId());

		req.setAttribute(
				"missions",
				missions);

		req.setAttribute(
				"missionMessage",
				session.getAttribute(
						"missionMessage"));

		session.removeAttribute(
				"missionMessage");

		req.getRequestDispatcher(
				"/scoremanager/main/mission.jsp")
				.forward(req, res);
	}
}