package auth_system;

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
@WebServlet(name = "CookieKiller",urlPatterns = "/logout")
public class CookieKiller extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(!request.isSecure())response.sendRedirect(NSDConstants.HOST+"/logout");
        finishHim(request,response);
        response.sendRedirect("/");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    private void finishHim(HttpServletRequest req, HttpServletResponse resp) {
        Cookie[] cookies = req.getCookies();
        if (cookies != null)
            for (int i = 0; i < cookies.length; i++) {
                cookies[i].setValue("");
                cookies[i].setPath("/");
                cookies[i].setMaxAge(0);
                resp.addCookie(cookies[i]);
            }
    }
}
