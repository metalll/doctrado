<%@ page import="NSD.NSDConstants" %>
<%@ page import="auth_system.CookieKiller" %>
<%--
  Created by IntelliJ IDEA.
  User: NSD
  Date: 16.12.16
  Time: 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    try {



        Cookie[] cookies = request.getCookies();
        String type = "";


        for (int i = 0; i < cookies.length; i++) {

            if (cookies[i].getName().equals(NSDConstants.uTypeCookie)) {
                type = cookies[i].getValue();
            }
        }

        if (type.equals("t")) request.getRequestDispatcher("../profile/teacherProfile.jsp").include(request, response);
        if (type.equals("s")) request.getRequestDispatcher("../profile/studentProfile.jsp").include(request, response);
        if (type.equals("a")) request.getRequestDispatcher("../profile/adminProfile.jsp").include(request, response);
    }catch (Exception e){
        CookieKiller.logout(request,response);
        response.sendRedirect(NSDConstants.HOST);
        return;

    }
%>