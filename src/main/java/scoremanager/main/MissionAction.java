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

		// ミッション達成メッセージ受け取り

		req.setAttribute(
				"missionMessage",
				session.getAttribute(
						"missionMessage"));

		req.setAttribute(
				"rewardExp",
				session.getAttribute(
						"rewardExp"));

		req.setAttribute(
				"rewardPoint",
				session.getAttribute(
						"rewardPoint"));

		// 一度表示したら削除

		session.removeAttribute(
				"missionMessage");

		session.removeAttribute(
				"rewardExp");

		session.removeAttribute(
				"rewardPoint");

		req.getRequestDispatcher(
				"mission.jsp")
				.forward(req, res);
	}
}