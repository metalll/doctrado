package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by NSD on 15.12.16.
 */
@WebServlet(name = "validateCourse",urlPatterns = "/validate_course")
public class validateCourse extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType ("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter ();
        request.setCharacterEncoding ("UTF-8");

        response.setStatus(HttpServletResponse.SC_OK);
        out.write("0");
        out.flush();
        out.close();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
