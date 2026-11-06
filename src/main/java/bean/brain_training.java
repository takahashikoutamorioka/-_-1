package bean;
 
import java.io.Serializable;
 
public class brain_training implements Serializable {
 
    private int brainTrainingId;
    private String trainingName;
    private int maxScore;
 
    public int getBrainTrainingId() {
        return brainTrainingId;
    }
 
    public void setBrainTrainingId(int brainTrainingId) {
        this.brainTrainingId = brainTrainingId;
    }
 
    public String getTrainingName() {
        return trainingName;
    }
 
    public void setTrainingName(String trainingName) {
        this.trainingName = trainingName;
    }
 
    public int getMaxScore() {
        return maxScore;
    }
 
    public void setMaxScore(int maxScore) {
        this.maxScore = maxScore;
    }
}