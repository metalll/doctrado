<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="auth_system.Authorizator" %>
<%@ page import="com.mysql.jdbc.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: NSD
  Date: 15.12.16
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>

<%

    ArrayList<String> strings = new ArrayList<String>();
    final String databaseUrl = "jdbc:mysql://127.6.55.2:3306/doctrado?useUnicode=true&amp;characterEncoding=utf8";
    //private static final String databaseUrl = "jdbc:mysql://localhost:3307/tochka";
    final String userName = "adminsBmIZAN";
    final String password = "qIqWymbbb-hk";
    Connection conn = null;
    Statement stmt = null;
    String uToken = null;
    for(Cookie cookie : request.getCookies()){
        if(cookie.getName().equals(Authorizator.uTokenCookie))
            uToken = cookie.getValue();
    }


    String query =  "SELECT * FROM `users` WHERE `lastUserToken` = '"+uToken+"'";



    boolean isSuccess = false;
    // String query =  "SELECT * FROM `users` WHERE `login` = '"+uName+"' AND `pass` ='"+uPass+"'";
    try{  Class.forName("com.mysql.jdbc.Driver"); }
    catch(Exception e){ e.printStackTrace(); }
    try{
        conn = DriverManager.getConnection(databaseUrl, userName, password);
        stmt =  (Statement) conn.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        while(rs.next()){
            isSuccess = true;

            for(int i=1;i<=12;i++){
                strings.add(rs.getString(i));
            }

            //  completion.afterOperation(new Teacher();
        }
    }
    catch (SQLException e){ e.printStackTrace();  }
    finally {
        if(stmt != null) try {stmt.close();} catch (Exception e){}
        if(conn != null) try {conn.close();} catch (Exception e){}

    }

    query = "SELECT * FROM 'teacher' WHERE 'id'='"+uToken+"'";
    // String query =  "SELECT * FROM `users` WHERE `login` = '"+uName+"' AND `pass` ='"+uPass+"'";
    try{  Class.forName("com.mysql.jdbc.Driver"); }
    catch(Exception e){ e.printStackTrace(); }
    try{
        conn = DriverManager.getConnection(databaseUrl, userName, password);
        stmt =  (Statement) conn.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        while(rs.next()){
            isSuccess = true;

            for(int i=1;i<=6;i++){
                strings.add(rs.getString(i));
            }

            //  completion.afterOperation(new Teacher();
        }
    }
    catch (SQLException e){ e.printStackTrace();  }
    finally {
        if(stmt != null) try {stmt.close();} catch (Exception e){}
        if(conn != null) try {conn.close();} catch (Exception e){}

    }







%>



<!DOCTYPE html>
<html lang="en">
<head>



    <meta charset="utf-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="csrf-token" content="QztTeriVGADjqJNodjGXM9ch3ZdGO8dwteZkGZOd" />
    <title>Doctrado</title>
    <link rel="stylesheet" type="text/css" href="../css/slick.css"/>
    <link rel="stylesheet" href="../css/app.css">
    <link rel="stylesheet" href="../css/costume-decoration.css">
    <link rel="shortcut icon" href="https://doctrado.me/img/favicon.ico">
    <script>
        var user_id = 28;
        var user_type = 't';
    </script>
    <style>
        .courses__img {
            height: 200px;
        }
    </style>
</head>
<body>
<div id="loading-bg" style="display:none;">
    <div style="position: fixed;  background: rgba(0, 0, 0, 0.3);  width: 100%;  height: 100%;z-index: 1001;"></div>
    <img src="css/ajax-loader.gif" style="position: fixed; z-index: 1000; left: 50%; top: 50%; transform: translate(-50%, -50%); max-width:200px; max-height: 200px;">
</div>
<div class="login-popup" id="login-popup">
    <div class="login-popup__bg"></div>
    <div class="login-popup__wrapper">
        <div class="row">
            <div class="small-12 columns">
                <div class="login-popup__close-button">
                    <i class="fa fa-times"></i>
                </div>
                <p class="login-popup__title">
                    Форма входа
                </p>
            </div>
        </div>
        <form name="login-form" id="login-form">
            <div class="row">
                <div class="small-12 columns">
                    <fieldset form="login-form">
                        <input type="text" placeholder="E-mail" name="email">
                        <p class="login-alert" id="alert-login">Введите ваш e-mail</p>
                        <input type="text" placeholder="Пароль" name="pass">
                        <p class="login-alert" id="alert-login-password">Введите ваш пароль</p>
                        <input class="login-popup__submit" type="submit" value="Войти">
                    </fieldset>
                </div>
            </div>
        </form>
    </div>
</div>
<div class="full-about-popup">
    <div class="full-about-popup__bg"></div>
    <div class="full-about-popup__wrapper">
        <div class="row">
            <div class="small-12  columns">
                <div class="full-about-popup__wrapper-form ">
                    <div class="full-about-popup__close-button">
                        <i class="fa fa-times"></i>
                    </div>
                    <p class="full-about-popup__subtitle">Полная информация о пользователе</p>
                    <form name="full-about-form" id="full-about-form">
                        <div class="row">
                            <div class="small-12 medium-6 columns">
                                <fieldset form="full-about-form">
                                    <input type="text" placeholder="Ваше имя" title="Ваше имя" name="name" value="Леша">
                                    <p class="reg-alert" id="alert-0">Заполните это поле</p>
                                    <input type="text" placeholder="Ваше отчество" title="Ваше отчество" name="patronymic" value="Влад">
                                    <p class="reg-alert" id="alert-1">Заполните это поле</p>
                                    <input type="text" placeholder="Ваша фамилия" title="Ваша фамилия" name="surname" value="Петров">
                                    <p class="reg-alert" id="alert-2">Заполните это поле</p>
                                    <input type="text" placeholder="Ваш e-mail" title="Ваш e-mail" name="email" value="linuxoid6666@gmail.com">
                                    <p class="reg-alert" id="alert-3">Заполните это поле</p>
                                    <input type="text" placeholder="Ваш преподавательский опыт" title="Ваш преподавательский опыт" name="experience" value="100">
                                    <p class="reg-alert" id="alert-4">Заполните это поле</p>
                                    <input type="text" placeholder="Номер банковской карты (для выплат)" title="Номер банковской карты (для выплат)" name="card" value="442423242343424143242" readonly>
                                    <p class="reg-alert" id="alert-5">Заполните это поле</p>
                                </fieldset>
                            </div>
                            <div class="small-12 medium-6 columns">
                                <fieldset form="full-about-form">
                                    <input type="text" placeholder="Ваш телефон" title="Ваш телефон" name="phone" value="0487043938">
                                    <p class="reg-alert" id="alert-6">Заполните это поле</p>
                                    <input type="text" placeholder="Дата рождения" title="Дата рождения" name="birth_date" value="23.12.1991">
                                    <p class="reg-alert" id="alert-7">Заполните это поле</p>
                                    <input type="text" placeholder="Уровень образования" title="Уровень образования" name="education" value="Макс">
                                    <p class="reg-alert" id="alert-8">Заполните это поле</p>
                                    <input type="text" title="Дополнительное образование" name="extra_graduate" value="Мин">
                                    <p class="reg-alert" id="alert-9">Заполните это поле</p>
                                    <input type="text" placeholder="Место работы " name="work_place">
                                    <div class="small-12 medium-6 columns">
                                        <a class="creating success button save-changes" onclick="commitChanges()"><span class="class">сохранить</span></a>
                                    </div>
                                    <div class="small-12 medium-6 columns">
                                        <button class="file-upload-2" type="button" onclick="$('#photo-input').click()">
                                            сменить фото
                                        </button>
                                    </div>
                                    <input type="file" class="file-input new-avatar-button" style="display:none;" id="photo-input">
                                </fieldset>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<header class="profile-header">

    <nav class="header__top-bar">
        <div class="row collapse">
            <div class="small-12 columns">
                <div class="title-bar" data-responsive-toggle="main-menu" data-hide-for="large">
                    <button class="menu-icon" type="button" data-toggle></button>
                </div>
                <div class="top-bar" id="main-menu">
                    <div class="top-bar-left">
                        <h1 class="site-title">
                            <a href="/">Doctrado</a>
                        </h1>
                        <a class="login-btn" id="profile-button" style="margin-right:10px;">Кабинет</a><a class="login-btn" href="logout">Выход</a>
                    </div>
                    <div class="top-bar-right">
                        <ul class="menu vertical large-horizontal">
                            <li>
                                <a class="menu-elem" href="./#about">О проекте</a>
                            </li>
                            <li>
                                <a class="menu-elem" href="./#capabilities">Возможности</a>
                            </li>
                            <li>
                                <a class="menu-elem" href="./certificates">Сертификаты</a>
                            </li>
                            <li>
                                <a class="menu-elem" href="./webinar">Вебинары</a>
                            </li>
                            <li>
                                <a class="menu-elem" href="./course">Курсы</a>
                            </li>
                            <li>
                                <a class="menu-elem" href="./#contacts">Контакты</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</header>
<section class="global-container">
    <section class="content__teacher-profile">
        <div class="row">
            <div class="small-12 columns">
                <div class="user-profile-container">
                    <div class="information-about-user-container" style="margin-top:20px;">
                        <div class="row">
                            <div class="small-12 columns">
                                <!-- Показывать только администратору -->
                                <a class="button creating success admin-success-button"><span class="class">разрешить быть преподавателем</span></a>
                            </div>
                            <div class="small-12 medium-4 columns end">
                                <div class="user-avatar-container" style="text-align: center;"><img style="height: 200px;" src="../img/camera.gif"></div>
                            </div>
                            <div class="small-12 medium-5 columns end">
                                <div class="user-about-container">
                                    <h2 class="info-about-user"> <%=strings.get(2)+" "+strings.get(3)+" "+strings.get(4)%></h2>
                                    <h2 class="info-about-user">Дата рождения: <%= strings.get(8) %></h2>
                                    <h2 class="info-about-user">Преподавательский опыт: <%=strings.get(17)%></h2>
                                </div>
                            </div>
                            <div class="small-12 medium-3 columns end">
                                <div class="user-profile-buttons">
                                    <p class="user-rank"><span class="class">Преподаватель</span></p>
                                    <a class="creating button secondary look-more"><span class="class">подробнее</span></a>
                                    <!-- Должно быть спрятано при условии, что не твой профиль. А кто-то другой просматривает его -->
                                    <a href="statistic" class="creating button secondary "><span class="class">ваша статистика</span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="delimiter-buttons">
                            <div class="small-12 medium-4 columns">
                                <a id="user-courses-all" class="button success creating"><span class="class">Созданные курсы (0)</span></a>
                            </div>
                            <div class="small-12 medium-4 columns">
                                <a id="user-courses-bought" class="button secondary creating"><span class="class">Купленные курсы (0)</span></a>
                            </div>
                            <div class="small-12 medium-4 columns">
                                <a id="user-notifications" class="button secondary creating"><span class="class">оповещения (0)</span></a>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="nocourses-question-container">
                            <div class="small-12 medium-6 medium-offset-3 columns">
                                <a href="creating-course" class="creating button success"><span class="class">создать курс</span></a>
                            </div>
                        </div>
                        <div class="user-courses-container-all">
                            <div class="row">
                                <div class="small-12 columns">
                                    <h2 class="info-about-courses-title">Ваши курсы:</h2>
                                </div>
                                <div class="row small-up-1 medium-up-3">
                                </div>
                            </div>
                        </div>
                        <div class="user-courses-container-bought" style="display:none;">
                            <div class="row">
                                <div class="small-12 columns">
                                    <h2 class="info-about-courses-title">Ваши курсы:</h2>
                                </div>
                                <div class="small-12 medium-6 medium-centered columns" style="float:none;">
                                    <p class="user-notification-content" style="text-align: center; margin-top: 50px;">У Вас ещё не приобретён ни один курс</p>
                                    <a href="course" class="creating button success"><span class="class">Приобрести курс</span></a>
                                </div>
                                <div class="row small-up-1 medium-up-3">
                                </div>
                            </div>
                        </div>
                        <div class="user-notifications-container for-teacher">
                            <div class="small-12 columns">
                                <p class="user-notification-content">Новых оповещений нет.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</section>

<footer class="footer">
    <div class="row">
        <div class="small-6 medium-4 columns">
            <div class="footer__social">
                <a class="footer__social-item social-facebook" href="#">
                    <i class="fa fa-facebook"></i>
                </a>
                <a class="footer__social-item social-twitter" href="#">
                    <i class="fa fa-twitter"></i>
                </a>
            </div>
        </div>
        <div class="small-6 medium-4 columns">
            <div class="footer__copyright">
                Doctrado ©
            </div>
        </div>
        <div class="small-12 medium-4 columns">
            <a href="//elegance.od.ua" class="footer_logo">
                <img src="img/elegance.png" class="elegance-logo" alt="">
            </a>
        </div>
    </div>
</footer>

<script src="../js/jquery.min.js"></script>
<script src="../js/slick.min.js"></script>
<script src="../js/foundation.min.js"></script>
<script src="../js/app.js"></script>
<script src="../js/profile.js"></script>
</body>
</html>