package controller;

import javax.activation.MimetypesFileTypeMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.net.URLDecoder;

/**
 * Created by NSD on 19.12.16.
 */
@WebServlet(name = "documentController")
@MultipartConfig
public class documentController extends HttpServlet {
    private static final long serialVersionUID = 2857847752169838915L;
    int BUFFER_LENGTH = 4096;
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        for (Part part : request.getParts()) {
            InputStream is = request.getPart(part.getName()).getInputStream();
            String fileName = getFileName(part);
            FileOutputStream os = new FileOutputStream(
                    System.getenv("OPENSHIFT_DATA_DIR") + fileName);
            byte[] bytes = new byte[BUFFER_LENGTH];
            int read = 0;
            while ((read = is.read(bytes, 0, BUFFER_LENGTH)) != -1) {
                os.write(bytes, 0, read);
            }
            os.flush();
            is.close();
            os.close();
            out.println(fileName + " was uploaded to "
                    + System.getenv("OPENSHIFT_DATA_DIR"));
        }
    }
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {
        //Remove extra context path which exists in local Tomcat applications.
        String filePath = request.getRequestURI().substring(
                request.getContextPath().length());
        //Decode url. Fixes issue with files having space within the file name
        filePath = URLDecoder.decode(filePath, "UTF-8");
        File file = new File(System.getenv("OPENSHIFT_DATA_DIR")
                + filePath.replace("/uploads/", ""));
        InputStream input = new FileInputStream(file);
        response.setContentLength((int) file.length());
        response.setContentType(new MimetypesFileTypeMap().getContentType(file));
        OutputStream output = response.getOutputStream();
        byte[] bytes = new byte[BUFFER_LENGTH];
        int read = 0;
        while ((read = input.read(bytes, 0, BUFFER_LENGTH)) != -1) {
            output.write(bytes, 0, read);
            output.flush();
        }
        input.close();
        output.close();
    }
    private String getFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String filename = cd.substring(cd.indexOf('=') + 1);
                //remove extra file path in windows local machine
                return filename.substring(filename.lastIndexOf("\\") + 1)
                        .trim().replace("\"", "");
            }
        }
        return null;
    }
}

