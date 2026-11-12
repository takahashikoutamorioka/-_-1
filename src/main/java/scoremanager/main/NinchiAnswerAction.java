package scoremanager.main;

import java.util.List;

import bean.ninchi_question;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class NinchiAnswerAction extends Action {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(
			HttpServletRequest req,
			HttpServletResponse res)
			throws Exception {

		HttpSession session =
				req.getSession();

		List<ninchi_question> questions =
				(List<ninchi_question>) session.getAttribute(
						"questions");

		int index =
				(Integer) session.getAttribute(
						"index");

		int score =
				(Integer) session.getAttribute(
						"score");

		int answer =
				Integer.parseInt(
						req.getParameter(
								"answer"));

		ninchi_question currentQuestion =
				questions.get(index);

		// 採点
		if (answer ==
				currentQuestion.getCorrectAnswer()) {

			score++;
		}

		// 次の問題番号
		index++;

		// 15問終了
		// 全問終了
		if (index >= questions.size()) {

			int brainAge;

			if (score >= 13) {

				brainAge = 40;

			} else if (score >= 10) {

				brainAge = 50;

			} else if (score >= 7) {

				brainAge = 60;

			} else if (score >= 4) {

				brainAge = 70;

			} else {

				brainAge = 80;
			}

			// 結果表示用
			req.setAttribute(
					"score",
					score);

			req.setAttribute(
					"brainAge",
					brainAge);

			System.out.println("結果画面へ");
			System.out.println("score=" + score);
			System.out.println("brainAge=" + brainAge);

			req.getRequestDispatcher(
					"/scoremanager/main/ninchiResult.jsp")
					.forward(req, res);

			return;
		}

		// 次の問題用
		session.setAttribute(
		        "index",
		        index);

		session.setAttribute(
		        "score",
		        score);

		req.setAttribute(
		        "questionNo",
		        index + 1);

		req.setAttribute(
		        "question",
		        questions.get(index));

		req.getRequestDispatcher(
		        "/scoremanager/main/ninchiQuestion.jsp")
		        .forward(req, res);
	}
}