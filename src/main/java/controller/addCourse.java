package controller;

import auth_system.UUIDGenerator;
import com.mysql.jdbc.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Map;
import java.util.Properties;

/**
 * Created by NSD on 13.02.17.
 */
@WebServlet(name = "addCourse")
public class addCourse extends HttpServlet {


     private Statement stmt;
    protected static final String databaseUrl = "jdbc:mysql://127.6.55.2:3306/doctrado?useUnicode=true&amp;characterEncoding=utf8";
    //private static final String databaseUrl = "jdbc:mysql://localhost:3307/tochka";
    protected static final String userName = "adminsBmIZAN";
    protected static final String password = "qIqWymbbb-hk";
    protected Connection conn = null;



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String,String[]> paramMap = request.getParameterMap();

        String parent = paramMap.get("parent")[0];
        String number = paramMap.get("number")[0];




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
            stmt.executeUpdate("INSERT INTO  `doctrado`.`subCourse` (\n" +
                    "`id` ,\n" +
                    "`parentCourse` ,\n" +
                    "`contentOfCourse` ,\n" +
                    "`hasTest` ,\n" +
                    "`courseNumber` ,\n" +
                    "`internalID`\n" +
                    ")\n" +
                    "VALUES (\n" +
                    "'"+ UUIDGenerator.Generate()+"',  '"+parent+"',  '',  'NO',  '"+number+"', NULL\n" +
                    ");");
         //   completion.afterOperation(null);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            if(stmt != null) try {stmt.close();} catch (Exception e){}
            if(conn != null) try {conn.close();} catch (Exception e){}

            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write("0");
            response.getWriter().flush();
            response.getWriter().close();

        }





    }


}
