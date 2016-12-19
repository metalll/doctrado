package controller;



import Interfaces.ICompletion;
import auth_system.Authorizator;
import database.DBImage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;


/**
 * Created by NSD on 19.12.16.
 */




@WebServlet(name = "photoController")
public class photoController extends HttpServlet {
        private static final String startImage = "/9j/4AAQSkZJ";
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        response.setContentType ("text/html; charset=UTF-8");
        final PrintWriter out = response.getWriter ();
        request.setCharacterEncoding ("UTF-8");


        InputStream is = request.getInputStream();
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();

        int nRead;
        byte[] data = new byte[16384];

        while ((nRead = is.read(data, 0, data.length)) != -1) {
            buffer.write(data, 0, nRead);
        }

        buffer.flush();

        byte[] bytes = buffer.toByteArray();


        sun.misc.BASE64Encoder encoder = new sun.misc.BASE64Encoder();
        String  img =  encoder.encode(bytes);


        int location = img.indexOf(startImage);

        String img1 = "";
        if(location!=-1)
               img1 = img.substring(location);



        String key  = "";

        for(Cookie cookie : request.getCookies()){

            if(cookie.getName().equals(Authorizator.uTokenCookie)){
                key = cookie.getValue();
            }

        }

if(!img1.equals(""))
        DBImage.getInstance().add(img1, key, new ICompletion() {
            @Override
            public void afterOperation(Object bundle) {
                out.print("");
                out.flush();
                out.close();

            }
        });

//        BufferedWriter writer = null;
//        try
//        {
//            writer = new BufferedWriter( new FileWriter("file"));
//
//
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








    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
