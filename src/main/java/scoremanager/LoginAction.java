package scoremanager;

import java.util.ArrayList;
import java.util.List;

import bean.account;
import dao.AccountDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class LoginAction extends Action {

	@Override
	public void execute(HttpServletRequest req,
			HttpServletResponse res)
			throws Exception {

		// 入力値取得
		String name = req.getParameter("name");
		String password = req.getParameter("password");

		List<String> errors = new ArrayList<>();

		// 入力チェック
		if (!checkInput(name, password, errors)) {

			backToLogin(req, res, name, errors);

			return;
		}

		// DB検索
		AccountDAO dao = new AccountDAO();

		account account =
				dao.findByNameAndPassword(
						name.trim(),
						password);

		// ログイン失敗
		if (account == null) {

			errors.add(
				"ユーザー名またはパスワードが違います");

			backToLogin(req, res, name, errors);

			return;
		}

		// 古いセッション破棄
		HttpSession old =
				req.getSession(false);

		if (old != null) {

			old.invalidate();
		}

		// 新しいセッション作成
		HttpSession session =
				req.getSession(true);

		// アカウント情報を保存
		session.setAttribute(
				"account",
				account);

		// アカウントIDを保存（追加）
		session.setAttribute(
				"accountId",
				account.getAccountId());

		// TopActionへリダイレクト
		if (account.getAccountType() == 1) {

			res.sendRedirect(
				req.getContextPath()
				+ "/scoremanager/main/AdminTop.action");

		} else {

			res.sendRedirect(
				req.getContextPath()
				+ "/scoremanager/main/Top.action");
		}
	}

	/**
	 * 入力チェック
	 */
	private boolean checkInput(
			String name,
			String password,
			List<String> errors) {

		if (name == null
				|| name.trim().isEmpty()) {

			errors.add(
				"ユーザー名を入力してください");
		}

		if (password == null
				|| password.isEmpty()) {

			errors.add(
				"パスワードを入力してください");
		}

		return errors.isEmpty();
	}

	/**
	 * ログイン画面へ戻る
	 */
	private void backToLogin(
			HttpServletRequest req,
			HttpServletResponse res,
			String name,
			List<String> errors)
			throws Exception {

		req.setAttribute(
				"errors",
				errors);

		req.setAttribute(
				"name",
				name);

		req.getRequestDispatcher(
				"/scoremanager/login.jsp")
				.forward(req, res);
	}
}