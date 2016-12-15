<%--
  Created by IntelliJ IDEA.
  User: NSD
  Date: 13.12.16
  Time: 13:32
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  response.setContentType("text/html;charset=UTF-8");
    request.getRequestDispatcher("./course.jsp").include(request, response);//рисуем jsp
 // %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="ISO-8859-1">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="g8k03dmeUjKAaPd9NhawrT1IoXwMKnszUCjErNEb">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Doctrado</title>
    <link rel="stylesheet" href="css/app.css">
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
                                    <p class="reg-alert" id="alert-0">Заполните это поле</p>
                                    <input type="text" placeholder="Ваше отчество" name="patronymic">
                                    <p class="reg-alert" id="alert-1">Заполните это поле</p>
                                    <input type="text" placeholder="Ваша фамилия" name="surname">
                                    <p class="reg-alert" id="alert-2">Заполните это поле</p>
                                    <input type="text" placeholder="Ваш e-mail" name="email">
                                    <p class="reg-alert" id="alert-3">Заполните это поле</p>
                                    <input type="password" placeholder="Ваш пароль" name="password">
                                    <p class="reg-alert" id="alert-4">Заполните это поле</p>
                                    <input type="text" placeholder="Ваш телефон" name="phone">
                                    <p class="reg-alert" id="alert-5">Заполните это поле</p>
                                </fieldset>
                            </div>
                            <div class="small-12 medium-6 columns">
                                <fieldset form="registration-form">
                                    <input type="text" placeholder="Дата рождения" name="birth_date">
                                    <p class="reg-alert" id="alert-6">Заполните это поле</p>
                                    <input type="text" placeholder="Уровень образования" name="education">
                                    <p class="reg-alert" id="alert-7">Заполните это поле</p>
                                    <input type="text" placeholder="Место работы *" name="work_place">
                                </fieldset>
                                <p class="reg-popup__condition">* При условии, что Вы регистрируетесь от юр. лица в ином
                                    случае - можете оставить это поле пустым</p>
                                <fieldset form="registration-form">
                                    <input type="checkbox" id="terms-checkbox"><span class="reg-popup__checkbox-text">Я согласен с условиями предоставления услуг</span>
                                    <p class="reg-alert" id="alert-terms">Для регистрации необходимо согласиться с условиями</p>
                                </fieldset>
                                <p class="reg-popup__who">Кто Вы?</p>
                                <fieldset form="registration-form" class="reg-popup__buttons">
                                    <input class="reg-popup__teacher-submit" type="button" value="Преподаватель">
                                    <input class="reg-popup__student-submit" type="button" value="Студент">
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
                    <p class="reg-popup__title" id="reg-second-title">Регистрация<br>преподавателя</p>
                    <form class="registration-form" name="registration-form-2" id="registration-form-2">
                        <div class="row">
                            <div class="small-12 medium-6 columns" id="reg-second-column1">
                                <fieldset class="text-center" form="registration-form-2">
                                    <input type="text" placeholder="Ваше образование" name="graduate_t">
                                    <p class="reg-alert" id="alert-2-0">Заполните это поле</p>
                                    <input type="text" placeholder="Дополнительное образование" name="extra_graduate">
                                    <p class="reg-alert" id="alert-2-1">Заполните это поле</p>
                                    <input type="text" placeholder="Ваш преподавательский опыт" name="experience">
                                    <p class="reg-alert" id="alert-2-2">Заполните это поле</p>
                                    <button type="button" class="reg-popup__upload" onclick="$('#document-input').click()">
                                        Выбрать
                                    </button>
                                    <p class="reg-popup__condition">* Пожалуйста, выберите копию подтверждающих
                                        документов для загрузки</p>
                                    <p class="reg-alert" id="alert-2-confirmation">Для регистрации профиля преподавателя необходимо предоставить подтверждающие документы</p>
                                    <input class="reg-upload" type="file" style="display:none;" id="document-input">
                                    <input type="text" placeholder="Номер банковской карты (для выплат)" name="card" style="font-size:0.9rem;">
                                    <p class="reg-alert" id="alert-2-3">Заполните это поле</p>
                                </fieldset>
                            </div>
                            <div class="small-12 medium-6 columns" id="reg-second-column2">
                                <fieldset class="text-center" form="registration-form-2">
                                    <button type="button" class="reg-popup__upload-avatar" onclick="uploadPhoto()">
                                        <img src="img/camera.png" id="avatar-img">
                                    </button>
                                    <input accept="image/*" style="display:none;" id="avatar-input" type="file">
                                    <p>Ваш аватар для сайта</p>
                                    <p>
                                        <input type="checkbox" id="terms-2-checkbox"><span class="reg-popup__checkbox-text">Я согласен с условиям предоставления данных</span>
                                    <p class="reg-alert" id="alert-2-terms">Для регистрации необходимо согласиться с условиями</p>
                                    </p>
                                    <div class="row">
                                        <div class="medium-12 large-6 columns">
                                            <input style="min-width:100%;" class="reg-popup__back" type="button" value="Вернуться">
                                        </div>
                                        <div class="medium-12 large-6 columns">
                                            <input style="min-width:100%;" class="reg-popup__ready" type="submit" value="Готово">
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

                    <a class="lost-your-password" href="./restorePass">Забыли ваш пароль?</a>
                </div>
            </div>
        </form>
    </div>
</div>
<div class="login-popup" id="mail-popup">
    <div class="login-popup__bg"></div>
    <div class="login-popup__wrapper">
        <div class="row">
            <div class="small-12 columns">
                <div class="login-popup__close-button">
                    <i class="fa fa-times"></i>
                </div>
                <p class="login-popup__title" style="margin-bottom:0; font-size: 1.2rem;">
                    Спасибо за Ваше сообщение!
                </p>
            </div>
        </div>
    </div>
</div>
<div class="login-popup" id="mail-error-popup">
    <div class="login-popup__bg"></div>
    <div class="login-popup__wrapper">
        <div class="row">
            <div class="small-12 columns">
                <div class="login-popup__close-button">
                    <i class="fa fa-times"></i>
                </div>
                <p class="login-popup__title" style="margin-bottom:0; font-size: 1.2rem;">
                    Пожалуйста, заполните все поля!
                </p>
            </div>
        </div>
    </div>
</div>
<header class="header">
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
                                <a class="menu-elem" data-anchor="#courses">Курсы</a>
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
    <section class="header__about">
        <div class="row">
            <div class="small-12 medium-7 medium-offset-5 columns end">
                <h3 class="about__title">Учиться никогда<br/> не бывает поздно</h3>
                <p class="about__text">
                    Однажды, проснувшись утром, ты задумаешься Насколько много разных вещей тебе неизвестно? В современном
                    мире наши знания - наша сила!
                    Обретай новые знания сейчас! Каждый день! Вместе с Doctrado.
                </p>
                <p class="about__reg-button">
                    <a class="reg-button" role="button">Регистрация</a>
                </p>
            </div>
        </div>
    </section>
</header>
<section class="desc" id="about">
    <div class="row">
        <div class="small-12 columns">
            <h2 class="desc__title">Кто и почему</h2>
            <p class="desc__text">
                Мы - команда из людей разных специальностей, и каждый из нас сталкивался с проблемой поиска информации, для
                улучшения своих навыков, либо же не хватало времени, чтобы
                закончить курсы и получить нужный сертификат. Сейчас мы решили создать сервис, где каждый человек, который занят
                своей работой, может не тратив свое время на лишние
                путешествия в учебные центры - быстро, легко, а главное 100% пройти нужный ему курс онлайн и получить
                государственный сертификат.
            </p>
        </div>
    </div>

</section>
<section class="pros">
    <div class="row">
        <div class="small-12 medium-4 columns">
            <div class="pros__elem">
                <img src="img/time.png" class="pros__img" alt="Быстро и удобно">
                <h3 class="pros__title">Быстро и удобно</h3>
                <p class="pros__text">
                    Региструешься, находишь нужный курс, проходишь все темы и тесты после каждой из них - получаешь
                    сертификат.
                </p>
            </div>

        </div>
        <div class="small-12 medium-4 columns">
            <div class="pros__elem">
                <img src="img/science.png" class="pros__img" alt="Командная работа">
                <h3 class="pros__title">Командная работа</h3>
                <p class="pros__text">
                    Для развития сервиса мы добавили возможность каждому, у кого есть должный опыт, стать препдавателем
                </p>
            </div>

        </div>
        <div class="small-12 medium-4 columns">
            <div class="pros__elem">
                <img src="img/work.png" class="pros__img" alt="Приступай к работе">
                <h3 class="pros__title">Приступай к работе</h3>
                <p class="pros__text">
                    Пройдя какой-либо курс, получив сертификат - Вы тут же можете приступить к роботе по полученной
                    специальности
                </p>
            </div>
        </div>
    </div>
</section>
<section class="capabilities" id="capabilities">
    <div class="row">
        <div class="small-12 columns">
            <h2 class="capabilities__title">Возможности</h2>

            <h3 class="capabilities__subtitle">Быть студентом</h3>

            <div class="row">
                <div class="small-12 medium-6 large-5 columns">
                    <div class="capabilities__img-stud" role="img" alt="Быть студентом" data-mh="student">
                        <img src="img/student.jpg" class="capabilities__img" alt="Быть студентом">
                    </div>
                </div>
                <div class="small-12 medium-5 large-5 large-offset-2 columns" data-mh="student">
                    <p class="capabilities__text">
                        Если у Вас нет времени на прохождение офф-лайн тренингов, тестирования, курсов и т.д. То
                        зарегистрировавшись у нас - Вы получите возможность поиска курсов, которые окажуться Вам нужны
                        или интересны. После их прохождения Вы сможете получить государственный сертификат, который
                        поможет Вам - сразу
                        получить более высокооплачиваемую работу
                    </p>
                    <p class="capabilities__reg-button">
                        <img src="img/student-arrow.png" class="student-arrow" alt="">
                        <a class="reg-button" role="button">Регистрация</a>
                    </p>
                </div>
            </div>

            <h3 class="capabilities__subtitle capabilities__margin-top">Быть преподавателем</h3>

            <div class="row">
                <div class="small-12 medium-6 large-5 large-offset-2 medium-push-6 large-push-5 columns">
                    <div class="capabilities__img-teach" role="img" alt="Быть студентом" data-mh="teacher">
                        <img src="img/teacher.jpg" class="capabilities__img" alt="Быть студентом">
                    </div>
                </div>
                <div class="small-12 medium-5 large-5 large-pull-7 medium-pull-7 columns" data-mh="teacher">
                    <p class="capabilities__text">
                        Если у Вас нет времени на прохождение офф-лайн тренингов, тестирования, курсов и т.д. То
                        зарегистрировавшись у нас - Вы получите возможность поиска курсов, которые окажуться Вам нужны
                        или интересны. После их прохождения Вы сможете получить государственный сертификат, который
                        поможет Вам - сразу
                        получить более высокооплачиваемую работу
                    </p>
                    <p class="capabilities__reg-button">
                        <img src="img/teacher-arrow.png" class="teacher-arrow" alt="">
                        <a class="reg-button" role="button">Регистрация</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="partners" id="partners">
    <div class="row">
        <div class="small-12 columns">
            <h2 class="partners__title">Партнеры</h2>
            <ul class="partners__slider">
                <li class="partners__elem"><img src="img/001.jpg" alt=""></li>
                <li class="partners__elem"><img src="img/002.jpg" alt=""></li>
                <li class="partners__elem"><img src="img/007.jpg" alt=""></li>
                <li class="partners__elem"><img src="img/010.jpg" alt=""></li>
                <li class="partners__elem"><img src="img/011.jpg" alt=""></li>
                <li class="partners__elem"><img src="img/slider-elem.jpg" alt=""></li>
                <li class="partners__elem"><img src="img/slider-elem.jpg" alt=""></li>
                <li class="partners__elem"><img src="img/slider-elem.jpg" alt=""></li>
                <li class="partners__elem"><img src="img/slider-elem.jpg" alt=""></li>
                <li class="partners__elem"><img src="img/slider-elem.jpg" alt=""></li>
                <li class="partners__elem"><img src="img/slider-elem.jpg" alt=""></li>
                <li class="partners__elem"><img src="img/slider-elem.jpg" alt=""></li>
                <li class="partners__elem"><img src="img/slider-elem.jpg" alt=""></li>
                <li class="partners__elem"><img src="img/slider-elem.jpg" alt=""></li>
                <li class="partners__elem"><img src="img/slider-elem.jpg" alt=""></li>
            </ul>
        </div>
    </div>
</section>
<section class="courses" id="courses">
    <div class="row">
        <div class="small-12 columns">
            <h2 class="courses__title">
                Список курсов
            </h2>
        </div>
    </div>
    <div class="row small-up-1 medium-up-3">
        <div class="column">
            <div class="courses__elem">
                <a href="/course/id64">
                    <img src="img/course.jpg" class="courses__img">
                </a>
                <h4 style="word-wrap: break-word;" class="courses__name">Охорона праці під час роботи з інструментами та пристроями</h4>
                <p class="courses__time">Время на изучение: 5 днів</p>
                <a href="course/id64" class="courses__link">Подробнее</a>
            </div>
        </div>
        <div class="column">
            <div class="courses__elem">
                <a href="/course/id63">
                    <img src="img/course.jpg" class="courses__img">
                </a>
                <h4 style="word-wrap: break-word;" class="courses__name">Охорона праці ІТР</h4>
                <p class="courses__time">Время на изучение: 5 днів</p>
                <a href="course/id63" class="courses__link">Подробнее</a>
            </div>
        </div>
        <div class="column">
            <div class="courses__elem">
                <a href="/course/id62">
                    <img src="img/course.jpg" class="courses__img">
                </a>
                <h4 style="word-wrap: break-word;" class="courses__name">Здания и сооружения. Общие требования</h4>
                <p class="courses__time">Время на изучение: 5 дней</p>
                <a href="course/id62" class="courses__link">Подробнее</a>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="small-12 columns text-center">
            <a class="more-courses-btn" href="course">Больше курсов</a>
        </div>
    </div>
</section>
<section class="contact" id="contacts">
    <div class="row">
        <div class="small-12 columns">
            <h2 class="contact__title">
                Остались вопросы?
            </h2>
        </div>
    </div>
    <div class="row">
        <div class="small-12 medium-10 medium-offset-1 end columns">
            <form id="mail-form">
                <div class="row">
                    <div class="small-12 medium-6 columns">
                        <fieldset>
                            <input name="name" type="text" class="contact-form__field" placeholder="Ваше имя">
                            <input name="surname" type="text" class="contact-form__field" placeholder="Ваша фамилия">
                            <input name="mail" type="text" class="contact-form__field" placeholder="Ваш e-mail">
                            <input name="phone" type="text" class="contact-form__field" placeholder="Ваш телефон">
                        </fieldset>
                    </div>
                    <div class="small-12 medium-6 columns">
                        <fieldset>
                            <textarea name="message" class="contact-form__field contact-form__message" placeholder="Текст сообщения"></textarea>
                            <input type="submit" class="contact-form__button" value="Отправить">
                        </fieldset>
                    </div>
                </div>
            </form>
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
                <img src="img/elegance.png" class="elegance-logo" alt="">
            </a>
        </div>
    </div>
</footer>

<script src="js/jquery.min.js"></script>
<script src="js/foundation.min.js"></script>
<script src="js/jquery.matchHeight-min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/app.js"></script>

</body>
</html>