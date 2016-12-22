<%--
  Created by IntelliJ IDEA.
  User: NSD
  Date: 16.12.16
  Time: 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
    <title>Doctrado</title>
    <!-- CSS  -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="../css/materialize.min.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="../css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>

    <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>


    <script src="../js/materialize.min.js"></script>


    <script>

        $(document).ready(function(){
            // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
            $('.modal-trigger').modal();
        });

    </script>


</head>
<body>


<div class="row section">
<div class="col">
    <!-- Modal Trigger -->
    <a class="waves-effect waves-light btn modal-trigger" href="#modal1">Modal</a>
    <p>You have to include jQuery and Materialize JS + CSS for the modal to work. You can include it from <a href="http://materializecss.com/getting-started.html">CDN (getting started)</a>.
</div>
</div>
<!-- Modal Structure -->
<div id="modal1" class="modal">
    <div class="modal-content">
        <h4>Modal Header</h4>
        <p>A bunch of text</p>
    </div>
    <div class="modal-footer">
        <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Agree</a>
    </div>
</div>

<nav class="white" role="navigation">
    <div class="nav-wrapper container">

        <a id="logo-container" href="#" class="brand-logo "><img src="../img/favicon.ico"></a>

        <ul class="right hide-on-med-and-down">

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

        <ul id="nav-mobile" class="side-nav">
            <li><a href="#">Navbar Link</a></li>
        </ul>
        <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
    </div>
</nav>

<div id="index-banner" class="parallax-container">
    <div class="section no-pad-bot">
        <div class="container">
            <br><br>
            <h1 class="header center black-text">Doctrado</h1>
            <div class="row center">
                <h5 class="header col s12 light grey-text darken-4">Обретай новые знания сейчас! Каждый день! Вместе с Doctrado.</h5>
            </div>
            <div class="row center">
                <a href="http://materializecss.com/getting-started.html" id="download-button" class="btn-large waves-effect waves-light grey darken-3">Приступить к работе</a>
            </div>
            <br><br>

        </div>
    </div>
    <div class="parallax"><img src="../img/background.jpg" alt="Unsplashed background img 1"></div>
</div>


<div class="container" style="{height: 160px; }">
    <div class="section">

        <!--   Icon Section   -->
        <div class="row">
            <div class="col s12 m4">
                <div class="icon-block">
                    <h2 class="center black-text"><i class="material-icons">schedule</i></h2>
                    <h4 class="center">Быстро и удобно</h4>

                    <p class="light center-align">Региструешься, находишь нужный курс, проходишь все темы и тесты после каждой из них - получаешь сертификат</p>
                </div>
            </div>

            <div class="col s12 m4">
                <div class="icon-block">
                    <h2 class="center black-text"><i class="material-icons">group_work</i></h2>
                    <h4 class="center">Командная работа</h4>
                    <p class="light center-align">Для развития сервиса мы добавили возможность каждому, у кого есть должный опыт, стать преподавателем</p>
                </div>
            </div>

            <div class="col s12 m4">
                <div class="icon-block">
                    <h2 class="center black-text"><i class="material-icons">work</i></h2>
                    <h4 class="center">Приступай к работе</h4>

                    <p class="light center-align">Пройдя какой-либо курс, получив сертификат - Вы тут же можете приступить к роботе по полученной специальности </p>
                </div>
            </div>
        </div>

    </div>
</div>


<div class="parallax-container valign-wrapper">
    <div class="section no-pad-bot">
        <div class="container">
            <div class="row center">
                <h4 class="header col s12 light black-text">КТО И ПОЧЕМУ</h4>
            </div>
        </div>
    </div>
    <div class="parallax"><img src="../img/background.jpg" alt="Unsplashed background img 2"></div>
</div>

<div class="container">
    <div class="section">

        <div class="row">
            <div class="col s12 center">
                <h3><i class="mdi-content-send brown-text"></i></h3>

                <p class="left-align light">Мы - команда из людей разных специальностей, и каждый из нас сталкивался с проблемой поиска информации, для улучшения своих навыков, либо же не хватало времени, чтобы закончить курсы и получить нужный сертификат. Сейчас мы решили создать сервис, где каждый человек, который занят своей работой, может не тратив свое время на лишние путешествия в учебные центры - быстро, легко, а главное 100% пройти нужный ему курс онлайн и получить государственный сертификат.</p>
            </div>
        </div>

    </div>
</div>


<div class="parallax-container valign-wrapper">
    <div class="section no-pad-bot">
        <div class="container">
            <div class="row center">
                <h4 class="header col s12 black-text light">ВОЗМОЖНОСТИ</h4>
            </div>
        </div>
    </div>
    <div class="parallax"><img src="../img/background.jpg" alt="Unsplashed background img 3"></div>
</div>

<div class="container">
    <div class="section">

        <div class="row">
            <div class="col s12 m6 center">
                <h3><i class="mdi-content-send brown-text"></i></h3>
                <h5>БЫТЬ СТУДЕНТОМ</h5>
            </div>
            <div class="col s12 m6 center">
                <h3><i class="mdi-content-send brown-text"></i></h3>
                <h5>БЫТЬ ПРЕПОДАВАТЕЛЕМ</h5>
            </div>
        </div>
        <div class="row">
            <div class="col s12 center-align">
                <h3><i class="mdi-content-send brown-text"></i></h3>
                <p class="light center-align">Если у Вас нет времени на прохождение офф-лайн тренингов, тестирования, курсов и т.д. То зарегистрировавшись у нас - Вы получите возможность поиска курсов, которые окажуться Вам нужны или интересны. После их прохождения Вы сможете получить государственный сертификат, который поможет Вам - сразу получить более высокооплачиваемую работу</p>
                <a class="waves-effect waves-light btn-large black white-text" href="#modal1">Регистрация</a>
            </div>
        </div>

    </div>
</div>





<footer class="page-footer center-align grey darken-4 white-text">
    <div class="container">
        <div class="footer-copyright">
            <div class="container">Doctrado © 2016</div>
        </div>
    </div>
</footer>











</body>
</html>
