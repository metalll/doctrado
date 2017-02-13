package auth_system;

import Interfaces.ICompletion;
import NSD.NSDConstants;
import database.User.DBStudent;
import database.User.DBTeacher;
import model.Users.BaseUser;
import model.Users.Student;
import model.Users.Teacher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

/**
 * Created by NSD on 16.12.16.
 */
@WebServlet(name = "Registrator",urlPatterns = "/register")
public class Registrator extends HttpServlet {


    protected void doPost(HttpServletRequest request,final HttpServletResponse response) throws ServletException, IOException {
        if(!request.isSecure())response.sendRedirect(NSDConstants.HOST+"/register");
        response.setContentType ("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter ();

        request.setCharacterEncoding ("UTF-8");
        Map<String,String[]> paramMap = request.getParameterMap();
        ICompletion completion = new ICompletion() {
            @Override
            public void afterOperation(Object bundle) {
                if(bundle != null){
                    Cookie cookie = new Cookie(NSDConstants.uTokenCookie,((BaseUser)bundle).getLastUserToken());
                    cookie.setMaxAge(60 * 60 * 24 * 365 * 10);
                    cookie.setSecure(true);
                    Cookie cookie1 = new Cookie(NSDConstants.uTypeCookie,((BaseUser)bundle).getUserType());
                    cookie1.setMaxAge(60 * 60 * 24 * 365 * 10);
                    cookie1.setSecure(true);
                    response.addCookie(cookie);
                    response.addCookie(cookie1);
                    response.setStatus(HttpServletResponse.SC_OK);
                    try {
                        response.getWriter().write("0");
                        response.getWriter().flush();
                        response.getWriter().close();
                    }catch (Exception e){
                        e.printStackTrace();
                    }
                }
            }
        };

        if (paramMap.get("Type")[0].equals("s"))
        {
            this.reg_student(paramMap, completion);
        }
        else{
            this.reg_teacher(paramMap, completion);
        }
    }


    private void reg_teacher(Map<String,String[]> paramMap, final ICompletion completion){
        final Teacher teacher = new Teacher(
                1,
                paramMap.get("name")[0],
                paramMap.get("last_name")[0],
                paramMap.get("surname")[0],
                paramMap.get("email")[0],
                paramMap.get("password")[0],
                paramMap.get("telephone")[0],
                paramMap.get("born")[0],
                "No",
                "No",
                UUIDGenerator.Generate(),
                "t",
                paramMap.get("hasPhoto")[0].equals("true") ? "YES" : "NO",
                "NULL",
                "NULL",
                paramMap.get("teacher_ex")[0],
                "NULL");

       DBTeacher.getInstance().add(teacher, new ICompletion() {
           @Override
           public void afterOperation(Object bundle) {
               completion.afterOperation(teacher);
           }
       });


    }

    private void reg_student(Map<String,String[]> paramMap, final ICompletion completion){
        final Student student = new Student(
                        1,
                paramMap.get("name")[0],
                paramMap.get("last_name")[0],
                paramMap.get("surname")[0],
                paramMap.get("email")[0],
                paramMap.get("password")[0],
                paramMap.get("telephone")[0],
                paramMap.get("born")[0],
                "No",
                "No",
                        UUIDGenerator.Generate(),
                        "s",
                paramMap.get("hasPhoto")[0].equals("true") ? "YES" : "NO");


        DBStudent.getInstance().add(student, new ICompletion() {
            @Override
            public void afterOperation(Object bundle) {
                completion.afterOperation(student);
            }
        });
    }
}
