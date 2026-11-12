package scoremanager.main;

import java.util.List;

import bean.ninchi_question;
import dao.NinchiQuestionDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class NinchiStartAction extends Action {

	@Override
	public void execute(
			HttpServletRequest req,
			HttpServletResponse res)
			throws Exception {

		NinchiQuestionDAO dao =
				new NinchiQuestionDAO();

		List<ninchi_question> questions =
				dao.findRandom();

		HttpSession session =
				req.getSession();

		session.setAttribute(
				"questions",
				questions);

		session.setAttribute(
				"index",
				0);

		session.setAttribute(
				"score",
				0);

		// 1問目
		req.setAttribute(
				"questionNo",
				1);

		req.setAttribute(
				"question",
				questions.get(0));

		req.getRequestDispatcher(
				"/scoremanager/main/ninchiQuestion.jsp")
				.forward(req, res);
	}
}