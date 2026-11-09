package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.point;

public class PointDAO extends DAO {


//    アカウントIDからポイントを取得
    public point selectByAccountId(int accountId) throws Exception {

        point p = null;

        String sql = "SELECT * FROM point WHERE account_id = ?";

        try (Connection con = getConnection();
             PreparedStatement st = con.prepareStatement(sql)) {

            st.setInt(1, accountId);

            try (ResultSet rs = st.executeQuery()) {

                if (rs.next()) {

                    p = new point();

                    p.setAccountId(rs.getInt("account_id"));
                    p.setPointCount(rs.getInt("point_count"));
                }
            }
        }

        return p;
    }


    // -----------------------------------------
    // ポイントを更新
    // -----------------------------------------
    public int update(point p) throws Exception {

        String sql =
            "UPDATE point SET point_count = ? WHERE account_id = ?";

        try (Connection con = getConnection();
             PreparedStatement st = con.prepareStatement(sql)) {

            st.setInt(1, p.getPointCount());
            st.setInt(2, p.getAccountId());

            int line = st.executeUpdate();

            return line;
        }
    }


    // -----------------------------------------
    // ポイント交換処理
    // -----------------------------------------
    public boolean exchangeGift(int accountId) throws Exception {

        try (Connection con = getConnection()) {

            // 現在のAutoCommit設定を保存
            boolean autoCommit = con.getAutoCommit();

            try {

                // トランザクション開始
                con.setAutoCommit(false);


                // ---------------------------------
                // 現在のポイントを取得
                // ---------------------------------
                String selectSql =
                    "SELECT point_count FROM point "
                    + "WHERE account_id = ? FOR UPDATE";

                int currentPoint = 0;

                try (PreparedStatement st = con.prepareStatement(selectSql)) {

                    st.setInt(1, accountId);

                    try (ResultSet rs = st.executeQuery()) {

                        // ポイント情報が存在しない場合
                        if (!rs.next()) {

                            con.rollback();
                            return false;
                        }

                        currentPoint = rs.getInt("point_count");
                    }
                }


                // ---------------------------------
                // 500ポイント未満の場合は交換不可
                // ---------------------------------
                if (currentPoint < 500) {

                    con.rollback();
                    return false;
                }


                // ---------------------------------
                // POINTテーブルから500ポイント減算
                // ---------------------------------
                String updateSql =
                    "UPDATE point "
                    + "SET point_count = point_count - 500 "
                    + "WHERE account_id = ?";

                try (PreparedStatement st = con.prepareStatement(updateSql)) {

                    st.setInt(1, accountId);

                    int line = st.executeUpdate();

                    if (line != 1) {

                        throw new SQLException(
                            "ポイントの更新に失敗しました。"
                        );
                    }
                }


                // ---------------------------------
                // GIFTテーブルに交換情報を登録
                // ---------------------------------
                String insertSql =
                    "INSERT INTO gift "
                    + "(account_id, used_point, gift_amount, gift_name) "
                    + "VALUES (?, 500, 500, 'Amazonギフト券')";

                try (PreparedStatement st = con.prepareStatement(insertSql)) {

                    st.setInt(1, accountId);

                    int line = st.executeUpdate();

                    if (line != 1) {

                        throw new SQLException(
                            "ギフト券情報の登録に失敗しました。"
                        );
                    }
                }


                // ---------------------------------
                // トランザクション確定
                // ---------------------------------
                con.commit();

                return true;


            } catch (Exception e) {

                // エラー発生時は処理を取り消す
                con.rollback();

                throw e;


            } finally {

                // AutoCommit設定を元に戻す
                con.setAutoCommit(autoCommit);
            }
        }
    }
}