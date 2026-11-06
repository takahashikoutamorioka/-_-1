package bean;
 
import java.io.Serializable;
 
public class exp implements Serializable {
 
    private int accountId;
    private int totalExp;
 
    public int getAccountId() {
        return accountId;
    }
 
    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }
 
    public int getTotalExp() {
        return totalExp;
    }
 
    public void setTotalExp(int totalExp) {
        this.totalExp = totalExp;
    }
}