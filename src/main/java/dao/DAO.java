package dao;

import java.sql.Connection;

import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 * DAOの共通クラス（DB接続を取得する）
 * 各DAO（AccountDAOなど）は、このクラスを継承して getConnection() を使う
 * 接続の設定は、META-INF/context.xml の「jdbc/ninchirishou」に書く
 */
public class DAO {

	/** データソース（最初の1回だけ取得する） */
	private static DataSource ds;

	/** DB接続を取得する（使い終わったら、try-with-resourcesで閉じる） */
	protected Connection getConnection() throws Exception {
		if (ds == null) {
			InitialContext ic = new InitialContext();
			ds = (DataSource) ic.lookup("java:/comp/env/jdbc/ninchirishou");
		}
		return ds.getConnection();
	}
}
