package scoremanager.main;

import java.math.BigDecimal;
import java.util.List;

import bean.account;
import bean.exercise_record;
import bean.exp;
import bean.mission;
import bean.point;
import dao.ExerciseRecordDAO;
import dao.ExpDAO;
import dao.MissionDAO;
import dao.PointDAO;
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

		// 入力チェック
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
				new BigDecimal(distanceStr));

		ExerciseRecordDAO exerciseDao =
				new ExerciseRecordDAO();

		exerciseDao.insert(record);

		// 保存完了メッセージ
		req.setAttribute(
				"message",
				"運動記録を保存しました。");

		// ミッション判定
		MissionDAO missionDao =
				new MissionDAO();

		List<mission> missions =
				missionDao.selectUnclearedByAccountId(
						user.getAccountId());

		for (mission m : missions) {

			// 運動ミッションのみ
			if (m.getTargetType() == 1) {

				if (distance >=
						m.getTargetValue()
						.doubleValue()) {

					// ミッションクリア
					missionDao.clearMission(
							m.getMissionId());

					// EXP加算
					ExpDAO expDao =
							new ExpDAO();

					exp e =
							expDao.selectByAccountId(
									user.getAccountId());

					if (e != null) {

						e.setTotalExp(
								e.getTotalExp()
								+ m.getRewardExp());

						expDao.update(e);
					}

					// ポイント加算
					PointDAO pointDao =
							new PointDAO();

					point p =
							pointDao.selectByAccountId(
									user.getAccountId());

					if (p != null) {

						p.setPointCount(
								p.getPointCount()
								+ m.getRewardPoint());

						pointDao.update(p);
					}

					// ミッション画面で表示する
					session.setAttribute(
							"missionMessage",
							"ミッション達成！");

					session.setAttribute(
							"rewardExp",
							m.getRewardExp());

					session.setAttribute(
							"rewardPoint",
							m.getRewardPoint());

					break;
				}
			}
		}

		req.getRequestDispatcher(
				"/scoremanager/main/exerciseRecord.jsp")
				.forward(req, res);
	}
}