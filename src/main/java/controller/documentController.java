package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

/**
 * Created by NSD on 19.12.16.
 */
@WebServlet(name = "documentController")
public class documentController extends HttpServlet {

    private static final String startImage = "/9j/4AAQSkZJ";
    private static final String startPDF = "";
    private static final String startDoc = "";
    private static final String startRTF = "";
    private static final String startDocx = "";
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
        String  file =  encoder.encode(bytes);

       // int type = getTypeFile(file);
       



     //   String key  = "";

//        for(Cookie cookie : request.getCookies()){
//
//            if(cookie.getName().equals(Authorizator.uTokenCookie)){
//                key = cookie.getValue();
//            }
//
//        }

//        if(!img1.equals(""))
//            DBImage.getInstance().add(img1, key, new ICompletion() {
//                @Override
//                public void afterOperation(Object bundle) {
//                    out.print("");
//                    out.flush();
////                    out.close();
//
//                }
//            });

        BufferedWriter writer = null;
        try
        {
            writer = new BufferedWriter( new FileWriter("file"));

    
            writer.write(file);
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








    }


    protected int getTypeFile(String file){
        if(file.indexOf(startPDF)!=-1)  return 1;
        if(file.indexOf(startRTF)!=-1)  return 2;
        if(file.indexOf(startDoc)!=-1)  return 3;
        if(file.indexOf(startDocx)!=-1) return 4;
        if(file.indexOf(startImage)!=-1)return 5;

        return -1;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}

