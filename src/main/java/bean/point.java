package bean;
 
import java.io.Serializable;
 
public class point implements Serializable {
 
    private int accountId;
    private int pointCount;
 
    public int getAccountId() {
        return accountId;
    }
 
    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }
 
    public int getPointCount() {
        return pointCount;
    }
 
    public void setPointCount(int pointCount) {
        this.pointCount = pointCount;
    }
}
 

 