package controller;

import auth_system.Authorizator;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

/**
 * Created by NSD on 19.12.16.
 */
@WebServlet(name = "documentController")
public class documentController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String UPLOAD_DIRECTORY = "/var/lib/openshift/58512d040c1e66ad2d000024/jbossews/upload";
    private static final int THRESHOLD_SIZE 	= 1024 * 1024 * 3; 	// 3MB
    private static final int MAX_FILE_SIZE 		= 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE 	= 1024 * 1024 * 50; // 50MB

    /**
     * handles file upload via HTTP POST method
     */
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
        // checks if the request actually contains upload file
        if (!ServletFileUpload.isMultipartContent(request)) {
            PrintWriter writer = response.getWriter();
            writer.println("Request does not contain upload data");
            writer.flush();
            return;
        }

        String key = "";

        for(Cookie cookie : request.getCookies()){

            if(cookie.getName().equals(Authorizator.uTokenCookie)){
                key = cookie.getValue();
            }

        }

        // configures upload settings
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(THRESHOLD_SIZE);
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setFileSizeMax(MAX_FILE_SIZE);
        upload.setSizeMax(MAX_REQUEST_SIZE);

        // constructs the directory path to store upload file
        String uploadPath = "/var/lib/openshift/58512d040c1e66ad2d000024/jbossews/upload";
        // creates the directory if it does not exist
        File uploadDir = new File("/var/lib/openshift/58512d040c1e66ad2d000024/jbossews/upload");
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        try {
            // parses the request's content to extract file data
            List formItems = upload.parseRequest(request);
            Iterator iter = formItems.iterator();

            // iterates over form's fields
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();
                // processes only fields that are not form fields
                if (!item.isFormField()) {
                    String fileName =  FileNameConsructor(new File(item.getName()).getName(),key);
                    String filePath = uploadPath + File.separator + fileName;
                    File storeFile = new File(filePath);

                    // saves the file on disk
                    item.write(storeFile);
                }
            }
            request.setAttribute("message", "Upload has been done successfully! " + uploadPath);
        } catch (Exception ex) {
            request.setAttribute("message", "There was an error: " + ex.getMessage());
        }
        getServletContext().getRequestDispatcher("/message.jsp").forward(request, response);
    }



    private String FileNameConsructor(String fileName,String key){
        int locale = fileName.lastIndexOf('.');
        String ext = "";
        if(locale != -1){
            ext = fileName.substring(locale);
        }
        return key+ext;
    }
}