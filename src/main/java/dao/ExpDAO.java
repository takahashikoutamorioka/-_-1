package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.exp;

public class ExpDAO extends DAO {

	// account_idから経験値を取得
	public exp selectByAccountId(int accountId)
			throws Exception {

		exp e = null;

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(
				"SELECT * FROM exp WHERE account_id = ?");

		st.setInt(1, accountId);

		ResultSet rs = st.executeQuery();

		while (rs.next()) {

			e = new exp();

			e.setAccountId(
					rs.getInt("account_id"));

			e.setTotalExp(
					rs.getInt("total_exp"));
		}

		st.close();
		con.close();

		return e;
	}

	// 経験値更新
	public int update(exp e)
			throws Exception {

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(

				"UPDATE exp "
				+ "SET total_exp=? "
				+ "WHERE account_id=?"

		);

		st.setInt(1, e.getTotalExp());
		st.setInt(2, e.getAccountId());

		int line = st.executeUpdate();

		st.close();
		con.close();

		return line;
	}
}