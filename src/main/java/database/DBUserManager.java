package database;

import Interfaces.ICompletion;
import model.Users.BaseUser;

import java.sql.*;
import java.util.Properties;
import com.mysql.jdbc.Statement;

/**
 * Created by NSD on 08.12.16.
 */
public class DBUserManager extends DB {

    private static volatile DBUserManager instance;
    private Statement stmt;
    public static DBUserManager getInstance() {
        DBUserManager localInstance = instance;
        if (localInstance == null) {
            synchronized (DBUserManager.class) {
                localInstance = instance;
                if (localInstance == null) {
                    instance = localInstance = new DBUserManager();
                }
            }
        }
        return localInstance;
    }

    private DBUserManager(){
    }

    public void validateTokenAndGetUser(final String uName, final String uToken, ICompletion completion){
        boolean isSuccess = false;
        String query =  "SELECT * FROM `users` WHERE `login` = '"+uName+"' AND `lastUserToken` ='"+uToken+"'";

        try{
            Class.forName("com.mysql.jdbc.Driver");
        }catch(Exception e){
            e.printStackTrace();
        }

        try{
            conn = DriverManager.getConnection(databaseUrl, userName, password);
            Statement stmt =  (Statement) conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            if(rs.next()){
                isSuccess = true;
                completion.afterOperation(new BaseUser(rs.getString("login"),rs.getString("pass"),
                        rs.getString("user_type"),rs.getString("lastUserToken")));



            }


        }
        catch (SQLException e){

            e.printStackTrace();

        }

        finally {
            try {
                conn.close();
                stmt.close();
                stmt = null;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
            if(!isSuccess){

                completion.afterOperation(null);
            }

    }

    public void getUserWithLoginAndPass( String uName,String uPass,ICompletion completion){

        boolean isSuccess = false;
        String query =  "SELECT * FROM `users` WHERE `login` = '"+uName+"' AND `pass` ='"+uPass+"'";




        try{
            Class.forName("com.mysql.jdbc.Driver");
        }catch(Exception e){
            e.printStackTrace();
        }

        try{
            conn = DriverManager.getConnection(databaseUrl, userName, password);
            Statement stmt =  (Statement) conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()){
                isSuccess = true;
                completion.afterOperation(new BaseUser(rs.getString("login"),rs.getString("pass"),
                        rs.getString("user_type"),rs.getString("lastUserToken")));



            }


        }
        catch (SQLException e){

            e.printStackTrace();

        }


        if(!isSuccess){

            completion.afterOperation(null);
        }




        //return null;
    }

    private boolean isUserExist(String login){
        //SELECT *
        //FROM  `users`
        //WHERE  `login` =  'ddd'

        boolean retVal = false;

        try{
            Class.forName("com.mysql.jdbc.Driver");
        }catch(Exception e){
            e.printStackTrace();
        }

        try{
            conn = DriverManager.getConnection(databaseUrl, userName, password);
            Statement stmt =  (Statement) conn.createStatement();
            String query =  "SELECT * FROM `users` WHERE `login` = '"+login+"'";
            ResultSet rs = stmt.executeQuery(query);
            if(rs.next()){
                retVal = true;
            }


        }
        catch (SQLException e){

            e.printStackTrace();

        }

        finally {
            try {
                conn.close();
                stmt.close();
                stmt = null;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return retVal;








    }

    private void addUser(BaseUser user,ICompletion completion){
        try{
            Class.forName("com.mysql.jdbc.Driver");
        }catch(Exception e){
            e.printStackTrace();
        }

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
            String exAdd = "INSERT INTO `doctrade`.`users` (`id`, `login`, `pass`, `user_type`, `lastUserToken`) " +
                    " VALUES ('NULL', '"+user.getUserName()+"', '"+user.getUserPass()+"', '"+user.getUserType()+"', '"+user.getLastUserToken()+"');";
        try {
            stmt.executeUpdate(exAdd);
            completion.afterOperation("successful");
        } catch (SQLException e) {
            completion.afterOperation("error");
            e.printStackTrace();
        }
        finally {
            try {
                stmt.close();
                conn.close();
                stmt = null;
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }

    }




}
