package auth_system;

import Interfaces.ICompletion;
import database.User.DBBaseUser;
import database.User.DBStudent;
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
@WebServlet(name = "Registrator")
public class Registrator extends HttpServlet {
    protected void doPost(HttpServletRequest request,final HttpServletResponse response) throws ServletException, IOException {
        response.setContentType ("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter ();
        request.setCharacterEncoding ("UTF-8");

        Map<String,String[]> paramMap = request.getParameterMap();

        ICompletion completion = new ICompletion() {
            @Override
            public void afterOperation(Object bundle) {
                if(bundle != null){
                    Cookie cookie = new Cookie(Authorizator.uTokenCookie,((BaseUser)bundle).getLastUserToken());
                    cookie.setMaxAge(60 * 60 * 24 * 365 * 10);
                    Cookie cookie1 = new Cookie(Authorizator.uTypeCookie,((BaseUser)bundle).getUserType());
                    cookie.setMaxAge(60 * 60 * 24 * 365 * 10);


                    response.addCookie(cookie);
                    response.addCookie(cookie1);
                    response.setStatus(HttpServletResponse.SC_OK);
                    try {
                        response.getWriter().write("");
                        response.getWriter().flush();
                        response.getWriter().close();
                    }catch (Exception e){
                        e.printStackTrace();
                    }

                }


            }
        };

        if(paramMap.get("user[user_type]")[0].equals("s"))
        {
            this.reg_student(paramMap,completion);
        }
        else{
            this.reg_teacher(paramMap,completion);
        }
    }


    private void reg_teacher(Map<String,String[]> paramMap, ICompletion completion){
        Teacher teacher = new Teacher(
                0,
                paramMap.get("user[name]")[0],
                paramMap.get("user[patronymic]")[0],
                paramMap.get("user[surname]")[0],
                paramMap.get("user[email]")[0],
                paramMap.get("user[password]")[0],
                paramMap.get("user[phone]")[0],
                paramMap.get("user[birth_date]")[0],
                paramMap.get("user[education]")[0],
                paramMap.get("user[work_place]")[0],
                UUIDGenerator.Generate(),
                "t",
                paramMap.get("user[avatar]")[0].equals("true")?"YES":"NO",
                paramMap.get("teacher[graduate_t]")[0],
                paramMap.get("teacher[extra_graduate]")[0],
                paramMap.get("teacher[extra_experience]")[0],
                paramMap.get("teacher[card]")[0]);


            //todo put to db

    }

    private void reg_student(Map<String,String[]> paramMap, final ICompletion completion){
                final Student student = new Student(
                        1,
                        paramMap.get("user[name]")[0],
                        paramMap.get("user[patronymic]")[0],
                        paramMap.get("user[surname]")[0],
                        paramMap.get("user[email]")[0],
                        paramMap.get("user[password]")[0],
                        paramMap.get("user[phone]")[0],
                        paramMap.get("user[birth_date]")[0],
                        paramMap.get("user[education]")[0],
                        paramMap.get("user[work_place]")[0],
                        UUIDGenerator.Generate(),
                        "s",
                        paramMap.get("user[photo]")[0].equals("true")?"YES":"NO");

        DBBaseUser.getInstance().addUser(student, new ICompletion() {
            @Override
            public void afterOperation(Object bundle) {
                completion.afterOperation(student);
            }
        });

            //todo put to db

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
