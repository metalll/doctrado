package database;

import Interfaces.ICompletion;
import com.mysql.jdbc.Statement;
import database.User.DBBaseUser;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 * Created by NSD on 19.12.16.
 */
public class DBImage extends DB {

    private static volatile DBImage instance;
    private Statement stmt;
    public static DBImage getInstance() {
        DBImage localInstance = instance;
        if (localInstance == null) {
            synchronized (DBBaseUser.class) {
                localInstance = instance;
                if (localInstance == null) {
                    instance = localInstance = new DBImage();
                }
            }
        }
        return localInstance;
    }


    private DBImage(){}

    public void add(String image, String token, ICompletion completion){
        String exUpdate = "INSERT INTO `doctrado`.`avatars` (`id`, `avatar`) VALUES ('"+
                token+"', '"+image+"');";


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
            stmt.executeUpdate(exUpdate);
            completion.afterOperation(null);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public void get(String token, ICompletion completion){
        String query = "SELECT * FROM `avatars` WHERE `id` LIKE '"+token+"'";

    }

    


}
