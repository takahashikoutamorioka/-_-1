package scoremanager.main;

public class AccountInfoAction {

<<<<<<< HEAD
}
=======
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
				|| !(session.getAttribute("account")
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

		// DBから最新情報を取得
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

		// JSPへ
		req.getRequestDispatcher(
				"/scoremanager/main/accountInfo.jsp")
				.forward(req, res);
	}
}
>>>>>>> branch 'master' of https://github.com/takahashikoutamorioka/-_-1.git
