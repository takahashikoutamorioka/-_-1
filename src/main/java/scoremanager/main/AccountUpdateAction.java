package scoremanager.main;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.List;

import bean.account;
import dao.AccountDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class AccountUpdateAction extends Action {

    @Override
    public void execute(HttpServletRequest req,
            HttpServletResponse res) throws Exception {

        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession(false);

        if (session == null ||
                !(session.getAttribute("account") instanceof account)) {
            res.sendRedirect(req.getContextPath() + "/loginForm.jsp");
            return;
        }

        if (!"POST".equalsIgnoreCase(req.getMethod())) {
            res.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
            return;
        }

        account loginAccount =
                (account) session.getAttribute("account");

        String name = req.getParameter("user_name");
        String email = req.getParameter("email");
        String tel = req.getParameter("tel");
        String password = req.getParameter("password");

        List<String> errors = new ArrayList<>();

        name = name == null ? "" : name.trim();
        email = email == null ? "" : email.trim();
        tel = tel == null ? "" : tel.trim();

        if (name.isEmpty()) {
            errors.add("名前を入力してください");
        } else if (name.length() > 50) {
            errors.add("名前は50文字以内で入力してください");
        }

        if (email.isEmpty()) {
            errors.add("メールアドレスを入力してください");
        } else if (email.length() > 254 ||
                !email.matches("^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$")) {
            errors.add("正しいメールアドレスを入力してください");
        }

        if (tel.isEmpty()) {
            errors.add("電話番号を入力してください");
        } else if (!tel.matches("[0-9-]{10,15}")) {
            errors.add("電話番号は10～15文字の数字とハイフンで入力してください");
        }

        if (password != null && !password.isEmpty()
                && password.length() < 8) {
            errors.add("パスワードは8文字以上で入力してください");
        }

        if (!errors.isEmpty()) {
            backToEdit(req, res, name, email, tel, errors);
            return;
        }

        AccountDAO dao = new AccountDAO();

        account sameName = dao.findByName(name);

        if (sameName != null &&
                sameName.getAccountId() != loginAccount.getAccountId()) {
            errors.add("そのユーザー名は既に使用されています");
        }

        account sameEmail = dao.findByEmail(email);

        if (sameEmail != null &&
                sameEmail.getAccountId() != loginAccount.getAccountId()) {
            errors.add("そのメールアドレスは既に使用されています");
        }

        if (!errors.isEmpty()) {
            backToEdit(req, res, name, email, tel, errors);
            return;
        }

        account current =
                dao.findByUserId(loginAccount.getAccountId());

        if (current == null) {
            errors.add("アカウントが見つかりません");
            backToEdit(req, res, name, email, tel, errors);
            return;
        }

        current.setUserName(name);
        current.setEmail(email);
        current.setTel(tel);

        if (password != null && !password.isEmpty()) {
            current.setPassword(hashPassword(password));
        }

        boolean updated = dao.update(current);

        if (updated) {
            session.setAttribute("account", current);
            res.sendRedirect("accountInfo.jsp");
        } else {
            errors.add("アカウント情報の更新に失敗しました");
            backToEdit(req, res, name, email, tel, errors);
        }
    }

    private void backToEdit(
            HttpServletRequest req,
            HttpServletResponse res,
            String name,
            String email,
            String tel,
            List<String> errors) throws Exception {

        req.setAttribute("errors", errors);
        req.setAttribute("inputName", name);
        req.setAttribute("inputEmail", email);
        req.setAttribute("inputTel", tel);

        req.getRequestDispatcher("accountEdit.jsp").forward(req, res);
    }

    private String hashPassword(String password) throws Exception {

        MessageDigest md = MessageDigest.getInstance("SHA-256");

        byte[] bytes = md.digest(
                password.getBytes(StandardCharsets.UTF_8));

        StringBuilder sb = new StringBuilder();

        for (byte b : bytes) {
            sb.append(String.format("%02x", b & 0xff));
        }

        return sb.toString();
    }
}
