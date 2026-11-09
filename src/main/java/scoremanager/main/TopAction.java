package scoremanager.main;

import bean.account;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class TopAction extends Action {

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

		// ランクアップ通知

		req.setAttribute(
				"rankUpMessage",
				session.getAttribute(
						"rankUpMessage"));

		req.setAttribute(
				"oldRank",
				session.getAttribute(
						"oldRank"));

		req.setAttribute(
				"newRank",
				session.getAttribute(
						"newRank"));

		// 一度表示したら削除

		session.removeAttribute(
				"rankUpMessage");

		session.removeAttribute(
				"oldRank");

		session.removeAttribute(
				"newRank");

		req.getRequestDispatcher(
				"/scoremanager/main/top.jsp")
				.forward(req, res);
	}
}