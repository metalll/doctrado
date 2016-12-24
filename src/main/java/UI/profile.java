package UI;

import NSD.NSDConstants;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by NSD on 15.12.16.
 */
@WebServlet(name = "profile",urlPatterns = "/profile")
public class profile extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Cookie[] cookies = request.getCookies();
        response.setContentType("text/html;charset=UTF-8");



            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(NSDConstants.uTypeCookie)) {

                    if (cookie.getValue().equals("a")) {
                        request.getRequestDispatcher("./profile/adminProfile.jsp").include(request, response);//рисуем jsp

                    }
                    if (cookie.getValue().equals("s")) {
                        request.getRequestDispatcher("./profile/studentProfile.jsp").include(request, response);//рисуем jsp

                    }
                    if (cookie.getValue().equals("t")) {
                        request.getRequestDispatcher("./profile/teacherProfile.jsp").include(request, response);//рисуем jsp
                    }
                }
            }


    }
}
