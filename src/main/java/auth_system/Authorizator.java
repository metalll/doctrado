package auth_system;

import Interfaces.ICompletion;
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
    public static final String uTypeCookie = "UType";
    public static final String uTokenCookie = "Token";


    protected void doPost(HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        response.setContentType ("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter ();
        request.setCharacterEncoding ("UTF-8");
     //if auth



        Map<String, String[]> map = request.getParameterMap();
            //Reading the Map
            //Works for GET && POST Method

//        BufferedWriter writer = null;
//        try
//        {
//            writer = new BufferedWriter( new FileWriter("file"));
//            String str = "";
//            for(String paramName:map.keySet()) {
//                String[] paramValues = map.get(paramName);
//
//                //Get Values of Param Name
//                for(String valueOfParam:paramValues) {
//                    //Output the Value
//                     str += "Value of Param with Name "+paramName+": "+valueOfParam + "\n";
//
//                }
//            }
//            writer.write(str);
//        }
//        catch ( IOException e)
//        {
//        }
//        finally
//        {
//            try
//            {
//                if ( writer != null)
//                    writer.close( );
//            }
//            catch ( IOException e)
//            {
//            }
//        }


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
                    catch (Exception e){

                    }
                }
                else {
                    try {
                        Cookie cookie = new Cookie(uTokenCookie,((BaseUser)bundle).getLastUserToken());
                        cookie.setMaxAge(60 * 60 * 24 * 365 * 10);
                        Cookie cookie1 = new Cookie(uTypeCookie,((BaseUser)bundle).getUserType());
                        cookie.setMaxAge(60 * 60 * 24 * 365 * 10);


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




         //if dont auth

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


}
