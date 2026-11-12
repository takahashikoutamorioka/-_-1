package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.gift;

/**
 * ギフト券交換履歴DAO
 */
public class GiftDAO extends DAO {

    /**
     * ギフト券交換履歴を登録する
     */
    public void insert(gift g) throws Exception {

        String sql =
            "INSERT INTO gift " +
            "(account_id, used_point, gift_amount, gift_name) " +
            "VALUES (?, ?, ?, ?)";

        try (
            Connection con = getConnection();
            PreparedStatement st = con.prepareStatement(sql)
        ) {

            st.setInt(1, g.getAccountId());
            st.setInt(2, g.getUsedPoint());
            st.setInt(3, g.getGiftAmount());
            st.setString(4, g.getGiftName());

            st.executeUpdate();
        }
    }

    /**
     * 指定したユーザーのギフト券交換履歴を取得する
     */
    public List<gift> selectByAccountId(int accountId) throws Exception {

        List<gift> list = new ArrayList<>();

        String sql =
            "SELECT * FROM gift " +
            "WHERE account_id = ? " +
            "ORDER BY exc_at DESC";

        try (
            Connection con = getConnection();
            PreparedStatement st = con.prepareStatement(sql)
        ) {

            st.setInt(1, accountId);

            try (ResultSet rs = st.executeQuery()) {

                while (rs.next()) {

                    gift g = new gift();

                    g.setGiftExcId(rs.getInt("gift_exc_id"));
                    g.setAccountId(rs.getInt("account_id"));
                    g.setExcAt(rs.getTimestamp("exc_at"));
                    g.setUsedPoint(rs.getInt("used_point"));
                    g.setGiftAmount(rs.getInt("gift_amount"));
                    g.setGiftName(rs.getString("gift_name"));

                    list.add(g);
                }
            }
        }

        return list;
    }

    /**
     * 管理者用：全ユーザーのギフト券交換履歴を取得する
     */
    public List<gift> selectAllForAdmin() throws Exception {

        List<gift> list = new ArrayList<>();

        String sql =
            "SELECT " +
            "g.gift_exc_id, " +
            "g.account_id, " +
            "g.exc_at, " +
            "g.used_point, " +
            "g.gift_amount, " +
            "g.gift_name, " +
            "a.user_name " +
            "FROM gift g " +
            "INNER JOIN account a " +
            "ON g.account_id = a.account_id " +
            "ORDER BY g.exc_at DESC";

        try (
            Connection con = getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery()
        ) {

            while (rs.next()) {

                gift g = new gift();

                g.setGiftExcId(rs.getInt("gift_exc_id"));
                g.setAccountId(rs.getInt("account_id"));
                g.setExcAt(rs.getTimestamp("exc_at"));
                g.setUsedPoint(rs.getInt("used_point"));
                g.setGiftAmount(rs.getInt("gift_amount"));
                g.setGiftName(rs.getString("gift_name"));

                // ユーザー名を取得
                g.setUserName(rs.getString("user_name"));

                list.add(g);
            }
        }

        return list;
    }
}