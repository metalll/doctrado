package UI;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;




/**
 * Created by NSD on 08.12.16.
 */
@WebServlet("/restorePass")
public class restorePass extends HttpServlet {



    protected void doPost(HttpServletRequest request,   HttpServletResponse response) throws ServletException, IOException {


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
      request.getRequestDispatcher("./restorePassVC.jsp").include(request, response);//рисуем jsp.e

    }
}
