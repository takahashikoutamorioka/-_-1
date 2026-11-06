package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.point;

public class PointDAO extends DAO {

	// account_idからポイント取得
	public point selectByAccountId(int accountId)
			throws Exception {

		point p = null;

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(
				"SELECT * FROM point WHERE account_id = ?");

		st.setInt(1, accountId);

		ResultSet rs = st.executeQuery();

		while (rs.next()) {

			p = new point();

			p.setAccountId(
					rs.getInt("account_id"));

			p.setPointCount(
					rs.getInt("point_count"));
		}

		st.close();
		con.close();

		return p;
	}

	// ポイント更新
	public int update(point p)
			throws Exception {

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(

				"UPDATE point "
				+ "SET point_count = ? "
				+ "WHERE account_id = ?"

		);

		st.setInt(1, p.getPointCount());
		st.setInt(2, p.getAccountId());

		int line = st.executeUpdate();

		st.close();
		con.close();

		return line;
	}
}