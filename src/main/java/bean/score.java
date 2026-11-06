package bean;
 
import java.io.Serializable;
import java.sql.Timestamp;
 
public class score implements Serializable {
 
    private int scoreId;
    private int accountId;
    private int brainTrainingId;
    private int score;
    private Timestamp playAt;
 
    public int getScoreId() {
        return scoreId;
    }
 
    public void setScoreId(int scoreId) {
        this.scoreId = scoreId;
    }
 
    public int getAccountId() {
        return accountId;
    }
 
    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }
 
    public int getBrainTrainingId() {
        return brainTrainingId;
    }
 
    public void setBrainTrainingId(int brainTrainingId) {
        this.brainTrainingId = brainTrainingId;
    }
 
    public int getScore() {
        return score;
    }
 
    public void setScore(int score) {
        this.score = score;
    }
 
    public Timestamp getPlayAt() {
        return playAt;
    }
 
    public void setPlayAt(Timestamp playAt) {
        this.playAt = playAt;
    }
}