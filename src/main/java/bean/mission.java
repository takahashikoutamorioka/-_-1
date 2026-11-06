package bean;
 
import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;
 
public class mission implements Serializable {
 
    private int missionId;
    private int accountId;
    private int missionType;
    private int targetType;
    private BigDecimal targetValue;
    private int status;
    private Timestamp clearedAt;
    private int rewardExp;
    private int rewardPoint;
 
    public int getMissionId() {
        return missionId;
    }
 
    public void setMissionId(int missionId) {
        this.missionId = missionId;
    }
 
    public int getAccountId() {
        return accountId;
    }
 
    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }
 
    public int getMissionType() {
        return missionType;
    }
 
    public void setMissionType(int missionType) {
        this.missionType = missionType;
    }
 
    public int getTargetType() {
        return targetType;
    }
 
    public void setTargetType(int targetType) {
        this.targetType = targetType;
    }
 
    public BigDecimal getTargetValue() {
        return targetValue;
    }
 
    public void setTargetValue(BigDecimal targetValue) {
        this.targetValue = targetValue;
    }
 
    public int getStatus() {
        return status;
    }
 
    public void setStatus(int status) {
        this.status = status;
    }
 
    public Timestamp getClearedAt() {
        return clearedAt;
    }
 
    public void setClearedAt(Timestamp clearedAt) {
        this.clearedAt = clearedAt;
    }
 
    public int getRewardExp() {
        return rewardExp;
    }
 
    public void setRewardExp(int rewardExp) {
        this.rewardExp = rewardExp;
    }
 
    public int getRewardPoint() {
        return rewardPoint;
    }
 
    public void setRewardPoint(int rewardPoint) {
        this.rewardPoint = rewardPoint;
    }
}