package model.Users;

import model.BaseModel;

/**
 * Created by NSD on 08.12.16.
 */
public class BaseUser {

    private int id;
    private String name;
    private String second_name;
    private String surname;
    private String email;
    private String password;
    private String telephone;
    private String born_date;
    private String edu_level;
    private String work_location;
    private String lastUserToken;


    public BaseUser(int id,String name,String second_name,
                    String surname,String email,String password,
                    String telephone,String born_date,String edu_level,
                    String work_location,String lastUserToken){
        this.id = id;
        this.name = name;
        this.second_name = second_name;
        this.surname = surname;
        this.email = email;
        this.password = password;
        this.telephone = telephone;
        this.born_date = born_date;
        this.edu_level = edu_level;
        this.work_location = work_location;


        this.lastUserToken = lastUserToken;
    }


    public String getLastUserToken() {
        return lastUserToken;
    }

    public void setLastUserToken(String lastUserToken) {
        this.lastUserToken = lastUserToken;
    }

    public String getWork_location() {
        return work_location;
    }

    public void setWork_location(String work_location) {
        this.work_location = work_location;
    }

    public String getEdu_level() {
        return edu_level;
    }

    public void setEdu_level(String edu_level) {
        this.edu_level = edu_level;
    }

    public String getBorn_date() {
        return born_date;
    }

    public void setBorn_date(String born_date) {
        this.born_date = born_date;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telelphone) {
        this.telephone = telelphone;
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

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getSecond_name() {
        return second_name;
    }

    public void setSecond_name(String second_name) {
        this.second_name = second_name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}