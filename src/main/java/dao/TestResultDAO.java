package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.test_result;

public class TestResultDAO extends DAO {

	// テスト結果登録
	public int insert(test_result t)
			throws Exception {

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(

				"INSERT INTO test_result("
				+ "account_id,"
				+ "test_type,"
				+ "total_score,"
				+ "brain_age"
				+ ") VALUES(?,?,?,?)"

		);

		st.setInt(1, t.getAccountId());
		st.setInt(2, t.getTestType());
		st.setInt(3, t.getTotalScore());
		st.setInt(4, t.getBrainAge());

		int line = st.executeUpdate();

		st.close();
		con.close();

		return line;
	}

	// ユーザーの受験履歴取得
	public List<test_result> selectByAccountId(
			int accountId)
			throws Exception {

		List<test_result> list = new ArrayList<>();

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(

				"SELECT * "
				+ "FROM test_result "
				+ "WHERE account_id=? "
				+ "ORDER BY taken_at DESC"

		);

		st.setInt(1, accountId);

		ResultSet rs = st.executeQuery();

		while (rs.next()) {

			test_result t = new test_result();

			t.setTestResultId(
					rs.getInt("test_result_id"));

			t.setAccountId(
					rs.getInt("account_id"));

			t.setTestType(
					rs.getInt("test_type"));

			t.setTotalScore(
					rs.getInt("total_score"));

			t.setBrainAge(
					rs.getInt("brain_age"));

			t.setTakenAt(
					rs.getTimestamp("taken_at"));

			list.add(t);
		}

		st.close();
		con.close();

		return list;
	}

	// 最新のテスト結果取得
	public test_result selectLatestResult(
			int accountId)
			throws Exception {

		test_result t = null;

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(

				"SELECT * "
				+ "FROM test_result "
				+ "WHERE account_id=? "
				+ "ORDER BY taken_at DESC"

		);

		st.setInt(1, accountId);

		ResultSet rs = st.executeQuery();

		if (rs.next()) {

			t = new test_result();

			t.setTestResultId(
					rs.getInt("test_result_id"));

			t.setAccountId(
					rs.getInt("account_id"));

			t.setTestType(
					rs.getInt("test_type"));

			t.setTotalScore(
					rs.getInt("total_score"));

			t.setBrainAge(
					rs.getInt("brain_age"));

			t.setTakenAt(
					rs.getTimestamp("taken_at"));
		}

		st.close();
		con.close();

		return t;
	}
}