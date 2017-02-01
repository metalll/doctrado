package controller;


import Interfaces.ICompletion;
import NSD.NSDConstants;
import com.mysql.jdbc.Statement;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Properties;

/**
 * Created by NSD on 19.12.16.
 */
@WebServlet(name = "documentController")
public class documentController extends HttpServlet {
    protected static final String databaseUrl = "jdbc:mysql://127.6.55.2:3306/doctrado?useUnicode=true&amp;characterEncoding=utf8";
    //db params
    //private static final String databaseUrl = "jdbc:mysql://localhost:3307/tochka";
    protected static final String userName = "adminsBmIZAN";
    protected static final String password = "qIqWymbbb-hk";
    private static final long serialVersionUID = 1L;
    // location to store file uploaded
    private static final String UPLOAD_DIRECTORY = "/var/lib/openshift/58512d040c1e66ad2d000024/app-root/logs/upload";
    // upload settings
    private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB
    protected Connection conn = null;
    protected Statement stmt = null;

    /**
     * Upon receiving file upload submission, parses the request to read
     * upload data and saves the file on disk.
     */
    protected void doPost(HttpServletRequest request,
                          final HttpServletResponse response) throws ServletException, IOException {
        // checks if the request actually contains upload file
        if (!ServletFileUpload.isMultipartContent(request)) {
            // if not, we stop here
            PrintWriter writer = response.getWriter();
            writer.println("Error: Form must has enctype=multipart/form-data.");
            writer.flush();
            return;
        }

        // configures upload settings
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // sets memory threshold - beyond which files are stored in disk
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        // sets temporary location to store files
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        ServletFileUpload upload = new ServletFileUpload(factory);

        // sets maximum size of upload file
        upload.setFileSizeMax(MAX_FILE_SIZE);

        // sets maximum size of request (include file + form data)
        upload.setSizeMax(MAX_REQUEST_SIZE);

        // constructs the directory path to store upload file
        // this path is relative to application's directory
        String uploadPath = UPLOAD_DIRECTORY;

        // creates the directory if it does not exist
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        try {
            // parses the request's content to extract file data
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);

            String type = "";
            String uuid = "";
            String GenfilePath = "";
            String userInfo = "";


            if (formItems != null && formItems.size() > 0) {
                // iterates over form's fields
                for (FileItem item : formItems) {
                    if (item.isFormField()) {
                        if (item.getFieldName().equals("type")) {
                            type = item.getString();
                        }
                        if (item.getFieldName().equals("uuid")) {
                            uuid = item.getString();
                        }
                    }


                    // processes only fields that are not form fields
                    if (!item.isFormField()) {
                        String fileName = new File(item.getName()).getName();
                        String filePath = uploadPath + File.separator + fileName;

                        File storeFile = new File(filePath);
                        storeFile.setReadable(true, false);
                        storeFile.setWritable(true, false);
                        // saves the file on disk
                        item.write(storeFile);
                        GenfilePath = storeFile.getCanonicalPath();
                    }

                }

                //init userInfo

                Cookie[] cookies = request.getCookies();
                for (Cookie cookie : cookies) {

                    if (cookie.getName().equals(NSDConstants.uTokenCookie)) {
                        userInfo = cookie.getValue();
                    }


                }

                if (type == null) {
                    type = "NULL";
                }
                if (uuid == null || uuid.equals("")) {
                    uuid = "NULL";
                }
                if (GenfilePath == null) {
                    GenfilePath = "NULL";
                }
                if (userInfo == null) {
                    userInfo = "NULL";
                }

                //Write res info to DB
                setExecuteDB("INSERT INTO `doctrado`.`resourses` (`type`, `uuid`, `path`, `userInfo`) VALUES (\'" + type + "\', \'" + uuid + "\', \'" + GenfilePath + "\', \'" + userInfo + "\');", new ICompletion() {
                    @Override
                    public void afterOperation(Object bundle) {
                        try {
                            int errors = 0;

                            response.setStatus(HttpServletResponse.SC_OK);
                            response.getWriter().write("" + errors);
                            response.getWriter().flush();
                            response.getWriter().close();
                        } catch (Exception exc) {
                        }


                    }
                });










            }
        } catch (Exception ex) {
            request.setAttribute("message",
                    "There was an error: " + ex.getMessage() + " " + ex.fillInStackTrace());
        }
        // redirects client to message page

    }


    private void setExecuteDB(String execute, ICompletion completion) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            Properties connInfo = new Properties();
            connInfo.put("user", userName);
            connInfo.put("password", password);
            connInfo.put("useUnicode", "true");
            connInfo.put("characterEncoding", "UTF-8");
            Connection conn = DriverManager.getConnection(databaseUrl, connInfo);
            stmt = (Statement) conn.createStatement();
        } catch (Exception e) {
        }
        try {
            stmt.executeUpdate(execute);
            completion.afterOperation(null);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (stmt != null) try {
                stmt.close();
            } catch (Exception e) {
            }
            if (conn != null) try {
                conn.close();
            } catch (Exception e) {
            }

        }

    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Map<String, String[]> map = req.getParameterMap();
        String path = map.get("path")[0];


        if (!path.equals("") && path != null) {
            OutputStream out = resp.getOutputStream();
            FileInputStream in = new FileInputStream(path);
            byte[] buffer = new byte[4096];
            int length;
            while ((length = in.read(buffer)) > 0) {
                out.write(buffer, 0, length);
            }
            in.close();
            out.flush();

        } else {

            OutputStream out = resp.getOutputStream();
            out.write(0);
            out.flush();

        }




    }
}

