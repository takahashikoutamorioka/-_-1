package scoremanager;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.List;

import bean.AccountBean;
import dao.AccountDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

/**
 * ログイン処理（POST main/Login.action）
 * ・入力チェック → アカウント検索 → 成功ならセッションに保存して画面へ
 * ・管理者はadminTop.jsp、ユーザーはtop.jspを表示する
 */
public class LoginAction extends Action {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// 入力値を受け取る
		String name = req.getParameter("name");
		String password = req.getParameter("password");
		List<String> errors = new ArrayList<>();

		// 入力チェック
		if (!checkInput(name, password, errors)) {
			backToLogin(req, res, name, errors);
			return;
		}

		// アカウントを検索する（新規登録と同じ方法でハッシュ化したパスワードで照合）
		AccountDAO dao = new AccountDAO();
		AccountBean account = dao.findByNameAndPassword(name.trim(), hashPassword(password));

		// 一致しない場合
		if (account == null) {
			errors.add("ユーザー名またはパスワードが違います");
			backToLogin(req, res, name, errors);
			return;
		}

		// 一致した場合：古いセッションを破棄して、新しいセッションにアカウントを保存する
		HttpSession old = req.getSession(false);
		if (old != null) {
			old.invalidate();
		}
		HttpSession session = req.getSession(true);
		session.setAttribute("account", account);

		// 管理者（accountType=1）は管理者画面、ユーザーはトップ画面
		String next = account.getAccountType() == 1 ? "adminTop.jsp" : "top.jsp";
		req.getRequestDispatcher(next).forward(req, res);
	}

	/** 入力チェック（未入力があれば errors に追加して false を返す） */
	private boolean checkInput(String name, String password, List<String> errors) {
		if (name == null || name.trim().isEmpty()) {
			errors.add("ユーザー名を入力してください");
		}
		if (password == null || password.isEmpty()) {
			errors.add("パスワードを入力してください");
		}
		return errors.isEmpty();
	}

	/** ログイン画面に戻す（エラーメッセージと入力したユーザー名を渡す） */
	private void backToLogin(HttpServletRequest req, HttpServletResponse res,
			String name, List<String> errors) throws Exception {
		req.setAttribute("errors", errors);
		req.setAttribute("name", name);
		req.getRequestDispatcher("../loginForm.jsp").forward(req, res);
	}

	/** パスワードをSHA-256でハッシュ化する（新規登録の方法と必ずそろえる） */
	private String hashPassword(String password) throws Exception {
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		byte[] bytes = md.digest(password.getBytes(StandardCharsets.UTF_8));
		StringBuilder sb = new StringBuilder();
		for (byte b : bytes) {
			sb.append(String.format("%02x", b));
		}
		return sb.toString();
	}
}