package model.Users;

import model.Users.BaseUser;

/**
 * Created by NSD on 08.12.16.
 */
public class Teacher extends BaseUser {

    private String avatar;


    public Teacher(String userName, String userPass, String userType, String lastUserToken,String avatar) {
        super(userName, userPass, userType, lastUserToken);
    }

}
