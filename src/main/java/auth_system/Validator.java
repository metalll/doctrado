package auth_system;

import Interfaces.ICompletion;
import database.User.DBBaseUser;
import model.Users.BaseUser;
import utils.BodyGetter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.Map;

/**
 * Created by NSD on 14.12.16.
 */
@WebServlet("/validate_user")
public class Validator extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType ("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter ();
        request.setCharacterEncoding ("UTF-8");
        int error = 0;


        Map<String,String[]> map = request.getParameterMap();
        String str = request.getCharacterEncoding() + "\n";
        str += BodyGetter.getBody(request);
//                String result = URLDecoder.decode(str,"UTF-8");


        BaseUser u = new BaseUser(0,"Алексей","Владимирович","Петров","metall112@bk.ru",
                "QazWsx321","380679662385","09.09.1991","Высшее","Одесса","0324552532562","s");

        DBBaseUser.getInstance().addUser(u, new ICompletion() {
            @Override
            public void afterOperation(Object bundle) {

            }
        });

        String result = URLDecoder.decode(str, "UTF-8").replaceAll("\\+", "%20");


        BufferedWriter writer = null;
        result += new FileWriter("fcw").getEncoding();



        try
        {
            writer = new BufferedWriter( new FileWriter("file1"));

//
//
//            for(String paramName:map.keySet()) {
//                String[] paramValues = map.get(paramName);
//
//                //Get Values of Param Name
//                for(String valueOfParam:paramValues) {
//                    //Output the Value
//                     str += "Value of Param with Name "+ paramName+": "+valueOfParam + "\n";
//
//                }
//            }

            writer.write(result);
        }
        catch ( IOException e)
        {
        }
        finally
        {
            try
            {
                if ( writer != null)
                    writer.close( );
            }
            catch ( IOException e)
            {
            }
        }


        response.setStatus(HttpServletResponse.SC_OK);
        out.write("0");
        out.flush();
        out.close();




    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
