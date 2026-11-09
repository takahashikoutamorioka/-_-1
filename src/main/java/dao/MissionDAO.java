package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.mission;

public class MissionDAO extends DAO {

	// 未クリアミッション取得
	public List<mission> selectUnclearedByAccountId(
			int accountId)
			throws Exception {

		List<mission> list =
				new ArrayList<>();

		Connection con =
				getConnection();

		PreparedStatement st =
				con.prepareStatement(

				"SELECT * "
				+ "FROM mission "
				+ "WHERE account_id = ? "
				+ "AND status IN (0,1) "
				+ "ORDER BY mission_id"

				);

		st.setInt(1, accountId);

		ResultSet rs =
				st.executeQuery();

		while (rs.next()) {

			mission m =
					new mission();

			m.setMissionId(
					rs.getInt("mission_id"));

			m.setMissionType(
					rs.getInt("mission_type"));

			m.setTargetType(
					rs.getInt("target_type"));

			m.setTargetValue(
					rs.getBigDecimal("target_value"));

			m.setStatus(
					rs.getInt("status"));

			m.setRewardExp(
					rs.getInt("reward_exp"));

			m.setRewardPoint(
					rs.getInt("reward_point"));

			list.add(m);
		}

		rs.close();
		st.close();
		con.close();

		return list;
	}

	// クリア済み一覧
	public List<mission> selectClearedByAccountId(
			int accountId)
			throws Exception {

		List<mission> list =
				new ArrayList<>();

		Connection con =
				getConnection();

		PreparedStatement st =
				con.prepareStatement(

				"SELECT * "
				+ "FROM mission "
				+ "WHERE account_id = ? "
				+ "AND status = 2 "
				+ "ORDER BY cleared_at DESC"

				);

		st.setInt(1, accountId);

		ResultSet rs =
				st.executeQuery();

		while (rs.next()) {

			mission m =
					new mission();

			m.setMissionId(
					rs.getInt("mission_id"));

			m.setMissionType(
					rs.getInt("mission_type"));

			m.setTargetType(
					rs.getInt("target_type"));

			m.setTargetValue(
					rs.getBigDecimal("target_value"));

			m.setStatus(
					rs.getInt("status"));

			m.setRewardExp(
					rs.getInt("reward_exp"));

			m.setRewardPoint(
					rs.getInt("reward_point"));

			list.add(m);
		}

		rs.close();
		st.close();
		con.close();

		return list;
	}

	// ミッション取得
	public mission findById(
			int missionId)
			throws Exception {

		Connection con =
				getConnection();

		PreparedStatement st =
				con.prepareStatement(

				"SELECT * "
				+ "FROM mission "
				+ "WHERE mission_id = ?"

				);

		st.setInt(1, missionId);

		ResultSet rs =
				st.executeQuery();

		mission m = null;

		if (rs.next()) {

			m = new mission();

			m.setMissionId(
					rs.getInt("mission_id"));

			m.setMissionType(
					rs.getInt("mission_type"));

			m.setTargetType(
					rs.getInt("target_type"));

			m.setTargetValue(
					rs.getBigDecimal("target_value"));

			m.setStatus(
					rs.getInt("status"));

			m.setRewardExp(
					rs.getInt("reward_exp"));

			m.setRewardPoint(
					rs.getInt("reward_point"));
		}

		rs.close();
		st.close();
		con.close();

		return m;
	}

	// 条件達成
	public int completeMission(
			int missionId)
			throws Exception {

		Connection con =
				getConnection();

		PreparedStatement st =
				con.prepareStatement(

				"UPDATE mission "
				+ "SET status = 1 "
				+ "WHERE mission_id = ?"

				);

		st.setInt(1, missionId);

		int line =
				st.executeUpdate();

		st.close();
		con.close();

		return line;
	}

	// 報酬受取
	public int rewardMission(
			int missionId)
			throws Exception {

		Connection con =
				getConnection();

		PreparedStatement st =
				con.prepareStatement(

				"UPDATE mission "
				+ "SET status = 2, "
				+ "cleared_at = CURRENT_TIMESTAMP "
				+ "WHERE mission_id = ?"

				);

		st.setInt(1, missionId);

		int line =
				st.executeUpdate();

		st.close();
		con.close();

		return line;
	}
}