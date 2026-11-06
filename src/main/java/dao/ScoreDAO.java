package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.score;

public class ScoreDAO extends DAO {

	// スコア登録
	public int insert(score s)
			throws Exception {

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(

				"INSERT INTO score("
				+ "account_id,"
				+ "brain_training_id,"
				+ "score"
				+ ") VALUES(?,?,?)"

		);

		st.setInt(1, s.getAccountId());
		st.setInt(2, s.getBrainTrainingId());
		st.setInt(3, s.getScore());

		int line = st.executeUpdate();

		st.close();
		con.close();

		return line;
	}

	// ユーザーごとのスコア履歴取得
	public List<score> selectByAccountId(
			int accountId)
			throws Exception {

		List<score> list =
				new ArrayList<>();

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(

				"SELECT * "
				+ "FROM score "
				+ "WHERE account_id=? "
				+ "ORDER BY play_at DESC"

		);

		st.setInt(1, accountId);

		ResultSet rs = st.executeQuery();

		while (rs.next()) {

			score s = new score();

			s.setScoreId(
					rs.getInt("score_id"));

			s.setAccountId(
					rs.getInt("account_id"));

			s.setBrainTrainingId(
					rs.getInt("brain_training_id"));

			s.setScore(
					rs.getInt("score"));

			s.setPlayAt(
					rs.getTimestamp("play_at"));

			list.add(s);
		}

		st.close();
		con.close();

		return list;
	}

	// 最高得点取得
	public int selectMaxScore(
			int accountId,
			int brainTrainingId)
			throws Exception {

		int maxScore = 0;

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(

				"SELECT MAX(score) max_score "
				+ "FROM score "
				+ "WHERE account_id=? "
				+ "AND brain_training_id=?"

		);

		st.setInt(1, accountId);
		st.setInt(2, brainTrainingId);

		ResultSet rs = st.executeQuery();

		if (rs.next()) {

			maxScore =
					rs.getInt("max_score");
		}

		st.close();
		con.close();

		return maxScore;
	}
}