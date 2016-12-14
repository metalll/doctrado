package auth_system;

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
        // request.setCharacterEncoding("Cp1251");

        //   Map<String,String[]> map = request.getParameterMap();
        String str = request.getCharacterEncoding() + "\n";
        str += BodyGetter.getBody(request);
//                String result = URLDecoder.decode(str,"UTF-8");

        //Reading the Map
        //Works for GET && POST Method

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
        out.write(result);
        out.flush();
        out.close();




    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
