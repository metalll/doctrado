<%--
  Created by IntelliJ IDEA.
  User: NSD
  Date: 14.12.16
  Time: 23:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="csrf-token" content="Wx6PFl4mn9yqYIFxDmcvdgOH6tNtWn3dVOktVC7V">
    <title>Doctrado</title>
    <link rel="stylesheet" href="https://doctrado.me/css/app.css">
    <link rel="shortcut icon" href="https://doctrado.me/img/favicon.ico">
    <style>
        .courses__img {
            height: 200px;
        }
    </style>
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
                                        <img src="/img/camera.png" alt="">
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
                        <input type="text" placeholder="E-mail" name="email">
                        <p class="login-alert" id="alert-login">Введите ваш e-mail</p>
                        <input type="password" placeholder="Пароль" name="pass">
                        <p class="login-alert" id="alert-login-password">Введите ваш пароль</p>
                        <input class="login-popup__submit" type="submit" value="Войти">
                    </fieldset>
                    <a class="lost-your-password" href="https://doctrado.me/restore">Забыли ваш пароль?</a>
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
                    <a href="https://doctrado.me/profile" class="login-btn" id="profile-button" style="margin-right:10px;">Кабинет</a><a class="login-btn" href="https://doctrado.me/logout">Выход</a>
                </div>
                <div class="top-bar-right">
                    <ul class="menu vertical large-horizontal">
                        <li>
                            <a class="menu-elem" href="https://doctrado.me/#about">О проекте</a>
                        </li>
                        <li>
                            <a class="menu-elem" href="https://doctrado.me/#capabilities">Возможности</a>
                        </li>
                        <li>
                            <a class="menu-elem" href="https://doctrado.me/certificates">Сертификаты</a>
                        </li>
                        <li>
                            <a class="menu-elem" href="https://doctrado.me/webinar">Вебинары</a>
                        </li>
                        <li>
                            <a class="menu-elem" href="https://doctrado.me/course">Курсы</a>
                        </li>
                        <li>
                            <a class="menu-elem" href="https://doctrado.me/#contacts">Контакты</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</nav>

<section class="courses" style="min-height:100vh;">
    <div class="row">
        <div class="small-12 columns">
            <h2 class="courses__title">
                Список курсов
            </h2>
        </div>
        <section class="content__search-container">
            <div class="small-up-12 columns">
                <form id="search_form">
                    <div class="row">
                        <div class="small-12 columns">
                            <div class="row collapse">
                                <div class="small-8 medium-9 columns search-field">
                                    <input type="text" placeholder="Поиск по курсам" id="search-text" >
                                </div>
                                <div class="small-2 columns categories-change">
                                    <select class="categories" id="search-category">
                                        <option class="button" value="0">Все категории <i class="icon-caret-down"></i></option>
                                        <option class="button"  value="35"></option>
                                        <option class="button"  value="11">Security</option>
                                        <option class="button"  value="30">Охорона праці</option>
                                        <option class="button"  value="32">Охорона праці</option>
                                        <option class="button"  value="24">Охорона праці ІТР</option>
                                        <option class="button"  value="25">ОХОРОНА ПРАЦІ ІТР</option>
                                        <option class="button"  value="16">Охорона праці ІТР &quot; Лакофарба &quot;</option>
                                        <option class="button"  value="18">Охорона праці автонавантажувачі &quot; Лакофарба&quot;</option>
                                        <option class="button"  value="19">Охорона праці лабораторія &quot; Лакофарба&quot;</option>
                                        <option class="button"  value="17">Охорона праці працівників &quot;Лакофарба&quot;</option>
                                        <option class="button"  value="13">Проф.тех. образование</option>
                                        <option class="button"  value="9">Прочее</option>
                                        <option class="button"  value="37">Техника Безопасности</option>
                                    </select>
                                </div>
                                <div class="small-2 medium-1 columns search-button">
                                    <a onclick="searchCourses()" style="line-height: 95%;" class="button postfix search-start"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
    </div>
    <div class="row small-up-1 medium-up-3">
        <div class="column">
            <div class="courses__elem">
                <a href="https://doctrado.me/course/id64">
                    <img src="https://doctrado.me/img/course.jpg" class="courses__img">
                </a>
                <h4 style="word-wrap: break-word;" class="courses__name">Охорона праці під час роботи з інструментами та пристроями</h4>
                <p class="courses__time">Время на изучение: 5 днів</p>
                <a href="https://doctrado.me/course/id64" class="courses__link">Подробнее</a>
            </div>
        </div>
        <div class="column">
            <div class="courses__elem">
                <a href="https://doctrado.me/course/id63">
                    <img src="https://doctrado.me/img/course.jpg" class="courses__img">
                </a>
                <h4 style="word-wrap: break-word;" class="courses__name">Охорона праці ІТР</h4>
                <p class="courses__time">Время на изучение: 5 днів</p>
                <a href="https://doctrado.me/course/id63" class="courses__link">Подробнее</a>
            </div>
        </div>
        <div class="column">
            <div class="courses__elem">
                <a href="https://doctrado.me/course/id62">
                    <img src="https://doctrado.me/img/course.jpg" class="courses__img">
                </a>
                <h4 style="word-wrap: break-word;" class="courses__name">Здания и сооружения. Общие требования</h4>
                <p class="courses__time">Время на изучение: 5 дней</p>
                <a href="https://doctrado.me/course/id62" class="courses__link">Подробнее</a>
            </div>
        </div>
        <div class="column">
            <div class="courses__elem">
                <a href="https://doctrado.me/course/id59">
                    <img src="https://doctrado.me/img/course.jpg" class="courses__img">
                </a>
                <h4 style="word-wrap: break-word;" class="courses__name">Здания и сооружения</h4>
                <p class="courses__time">Время на изучение: 12 дней</p>
                <a href="https://doctrado.me/course/id59" class="courses__link">Подробнее</a>
            </div>
        </div>
        <div class="column">
            <div class="courses__elem">
                <a href="https://doctrado.me/course/id58">
                    <img src="https://doctrado.me/img/course.jpg" class="courses__img">
                </a>
                <h4 style="word-wrap: break-word;" class="courses__name">Охорона праці</h4>
                <p class="courses__time">Время на изучение: 14 днів</p>
                <a href="https://doctrado.me/course/id58" class="courses__link">Подробнее</a>
            </div>
        </div>
        <div class="column">
            <div class="courses__elem">
                <a href="https://doctrado.me/course/id55">
                    <img src="https://doctrado.me/img/course.jpg" class="courses__img">
                </a>
                <h4 style="word-wrap: break-word;" class="courses__name">рмптм</h4>
                <p class="courses__time">Время на изучение: 9</p>
                <a href="https://doctrado.me/course/id55" class="courses__link">Подробнее</a>
            </div>
        </div>
        <div class="column">
            <div class="courses__elem">
                <a href="https://doctrado.me/course/id53">
                    <img src="https://doctrado.me/img/course.jpg" class="courses__img">
                </a>
                <h4 style="word-wrap: break-word;" class="courses__name">огнетушитель</h4>
                <p class="courses__time">Время на изучение: 2</p>
                <a href="https://doctrado.me/course/id53" class="courses__link">Подробнее</a>
            </div>
        </div>
        <div class="column">
            <div class="courses__elem">
                <a href="https://doctrado.me/course/id51">
                    <img src="https://doctrado.me/courses/course-51/photo.jpg" class="courses__img">
                </a>
                <h4 style="word-wrap: break-word;" class="courses__name">Пожарно-технический минимум </h4>
                <p class="courses__time">Время на изучение: 3 дня</p>
                <a href="https://doctrado.me/course/id51" class="courses__link">Подробнее</a>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="small-12 columns">
            <div class="pagination">
                <ul class="pagination__list">
                    <li class="arrow"><a>&laquo;</a></li>
                    <li class="pagination__elem active"><a href="https://doctrado.me/course/1">1</a></li>
                    <li class="arrow"><a>&raquo;</a></li>
                </ul>
            </div>
        </div>
    </div>
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
                <img src="https://doctrado.me/img/elegance.png" class="elegance-logo" alt="">
            </a>
        </div>
    </div>
</footer>

<script src="https://doctrado.me/js/jquery.min.js"></script>
<script src="https://doctrado.me/js/foundation.min.js"></script>
<script src="https://doctrado.me/js/slick.min.js"></script>
<script src="https://doctrado.me/js/app.js"></script>
<script src="https://doctrado.me/js/courses.js"></script>

</body>
</html>