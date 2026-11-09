package scoremanager.main;

import bean.account;
import dao.AccountDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class AccountInfoAction extends Action {

	@Override
	public void execute(
			HttpServletRequest req,
			HttpServletResponse res)
			throws Exception {

		HttpSession session =
				req.getSession(false);

		// 未ログイン対策
		if (session == null
				|| !(session.getAttribute(
						"account")
						instanceof account)) {

			res.sendRedirect(
					req.getContextPath()
					+ "/scoremanager/login.jsp");

			return;
		}

		account loginAccount =
				(account) session.getAttribute(
						"account");

		AccountDAO dao =
				new AccountDAO();

		// DBから最新情報取得
		account latestAccount =
				dao.findByUserId(
						loginAccount.getAccountId());

		// アカウントが存在しない場合
		if (latestAccount == null) {

			session.invalidate();

			res.sendRedirect(
					req.getContextPath()
					+ "/scoremanager/login.jsp");

			return;
		}

		// セッション更新
		session.setAttribute(
				"account",
				latestAccount);

		// JSPへ遷移
		req.getRequestDispatcher(
				"accountInfo.jsp")
				.forward(req, res);
	}
}