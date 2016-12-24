<%--
  Created by IntelliJ IDEA.
  User: NSD
  Date: 13.12.16
  Time: 13:32
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="auth_system.Authorizator" %>
<%@ page import="javax.servlet.http.Cookie" %>
<%


    if (!request.isSecure())
    {
        response.sendRedirect("https://doctrado-sviasy.rhcloud.com");
    }



    Cookie[] cookies = request.getCookies();
    boolean auth = false;
    try{
    for (Cookie cookie:cookies) {
        if(cookie.getName().equals(Authorizator.uTokenCookie)&&!cookie.getValue().equals("")){
            auth = true;
        }}} catch (Exception e){ e.printStackTrace(); }
    response.setContentType("text/html;charset=UTF-8");
        if(auth){
    request.getRequestDispatcher("./home/home_reg.jsp").include(request, response);//рисуем jsp
        }
        else {
    request.getRequestDispatcher("./home/home_unreg.jsp").include(request, response);//рисуем jsp
        }
 // %>
