package database.User;

import Interfaces.ICompletion;
import com.mysql.jdbc.Statement;
import database.DB;
import model.Users.BaseUser;
import model.Users.Student;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

/**
 * Created by NSD on 14.12.16.
 */
public class DBStudent extends DB {

    private static volatile DBBaseUser instance;
    private Statement stmt;
    public static DBBaseUser getInstance() {
        DBBaseUser localInstance = instance;
        if (localInstance == null) {
            synchronized (DBBaseUser.class) {
                localInstance = instance;
                if (localInstance == null) {
                    instance = localInstance = new DBBaseUser();
                }
            }
        }
        return localInstance;
    }



    public void add(final Student student, ICompletion completion){

        DBBaseUser.getInstance().addUser(student, new ICompletion() {
            @Override
            public void afterOperation(Object bundle) {

                String exQuery = "";






            }
        });



    }

    public void get(String id,ICompletion completion){


    }

    public void remove(String id,ICompletion completion){

    }

    public void update(Student student,ICompletion completion) {



    }


    private void getExecute(String exString,ICompletion completion){

        boolean isSuccess = false;
        // String query =  "SELECT * FROM `users` WHERE `login` = '"+uName+"' AND `pass` ='"+uPass+"'";
        try{  Class.forName("com.mysql.jdbc.Driver"); }
        catch(Exception e){ e.printStackTrace(); }
        try{
            conn = DriverManager.getConnection(databaseUrl, userName, password);
            Statement stmt =  (Statement) conn.createStatement();
            ResultSet rs = stmt.executeQuery(exString);
            while(rs.next()){
                isSuccess = true;
                completion.afterOperation(new BaseUser(rs.getInt(1),rs.getString(2),rs.getString(3),
                        rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),
                        rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12)));
            }
        }
        catch (SQLException e){ e.printStackTrace();  }
        if(!isSuccess){   completion.afterOperation(null);  }
    }

    private void setExecute(String execute,ICompletion completion) {
        try{
            Class.forName("com.mysql.jdbc.Driver");  }
        catch(Exception e){ e.printStackTrace(); }
        try {
            Properties connInfo = new Properties();
            connInfo.put("user",userName);
            connInfo.put("password",password);
            connInfo.put("useUnicode","true");
            connInfo.put("characterEncoding","UTF-8");
            Connection conn = DriverManager.getConnection(databaseUrl, connInfo);
            stmt = (Statement) conn.createStatement();
        }
        catch (Exception e){}
        try {
            stmt.executeUpdate(execute);
            completion.afterOperation(null);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }




}
