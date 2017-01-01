package auth_system;

import NSD.NSDConstants;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

/**
 * Created by NSD on 14.12.16.
 */
@WebServlet("/validate_user")
public class Validator extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(!request.isSecure())response.sendRedirect(NSDConstants.HOST+"/validate_user");
        response.setContentType ("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter ();
        request.setCharacterEncoding ("UTF-8");
        int error = 0;


        Map<String,String[]> map = request.getParameterMap();
        response.setStatus(HttpServletResponse.SC_OK);
        out.write(""+ error);
        out.flush();
        out.close();
    }

}
