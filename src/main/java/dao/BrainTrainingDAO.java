package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.brain_training;

public class BrainTrainingDAO extends DAO {

	// 脳トレ一覧取得
	public List<brain_training> selectAll()
			throws Exception {

		List<brain_training> list = new ArrayList<>();

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(
				"SELECT * FROM brain_training");

		ResultSet rs = st.executeQuery();

		while (rs.next()) {

			brain_training b = new brain_training();

			b.setBrainTrainingId(
					rs.getInt("brain_training_id"));

			b.setTrainingName(
					rs.getString("training_name"));

			b.setMaxScore(
					rs.getInt("max_score"));

			list.add(b);
		}

		st.close();
		con.close();

		return list;
	}

	// ID検索
	public brain_training selectById(int id)
			throws Exception {

		brain_training b = null;

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(
				"SELECT * FROM brain_training "
				+ "WHERE brain_training_id=?");

		st.setInt(1, id);

		ResultSet rs = st.executeQuery();

		while (rs.next()) {

			b = new brain_training();

			b.setBrainTrainingId(
					rs.getInt("brain_training_id"));

			b.setTrainingName(
					rs.getString("training_name"));

			b.setMaxScore(
					rs.getInt("max_score"));
		}

		st.close();
		con.close();

		return b;
	}
}