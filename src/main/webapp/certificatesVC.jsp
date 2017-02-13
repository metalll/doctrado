<%--
  Created by IntelliJ IDEA.
  User: NSD
  Date: 12.12.16
  Time: 11:57
  To change this template use File | Settings | File Templates.
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ page import="javax.servlet.http.Cookie" %>
<%@ page import="NSD.NSDConstants" %>

<%
    Cookie[] cookies = request.getCookies();
    boolean auth = false;
    try{
        for (Cookie cookie:cookies) {
            if(cookie.getName().equals(NSDConstants.uTokenCookie)&&!cookie.getValue().equals("")){
                auth = true;
            }}} catch (Exception e){ e.printStackTrace(); }
    response.setContentType("text/html;charset=UTF-8");
    if(auth){
        request.getRequestDispatcher("./certificates/certificates_reg.jsp").include(request, response);//рисуем jsp
    }
    else {
        request.getRequestDispatcher("./certificates/certificates_unreg.jsp").include(request, response);//рисуем jsp
    }
    // %>