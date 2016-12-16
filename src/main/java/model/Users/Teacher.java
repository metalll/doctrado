package model.Users;

import model.Users.BaseUser;

/**
 * Created by NSD on 08.12.16.
 */
public class Teacher extends BaseUser {

    private String avatar;
    private String teacherEdu;
    private String addEdu;
    private String teacherExp;
    private String bankCard;
    public Teacher(int id, String name, String second_name, String surname, String email, String password, String telephone, String born_date, String edu_level, String work_location, String lastUserToken,String userType,
                   String avatar,String teacherEdu,String addEdu,String teacherExp,String bankCard) {
        super(id, name, second_name, surname, email, password, telephone, born_date, edu_level, work_location, lastUserToken,userType);
        this.avatar = avatar;
        this.teacherEdu = teacherEdu;
        this.addEdu = addEdu;
        this.teacherExp = teacherExp;
        this.bankCard = bankCard;
    }

    public String getAddEdu() {
        return addEdu;
    }

    public void setAddEdu(String addEdu) {
        this.addEdu = addEdu;
    }

    public String getTeacherEdu() {
        return teacherEdu;
    }

    public void setTeacherEdu(String teacherEdu) {
        this.teacherEdu = teacherEdu;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getTeacherExp() {
        return teacherExp;
    }

    public void setTeacherExp(String teacherExp) {
        this.teacherExp = teacherExp;
    }

    public String getBankCard() {
        return bankCard;
    }

    public void setBankCard(String bankCard) {
        this.bankCard = bankCard;
    }
}
