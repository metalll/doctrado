package controller;

import Interfaces.ICompletion;
import NSD.NSDConstants;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.mysql.jdbc.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
/**
 * Created by NSD on 15.02.17.
 */
@WebServlet(name = "courseQuery")
public class courseQuery extends HttpServlet {
    protected void doPost(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        Map<String,String[]> paramMap = request.getParameterMap();
        ICompletion completion = new ICompletion() {
            @Override
            public void afterOperation(Object bundle) {

                try {
                    response.setStatus(HttpServletResponse.SC_OK);
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write((String)bundle);
                    response.getWriter().flush();
                    response.getWriter().close();
                }catch (Exception e){

                }

            }
        };
        String paramQuery = paramMap.get("q")[0];

        final String databaseUrl = "jdbc:mysql://127.6.55.2:3306/doctrado?useUnicode=true&amp;characterEncoding=utf8";
        //private static final String databaseUrl = "jdbc:mysql://localhost:3307/tochka";
        final String userName = "adminsBmIZAN";
        final String password = "qIqWymbbb-hk";
        Connection conn = null;
        Statement stmt = null;

        Map<String,String> course = new HashMap<String, String>();
        ArrayList<Map<String,String>> mapArrayList = new ArrayList<Map<String, String>>();
        //query
        String query = "SELECT * FROM `course`";

        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            conn = DriverManager.getConnection(databaseUrl, userName, password);
            stmt = (Statement) conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()){
                if(rs.getString(3).contains(paramQuery)) {
                    course = new HashMap<String, String>();
                    course.put("moreLink", NSDConstants.HOST + "/getCourse?id=" + rs.getString(1));
                    course.put("id", rs.getString(1));
                    course.put("courseName", rs.getString(3));
                    course.put("timeToLearn", rs.getString(4));
                    mapArrayList.add(course);
                }
            }



            for (int i = 0; i < mapArrayList.size(); i++) {
                query = "SELECT * FROM `resourses` WHERE `type` = 'photo' AND `uuid` = '" + mapArrayList.get(i).get("id") + "'";

                rs = stmt.executeQuery(query);

                while (rs.next()) {

                   mapArrayList.get(i).put("imageLink",   NSDConstants.HOST + "/uploadDocument?path=" + rs.getString(4));

                }



            }



        }catch (Exception e){

        }finally {

            if(stmt!=null){ try {stmt.close();}catch (Exception e){}}
            if(conn!=null){ try {conn.close();}catch (Exception e){}}

            Gson gson = new GsonBuilder().serializeNulls().create();
            String jString = gson.toJson(mapArrayList);
            completion.afterOperation(jString);

        }




     //   mapArrayList.add(course);














    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
