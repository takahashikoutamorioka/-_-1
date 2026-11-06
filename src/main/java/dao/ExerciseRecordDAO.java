package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.exercise_record;

public class ExerciseRecordDAO extends DAO {

	// 運動記録登録
	public int insert(exercise_record e) throws Exception {

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(

			"INSERT INTO exercise_record ("
			+ "account_id, "
			+ "walking_distance"
			+ ") VALUES (?, ?)"

		);

		st.setInt(1, e.getAccountId());
		st.setBigDecimal(2, e.getWalkingDistance());

		int line = st.executeUpdate();

		st.close();
		con.close();

		return line;
	}

	// アカウントごとの運動記録一覧取得
	public List<exercise_record> selectByAccountId(
			int accountId)
			throws Exception {

		List<exercise_record> list = new ArrayList<>();

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(

			"SELECT * FROM exercise_record "
			+ "WHERE account_id = ? "
			+ "ORDER BY recorded_at DESC"

		);

		st.setInt(1, accountId);

		ResultSet rs = st.executeQuery();

		while (rs.next()) {

			exercise_record e = new exercise_record();

			e.setExerciseRecordId(
				rs.getInt("exercise_record_id"));

			e.setAccountId(
				rs.getInt("account_id"));

			e.setWalkingDistance(
				rs.getBigDecimal("walking_distance"));

			e.setRecordedAt(
				rs.getTimestamp("recorded_at"));

			list.add(e);
		}

		st.close();
		con.close();

		return list;
	}
}