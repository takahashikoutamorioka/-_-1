package scoremanager.main;

import java.util.ArrayList;
import java.util.List;

import bean.account;
import dao.AccountDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class RegisterAction extends Action {

	@Override
	public void execute(HttpServletRequest req,
			HttpServletResponse res)
			throws Exception {

		String userName =
				req.getParameter("userName");

		String password =
				req.getParameter("password");

		String confirmPassword =
				req.getParameter("confirmPassword");

		String email =
				req.getParameter("email");

		String tel =
				req.getParameter("tel");

		List<String> errors =
				new ArrayList<>();

		// 入力チェック
		if (userName == null
				|| userName.trim().isEmpty()) {

			errors.add(
					"ユーザー名を入力してください");
		}

		if (password == null
				|| password.isEmpty()) {

			errors.add(
					"パスワードを入力してください");
		}

		if (confirmPassword == null
				|| confirmPassword.isEmpty()) {

			errors.add(
					"確認用パスワードを入力してください");
		}

		if (password != null
				&& confirmPassword != null
				&& !password.equals(confirmPassword)) {

			errors.add(
					"パスワードが一致しません");
		}

		if (email == null
				|| email.trim().isEmpty()) {

			errors.add(
					"メールアドレスを入力してください");
		}

		if (tel == null
				|| tel.trim().isEmpty()) {

			errors.add(
					"電話番号を入力してください");
		}

		// エラー時
		if (!errors.isEmpty()) {

			req.setAttribute(
					"errors",
					errors);

			req.setAttribute(
					"userName",
					userName);

			req.setAttribute(
					"email",
					email);

			req.setAttribute(
					"tel",
					tel);

			req.getRequestDispatcher(
					"register.jsp")
					.forward(req, res);

			return;
		}

		AccountDAO dao =
				new AccountDAO();

		// ユーザー名重複チェック
		if (dao.findByName(
				userName.trim()) != null) {

			errors.add(
					"そのユーザー名は既に使用されています");
		}

		// メール重複チェック
		if (dao.findByEmail(
				email.trim()) != null) {

			errors.add(
					"そのメールアドレスは既に登録されています");
		}

		if (!errors.isEmpty()) {

			req.setAttribute(
					"errors",
					errors);

			req.setAttribute(
					"userName",
					userName);

			req.setAttribute(
					"email",
					email);

			req.setAttribute(
					"tel",
					tel);

			req.getRequestDispatcher(
					"register.jsp")
					.forward(req, res);

			return;
		}

		// Beanへセット
		account a =
				new account();

		a.setUserName(
				userName.trim());

		a.setPassword(
				password);

		a.setEmail(
				email.trim());

		a.setTel(
				tel.trim());

		// 登録
		dao.insert(a);

		// セッション保存
		HttpSession session =
				req.getSession();

		session.setAttribute(
				"account",
				a);

		// 認知力チェック開始画面へ
		req.getRequestDispatcher(
				"ninchiCheckStart.jsp")
				.forward(req, res);
	}
}