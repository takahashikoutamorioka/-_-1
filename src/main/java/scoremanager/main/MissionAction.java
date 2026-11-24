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

		HttpSession session = req.getSession();

		account user = (account) session.getAttribute("account");

		// 未ログインならログイン画面へ
		if (user == null) {
			res.sendRedirect(
					req.getContextPath() + "/scoremanager/login.jsp");
			return;
		}

		MissionDAO dao = new MissionDAO();

		// 日付が変わっていたら、前日以前にクリアしたデイリーミッションを未クリアに戻す
		dao.resetDailyMissions(user.getAccountId());

		// 未クリアミッション取得
		List<mission> missions =
				dao.selectUnclearedByAccountId(user.getAccountId());

		req.setAttribute("missions", missions);

		// クリア後などに他のActionが入れたメッセージを1回だけ表示
		req.setAttribute(
				"missionMessage",
				session.getAttribute("missionMessage"));

		session.removeAttribute("missionMessage");

		req.getRequestDispatcher(
				"/scoremanager/main/mission.jsp")
				.forward(req, res);
	}
}
