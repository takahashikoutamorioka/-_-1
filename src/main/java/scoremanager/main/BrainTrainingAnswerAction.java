package scoremanager.main;

import java.util.List;

import bean.brain_training_question;
import bean.mission;
import bean.score;
import dao.MissionDAO;
import dao.ScoreDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class BrainTrainingAnswerAction extends Action {

    @SuppressWarnings("unchecked")
    @Override
    public void execute(HttpServletRequest req,
            HttpServletResponse res) throws Exception {

        HttpSession session =
                req.getSession();

        List<brain_training_question> examList =
                (List<brain_training_question>)
                session.getAttribute("examList");

        int currentNo =
                (Integer) session.getAttribute("currentNo");

        int correctCount =
                (Integer) session.getAttribute("correctCount");

        String trainingType =
                (String) session.getAttribute("trainingType");

        String trainingName =
                (String) session.getAttribute("trainingName");

        Integer trainingId =
                (Integer) session.getAttribute("trainingId");

        String answer =
                req.getParameter("answer");

        brain_training_question question =
                examList.get(currentNo);

        // 正解判定
        if (Integer.parseInt(answer)
                == question.getCorrectAnswer()) {

            correctCount++;
        }

        // 次の問題へ
        currentNo++;

        session.setAttribute(
                "currentNo",
                currentNo);

        session.setAttribute(
                "correctCount",
                correctCount);

        // 全問題終了
        if (currentNo >= examList.size()) {

            int scoreValue =
                    (int) Math.round(
                            ((double) correctCount
                                    / examList.size())
                                    * 100);

            Integer accountId =
                    (Integer) session.getAttribute(
                            "accountId");

            // ====================
            // score保存
            // ====================

            score scoreBean =
                    new score();

            scoreBean.setAccountId(
                    accountId);

            scoreBean.setBrainTrainingId(
                    trainingId);

            scoreBean.setScore(
                    scoreValue);

            ScoreDAO scoreDao =
                    new ScoreDAO();

            scoreDao.insert(
                    scoreBean);

            // ====================
            // ミッション判定
            // ====================

            MissionDAO missionDao =
                    new MissionDAO();

            List<mission> missionList =
                    missionDao.selectUnclearedByAccountId(
                            accountId);

            for (mission m : missionList) {

                // targetType = 3
                // 脳トレ実施回数
                if (m.getTargetType() == 3) {

                    missionDao.completeMission(
                            m.getMissionId());
                }

                // targetType = 2
                // 脳トレ得点
                if (m.getTargetType() == 2
                        && scoreValue >=
                        m.getTargetValue()
                        .intValue()) {

                    missionDao.completeMission(
                            m.getMissionId());
                }
            }

            // ====================
            // 結果画面
            // ====================

            req.setAttribute(
                    "score",
                    scoreValue);

            req.setAttribute(
                    "correctCount",
                    correctCount);

            req.setAttribute(
                    "totalQuestions",
                    examList.size());

            req.setAttribute(
                    "trainingName",
                    trainingName);

            req.getRequestDispatcher(
                    "brainTrainingResult.jsp")
                    .forward(req, res);

            return;
        }

        // ====================
        // 次の問題表示
        // ====================

        brain_training_question nextQuestion =
                examList.get(currentNo);

        req.setAttribute(
                "question",
                nextQuestion);

        req.setAttribute(
                "questionNo",
                currentNo + 1);

        req.setAttribute(
                "trainingType",
                trainingType);

        req.setAttribute(
                "trainingName",
                trainingName);

        req.getRequestDispatcher(
                "brainTrainingQuestion.jsp")
                .forward(req, res);
    }
}