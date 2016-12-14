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
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Map;

/**
 * Created by NSD on 13.12.16.
 */
@WebServlet("/validate_user")
public class validate_user extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        response.getWriter().write(result);
        response.getWriter().flush();
        response.getWriter().close();






    }

    public static String decodeGetParameter(String parameter,String enc) throws UnsupportedEncodingException {
        return new String(parameter.getBytes(enc),"UTF-8");
    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
