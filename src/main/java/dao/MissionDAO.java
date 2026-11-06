package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.mission;

public class MissionDAO extends DAO {

	// 未クリアミッション取得
	public List<mission> selectUncleared()
			throws Exception {

		List<mission> list = new ArrayList<>();

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(
				"SELECT * FROM mission "
				+ "WHERE status = 0");

		ResultSet rs = st.executeQuery();

		while (rs.next()) {

			mission m = new mission();

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

		st.close();
		con.close();

		return list;
	}

	// クリア済ミッション取得
	public List<mission> selectCleared()
			throws Exception {

		List<mission> list = new ArrayList<>();

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(
				"SELECT * FROM mission "
				+ "WHERE status = 1");

		ResultSet rs = st.executeQuery();

		while (rs.next()) {

			mission m = new mission();

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

		st.close();
		con.close();

		return list;
	}

	// ミッションクリア
	public int clearMission(int missionId)
			throws Exception {

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(

				"UPDATE mission "
				+ "SET status = 1, "
				+ "cleared_at = CURRENT_TIMESTAMP "
				+ "WHERE mission_id = ?"

		);

		st.setInt(1, missionId);

		int line = st.executeUpdate();

		st.close();
		con.close();

		return line;
	}
}