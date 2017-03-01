package controller;

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
import java.text.CharacterIterator;
import java.text.StringCharacterIterator;
import java.util.Map;
import java.util.Properties;

/**
 * Created by NSD on 13.02.17.
 */
@WebServlet(name = "updateCourseContent")
public class updateCourseContent extends HttpServlet {
    public static char[] buf = new char[1024];

    private Statement stmt;
    protected static final String databaseUrl = "jdbc:mysql://127.6.55.2:3306/doctrado?useUnicode=true&amp;characterEncoding=utf8";
    //private static final String databaseUrl = "jdbc:mysql://localhost:3307/tochka";
    protected static final String userName = "adminsBmIZAN";
    protected static final String password = "qIqWymbbb-hk";
    protected Connection conn = null;
    private String er="";
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       // response.setCharacterEncoding("UTF-8");


       // response.setCharacterEncoding("UTF-8");



        Map<String,String[]>paramMap = request.getParameterMap();
        String id = paramMap.get("id")[0];
        String[] content = paramMap.get("content");
        String formattedContent = "";

        for(int i=0;i<content.length;i++){

            formattedContent += content[i];

        }


        // String cEnc = request.getCharacterEncoding();

      String s = formattedContent;








      //  String s = formattedContent;




        int length = s.length();
        char[] oldChars = (length < 1024) ? buf : new char[length];
        s.getChars(0, length, oldChars, 0);
        int newLen = 0;
        for (int j = 0; j < length; j++) {
            char ch = oldChars[j];
            if (ch >= ' ') {
                oldChars[newLen] = ch;
                newLen++;
            }
        }
        if (newLen != length)
            s = new String(oldChars, 0, newLen);

        String s1 = s;
        s = forJSON(s1);

        sun.misc.BASE64Encoder encoder = new sun.misc.BASE64Encoder();

        String base64 = encoder.encode(s.getBytes());

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
            stmt.execute("UPDATE  `doctrado`.`subCourse` SET  `contentOfCourse` =  '"+base64+"' WHERE  `id` = '"+id+"';");
            //   completion.afterOperation(null);
        } catch (SQLException e) {





            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write(e.getLocalizedMessage() + "\n "+s);
            response.getWriter().flush();
            response.getWriter().close();

        }
        finally {
            if(stmt != null) try {stmt.close();} catch (Exception e){}
            if(conn != null) try {conn.close();} catch (Exception e){}

            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write("0 "+s );
            response.getWriter().flush();
            response.getWriter().close();

        }







    }

    public static String forJSON(String input) {
        if (input == null || input.isEmpty()) {
            return "";
        }
        int len = input.length();
        // сделаем небольшой запас, чтобы не выделять память потом
        final StringBuilder result = new StringBuilder(len + len / 4);
        final StringCharacterIterator iterator = new StringCharacterIterator(input);
        char ch = iterator.current();
        while (ch != CharacterIterator.DONE) {
            if (ch == '\n') {
                result.append("\\n");
            } else if (ch == '\r') {
                result.append("\\r");
            } else if (ch == '\'') {
                result.append("\\\'");
            } else if (ch == '"') {
                result.append("\\\"");
            } else {
                result.append(ch);
            }
            ch = iterator.next();
        }
        return result.toString();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
