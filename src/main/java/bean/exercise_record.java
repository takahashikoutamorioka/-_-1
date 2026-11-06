package bean;
 
import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;
 
public class exercise_record implements Serializable {
 
    private int exerciseRecordId;
    private int accountId;
    private BigDecimal walkingDistance;
    private Timestamp recordedAt;
 
    public int getExerciseRecordId() {
        return exerciseRecordId;
    }
 
    public void setExerciseRecordId(int exerciseRecordId) {
        this.exerciseRecordId = exerciseRecordId;
    }
 
    public int getAccountId() {
        return accountId;
    }
 
    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }
 
    public BigDecimal getWalkingDistance() {
        return walkingDistance;
    }
 
    public void setWalkingDistance(BigDecimal walkingDistance) {
        this.walkingDistance = walkingDistance;
    }
 
    public Timestamp getRecordedAt() {
        return recordedAt;
    }
 
    public void setRecordedAt(Timestamp recordedAt) {
        this.recordedAt = recordedAt;
    }
}