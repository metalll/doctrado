package controller;

import Interfaces.ICompletion;
import NSD.NSDConstants;
import auth_system.UUIDGenerator;
import com.mysql.jdbc.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Map;
import java.util.Properties;

/**
 * Created by NSD on 21.12.16.
 */
@WebServlet(name = "createCourse",urlPatterns = "/createCourse")
public class createCourse extends HttpServlet {
    //DBParams


    protected static final String databaseUrl = "jdbc:mysql://127.6.55.2:3306/doctrado?useUnicode=true&amp;characterEncoding=utf8";
    //private static final String databaseUrl = "jdbc:mysql://localhost:3307/tochka";
    protected static final String userName = "adminsBmIZAN";
    protected static final String password = "qIqWymbbb-hk";
    protected Connection conn = null;
    protected Statement stmt = null;



    protected void doPost(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        if(!request.isSecure())response.sendRedirect(NSDConstants.HOST+"/createCourse");
        response.setContentType ("text/html; charset=UTF-8");
        final PrintWriter out = response.getWriter ();
        request.setCharacterEncoding ("UTF-8");

        Map<String,String[]> map = request.getParameterMap();
        String userID = "";

        for(Cookie cookie : request.getCookies()){
            if(cookie.getName().equals(NSDConstants.uTokenCookie)){ userID = cookie.getValue(); }
        }
        final String uuid = UUIDGenerator.Generate();

        String execute = "INSERT INTO `doctrado`.`course` " +
                "(`id`, `photo`, `courseName`, `createTime`, `descr`, `price`, `category`, `author`) " +
                "VALUES ('" + map.get("uuid")[0] + "', '" + "YES" + "', '" + map.get("name")[0] + "', '" + map.get("learnPeriod")[0] + "'," +
                " '" + map.get("descr")[0] + "', '" + 0 + "', '" + map.get("categories")[0] + "', '" + userID + "');";
        setExecute(execute, new ICompletion() {
            @Override
            public void afterOperation(Object bundle) {
                response.setStatus(HttpServletResponse.SC_OK);
                out.write(uuid);
                out.flush();
                out.close();

            }
        });


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(!request.isSecure())response.sendRedirect(NSDConstants.HOST+"/createCourse");
    }


    private void setExecute(String execute, ICompletion completion) {
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
        finally {
            if(stmt != null) try {stmt.close();} catch (Exception e){}
            if(conn != null) try {conn.close();} catch (Exception e){}

        }

    }
}
