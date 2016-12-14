package UI;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by NSD on 14.12.16.
 */
@WebServlet(name = "webinar",urlPatterns = "/webinar")
public class webinar extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean registered = false;
        for(int i=0 ;i<request.getCookies().length;i++){
            if(request.getCookies()[i].getName().equals("Token")){
                registered = true;
            }
        }
        response.setContentType("text/html;charset=UTF-8");
        if(registered){
        request.getRequestDispatcher("./webinar.jsp").include(request, response);//рисуем jsp.e
        }
        else {
            request.getRequestDispatcher("./webinarUnreg.jsp");
        }
    }
}
