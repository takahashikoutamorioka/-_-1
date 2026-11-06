package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.gift;

public class GiftDAO extends DAO {

	// ギフト券交換
	public int insert(gift g)
			throws Exception {

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(

			"INSERT INTO gift("
			+ "account_id, "
			+ "used_point, "
			+ "gift_amount, "
			+ "gift_name"
			+ ") VALUES(?,?,?,?)"

		);

		st.setInt(1, g.getAccountId());
		st.setInt(2, g.getUsedPoint());
		st.setInt(3, g.getGiftAmount());
		st.setString(4, g.getGiftName());

		int line = st.executeUpdate();

		st.close();
		con.close();

		return line;
	}

	// ギフト交換履歴取得
	public List<gift> selectByAccountId(
			int accountId)
			throws Exception {

		List<gift> list = new ArrayList<>();

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(

			"SELECT * FROM gift "
			+ "WHERE account_id=? "
			+ "ORDER BY exc_at DESC"

		);

		st.setInt(1, accountId);

		ResultSet rs = st.executeQuery();

		while (rs.next()) {

			gift g = new gift();

			g.setGiftExcId(
					rs.getInt("gift_exc_id"));

			g.setAccountId(
					rs.getInt("account_id"));

			g.setExcAt(
					rs.getTimestamp("exc_at"));

			g.setUsedPoint(
					rs.getInt("used_point"));

			g.setGiftAmount(
					rs.getInt("gift_amount"));

			g.setGiftName(
					rs.getString("gift_name"));

			list.add(g);
		}

		st.close();
		con.close();

		return list;
	}
}