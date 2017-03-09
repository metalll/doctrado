package controller;


import com.mysql.jdbc.Statement;
import database.DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.Map;
import java.util.Properties;

/**
 * Created by NSD on 28.02.17.
 */
@WebServlet(name = "addTest")
public class addTest extends HttpServlet {

    private Statement stmt;
    protected static final String databaseUrl = DB.databaseUrl;
    //private static final String databaseUrl = "jdbc:mysql://localhost:3307/tochka";
    protected static final String userName = DB.userName;
    protected static final String password = DB.password;
    protected Connection conn = null;



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String,String[]> paramMap = request.getParameterMap();

        String parent = paramMap.get("parent")[0];
        String uuid = paramMap.get("JSON")[0]; // uuid - json

        boolean has = false;


        String query = "SELECT * FROM `test` WHERE `parentCourse` = \'" + parent + "\'";





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
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()){
                has = true;
            }

            //   completion.afterOperation(null);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            if(stmt != null) try {stmt.close();} catch (Exception e){}
            if(conn != null) try {conn.close();} catch (Exception e){}



        }



        if(has){

            query = "DELETE FROM  `doctrado`.`test` WHERE  `test`.`parentCourse` =  '"+parent+"'";







            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                Properties connInfo = new Properties();
                connInfo.put("user", userName);
                connInfo.put("password", password);
                connInfo.put("useUnicode", "true");
                connInfo.put("characterEncoding", "UTF-8");
                Connection conn = DriverManager.getConnection(databaseUrl, connInfo);
                stmt = (Statement) conn.createStatement();
            } catch (Exception e) {
            }
            try {
                stmt.executeUpdate(query);
                //   completion.afterOperation(null);
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                if (stmt != null) try {
                    stmt.close();
                } catch (Exception e) {
                }
                if (conn != null) try {
                    conn.close();
                } catch (Exception e) {
                }


            }











        }


            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                Properties connInfo = new Properties();
                connInfo.put("user", userName);
                connInfo.put("password", password);
                connInfo.put("useUnicode", "true");
                connInfo.put("characterEncoding", "UTF-8");
                Connection conn = DriverManager.getConnection(databaseUrl, connInfo);
                stmt = (Statement) conn.createStatement();
            } catch (Exception e) {
            }
            try {
                stmt.executeUpdate("INSERT INTO  `doctrado`.`test` (\n" +
                        "`parentCourse` ,\n" +
                        "`testUUID` , `uid`\n" +
                        ")\n" +
                        "VALUES (\n" +
                        " '" + parent + "', '" + uuid + "'" +
                        ",NULL);");
                //   completion.afterOperation(null);
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                if (stmt != null) try {
                    stmt.close();
                } catch (Exception e) {
                }
                if (conn != null) try {
                    conn.close();
                } catch (Exception e) {
                }

                response.setStatus(HttpServletResponse.SC_OK);
                response.getWriter().write("0");
                response.getWriter().flush();
                response.getWriter().close();

            }


        }








    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String parent = request.getParameterMap().get("parent")[0];


        String retVal = "";


        String query = "SELECT * FROM `test` WHERE `parentCourse` = \'" + parent + "\'";





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
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()){
                retVal += rs.getString(2);
            }

            //   completion.afterOperation(null);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            if(stmt != null) try {stmt.close();} catch (Exception e){}
            if(conn != null) try {conn.close();} catch (Exception e){}

            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write(retVal);
            response.getWriter().flush();
            response.getWriter().close();

        }




    }
}
