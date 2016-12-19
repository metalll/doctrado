package database.User;

import Interfaces.ICompletion;
import com.mysql.jdbc.Statement;
import database.DB;
import model.Users.BaseUser;
import model.Users.Teacher;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

/**
 * Created by NSD on 14.12.16.
 */
public class DBTeacher extends DB {

    private static volatile DBTeacher instance;
    private Statement stmt;
    public static DBTeacher getInstance() {
        DBTeacher localInstance = instance;
        if (localInstance == null) {
            synchronized (DBBaseUser.class) {
                localInstance = instance;
                if (localInstance == null) {
                    instance = localInstance = new DBTeacher();
                }
            }
        }
        return localInstance;
    }

    private DBTeacher(){}


    public void add(final Teacher teacher, final ICompletion completion){
        DBBaseUser.getInstance().addUser(teacher, new ICompletion() {
            @Override
            public void afterOperation(Object bundle) {

                String ex = "INSERT INTO `doctrado`.`teacher` (`id`, `avatar`, `teacherEdu`, `addEdu`, `teacherExp`, `bankCard`) VALUES" +
                        " ('"+teacher.getLastUserToken()+"', '"+teacher.getAvatar()+"', '"+teacher.getTeacherEdu()+"', '"+teacher.getAddEdu()+"', '"+teacher.getTeacherExp()+"', '"+teacher.getBankCard()+"');";
                setExecute(ex,completion);

            }
        });


    }

    public void get(String id,ICompletion completion){

    }

    public void remove(Teacher id,ICompletion completion){

    }

    public void update(Teacher teacher, ICompletion completion) {

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
              //  completion.afterOperation(new Teacher();
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
