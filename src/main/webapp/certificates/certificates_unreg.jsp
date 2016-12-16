<%--
  Created by IntelliJ IDEA.
  User: NSD
  Date: 16.12.16
  Time: 13:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="csrf-token" content="y2BIl0WED1VBxU51YQ69dy5HvBNL5HRxywo2LwSw" />
    <title>Doctrado</title>
    <link rel="stylesheet" href="../css/app">
    <link rel="shortcut icon" href="https://doctrado.me/img/favicon.ico">
</head>
<body>
<div class="reg-popup">
    <div class="reg-popup__bg"></div>
    <div class="reg-popup__wrapper">
        <div class="row">
            <div class="small-12 columns">
                <div class="reg-popup__wrapper-form">
                    <div class="reg-popup__close-button">
                        <i class="fa fa-times"></i>
                    </div>
                    <p class="reg-popup__title">Добро пожаловать</p>
                    <p class="reg-popup__subtitle">Заполните, пожалуйста, все поля.</p>
                    <form class="registration-form" name="registration-form" id="registration-form">
                        <div class="row">
                            <div class="small-12 medium-6 columns">
                                <fieldset form="registration-form">
                                    <input type="text" placeholder="Ваше имя" name="name">
                                    <p class="reg-alert" id="alert-name">Заполните это поле</p>
                                    <input type="text" placeholder="Ваша фамилия" name="surname">
                                    <p class="reg-alert" id="alert-surname">Заполните это поле</p>
                                    <input type="text" placeholder="Ваше отчество" name="patronymic">
                                    <p class="reg-alert" id="alert-patronymic">Заполните это поле</p>
                                    <input type="text" placeholder="Ваш e-mail" name="email">
                                    <p class="reg-alert" id="alert-email">Заполните это поле</p>
                                    <input type="text" placeholder="Ваш пароль" name="password">
                                    <p class="reg-alert" id="alert-password">Заполните это поле</p>
                                    <input type="text" placeholder="Ваш телефон" name="phone">
                                    <p class="reg-alert" id="alert-phone">Заполните это поле</p>

                                </fieldset>
                            </div>
                            <div class="small-12 medium-6 columns">
                                <fieldset form="registration-form">
                                    <input type="text" placeholder="Дата рождения" name="birth-date">
                                    <p class="reg-alert" id="alert-date">Заполните это поле</p>
                                    <input type="text" placeholder="Уровень образования" name="graduate">
                                    <p class="reg-alert" id="alert-graduate">Заполните это поле</p>
                                    <input type="text" placeholder="Место работы *" name="experience">
                                </fieldset>
                                <p class="reg-popup__condition">* При условии, что Вы регистрируетесь от юр. лица в ином
                                    случае - можете оставить это поле пустым</p>
                                <fieldset form="registration-form">
                                    <input type="checkbox"><span class="reg-popup__checkbox-text">Я согласен с условиями предоставления услуг</span>
                                </fieldset>
                                <p class="reg-popup__who">Кто Вы?</p>
                                <fieldset form="registration-form" class="reg-popup__buttons">
                                    <!--<input class="reg-popup__teacher-submit" type="submit" value="Преподаватель">-->
                                    <button class="reg-popup__teacher-submit">Преподаватель</button>
                                    <input class="reg-popup__student-submit" type="submit" value="Студент">
                                </fieldset>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="reg-popup-second">
    <div class="reg-popup__bg"></div>
    <div class="reg-popup__wrapper">
        <div class="row">
            <div class="small-12 columns">
                <div class="reg-popup__wrapper-form">
                    <div class="reg-popup__close-button">
                        <i class="fa fa-times"></i>
                    </div>
                    <p class="reg-popup__title">Регистрация преподавателя</p>
                    <form class="registration-form" name="registration-form-2" id="registration-form-2">
                        <div class="row">
                            <div class="small-12 medium-6 columns">
                                <fieldset class="text-center" form="registration-form-2">
                                    <input type="text" placeholder="Ваше образование" name="graduate">
                                    <p class="reg-alert" id="alert-graduate-2">Заполните это поле</p>
                                    <input type="text" placeholder="Дополнительное образование" name="extra graduate">
                                    <p class="reg-alert" id="alert-graduate-extra">Заполните это поле</p>
                                    <input type="text" placeholder="Ваш преподавательский опыт" name="experience">
                                    <p class="reg-alert" id="alert-experience">Заполните это поле</p>
                                    <p class="reg-popup__condition">* Добавьте, пожалуйста, копии подтверждающих
                                        документов</p>
                                    <button class="reg-popup__upload">
                                        <input class="reg-upload" type="file">
                                        Загрузить
                                    </button>
                                    <input class="reg-popup__ready" type="submit" value="Готово">
                                    <input type="text" placeholder="Номер банковской карты (для выплат)" name="card">
                                    <p class="reg-alert" id="alert-card">Заполните это поле</p>
                                </fieldset>
                            </div>
                            <div class="small-12 medium-6 columns">
                                <fieldset class="text-center" form="registration-form-2">
                                    <button class="reg-popup__upload-avatar">
                                        <img src="../img/camera.png" alt="">
                                        <input class="reg-upload" type="file">
                                    </button>
                                    <p>Ваш аватар для сайта</p>
                                    <p>
                                        <input type="checkbox"><span class="reg-popup__checkbox-text">Я согласен с условиям предоставления данных</span>
                                    </p>
                                    <button class="reg-popup__back">Вернуться</button>
                                    <input class="reg-popup__ready" type="submit" value="Готово">
                                </fieldset>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
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
                        <input type="text" placeholder="Логин" name="login">
                        <p class="login-alert" id="alert-login">Введите ваш логин</p>
                        <input type="password" placeholder="Пароль" name="pass">
                        <p class="login-alert" id="alert-login-password">Введите ваш пароль</p>
                        <input class="login-popup__submit" type="submit" value="Войти">
                        <a class="lost-your-password" href="#">Забыли ваш пароль?</a>
                    </fieldset>

                </div>
            </div>
        </form>
    </div>
</div>

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

<section class="certificates" style="margin-top: 20px;">
    <div class="row">
        <div class="small-12 columns">
            <h2 class="checking__title">
                Проверка сертификатов пользователей
            </h2>
        </div>
        <section class="content__checking-container">
            <div class="about-this-container">
                <div class="row">
                    <div class="small-12 columns">
                        <div class="row">
                            <p class="why-it-needs">
                                Некоторые курсы сервиса Doctrado предоставляют студентам специальные сертификаты,
                                которые являются документом, подтверждающим, что студент действительно прошёл тот или иной курс.
                                <br>Вы можете проверить подлинность такого сертификаты введя его номер ниже.
                                <br><br>Внимание! Электронный сертификат может не совпадать внешним видом с физическим, совпадать должны лишь данные!
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="small-up-12 columns">
                <form id="get_certificates_form">
                    <div class="row">
                        <div class="check-certificate-field">
                            <div class="small-12 columns">
                                <div class="row collapse">
                                    <div class="small-10 columns checking-field">
                                        <input id="cert-number" type="number" placeholder="Введите номер сертификата" style="padding: 0 15px;">
                                    </div>
                                    <div class="small-2 columns search-button">
                                        <a onclick="getCertificates()" class="button postfix checking-start"></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
    </div>
    <section class="content__certificate-container" id="certificates">
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
                <img src="../img/elegance.png" class="elegance-logo" alt="">
            </a>
        </div>
    </div>
</footer>

<script src="../js/query.min.js"></script>
<script src="../js/foundation.min.js"></script>
<script src="../js/slick.min.js"></script>
<script src="../js/app.js"></script>
<script src="../js/certificates.js"></script>

</body>
</html>
