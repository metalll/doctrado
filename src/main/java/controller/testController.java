package controller;


import auth_system.UUIDGenerator;
import com.google.gson.Gson;
import com.mysql.jdbc.Statement;
import database.DB;
import model.Answer;
import model.Question;
import model.Test;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;
import java.util.Properties;


/**
 * Created by NSD on 01.03.17.
 */
@WebServlet(name = "testController")
public class testController extends HttpServlet {

    final String databaseUrl = DB.databaseUrl;
    //private static final String databaseUrl = "jdbc:mysql://localhost:3307/tochka";
    final String userName = DB.userName;
    final String password = DB.password;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {







    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String courseID = request.getParameterMap().get("course")[0];

        Test finalTest = new Test();
        String query;

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;






        try {
            conn = DriverManager.getConnection(databaseUrl, userName, password);
            stmt = (Statement) conn.createStatement();
            query = "SELECT * \n" +
                    "FROM  `test` WHERE `parentCourse` = '" + courseID + "' ";


            rs = stmt.executeQuery(query);
            while (rs.next()) {

                finalTest.testUUID = rs.getString(3);
            }

            if (finalTest.testUUID != null) {
                query = "SELECT * FROM `question` WHERE `parentTest` = '" + finalTest.testUUID + "'";
                rs = stmt.executeQuery(query);
                while (rs.next()) {

                    if (finalTest.questions == null) {
                        finalTest.questions = new ArrayList<Question>();
                    }

                    Question question = new Question();
                    question.question = rs.getString(3);
                    question.questionUUID = rs.getString(4);
                    question.numeric = rs.getString("numeric");
                    finalTest.questions.add(question);

                }

                for (int i = 0; i < finalTest.questions.size(); i++) {

                    if (finalTest.questions.get(i).answers == null) {
                        finalTest.questions.get(i).answers = new ArrayList<Answer>();
                    }

                    query = "SELECT * FROM `answer` WHERE `parentQuestion` = '" + finalTest.questions.get(i).questionUUID + "'";

                    rs = stmt.executeQuery(query);

                    while (rs.next()) {

                        Answer answer = new Answer();
                        answer.Answer = rs.getString(2);
                        answer.QuestionUUID = rs.getString(4);
                        answer.isTrue = rs.getInt(3);
                        answer.numeric = rs.getString("numeric");
                        finalTest.questions.get(i).answers.add(answer);

                    }
                }


            }
        }catch (Exception e){
        }
        finally {
            Gson gson = new Gson();
            String jsonInString = gson.toJson(finalTest);

            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write(jsonInString);
            response.getWriter().flush();
            response.getWriter().close();


        }
    }
}
