<%--
  Created by IntelliJ IDEA.
  User: NSD
  Date: 13.12.16
  Time: 13:32
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="NSD.NSDConstants" %>
<%@ page import="javax.servlet.http.Cookie" %>
<%
    if (!request.isSecure()) response.sendRedirect("https://doctrado-sviasy.rhcloud.com");




    Cookie[] cookies = request.getCookies();
    boolean auth = false;
    boolean nextStepAuth = false;
    try {
        for (Cookie cookie:cookies) {
            try {
                if (cookie.getName().equals(NSDConstants.uTokenCookie) && !cookie.getValue().equals("")) {
                    auth = true;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            try {
                if (cookie.getName().equals(NSDConstants.uTypeCookie) && (!cookie.getValue().equals("") || !(cookie.getValue() == null))) {
                    nextStepAuth = true;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    if (auth && !nextStepAuth) {
        response.sendRedirect("https://doctrado-sviasy.rhcloud.com");
    }




    response.setContentType("text/html;charset=UTF-8");
        if(auth){
    request.getRequestDispatcher("./home/home_reg.jsp").include(request, response);//рисуем jsp
        }
        else {
    request.getRequestDispatcher("./home/home_unreg.jsp").include(request, response);//рисуем jsp
        }
 // %>
