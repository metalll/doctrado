package auth_system;

import Interfaces.ICompletion;
import NSD.NSDConstants;
import database.User.DBBaseUser;
import model.Users.BaseUser;

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
 * Created by NSD on 12.12.16.
 */
@WebServlet("/login")
public class Authorizator extends HttpServlet {


    public static void addAuthSession(String[] session) {


    }

    protected void doPost(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        if(!request.isSecure())response.sendRedirect(NSDConstants.HOST+"/login");
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter ();
        request.setCharacterEncoding ("UTF-8");
        Map<String, String[]> map = request.getParameterMap();
        final String login =  map.get("email")[0];
        String password = map.get("password")[0];
        DBBaseUser.getInstance().getUserWithEmailAndPass(login, password, new ICompletion() {
            @Override
            public void afterOperation(Object bundle) {
                if(bundle == null) {
                    try {
                        response.setStatus(HttpServletResponse.SC_OK);
                        response.getWriter().write("-1");
                        response.getWriter().flush();
                        response.getWriter().close();
                    }
                    catch (Exception e){}
                }
                else {
                    try {
                        Cookie cookie = new Cookie(NSDConstants.uTokenCookie,((BaseUser)bundle).getLastUserToken());
                        cookie.setMaxAge(60 * 60 * 24 * 365 * 10);
                        cookie.setSecure(true);
                        Cookie cookie1 = new Cookie(NSDConstants.uTypeCookie,((BaseUser)bundle).getUserType());
                        cookie1.setMaxAge(60 * 60 * 24 * 365 * 10);
                        cookie1.setSecure(true);
                        Cookie[] cookie2 = request.getCookies();

                        for (Cookie tempCookie : cookie2) {
                            if (tempCookie.getName().equals("JSESSIONID")) {
                                //TODO additional security

                            }


                        }



                        response.addCookie(cookie);
                        response.addCookie(cookie1);
                        response.setStatus(HttpServletResponse.SC_OK);
                        response.getWriter().write("");
                        response.getWriter().flush();
                        response.getWriter().close();
                    }
                    catch (Exception e){

                    }
                }
            }
        });
    }
}
