<%--
  Created by IntelliJ IDEA.
  User: NSD
  Date: 14.12.16
  Time: 22:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="csrf-token" content="Wx6PFl4mn9yqYIFxDmcvdgOH6tNtWn3dVOktVC7V" />
    <title>Doctrado: Список вебинаров</title>
    <link rel="stylesheet" href="css/app.css">
    <link rel="shortcut icon" href="https://doctrado.me/img/favicon.ico">
</head>
<style type="text/css">
    .nowebinar-link, .nowebinar-link:hover, .nowebinar-link:focus {
        text-decoration: underline;
        color: black;
    }
    .webinars-image {
        height: 200px;
    }
    .webinars__elem {
        min-height: 350px;
    }
</style>
<body>
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
                        <input type="password" placeholder="Пароль" name="pass">
                        <p class="login-alert" id="alert-login-password">Введите ваш пароль</p>
                        <input class="login-popup__submit" type="submit" value="Войти">
                    </fieldset>
                    <a class="lost-your-password" href="restore">Забыли ваш пароль?</a>
                </div>
            </div>
        </form>
    </div>
</div>
<header class="webinars-list-head">
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
                        <a href="profile" class="login-btn" id="profile-button" style="margin-right:10px;">Кабинет</a><a class="login-btn" href="logout">Выход</a>
                    </div>
                    <div class="top-bar-right">
                        <ul class="menu vertical large-horizontal">
                            <li>
                                <a class="menu-elem" data-anchor="#about">О проекте</a>
                            </li>
                            <li>
                                <a class="menu-elem" data-anchor="#capabilities">Возможности</a>
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
                                <a class="menu-elem" data-anchor="#contacts">Контакты</a>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
    </nav>
</header>
<section class="main-container">
    <section class="content__webinars-list-container">
        <div class="webinars-list-global-container">
            <div class="row">
                <div class="small-12 columns" style="margin-top:50px;">
                    <h2 class="courses__title">Список вебинаров</h2>
                </div>
            </div>
            <div class="row">
                <div class="small-12 medium-4 columns">
                    <a class="webinars-edit" href="webinar/create">создать новый вебинар</a>
                    <a href="webinar/create">
                        <div class="new-webinar">
                            <img src="img/plus.png">
                        </div>
                    </a>
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
<script src="js/jquery.min.js"></script>
<script src="js/foundation.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/app.js"></script>
</body>
</html>
