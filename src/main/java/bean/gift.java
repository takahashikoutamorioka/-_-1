package bean;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * ギフト券交換履歴Bean
 */
public class gift implements Serializable {

    private int giftExcId;
    private int accountId;
    private Timestamp excAt;
    private int usedPoint;
    private int giftAmount;
    private String giftName;

    // 管理者画面用：ユーザー名
    private String userName;


    // ギフト交換ID
    public int getGiftExcId() {
        return giftExcId;
    }

    public void setGiftExcId(int giftExcId) {
        this.giftExcId = giftExcId;
    }


    // アカウントID
    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }


    // 交換日時
    public Timestamp getExcAt() {
        return excAt;
    }

    public void setExcAt(Timestamp excAt) {
        this.excAt = excAt;
    }


    // 使用ポイント
    public int getUsedPoint() {
        return usedPoint;
    }

    public void setUsedPoint(int usedPoint) {
        this.usedPoint = usedPoint;
    }


    // ギフト券金額
    public int getGiftAmount() {
        return giftAmount;
    }

    public void setGiftAmount(int giftAmount) {
        this.giftAmount = giftAmount;
    }


    // ギフト券名
    public String getGiftName() {
        return giftName;
    }

    public void setGiftName(String giftName) {
        this.giftName = giftName;
    }


    // ユーザー名（管理者画面用）
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}