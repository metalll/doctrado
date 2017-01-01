package UI;

import NSD.NSDConstants;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by NSD on 12.12.16.
 */
@WebServlet("/certificates")
public class certificates extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(!request.isSecure())response.sendRedirect(NSDConstants.HOST+"/certificates");
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher("./certificatesVC.jsp").include(request, response);//рисуем jsp
    }
}
