<%--
  Created by IntelliJ IDEA.
  User: NSD
  Date: 15.12.16
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="csrf-token" content="QztTeriVGADjqJNodjGXM9ch3ZdGO8dwteZkGZOd" />
    <title>Doctrado</title>
    <link rel="stylesheet" type="text/css" href="css/slick.css"/>
    <link rel="stylesheet" href="css/app.css">
    <link rel="stylesheet" href="css/costume-decoration.css">
    <link rel="shortcut icon" href="https://doctrado.me/img/favicon.ico">
    <script>
        var user_id = 29;
        var user_type = 's';
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
<div class="reg-popup-second">
    <div class="reg-popup__bg"></div>
    <div class="reg-popup__wrapper">
        <div class="row">
            <div class="small-12 columns">
                <div class="reg-popup__wrapper-form">
                    <div class="reg-popup__close-button">
                        <i class="fa fa-times"></i>
                    </div>
                    <p class="reg-popup__title" id="reg-second-title">Становление<br>преподавателем</p>
                    <form class="registration-form" name="registration-form-2" id="registration-form-2">
                        <div class="row">
                            <div class="small-12 medium-6 columns" id="reg-second-column1">
                                <fieldset class="text-center" form="registration-form-2">
                                    <input type="text" placeholder="Ваше образование" name="graduate_t" onkeydown="$('#alert-2-0').fadeOut()">
                                    <p class="reg-alert" id="alert-2-0">Заполните это поле</p>
                                    <input type="text" placeholder="Дополнительное образование" name="extra_graduate" onkeydown="$('#alert-2-1').fadeOut()">
                                    <p class="reg-alert" id="alert-2-1">Заполните это поле</p>
                                    <button type="button" class="reg-popup__upload" onclick="$('#document-input').click()">
                                        Выбрать
                                    </button>
                                    <p class="reg-popup__condition">* Пожалуйста, выберите копию подтверждающих
                                        документов для загрузки</p>
                                    <p class="reg-alert" id="alert-2-confirmation">Для регистрации профиля преподавателя необходимо предоставить подтверждающие документы</p>
                                    <input class="reg-upload" type="file" style="display:none;" id="document-input">
                                </fieldset>
                            </div>
                            <div class="small-12 medium-6 columns" id="reg-second-column2">
                                <fieldset class="text-center" form="registration-form-2">
                                    <input type="text" placeholder="Ваш преподавательский опыт" name="experience" onkeydown="$('#alert-2-2').fadeOut()">
                                    <p class="reg-alert" id="alert-2-2">Заполните это поле</p>
                                    <input type="text" placeholder="Номер банковской карты (для выплат)" name="card" style="font-size:0.9rem;" onkeydown="$('#alert-2-3').fadeOut()">
                                    <p class="reg-alert" id="alert-2-3">Заполните это поле</p>
                                    <input type="checkbox" id="terms-2-checkbox" onchange="$('#alert-2-terms').fadeOut()"><span class="reg-popup__checkbox-text">Я согласен с условиям предоставления данных</span>
                                    <p class="reg-alert" id="alert-2-terms">Для регистрации необходимо согласиться с условиями</p>
                                    </p>
                                    <div class="row">
                                        <div class="medium-12 large-6 columns">
                                            <input style="min-width:100%;" class="reg-popup__back" type="button" value="Вернуться">
                                        </div>
                                        <div class="medium-12 large-6 columns">
                                            <input style="min-width:100%;" class="reg-popup__ready" type="button" value="Готово" onclick="convertToTeacher()">
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
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
                                    <input type="text" placeholder="Ваше имя" name="name" value="Леша">
                                    <p class="reg-alert" id="alert-0">Заполните это поле</p>
                                    <input type="text" placeholder="Ваше отчество" name="patronymic" value="Владимирович">
                                    <p class="reg-alert" id="alert-1">Заполните это поле</p>
                                    <input type="text" placeholder="Ваша фамилия" name="surname" value="Петров">
                                    <p class="reg-alert" id="alert-2">Заполните это поле</p>
                                    <input type="text" placeholder="Ваш e-mail" name="email" value="metall112@bk.ru" readonly>
                                    <p class="reg-alert" id="alert-3">Заполните это поле</p>
                                </fieldset>
                            </div>
                            <div class="small-12 medium-6 columns">
                                <fieldset form="full-about-form">
                                    <input type="text" placeholder="Ваш телефон" name="phone" value="0652183554">
                                    <p class="reg-alert" id="alert-4">Заполните это поле</p>
                                    <input type="text" placeholder="Дата рождения" name="birth_date" value="08.08.91">
                                    <p class="reg-alert" id="alert-5">Заполните это поле</p>
                                    <input type="text" placeholder="Уровень образования" name="education" value="низко">
                                    <p class="reg-alert" id="alert-6">Заполните это поле</p>
                                    <input type="text" placeholder="Место работы " name="work_place" value="нет">
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
                            <div class="small-12 medium-4 columns end">
                                <div class="user-avatar-container" style="text-align: center;"><img style="height: 200px;" src="img/camera.gif"></div>
                            </div>
                            <div class="small-12 medium-5 columns end">
                                <div class="user-about-container">
                                    <h2 class="info-about-user">Леша Владимирович Петров</h2>
                                    <h2 class="info-about-user">Дата рождения: 08.08.91</h2>
                                </div>
                            </div>
                            <div class="small-12 medium-3 columns end">
                                <div class="user-profile-buttons">
                                    <p class="user-rank"><span class="class">Студент</span></p>
                                    <a class="creating button secondary look-more"><span class="class">подробнее</span></a>
                                    <a href="my-tests" class="creating button secondary "><span class="class">Мои успехи</span></a>
                                    <a class="creating button secondary" onclick="becomeTeacher()"><span class="class">Стать преподавателем</span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="delimiter-buttons">
                            <div class="small-12 medium-6 columns"><a id="user-courses-all" class="button success creating"><span class="class">мои курсы (0)</span></a></div>
                            <div class="small-12 medium-6 columns"><a id="user-notifications" class="button secondary creating"><span class="class">оповещения (0)</span></a></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="user-courses-container-all">
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

<script src="js/jquery.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/foundation.min.js"></script>
<script src="js/app.js"></script>
<script src="js/profile.js"></script>
</body>
</html>