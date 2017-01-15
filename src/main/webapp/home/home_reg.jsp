<%@ page import="auth_system.CookieKiller" %>
<%@ page import="NSD.NSDConstants" %><%--
  Created by IntelliJ IDEA.
  User: NSD
  Date: 16.12.16
  Time: 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    if(!request.isSecure()){ response.sendRedirect(NSDConstants.HOST); return;}
    Cookie[] cookies = request.getCookies();
    String type = "";
    for(int i=0;i<cookies.length;i++){

        if(cookies[i].getName().equals(NSDConstants.uTypeCookie)){
            type = cookies[i].getValue();
        }
    }

    if (type.equals("t")) request.getRequestDispatcher("../profile/teacherProfile.jsp").include(request, response);
    if (type.equals("s")) request.getRequestDispatcher("../profile/studentProfile.jsp").include(request,response);
    if (type.equals("a")) request.getRequestDispatcher("../profile/adminProfile.jsp").include(request,response);
%>