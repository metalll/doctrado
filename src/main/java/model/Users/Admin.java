package model.Users;

import model.Users.BaseUser;

/**
 * Created by NSD on 08.12.16.
 */
public class Admin extends BaseUser {

    private String avatar;


    public Admin(int id, String name, String second_name, String surname, String email, String password, String telephone, String born_date, String edu_level, String work_location, String lastUserToken,String userType) {
        super(id, name, second_name, surname, email, password, telephone, born_date, edu_level, work_location, lastUserToken,userType);
    }
}
