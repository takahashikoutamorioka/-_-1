package bean;
 
import java.io.Serializable;
 
public class account implements Serializable {
 
    private int accountId;
    private String userName;
    private String password;
    private String email;
    private String tel;
    private int accountType;
    private Integer brainAge;
    private int userRank;
 
    public int getAccountId() {
        return accountId;
    }
 
    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }
 
    public String getUserName() {
        return userName;
    }
 
    public void setUserName(String userName) {
        this.userName = userName;
    }
 
    public String getPassword() {
        return password;
    }
 
    public void setPassword(String password) {
        this.password = password;
    }
 
    public String getEmail() {
        return email;
    }
 
    public void setEmail(String email) {
        this.email = email;
    }
 
    public String getTel() {
        return tel;
    }
 
    public void setTel(String tel) {
        this.tel = tel;
    }
 
    public int getAccountType() {
        return accountType;
    }
 
    public void setAccountType(int accountType) {
        this.accountType = accountType;
    }
 
    public Integer getBrainAge() {
        return brainAge;
    }
 
    public void setBrainAge(Integer brainAge) {
        this.brainAge = brainAge;
    }
 
    public int getUserRank() {
        return userRank;
    }
 
    public void setUserRank(int userRank) {
        this.userRank = userRank;
    }
}