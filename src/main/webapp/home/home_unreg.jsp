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

        #progress {
            width: 200px;
            height: 200px;
        }

    </style>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="../css/materialize.min.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="../css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
</head>
<body>

<!-- Вперед к работе -->
<div id="modal1" class="modal">
    <div class="modal-content" style="
       .input-field label {
     color: #000;
   }
   /* label focus color */
   .input-field input[type=text]:focus + label {
     color: #000;
   }
   /* label underline focus color */
   .input-field input[type=text]:focus {
     border-bottom: 1px solid #000;
     box-shadow: 0 1px 0 0 #000;
   }
   /* valid color */
   .input-field input[type=text].valid {
     border-bottom: 1px solid #65ae00;
     box-shadow: 0 1px 0 0 #000;
   }
   /* invalid color */
   .input-field input[type=text].invalid {
     border-bottom: 1px solid #c60000;
     box-shadow: 0 1px 0 0 #000;
   }
   /* icon prefix focus color */
   .input-field .prefix.active {
     color: #000;
   }
" >
        <h4 class="center-align">Вперед к работе</h4>
        <div class="row">
            <div class="col s12 black-text ">
                <ul class="tabs black-text">
                    <li class="tab col s6" ><a href="#test1">Вход</a></li>
                    <li class="tab col s6"><a class="active" href="#test2">Регистрация</a></li>
                </ul>
            </div>
            <!-- Вперед к работе - > Регистрация --------------------------------->
            <div id="test1" class="col s12">
                <div class="row">
                    <h5 class="center-align black-text" ></h5>
                    <form class="col s12" name="login-form1" id="login-form1" method="post" action="javascript:void(null);" onsubmit="call1()">
                        <div class="row">
                            <div class="input-field col s12">
                                <input id="email" type="email" class="validate">
                                <label for="email" data-error="некорректный e-mail">e-mail</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <input id="password" type="password" class="validate">
                                <label for="password"  >Пароль</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s3 left-align">
                                <a href="#!" class=" modal-action modal-close waves-effect btn waves-green">Отмена</a>
                            </div>
                            <div class="col s9 center-align">
                                <button class="btn waves-effect waves-light" type="submit" value="Войти" >Войти
                                    <i class="material-icons right">send</i>
                                </button>
                            </div>
                         </div>
                    </form>
                </div>
            </div>
            <!----- Вперед к работе -> регистрация --------------->
            <div id="test2" class="col s12">
                <div class="row">
                    <form class="form" type="post" name="reg-form1" id="reg-form1" action="javascript:void(null);">
                        <div class="row">
                            <div class="input-field col s6">
                                <input id="nameR1" type="text" class="validate">
                                <label for="nameR1" data-error="некорректный e-mail">Ваше имя</label>
                            </div>
                            <div class="input-field col s6">
                                <input id="last_nameR1" type="text" class="validate">
                                <label for="last_nameR1" data-error="некорректный e-mail">Ваше отчество</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s6">
                                <input id="surnameR1" type="text" class="validate">
                                <label for="surnameR1" data-error="некорректный e-mail">Ваша фамилия</label>
                            </div>
                            <div class="input-field col s6">
                                <input id="emailR1" type="email" class="validate">
                                <label for="emailR1" data-error="некорректный e-mail">Ваш email</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s6">
                                <input id="passwordR1" type="password"  class="validate">
                                <label for="passwordR1" data-error="некорректный e-mail">Ваш пароль</label>
                            </div>
                            <div class="input-field col s6">
                                <input id="telephone1" type="tel" class="validate">
                                <label for="telephone1" data-error="некорректный e-mail">Ваш телефон</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <p>Дата рождения</p>
                                <input id="born1" type="date" placeholder="Дата рождения" class="validate">
                                <label for="born1" data-error="некорректный e-mail"></label>
                            </div>
                            <p class="col s12 center-align">
                                <input type="checkbox" id="test51" />
                                <label for="test51">Я согласен с условиями предоставления услуг</label>
                            </p>
                        </div>
                        <div class="row">
                            <div class="col s3 left-align">
                                <a href="#!" class=" modal-action modal-close waves-effect btn waves-green">Отмена</a>
                            </div>
                            <div class="col s4 center-align">
                                <button class="btn waves-effect waves-light" type="submit" value="s" onclick="callReg1(this.value)">Я студент</button>
                            </div>
                            <div class="col s5 center-align">
                                <button class="btn waves-effect waves-light" type="submit" value="t"  onclick="callReg1(this.value)">Я преподаватель</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer hide">
                <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Agree</a>
            </div>
        </div>
    </div></div>


<div id="modal4" class="modal">


    modal 4


</div>

    <!----------->
<div id="modal2" class="modal">
    <div class="modal-content">
        <h4 class="center-align col s12" >Регистрация</h4>
        <div class="row">
            <div class="form" type="post" name="reg-form" id="reg-form" action="javascript:void(null);">
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

                    <div class="col s3 left-align">
                        <a href="#!" class=" modal-action modal-close waves-effect btn waves-green">Отмена</a>
                    </div>

                    <div class="col s4 center-align">
                        <button class="btn waves-effect waves-light" type="submit" value="s" onclick="callReg(this.value)">Я студент</button>
                    </div>
                    <div class="col s5 center-align">
                        <button class="btn waves-effect waves-light" type="submit" value="t" onclick="callReg(this.value)" >Я преподаватель</button>
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
   <!-- <div id="progress" class="center center-block"></div>-->
    <div class="modal-content">
        <h4 class="center-align">Вход</h4>
        <div class="row">
            <h5 class="center-align black-text" ></h5>
            <form class="col s12" name="login-form" id="login-form" method="post" action="javascript:void(null);" onsubmit="call()">
                <div class="row">
                    <div class="input-field col s12">
                        <input id="email1" type="email" data-error="некорректный e-mail" class="validate">
                        <label for="email1">e-mail</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input id="password1" type="password" class="validate">
                        <label for="password1">Пароль</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col s3 left-align">
                        <a href="#!" class=" modal-action modal-close waves-effect btn waves-green">Отмена</a>
                    </div>
                    <div class="col s9 center-align">
                        <button class="btn waves-effect waves-light" type="submit" name="signIn">Войти
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
<div class="navbar-fixed">
<nav class="white darken-4 grey-text text-darken-4" role="navigation">
    <div class="nav-wrapper container">

        <a id="logo-container" href="#" class="brand-logo "><img src="../img/favicon.ico"></a>

        <ul class="right hide-on-med-and-down">

            <!--<li><a class="waves-effect waves-light black modal-trigger white-text" href="#modal3">Вход</a></li>-->
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
                <a class="menu-elem" data-anchor="#courses">Курсы</a>
            </li>
            <li>
                <a class="menu-elem" data-anchor="#contacts">Контакты</a>
            </li>
            <li><a href="#modal2" class="menu-elem modal-trigger waves-effect waves-light btn white-text green darken-3" >Регистрация</a></li>
            <li><a href="#modal3" class="menu-elem modal-trigger waves-effect waves-light orange btn white-text darken-3" >Вход</a></li>


        </ul>

        <ul id="nav-mobile" class="side-nav">
            <li><a href="#">Navbar Link</a></li>
        </ul>
        <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
    </div>
</nav>
</div>
<br>
<div class="parallax-container valign-wrapper col s12">
    <div class="section no-pad-bot">
        <div class="container">

            <h1 class="header center black-text">Doctrado</h1>
            <div class="row center">
                <h5 class="header col s12 light grey-text darken-4">Обретай новые знания сейчас! Каждый день! Вместе с Doctrado.</h5>
            </div>
            <div class="row center">
                <a href="#modal1" id="download-button" class="btn-large modal-trigger waves-effect waves-light grey darken-3">Приступить к работе</a>
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

<div id="progress_bar" class="modal">
    <div style="background: transparent">
        <div class="preloader-wrapper big active">
            <div class="spinner-layer spinner-blue">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div><div class="gap-patch">
                <div class="circle"></div>
            </div><div class="circle-clipper right">
                <div class="circle"></div>
            </div>
            </div>

            <div class="spinner-layer spinner-red">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div><div class="gap-patch">
                <div class="circle"></div>
            </div><div class="circle-clipper right">
                <div class="circle"></div>
            </div>
            </div>

            <div class="spinner-layer spinner-yellow">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div><div class="gap-patch">
                <div class="circle"></div>
            </div><div class="circle-clipper right">
                <div class="circle"></div>
            </div>
            </div>

            <div class="spinner-layer spinner-green">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div><div class="gap-patch">
                <div class="circle"></div>
            </div><div class="circle-clipper right">
                <div class="circle"></div>
            </div>
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



    function call() {

       //$('#progress_bar').modal('open');


      //  bar.animate(1.0);
        var email = document.getElementById('email1').value;
        var password = document.getElementById('password1').value;
        var errors = false;
        var errEmail = false;
        var errPass = false;
        if (email == "") {
            //Materialize.toast('Введите ваш email',4000,'rounded');
            errEmail = true;
            errors = true;

        }

        if (password == "") {
            //Materialize.toast('Введите ваш пароль',4000,'rounded');
            errPass = true;
            errors = true;
        }
        if(errEmail&&errPass){
            Materialize.toast('<div class="red-text text-darken-3"><b> Введите ваш email <br> и пароль </b></div>',4000,'rounded');
    //       bar.hide();
            return;
        }
        if(errEmail){
            Materialize.toast('<div class="red-text text-darken-3"><b> Введите ваш email </b></div>',4000,'rounded');
        }
        if(errPass){
            Materialize.toast('<div class="red-text text-darken-3"><b>Введите ваш пароль</b></div>',4000,'rounded');
        }

        if (errors) {
  //          bar.hide();
            return;}
        $.ajax({
            type: 'post',
            url: 'https://doctrado-sviasy.rhcloud.com/login',
            data: {
                email: email,
                password:password
            },
            success: function(data) {
                if (data==-1){ Materialize.toast('<div class="red-text text-darken-3"><b>Неверный логин <br> или пароль</b></div>',4000,'rounded');
                    bar.hide();
                }
                else window.location.href = "https://doctrado-sviasy.rhcloud.com/profile";
            }
        });
    };

    function call1() {
//        $('#progress_bar').modal('open');
        var email = document.getElementById('email').value;
        var password = document.getElementById('password').value;
        var errors = false;
        var errEmail = false;
        var errPass = false;
        if (email == "") {
            //Materialize.toast('Введите ваш email',4000,'rounded');
            errEmail = true;
            errors = true;

        }

        if (password == "") {
            //Materialize.toast('Введите ваш пароль',4000,'rounded');
            errPass = true;
            errors = true;
        }
        if(errEmail&&errPass){
            Materialize.toast('<div class="red-text text-darken-3"><b> Введите ваш email <br> и пароль </b></div>',4000,'rounded');
  //          $('#progress_bar').modal('close');
            return;
        }
        if(errEmail){
            Materialize.toast('<div class="red-text text-darken-3"><b> Введите ваш email </b></div>',4000,'rounded');
        }
        if(errPass){
            Materialize.toast('<div class="red-text text-darken-3"><b>Введите ваш пароль</b></div>',4000,'rounded');
        }

        if (errors) {
//            $('#progress_bar').modal('close');
            return;}
        $.ajax({
            type: 'post',
            url: 'https://doctrado-sviasy.rhcloud.com/login',
            data: {
                email: email,
                password:password
            },
            success: function(data) {
                if (data==-1){ Materialize.toast('<div class="red-text text-darken-3"><b>Неверный логин <br> или пароль</b></div>',4000,'rounded');
                  //  $('#progress_bar').modal('close');
                }
                else window.location.href = "https://doctrado-sviasy.rhcloud.com/profile";
            }
        });
    }

    function callReg1(accept) {
        var nameR = document.getElementById('nameR1').value;
        var last_nameR = document.getElementById('last_nameR1').value;
        var surnameR = document.getElementById('surnameR1').value;
        var emailR = document.getElementById('emailR1').value;
        var passwordR = document.getElementById('passwordR1').value;
        var telephone = document.getElementById('telephone1').value;
        var born = document.getElementById('born1').value;
        var test5 = document.getElementById('test51').value;

        var error = false;

        var nameREr = false;
        var last_nameREr = false;
        var surnameREr = false;
        var emailREr = false;
        var passwordREr = false;
        var telephoneEr = false;
        var bornEr = false;
        var testEr = false;

        if(nameR==""){
            error = true;
            nameREr = true;
        }
        if(last_nameR==""){
            error = true;
            last_nameREr = true;
        }
        if(surnameR==""){
            error = true;
            surnameREr = true;
        }
        if(emailR==""){
            error = true;
            emailREr = true;
        }
        if(passwordR==""){
            error = true;
            passwordREr = true;
        }
        if(telephone==""){
            error = true;
            telephoneEr = true;
        }
        if(born==""){
            error = true;
            bornEr = true;
        }
        if(test5==""){
            error = true;
            testEr = true;
        }

        if(error){
            if(nameREr||last_nameREr||surnameREr||emailREr||passwordREr||telephoneEr||bornEr||testEr){
                Materialize.toast('<div class="red-text text-darken-3"><b>Заполните все поля</b></div>',4000,'rounded');

                return;
            }
        }
        $.ajax({
            type: 'post',
            url: 'https://doctrado-sviasy.rhcloud.com/validate_user',
            data: {
                email: emailR,
                password:passwordR,
                name:nameR,
                last_name:last_nameR,
                surname:surnameR,
                telephone:telephone,
                born:born,
                type:accept
            },
            success: function(data) {
                if (data==0){    $('#modal3').modal('close');
                    $('#modal1').modal('close');
                    $('#modal2').modal('close');

                    $('#modal4').modal('open');
                }

            }
        });


    }


    function callReg(accept) {
        var nameR = document.getElementById('nameR').value;
        var last_nameR = document.getElementById('last_nameR').value;
        var surnameR = document.getElementById('surnameR').value;
        var emailR = document.getElementById('emailR').value;
        var passwordR = document.getElementById('passwordR').value;
        var telephone = document.getElementById('telephone').value;
        var born = document.getElementById('born').value;
        var test5 = document.getElementById('test5').value;


        var error = false;

        var nameREr = false;
        var last_nameREr = false;
        var surnameREr = false;
        var emailREr = false;
        var passwordREr = false;
        var telephoneEr = false;
        var bornEr = false;
        var testEr = false;

        if(nameR==""){
            error = true;
            nameREr = true;
        }
        if(last_nameR==""){
            error = true;
            last_nameREr = true;
        }
        if(surnameR==""){
            error = true;
            surnameREr = true;
        }
        if(emailR==""){
            error = true;
            emailREr = true;
        }
        if(passwordR==""){
            error = true;
            passwordREr = true;
        }
        if(telephone==""){
            error = true;
            telephoneEr = true;
        }
        if(born==""){
            error = true;
            bornEr = true;
        }
        if(test5==""){
            error = true;
            testEr = true;
        }

        if(error){
            if(nameREr||last_nameREr||surnameREr||emailREr||passwordREr||telephoneEr||bornEr||testEr){
                Materialize.toast('<div class="red-text text-darken-3"><b>Заполните все поля</b></div>',4000,'rounded');
                return;
            }
        }
        $.ajax({
            type: 'post',
            url: 'https://doctrado-sviasy.rhcloud.com/validate_user',
            data: {
                email: emailR,
                password:passwordR,
                name:nameR,
                last_name:last_nameR,
                surname:surnameR,
                telephone:telephone,
                born:born,
                type:accept
            },
            success: function(data) {
                if (data==0){
                    $('#modal3').modal('close');
                    $('#modal1').modal('close');
                    $('#modal2').modal('close');

                    $('#modal4').modal('open');

                    //  $('#progress_bar').modal('close');
                }

            }
        });
    }
</script>

<script>
    $(document).ready(function(){
        // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
        $('.modal').modal();

    });
    $(document).ready(function () {
        $('.parallax').parallax();
    });


  
</script>
</body>
</html>
