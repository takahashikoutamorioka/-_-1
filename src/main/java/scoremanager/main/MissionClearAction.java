package scoremanager.main;

import java.util.List;

import bean.account;
import bean.exp;
import bean.mission;
import bean.point;
import dao.AccountDAO;
import dao.ExpDAO;
import dao.MissionDAO;
import dao.PointDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class MissionClearAction extends Action {

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

		if (user == null) {

			res.sendRedirect(
					req.getContextPath()
					+ "/scoremanager/login.jsp");

			return;
		}

		MissionDAO missionDao =
				new MissionDAO();

		String missionIdStr =
				req.getParameter(
						"missionId");

		// 達成ボタン押下

		if (missionIdStr != null) {

			int missionId =
					Integer.parseInt(
							missionIdStr);

			mission mission =
					missionDao.findById(
							missionId);

			// EXP加算

			ExpDAO expDao =
					new ExpDAO();

			exp e =
					expDao.selectByAccountId(
							user.getAccountId());

			if (e != null) {

				e.setTotalExp(
						e.getTotalExp()
						+ mission.getRewardExp());

				expDao.update(e);

				int oldRank =
						user.getUserRank();

				int newRank =
						calculateRank(
								e.getTotalExp());

				AccountDAO accountDao =
						new AccountDAO();

				accountDao.updateRank(
						user.getAccountId(),
						newRank);

				// ランクアップ通知

				if (newRank > oldRank) {

					session.setAttribute(
							"rankUpMessage",
							"ランクアップ！");

					session.setAttribute(
							"oldRank",
							oldRank);

					session.setAttribute(
							"newRank",
							newRank);
				}

				// セッション更新

				user.setUserRank(
						newRank);

				session.setAttribute(
						"account",
						user);
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
						+ mission.getRewardPoint());

				pointDao.update(p);
			}

			// ミッション完了

			missionDao.rewardMission(
					missionId);

			session.setAttribute(
					"missionMessage",
					"報酬を受け取りました！");
		}

		List<mission> missions =
				missionDao.selectClearedByAccountId(
						user.getAccountId());

		req.setAttribute(
				"missions",
				missions);

		req.getRequestDispatcher(
				"missionclear.jsp")
				.forward(req, res);
	}

	/**
	 * ランク計算
	 *
	 * 1～10 = 50EXP
	 * 11～20 = 75EXP
	 * 21～30 = 100EXP
	 */
	private int calculateRank(
			int totalExp) {

		int rank = 1;

		int needExp = 0;

		for (int nextRank = 2;
				nextRank <= 30;
				nextRank++) {

			if (nextRank <= 10) {

				needExp += 50;

			} else if (nextRank <= 20) {

				needExp += 75;

			} else {

				needExp += 100;
			}

			if (totalExp >= needExp) {

				rank = nextRank;

			} else {

				break;
			}
		}

		return rank;
	}
}