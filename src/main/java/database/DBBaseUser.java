package database;

import Interfaces.ICompletion;
import com.mysql.jdbc.Statement;
import model.Users.BaseUser;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

/**
 * Created by NSD on 14.12.16.
 */
public class DBBaseUser extends  DB {

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

    public void addUser(BaseUser user, ICompletion completion){
        String execute = "INSERT INTO `doctrado`.`users` (`id`, `name`, `second_name`, `surname`, `email`, `password`, `telephone`, `born_date`, `edu_level`, `work_location`, `lastUserToken`)" +
                " VALUES (NULL, "+user.getName()+", "+user.getSecond_name()+", "+user.getSurname()+", "+user.getEmail()+", '"+user.getPassword()+", "+user.getTelephone()+", "+user.getBorn_date()+", "+user.getEdu_level()+", "+user.getWork_location()+", "+user.getLastUserToken()+");";
        this.setExecute(execute,completion);

    }
    public void getUser(int userID, ICompletion completion){
        String query =  "SELECT * FROM `users` WHERE `id` = '"+userID+"'";
        this.getExecute(query,completion);
    }
    public void deleteUser(int userID, ICompletion completion){
       String query =  "DELETE FROM `doctrado`.`users` WHERE `users`.`id` = "+userID+" ";
        try{  Class.forName("com.mysql.jdbc.Driver"); }
        catch(Exception e){ e.printStackTrace(); }
        try{
            conn = DriverManager.getConnection(databaseUrl, userName, password);
            Statement stmt =  (Statement) conn.createStatement();
            stmt.execute(query);
            completion.afterOperation(null );
        }
        catch (SQLException e){ e.printStackTrace();  }

    }
    public void updateUser(final BaseUser user, final ICompletion completion)    {



/* TO DO */

    }
    public void hasUserTelephone(String telephone,ICompletion completion){

        String query =  "SELECT * FROM `users` WHERE `telephone` = '"+telephone+"";
        this.getExecute(query,completion);
    }
    public void hasUserEmail(String email,ICompletion completion){
        String query =  "SELECT * FROM `users` WHERE `email` = '"+email+"";
        this.getExecute(query,completion);

    };
    public void getUserWithLastUserToken(String uToken,ICompletion completion){
        String query =  "SELECT * FROM `users` WHERE `lastUserToken` = '"+uToken+"";
        this.getExecute(query,completion);

    }
    public void getUserWithEmailAndPass(String email,String password,ICompletion completion){
        String query =  "SELECT * FROM `users` WHERE `email` = '"+email+"' AND 'password' ="+password+"";
        this.getExecute(query,completion);
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
                completion.afterOperation(new BaseUser(rs.getInt(0),rs.getString(1),rs.getString(2),
                        rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),
                        rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10)));
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





