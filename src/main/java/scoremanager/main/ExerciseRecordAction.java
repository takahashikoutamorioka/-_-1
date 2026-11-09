package scoremanager.main;

import java.math.BigDecimal;
import java.util.List;

import bean.account;
import bean.exercise_record;
import bean.mission;
import dao.ExerciseRecordDAO;
import dao.MissionDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class ExerciseRecordAction extends Action {

	@Override
	public void execute(
			HttpServletRequest req,
			HttpServletResponse res)
			throws Exception {

		HttpSession session =
				req.getSession();

		account user =
				(account) session.getAttribute(
						"account");

		String distanceStr =
				req.getParameter(
						"walkingDistance");

		// 初回表示
		if (distanceStr == null) {

			req.getRequestDispatcher(
					"/scoremanager/main/exerciseRecord.jsp")
					.forward(req, res);

			return;
		}

		// 未入力チェック
		if (distanceStr.trim().isEmpty()) {

			req.setAttribute(
					"error",
					"歩行距離を入力してください。");

			req.getRequestDispatcher(
					"/scoremanager/main/exerciseRecord.jsp")
					.forward(req, res);

			return;
		}

		double distance =
				Double.parseDouble(
						distanceStr);

		// 運動記録保存
		exercise_record record =
				new exercise_record();

		record.setAccountId(
				user.getAccountId());

		record.setWalkingDistance(
				new BigDecimal(
						distanceStr));

		ExerciseRecordDAO exerciseDao =
				new ExerciseRecordDAO();

		exerciseDao.insert(
				record);

		req.setAttribute(
				"message",
				"運動記録を保存しました。");

		// ミッション判定
		MissionDAO missionDao =
				new MissionDAO();

		List<mission> missions =
				missionDao.selectUnclearedByAccountId(
						user.getAccountId());

		boolean completed =
				false;

		for (mission m : missions) {

			// 運動ミッションのみ判定
			if (m.getTargetType() == 1) {

				if (distance >=
						m.getTargetValue()
						.doubleValue()) {

					// 未達成のみ達成状態へ変更
					if (m.getStatus() == 0) {

						missionDao.completeMission(
								m.getMissionId());

						completed = true;
					}
				}
			}
		}

		// ミッション達成通知
		if (completed) {

			session.setAttribute(
					"missionMessage",
					"ミッションを達成しました！");

		}

		req.getRequestDispatcher(
				"/scoremanager/main/exerciseRecord.jsp")
				.forward(req, res);
	}
}