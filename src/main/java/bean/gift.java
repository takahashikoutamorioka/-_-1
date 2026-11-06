package bean;
 
import java.io.Serializable;
import java.sql.Timestamp;
 
public class gift implements Serializable {
 
    private int giftExcId;
    private int accountId;
    private Timestamp excAt;
    private int usedPoint;
    private int giftAmount;
    private String giftName;
 
    public int getGiftExcId() {
        return giftExcId;
    }
 
    public void setGiftExcId(int giftExcId) {
        this.giftExcId = giftExcId;
    }
 
    public int getAccountId() {
        return accountId;
    }
 
    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }
 
    public Timestamp getExcAt() {
        return excAt;
    }
 
    public void setExcAt(Timestamp excAt) {
        this.excAt = excAt;
    }
 
    public int getUsedPoint() {
        return usedPoint;
    }
 
    public void setUsedPoint(int usedPoint) {
        this.usedPoint = usedPoint;
    }
 
    public int getGiftAmount() {
        return giftAmount;
    }
 
    public void setGiftAmount(int giftAmount) {
        this.giftAmount = giftAmount;
    }
 
    public String getGiftName() {
        return giftName;
    }
 
    public void setGiftName(String giftName) {
        this.giftName = giftName;
    }
}