package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.account;

/**
 * アカウントDAO（テーブル：account）
 * 新規登録のときは、経験値（exp）とポイント（point）の行も同じトランザクションで作る
 */
public class AccountDAO extends DAO {

	/** 取得する列（toBeanと順番をそろえる） */
	private static final String COLUMNS =
			"account_id, user_name, password, email, tel, account_type, brain_age, user_rank";

	/** アカウントIDで検索する（トップ画面、アカウント情報、アカウント情報変更） */
	public account findByUserId(int accountId) throws Exception {
		String sql = "SELECT " + COLUMNS + " FROM account WHERE account_id = ?";
		try (Connection con = getConnection();
				PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setInt(1, accountId);
			try (ResultSet rs = ps.executeQuery()) {
				return rs.next() ? toBean(rs) : null;
			}
		}
	}

	/** 名前とパスワード（ハッシュ化済み）で検索する（ログイン）。一致しなければnull */
	public account findByNameAndPassword(String name, String password) throws Exception {
		String sql = "SELECT " + COLUMNS + " FROM account WHERE user_name = ? AND password = ?";
		try (Connection con = getConnection();
				PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, name);
			ps.setString(2, password);
			try (ResultSet rs = ps.executeQuery()) {
				return rs.next() ? toBean(rs) : null;
			}
		}
	}

	/** 名前で検索する（新規登録・名前変更での重複確認）。いなければnull */
	public account findByName(String name) throws Exception {
		String sql = "SELECT " + COLUMNS + " FROM account WHERE user_name = ?";
		try (Connection con = getConnection();
				PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, name);
			try (ResultSet rs = ps.executeQuery()) {
				return rs.next() ? toBean(rs) : null;
			}
		}
	}

	/** メールアドレスで検索する（新規登録での重複確認）。いなければnull */
	public account findByEmail(String email) throws Exception {
		String sql = "SELECT " + COLUMNS + " FROM account WHERE email = ?";
		try (Connection con = getConnection();
				PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, email);
			try (ResultSet rs = ps.executeQuery()) {
				return rs.next() ? toBean(rs) : null;
			}
		}
	}

	/** ユーザーの一覧を取得する（管理者のユーザー一覧。管理者のアカウントは含めない） */
	public List<account> findAllUsers() throws Exception {
		String sql = "SELECT " + COLUMNS + " FROM account WHERE account_type = 0 ORDER BY account_id";
		List<account> list = new ArrayList<>();
		try (Connection con = getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {
			while (rs.next()) {
				list.add(toBean(rs));
			}
		}
		return list;
	}

	/**
	 * アカウントを登録する（新規登録）
	 * account・exp・pointの3つを、すべて成功したときだけ確定する。
	 * 登録したアカウントIDは、渡したBeanに設定する。
	 */
	public boolean insert(account a) throws Exception {
		try (Connection con = getConnection()) {
			con.setAutoCommit(false);
			try {
				int accountId;
				// 1. account（account_typeとuser_rankは初期値：0と1）
				String sql = "INSERT INTO account (user_name, password, email, tel) "
						+ "VALUES (?, ?, ?, ?) RETURNING account_id";
				try (PreparedStatement ps = con.prepareStatement(sql)) {
					ps.setString(1, a.getUserName());
					ps.setString(2, a.getPassword());
					ps.setString(3, a.getEmail());
					ps.setString(4, a.getTel());
					try (ResultSet rs = ps.executeQuery()) {
						rs.next();
						accountId = rs.getInt(1);
					}
				}
				// 2. exp（累計経験値は0から）
				try (PreparedStatement ps = con.prepareStatement(
						"INSERT INTO exp (account_id) VALUES (?)")) {
					ps.setInt(1, accountId);
					ps.executeUpdate();
				}
				// 3. point（ポイント数は0から）
				try (PreparedStatement ps = con.prepareStatement(
						"INSERT INTO point (account_id) VALUES (?)")) {
					ps.setInt(1, accountId);
					ps.executeUpdate();
				}
				con.commit();
				a.setAccountId(accountId);
				return true;
			} catch (Exception e) {
				con.rollback();
				throw e;
			}
		}
	}

	/** 名前・パスワード・メールアドレス・電話番号を更新する（アカウント情報変更） */
	public boolean update(account a) throws Exception {
		String sql = "UPDATE account SET user_name = ?, password = ?, email = ?, tel = ? "
				+ "WHERE account_id = ?";
		try (Connection con = getConnection();
				PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, a.getUserName());
			ps.setString(2, a.getPassword());
			ps.setString(3, a.getEmail());
			ps.setString(4, a.getTel());
			ps.setInt(5, a.getAccountId());
			return ps.executeUpdate() > 0;
		}
	}

	/** 脳年齢を更新する（認知力チェック・脳年齢テストのあと） */
	public boolean updateBrainAge(int accountId, int brainAge) throws Exception {
		String sql = "UPDATE account SET brain_age = ? WHERE account_id = ?";
		try (Connection con = getConnection();
				PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setInt(1, brainAge);
			ps.setInt(2, accountId);
			return ps.executeUpdate() > 0;
		}
	}

	/** 検索結果の1行をBeanに詰める */
	private account toBean(ResultSet rs) throws Exception {
		account a = new account();
		a.setAccountId(rs.getInt("account_id"));
		a.setUserName(rs.getString("user_name"));
		a.setPassword(rs.getString("password"));
		a.setEmail(rs.getString("email"));
		a.setTel(rs.getString("tel"));
		a.setAccountType(rs.getInt("account_type"));
		// 脳年齢はNULL（認知力チェック未実施）のとき、0を入れる
		int brainAge = rs.getInt("brain_age");
		a.setBrainAge(rs.wasNull() ? 0 : brainAge);
		a.setUserRank(rs.getInt("user_rank"));
		return a;
	}
}
