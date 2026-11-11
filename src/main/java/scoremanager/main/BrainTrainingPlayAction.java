package scoremanager.main;

import java.util.Collections;
import java.util.List;

import bean.brain_training_question;
import dao.BrainTrainingQuestionDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class BrainTrainingPlayAction extends Action {

    @Override
    public void execute(HttpServletRequest req,
            HttpServletResponse res) throws Exception {

        String trainingType =
                req.getParameter("trainingType");

        // 未選択チェック
        if (trainingType == null || trainingType.isEmpty()) {

            req.setAttribute("trainingError", true);

            req.getRequestDispatcher(
                    "brainTraining.jsp")
                    .forward(req, res);

            return;
        }

        int trainingId = 0;
        String trainingName = "";

        switch (trainingType) {

        case "calculation":
            trainingId = 1;
            trainingName = "計算";
            break;

        case "memory":
            trainingId = 2;
            trainingName = "記憶力";
            break;

        case "quiz":
            trainingId = 3;
            trainingName = "クイズ";
            break;

        case "judgment":
            trainingId = 4;
            trainingName = "神経衰弱";
            break;
        }

        BrainTrainingQuestionDAO dao =
                new BrainTrainingQuestionDAO();

        List<brain_training_question> questionList =
                dao.findByTrainingId(trainingId);

        // 問題未登録チェック
        if (questionList.isEmpty()) {

            req.setAttribute(
                    "trainingError",
                    "問題が登録されていません。");

            req.getRequestDispatcher(
                    "brainTraining.jsp")
                    .forward(req, res);

            return;
        }

        // ランダム並び替え
        Collections.shuffle(questionList);

        // 最大10問取得
        List<brain_training_question> examList =
                questionList.subList(
                        0,
                        Math.min(10, questionList.size()));

        HttpSession session =
                req.getSession();

        // セッション保存
        session.setAttribute(
                "examList",
                examList);

        session.setAttribute(
                "currentNo",
                0);

        session.setAttribute(
                "correctCount",
                0);

        session.setAttribute(
                "trainingId",
                trainingId);

        session.setAttribute(
                "trainingName",
                trainingName);

        session.setAttribute(
                "trainingType",
                trainingType);

        // 1問目取得
        brain_training_question question =
                examList.get(0);

        req.setAttribute(
                "question",
                question);

        req.setAttribute(
                "questionNo",
                1);

        req.setAttribute(
                "trainingName",
                trainingName);

        req.setAttribute(
                "trainingType",
                trainingType);

        req.getRequestDispatcher(
                "brainTrainingQuestion.jsp")
                .forward(req, res);
    }
}