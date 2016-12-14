package model.Users;

import model.BaseModel;

/**
 * Created by NSD on 08.12.16.
 */
public class BaseUser extends BaseModel {

    private String userName;
    private String userPass;
    private String userType;
    private String lastUserToken;


    public BaseUser(String userName,String userPass,String userType,String lastUserToken){
        this.userName = userName;
        this.userPass = userPass;
        this.userType = userType;
        this.lastUserToken = lastUserToken;
    }

    public String getUserPass() {
        return userPass;
    }

    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public String getLastUserToken() {
        return lastUserToken;
    }

    public void setLastUserToken(String lastUserToken) {
        this.lastUserToken = lastUserToken;
    }
}
