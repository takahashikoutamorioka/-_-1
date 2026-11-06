package bean;
 
import java.io.Serializable;
import java.sql.Timestamp;
 
public class test_result implements Serializable {
 
    private int testResultId;
    private int accountId;
    private int testType;
    private int totalScore;
    private int brainAge;
    private Timestamp takenAt;
 
    public int getTestResultId() {
        return testResultId;
    }
 
    public void setTestResultId(int testResultId) {
        this.testResultId = testResultId;
    }
 
    public int getAccountId() {
        return accountId;
    }
 
    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }
 
    public int getTestType() {
        return testType;
    }
 
    public void setTestType(int testType) {
        this.testType = testType;
    }
 
    public int getTotalScore() {
        return totalScore;
    }
 
    public void setTotalScore(int totalScore) {
        this.totalScore = totalScore;
    }
 
    public int getBrainAge() {
        return brainAge;
    }
 
    public void setBrainAge(int brainAge) {
        this.brainAge = brainAge;
    }
 
    public Timestamp getTakenAt() {
        return takenAt;
    }
 
    public void setTakenAt(Timestamp takenAt) {
        this.takenAt = takenAt;
    }
}