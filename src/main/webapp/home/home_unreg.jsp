<%--
  Created by IntelliJ IDEA.
  User: NSD
  Date: 16.12.16
  Time: 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ru">



<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
    <title>Doctrado</title>
    <!-- CSS  -->
    <link href="../NSDcss/modal_dialog.css" rel="stylesheet">
    <meta charset="utf-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="csrf-token" content="Wx6PFl4mn9yqYIFxDmcvdgOH6tNtWn3dVOktVC7V">
    <title>Doctrado</title>

    <link rel="shortcut icon" href="https://doctrado.me/img/favicon.ico">
    <link rel="stylesheet" href="../NSDcss/login.css">
    <style type="text/css">
        .parallax-container {
            height: 400px;
        }

    </style>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="../css/materialize.min.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="../css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
</head>
<body>

<!-- Вперед к работе -->
<div id="overlay"></div><!-- Пoдлoжкa -->
<div id="modal_form">
    <span id="modal_close">X</span> <!-- Кнoпкa зaкрыть -->
    <div class="container">
                <div class="card"></div>
                <div class="card">
                    <h1 class="title">Вход</h1>
                    <form>
                        <div class="input-container">
                            <input type="email" id="loginIN" required="required"/>
                            <label for="loginIN">Ваш e-mail</label>
                            <div class="bar"></div>
                        </div>
                        <div class="input-container">
                            <input type="password" id="passwordL" required="required"/>
                            <label for="passwordL">Ваш Пароль</label>
                            <div class="bar"></div>
                        </div>
                        <div class="button-container">
                            <button ><span>Войти</span></button>
                        </div>
                        <div class="footer"><a href="#">Забыли пароль?</a></div>
                    </form>
                </div>
                <div class="card alt">
                    <div class="toggle"></div>
                    <h1 class="title">Регистрация
                        <div class="close"></div>
                    </h1>
                    <form>
                        <div class="input-container">
                            <input type="text" id="unameReg" required="required"/>
                            <label for="unameReg">Вас зовут</label>
                            <div class="bar"></div>
                        </div>
                        <div class="input-container">
                            <input type="password" id="passwordReg" required="required"/>
                            <label for="passwordReg">Ваш e-mail</label>
                            <div class="bar"></div>
                        </div>
                        <div class="input-container">
                            <input type="password" id="passwordRegRepeat" required="required"/>
                            <label for="passwordRegRepeat">Ваш пароль</label>
                            <div class="bar"></div>
                        </div>
                        <div class="button-container">
                            <button><span>Далее</span></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

</div>

    <!----------->
<div id="modal2" class="modal">
    <div class="modal-content">
        <h4 class="hide" >Регистрация</h4>
        <div class="row">
            <div class="form">
                <div class="row">
                    <div class="input-field col s6">
                        <input id="nameR" type="text" class="validate">
                        <label for="nameR" data-error="некорректный e-mail">Ваше имя</label>
                    </div>
                    <div class="input-field col s6">
                        <input id="last_nameR" type="text" class="validate">
                        <label for="last_nameR" data-error="некорректный e-mail">Ваше отчество</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <input id="surnameR" type="text" class="validate">
                        <label for="surnameR" data-error="некорректный e-mail">Ваша фамилия</label>
                    </div>
                    <div class="input-field col s6">
                        <input id="emailR" type="email" class="validate">
                        <label for="emailR" data-error="некорректный e-mail">Ваш email</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <input id="passwordR" type="password"  class="validate">
                        <label for="passwordR" data-error="некорректный e-mail">Ваш пароль</label>
                    </div>
                    <div class="input-field col s6">
                        <input id="telephone" type="tel" class="validate">
                        <label for="telephone" data-error="некорректный e-mail">Ваш телефон</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <p>Дата рождения</p>
                        <input id="born" type="date" placeholder="Дата рождения" class="validate">
                        <label for="born" data-error="некорректный e-mail"></label>
                    </div>

                    <p class="col s12 center-align">
                        <input type="checkbox" id="test5" />
                        <label for="test5">Я согласен с условиями предоставления услуг</label>
                    </p>
                </div>
                <div class="row">

                    <div class="col s4 left-align">
                        <a href="#!" class=" modal-action modal-close waves-effect btn waves-green">Отмена</a>
                    </div>

                    <div class="col s4 center-align">
                        <button class="btn waves-effect waves-light" type="submit" name="action">Я студент</button>
                    </div>
                    <div class="col s4 center-align">
                        <button class="btn waves-effect waves-light" type="submit" name="action">Я преподаватель</button>
                    </div>


                </div>

            </div>
        </div>





    </div>
    <div class="modal-footer hide">
        <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Agree</a>
    </div>
    </div>
</div>

<div id="modal3" class="modal">
    <div class="modal-content">
        <h4 class="center-align">Вход</h4>
        <div class="row">
            <h5 class="center-align black-text" ></h5>
            <form class="col s12">
                <div class="row">
                    <div class="input-field col s12">
                        <input id="email1" type="email" data-error="некорректный e-mail" class="validate">
                        <label for="email">e-mail</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input id="password1" type="password" class="validate">
                        <label for="password">Пароль</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col s3 left-align">
                        <a href="#!" class=" modal-action modal-close waves-effect btn waves-green">Отмена</a>
                    </div>
                    <div class="col s9 center-align">
                        <button class="btn waves-effect waves-light" type="submit" name="action">Войти
                            <i class="material-icons right">send</i>
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="modal-footer hide">
        <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Agree</a>
    </div>
</div>

<nav class="white" role="navigation">
    <div class="nav-wrapper container">

        <a id="logo-container" href="#" class="brand-logo "><img src="../img/favicon.ico"></a>

        <ul class="right hide-on-med-and-down">

            <li><a class="waves-effect waves-light black modal-trigger white-text" href="#modal3">Вход</a></li>
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
<br>
<div class="parallax-container valign-wrapper col s12">
    <div class="section no-pad-bot">
        <div class="container">

            <h1 class="header center black-text">Doctrado</h1>
            <div class="row center">
                <h5 class="header col s12 light grey-text darken-4">Обретай новые знания сейчас! Каждый день! Вместе с Doctrado.</h5>
            </div>
            <div class="row center">
                <a id="go" class="btn-large modal-trigger waves-effect waves-light grey darken-3">Приступить к работе</a>
            </div>


        </div>
    </div>
    <div class="parallax "><img src="../img/background.jpg" alt="Unsplashed background img 1"></div>
</div>


<div class="container" style="{height: 160px; }">
    <div class="section">

        <!--   Icon Section   -->
        <div class="row">
            <div class="col s12 m4">
                <div class="icon-block">
                    <h2 class="center black-text"><i class="material-icons">schedule</i></h2>
                    <h5 class="center">Быстро и удобно</h5>

                    <p class="light center-align">Региструешься, находишь нужный курс, проходишь все темы и тесты после каждой из них - получаешь сертификат</p>
                </div>
            </div>

            <div class="col s12 m4">
                <div class="icon-block">
                    <h2 class="center black-text"><i class="material-icons">group_work</i></h2>
                    <h5 class="center">Командная работа</h5>
                    <p class="light center-align">Для развития сервиса мы добавили возможность каждому, у кого есть должный опыт, стать преподавателем</p>
                </div>
            </div>

            <div class="col s12 m4">
                <div class="icon-block">
                    <h2 class="center black-text"><i class="material-icons">work</i></h2>
                    <h5 class="center">Приступай к работе</h5>

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
                <a class="waves-effect waves-light modal-trigger btn-large black white-text" href="#modal2">Регистрация</a>
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










<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="../js/materialize.min.js"></script>
<script type="application/javascript" >
    $('.toggle').on('click', function() {
        $('.container').stop().addClass('active');
    });

    $('.close').on('click', function() {
        $('.container').stop().removeClass('active');
    });
</script>

<script>
    $(document).ready(function(){
        // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
        $('.modal').modal();

    });
    $(document).ready(function () {
        $('.parallax').parallax();
    });



    $(document).ready(function() { // вся мaгия пoсле зaгрузки стрaницы
        $('a#go').click( function(event){ // лoвим клик пo ссылки с id="go"
            event.preventDefault(); // выключaем стaндaртную рoль элементa
            $('#overlay').fadeIn(400, // снaчaлa плaвнo пoкaзывaем темную пoдлoжку
                function(){ // пoсле выпoлнения предъидущей aнимaции
                    $('#modal_form')
                        .css('display', 'block') // убирaем у мoдaльнoгo oкнa display: none;
                        .animate({opacity: 1, top: '50%'}, 200); // плaвнo прибaвляем прoзрaчнoсть oднoвременнo сo съезжaнием вниз
                });
        });
        /* Зaкрытие мoдaльнoгo oкнa, тут делaем тo же сaмoе нo в oбрaтнoм пoрядке */
        $('#modal_close, #overlay').click( function(){ // лoвим клик пo крестику или пoдлoжке
            $('#modal_form')
                .animate({opacity: 0, top: '45%'}, 200,  // плaвнo меняем прoзрaчнoсть нa 0 и oднoвременнo двигaем oкнo вверх
                    function(){ // пoсле aнимaции
                        $(this).css('display', 'none'); // делaем ему display: none;
                        $('#overlay').fadeOut(400); // скрывaем пoдлoжку
                    }
                );
        });
    });
  
</script>

</body>
</html>
