package model.Users;

/**
 * Created by NSD on 08.12.16.
 */
public class Student extends BaseUser {

    private String avatar;


    public Student(String userName, String userPass, String userType, String lastUserToken,String avatar) {
        super(userName, userPass, userType, lastUserToken);
    }

}
