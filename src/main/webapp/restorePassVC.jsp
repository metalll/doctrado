<%--
  Created by IntelliJ IDEA.
  User: NSD
  Date: 08.12.16
  Time: 13:50
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:directive.page pageEncoding="UTF-8" />

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="csrf-token" content="g8k03dmeUjKAaPd9NhawrT1IoXwMKnszUCjErNEb" />
    <title>Doctrado</title>
    <link rel="stylesheet" type="text/css" href="css/slick.css"/>
    <link rel="stylesheet" href="css/app.css">
    <link rel="shortcut icon" href="https://doctrado.me/img/favicon.ico">
</head>
<style type="text/css">

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
                        <a id="login-btn" class="login-btn">Log In</a>
                    </div>
                    <div class="top-bar-right">
                        <ul class="menu vertical large-horizontal">
                            <li>
                                <a class="menu-elem" href="../#about">О проекте</a>
                            </li>
                            <li>
                                <a class="menu-elem" href="../#capabilities">Возможности</a>
                            </li>
                            <li>
                                <a class="menu-elem" href="../certificates">Сертификаты</a>
                            </li>
                            <li>
                                <a class="menu-elem" href="../webinar">Вебинары</a>
                            </li>
                            <li>
                                <a class="menu-elem" href="../course">Курсы</a>
                            </li>
                            <li>
                                <a class="menu-elem" href="../#contacts">Контакты</a>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
    </nav>
</header>
<section class="global-container">
    <section class="content__pass-reset">
        <div class="row">
            <div class="small-10 medium-offset-1 columns">
                <h2 class="checking__title">Введите ваш e-mail при регистрации</h2>
                <h3 class="subtitle-reset__title">В случае если почтовый адрес действителен то на него придёт письмо со ссылкой для восстановления пароля</h3>
                <h3 class="subtitle-reset__title" id="reset-result" style="display:none;">Письмо отправлено, ожидайте в течении 10-15 минут.</h3>
                <input class="reset-your-password" type="text" placeholder="Ваш e-mail">
            </div>
            <div class="small-5  medium-offset-1 columns"><a href="/" class="creating secondary"><span class="class">Отменить</span></a></div>
            <div class="small-5  end columns"><a onclick="passwordRestoreRequest()" class="creating success"><span class="class">Отправить</span></a></div>
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
<script src="js/app.js"></script>
<script src="js/reset-password.js"></script>
<script src="js/slick.min.js"></script>

</body>
</html>


