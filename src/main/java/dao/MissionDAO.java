package dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.mission;

public class MissionDAO extends DAO {

	// ミッション種類（設計書：1=デイリー、2=ワンタイム）
	public static final int TYPE_DAILY = 1;
	public static final int TYPE_ONETIME = 2;

	// 達成状況（0=未クリア、1=条件達成（報酬未受取）、2=クリア）
	public static final int STATUS_UNCLEARED = 0;
	public static final int STATUS_ACHIEVED = 1;
	public static final int STATUS_CLEARED = 2;

	// ResultSet の1行を mission に変換
	private mission toMission(ResultSet rs) throws Exception {

		mission m = new mission();

		m.setMissionId(rs.getInt("mission_id"));
		m.setMissionType(rs.getInt("mission_type"));
		m.setTargetType(rs.getInt("target_type"));
		m.setTargetValue(rs.getBigDecimal("target_value"));
		m.setStatus(rs.getInt("status"));
		m.setRewardExp(rs.getInt("reward_exp"));
		m.setRewardPoint(rs.getInt("reward_point"));

		return m;
	}

	// 未クリアミッション取得（未クリア・条件達成）
	public List<mission> selectUnclearedByAccountId(int accountId)
			throws Exception {

		List<mission> list = new ArrayList<>();

		try (Connection con = getConnection();
				PreparedStatement st = con.prepareStatement(
						"SELECT * FROM mission "
						+ "WHERE account_id = ? "
						+ "AND status IN (0, 1) "
						+ "ORDER BY mission_id")) {

			st.setInt(1, accountId);

			try (ResultSet rs = st.executeQuery()) {
				while (rs.next()) {
					list.add(toMission(rs));
				}
			}
		}

		return list;
	}

	// クリア済み一覧（新しい順）
	public List<mission> selectClearedByAccountId(int accountId)
			throws Exception {

		List<mission> list = new ArrayList<>();

		try (Connection con = getConnection();
				PreparedStatement st = con.prepareStatement(
						"SELECT * FROM mission "
						+ "WHERE account_id = ? "
						+ "AND status = 2 "
						+ "ORDER BY cleared_at DESC")) {

			st.setInt(1, accountId);

			try (ResultSet rs = st.executeQuery()) {
				while (rs.next()) {
					list.add(toMission(rs));
				}
			}
		}

		return list;
	}

	// ミッション取得
	public mission findById(int missionId) throws Exception {

		mission m = null;

		try (Connection con = getConnection();
				PreparedStatement st = con.prepareStatement(
						"SELECT * FROM mission WHERE mission_id = ?")) {

			st.setInt(1, missionId);

			try (ResultSet rs = st.executeQuery()) {
				if (rs.next()) {
					m = toMission(rs);
				}
			}
		}

		return m;
	}

	// 条件達成（status = 1）
	public int completeMission(int missionId) throws Exception {

		try (Connection con = getConnection();
				PreparedStatement st = con.prepareStatement(
						"UPDATE mission SET status = 1 WHERE mission_id = ?")) {

			st.setInt(1, missionId);

			return st.executeUpdate();
		}
	}

	// 報酬受取（status = 2、クリア日時を記録）
	public int rewardMission(int missionId) throws Exception {

		try (Connection con = getConnection();
				PreparedStatement st = con.prepareStatement(
						"UPDATE mission "
						+ "SET status = 2, cleared_at = CURRENT_TIMESTAMP "
						+ "WHERE mission_id = ?")) {

			st.setInt(1, missionId);

			return st.executeUpdate();
		}
	}

	// デイリーミッションのリセット
	// 前日以前にクリアしたデイリーを未クリアに戻す（日付が変わったら再度受けられる）
	public int resetDailyMissions(int accountId) throws Exception {

		try (Connection con = getConnection();
				PreparedStatement st = con.prepareStatement(
						"UPDATE mission "
						+ "SET status = 0, cleared_at = NULL "
						+ "WHERE account_id = ? "
						+ "AND mission_type = ? "
						+ "AND status = 2 "
						+ "AND cleared_at < CURRENT_DATE")) {

			st.setInt(1, accountId);
			st.setInt(2, TYPE_DAILY);

			return st.executeUpdate();
		}
	}

	// ミッション追加（ワンタイムの次の目標など）
	public int insertMission(
			int accountId,
			int missionType,
			int targetType,
			BigDecimal targetValue,
			int status,
			int rewardExp,
			int rewardPoint)
			throws Exception {

		try (Connection con = getConnection();
				PreparedStatement st = con.prepareStatement(
						"INSERT INTO mission "
						+ "(account_id, mission_type, target_type, target_value, "
						+ "status, reward_exp, reward_point) "
						+ "VALUES (?, ?, ?, ?, ?, ?, ?)")) {

			st.setInt(1, accountId);
			st.setInt(2, missionType);
			st.setInt(3, targetType);
			st.setBigDecimal(4, targetValue);
			st.setInt(5, status);
			st.setInt(6, rewardExp);
			st.setInt(7, rewardPoint);

			return st.executeUpdate();
		}
	}
}
