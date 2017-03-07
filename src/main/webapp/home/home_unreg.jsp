<%@ page import="NSD.NSDConstants" %><%--
  Created by IntelliJ IDEA.
  User: NSD
  Date: 16.12.16
  Time: 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ru">

<% String token = ""; %>
<head>
    <meta name="google-site-verification" content="ZWWdaYwb-E3JvxMSiXcCDveaghrcK6aBBCohc9KAV_g" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
    <title>Doctrado</title>
    <!-- CSS  -->
    <meta name="yandex-verification" content="eb0417ab5cfa9ad9"/>
    <meta charset="utf-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="csrf-token" content="Wx6PFl4mn9yqYIFxDmcvdgOH6tNtWn3dVOktVC7V">
    <title>Doctrado</title>


    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="shortcut icon" href="https://doctrado-sviasy.rhcloud.com/img/favicon.ico">
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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/js/materialize.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="../css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <script charset="UTF-8"
            src="//cdn.sendpulse.com/28edd3380a1c17cf65b137fe96516659/js/push/819b89976985b49b08b2d06dbbf60964_1.js"
            async></script>
    <script type="text/javascript">
        document.ondragstart = noselect;
        // запрет на перетаскивание
        document.onselectstart = noselect;
        // запрет на выделение элементов страницы
        document.oncontextmenu = noselect;
        // запрет на выведение контекстного меню
        function noselect() {
            return false;
        }
    </script>
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
">
        <h4 class="center-align">Вперед к работе</h4>
        <div class="row">
            <div class="col s12 black-text ">
                <ul class="tabs black-text">
                    <li class="tab col s6"><a href="#test1">Вход</a></li>
                    <li class="tab col s6"><a class="active" href="#test2">Регистрация</a></li>
                </ul>
            </div>
            <!-- Вперед к работе - > Регистрация --------------------------------->
            <div id="test1" class="col s12">
                <div class="row">
                    <h5 class="center-align black-text"></h5>
                    <form class="col s12" name="login-form1" id="login-form1" method="post"
                          action="javascript:void(null);" onsubmit="call1()">
                        <div class="row">
                            <div class="input-field col s12">
                                <input id="email" type="email" class="validate">
                                <label for="email" data-error="некорректный e-mail">e-mail</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <input id="password" type="password" class="validate">
                                <label for="password">Пароль</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s3 left-align">
                                <a href="#!" class=" modal-action modal-close waves-effect btn waves-green">Отмена</a>
                            </div>
                            <div class="col s9 center-align">
                                <button class="btn waves-effect waves-light" type="submit" value="Войти">Войти
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
                                <input id="passwordR1" type="password" class="validate">
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
                                <input type="checkbox" id="test51"/>
                                <label for="test51">Я согласен с условиями предоставления услуг</label>
                            </p>
                        </div>
                        <div class="row">
                            <div class="col s3 left-align">
                                <a href="#!" class=" modal-action modal-close waves-effect btn waves-green">Отмена</a>
                            </div>
                            <div class="col s4 center-align">
                                <button class="btn waves-effect waves-light" type="submit" value="s"
                                        onclick="callReg1(this.value)">Я студент
                                </button>
                            </div>
                            <div class="col s5 center-align">
                                <button class="btn waves-effect waves-light" type="submit" value="t"
                                        onclick="callReg1(this.value)">Я преподаватель
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
    </div>
</div>

<div id="modal4" class="modal">
    <div class="modal-content">
        <div class="row">
            <h6 class="center-align center col s12">Ваш аватар для сайта</h6>
        </div>

        <button style="position: relative;
                       background: #ffffff;
                       background-color: #ffffff;
                       width: 100%;
                       max-width: 220px;
                       height: 220px;
                       display: block;
                       border: none;
                       margin: 0 auto;"
                type="button"
                onclick="uploadPhoto()">


            <img class="responsive-img circle" src="/img/camera.png" id="avatar-img">

        </button>
        <input accept="image/*" style="display: none;" id="avatar-input" type="file">


        <div class="row col s12">


            <a class="center center-align col s12 waves-effect waves-light btn" onclick="finishReqS()">Зарегестрироваться</a>


        </div>

    </div>


</div>

<div id="modal5" class="modal">


    <div class="modal-content">


        <div class="row col s12">
            <h6 class="center-align center col s12">Ваш аватар для сайта</h6>
        </div>
        <button style="position: relative;
                       background: #ffffff;
                       background-color: #ffffff;
                       width: 100%;
                       max-width: 220px;
                       height: 220px;
                       display: block;
                       border: none;
                       margin: 0 auto;"
                type="button"
                onclick="uploadPhotoA()">


            <img class="responsive-img circle" src="/img/camera.png" id="avatar-imgA">

        </button>
        <input accept="image/*" style="display: none;" id="avatar-inputA" type="file">
        <div class="input-field col s12">
            <input id="teacher_ex" type="text" class="validate">
            <label for="teacher_ex" data-error="">Преподавательский опыт</label>
        </div>
        <div class="row">
            <h6 class="col s12 center-align center"> Подтверждающие документы </h6>
        </div>
        <div class="file-field input-field">
            <div class="btn">
                <span>Обзор</span>
                <input id="conf_doc" type="file">
            </div>
            <div class="file-path-wrapper">
                <input class="file-path validate" type="text">
            </div>
        </div>


        <a class="center center-align col s12 waves-effect waves-light btn"
           onclick="finishReqT()">Зарегестрироваться</a>
    </div>
</div>

    <!----------->
<div id="modal2" class="modal">
    <div class="modal-content">
        <h4 class="center-align col s12">Регистрация</h4>
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
                        <input id="passwordR" type="password" class="validate">
                        <label for="passwordR" data-error="некорректный e-mail">Ваш пароль</label>
                    </div>
                    <div class="input-field col s6">
                        <input id="telephone" type="tel" class="validate">
                        <label for="telephone" data-error="некорректный e-mail">Ваш телефон</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">

                        <input id="born" type="date" placeholder="Дата рождения" class="validate datepicker">
                        <label for="born" data-error="некорректный e-mail">Дата рождения</label>
                    </div>

                    <p class="col s12 center-align">
                        <input type="checkbox" id="test5"/>
                        <label for="test5">Я согласен с условиями предоставления услуг</label>
                    </p>
                </div>
                <div class="row">

                    <div class="col s3 left-align">
                        <a href="#!" class=" modal-action modal-close waves-effect btn waves-green">Отмена</a>
                    </div>

                    <div class="col s4 center-align">
                        <button class="btn waves-effect waves-light" type="submit" value="s"
                                onclick="callReg(this.value)">Я студент
                        </button>
                    </div>
                    <div class="col s5 center-align">
                        <button class="btn waves-effect waves-light" type="submit" value="t"
                                onclick="callReg(this.value)">Я преподаватель
                        </button>
                    </div>


                </div>

            </div>
        </div>


    </div>
    <div class="modal-footer hide">
        <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Agree</a>
    </div>
</div>


<div id="modal3" class="modal">
    <!-- <div id="progress" class="center center-block"></div>-->
    <div class="modal-content">
        <h4 class="center-align">Вход</h4>
        <div class="row">
            <h5 class="center-align black-text"></h5>
            <form class="col s12" name="login-form" id="login-form" method="post" action="javascript:void(null);"
                  onsubmit="call()">
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


<nav class="white darken-4 grey-text text-darken-4" role="navigation">
    <div class="nav-wrapper">

        <a id="logo-container" href="<%=NSDConstants.HOST%>" class="brand-logo "><img src="/img/logo.png"></a>
        <a href="#" data-activates="nav-mobile" class="button-collapse green-text text-darken-3"><i
                class="material-icons">menu</i></a>
        <ul class="right hide-on-med-and-down">

            <!--<li><a class="waves-effect waves-light black modal-trigger white-text" href="#modal3">Вход</a></li>-->
            <li>
                <a class="menu-elem" href="<%=NSDConstants.HOST+"/about"%>">О проекте</a>
            </li>
            <%--<li>--%>
            <%--<a class="menu-elem" data-anchor="#capabilities">Возможности</a>--%>
            <%--</li>--%>
            <li>
                <a class="menu-elem" href="<%=NSDConstants.HOST+"/certificates"%>">Сертификаты</a>
            </li>
            <li>
                <a class="menu-elem" href="<%=NSDConstants.HOST+"/course"%>">Курсы</a>
            </li>
            <li>
                <a class="menu-elem" href="<%=NSDConstants.HOST+"/contacts"%>">Контакты</a>
            </li>



            <%
                if(!(token.equals(""))||!token.isEmpty()){
            %>
            <%= "\n" +
                    "                <li><a href=\""+NSDConstants.HOST+"/logout\" class=\"menu-elem waves-effect waves-light red btn white-text darken-3\">Выход</a></li>\n"%><%
        }else{

        %><%=" <li><a href=\"#modal2\"\n" +
                "                       class=\"menu-elem modal-trigger waves-effect waves-light btn white-text green darken-3\">Регистрация</a>\n" +
                "                </li>\n" +
                "                <li><a href=\"#modal3\"\n" +
                "                       class=\"menu-elem modal-trigger waves-effect waves-light orange btn white-text darken-3\">Вход</a>\n" +
                "                </li>"%><%

            }
        %>

        </ul>

        <ul class="side-nav" id="nav-mobile">

            <!--<li><a class="waves-effect waves-light black modal-trigger white-text" href="#modal3">Вход</a></li>-->
            <li>
                <a class="menu-elem" href="<%=NSDConstants.HOST+"/about"%>">О проекте</a>
            </li>
            <%--<li>--%>
            <%--<a class="menu-elem" data-anchor="#capabilities">Возможности</a>--%>
            <%--</li>--%>
            <li>
                <a class="menu-elem" href="<%=NSDConstants.HOST+"/certificates"%>">Сертификаты</a>
            </li>
            <li>
                <a class="menu-elem" href="<%=NSDConstants.HOST+"/course"%>">Курсы</a>
            </li>
            <li>
                <a class="menu-elem" href="<%=NSDConstants.HOST+"/contacts"%>">Контакты</a>
            </li>



            <%
                if(!(token.equals(""))||!token.isEmpty()){
            %>
            <%= "\n" +
                    "                <li><a href=\"+\"NSDConstants.HOST+\"/logout\"\" class=\"menu-elem waves-effect waves-light red btn white-text darken-3\" >Выход</a></li>\n"%><%
        }else{

        %><%=" <li><a href=\"#modal2\"\n" +
                "                       class=\"menu-elem modal-trigger waves-effect waves-light btn white-text green darken-3\">Регистрация</a>\n" +
                "                </li>\n" +
                "                <li><a href=\"#modal3\"\n" +
                "                       class=\"menu-elem modal-trigger waves-effect waves-light orange btn white-text darken-3\">Вход</a>\n" +
                "                </li>"%><%

            }
        %>

        </ul>



    </div>
</nav>


<div class="carousel carousel-slider center" data-indicators="true">
    <div class="carousel-fixed-item center">
        <a href="#modal1" id="download-button" class="btn-large modal-trigger waves-effect waves-light  " style="    background: linear-gradient(to bottom right, #ef6c00 0%, #2e7d32 36%,#ef6c00 100%);">Приступить
            к
            работе</a>
    </div>
    <div class="carousel-item white-text" href="#one!" style="background: url('../img/bImg1.jpeg') center center fixed;  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;">


        <h1 class="center orange-text text-darken-3 ">Doctrado</h1>
        <div class="row center ">
            <h5 class="header col s12 light white-text ">Обретай новые знания сейчас!</h5>

            <h5 class="header col s12 light white-text ">Вместе с Doctrado</h5>
        </div>
    </div>
    <div class="carousel-item amber white-text" href="#two!"  style="background: url('../img/bImg2.png') center center fixed ;  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;">
        <h1 class="center green-text text-darken-3 ">Сертификаты</h1>
        <div class="row center ">
            <h5 class="header col s12 light white-text ">Выберите нужный курс. Ознакомьтесь с лекционный материалом</h5>
            <h5 class="header col s12 light white-text ">Пройдите тест. И сертификат у вас!</h5>

        </div>
    </div>
    <div class="carousel-item green white-text" href="#three!" style="background: url('../img/bImage3.png') center center fixed ;  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;">

        <h1 class="center orange-text text-darken-3 ">Возможности</h1>
        <div class="row center ">
            <h5 class="header col s12 green-text text-darken-3  ">Наш сервис вам предоставляет возможности студентов и преподавателей</h5>


        </div>
    </div>

</div>


<div class="container" style="{height: 160px; }">
    <div class="section">

        <!--   Icon Section   -->
        <div class="row">
            <div class="col s12 m4 l4">
                <div class="icon-block">
                    <h2 class="center black-text"><i class="medium material-icons green-text text-darken-3">schedule</i></h2>
                    <h5 class="center">Быстро и удобно</h5>

                    <p class="light center-align">Региструешься, находишь нужный курс, проходишь все темы и тесты после
                        каждой из них - получаешь сертификат</p>
                </div>
            </div>

            <div class="col s12 m4 l4">
                <div class="icon-block">
                    <h2 class="center black-text"><i class="medium material-icons green-text text-darken-3">group_work</i>
                    </h2>
                    <h5 class="center">Командная работа</h5>
                    <p class="light center-align">Для развития сервиса мы добавили возможность каждому, у кого есть
                        должный опыт, стать преподавателем</p>
                </div>
            </div>

            <div class="col s12 m4 l4">
                <div class="icon-block">
                    <h2 class="center black-text"><i class="medium material-icons green-text text-darken-3">work</i></h2>
                    <h5 class="center">Приступай к работе</h5>

                    <p class="light center-align">Пройдя какой-либо курс, получив сертификат - Вы тут же можете
                        приступить к роботе по полученной специальности </p>
                </div>
            </div>
        </div>

    </div>
</div>


<div id = "rootContainer">




</div>


<div>
    <footer class="page-footer center-align grey darken-4 white-text">
        <div class="container">
            <div class="footer-copyright">
                <div class="container">Doctrado © 2016</div>
            </div>
        </div>
    </footer>
</div>



<script>
    $('.carousel.carousel-slider').carousel({fullWidth: true});
   // $('.button-collapse').sideNav();
    setInterval(function() {
        $('.carousel').carousel('next');
    }, 5000);
    $(document).ready(function () {

        loadCourse();

    });

    function loadCourse() {

        $.ajax({
            type: 'post',
            url: 'https://doctrado-sviasy.rhcloud.com/courseQuery',
            data: {
                q:""
            }    ,
            success:function (rawData) {
                var data = JSON.parse(rawData);
                var insertView = '';
                var root = document.getElementById("rootContainer");
                for (var i = 0; i < root.childElementCount; i++) {
                    root.removeChild(root.childNodes[i]);
                }
                for(var i1 = 0;i1<data.length;i1++){
                    if(i1==0||i1%3==0){
                        if(i1!=0){
                            insertView+='</div></div>';
                        }
                        insertView+='<div class="container"><div class="row">';
                    }
                    insertView+='<div class="row col s12 m4 l4"><div class="col s12 m12 l12"><div class="medium card"><div class="card-image" ><img  class="center center-align" style="width:200px;height:200px;overflow:hidden; top: 0; bottom:0; left: 0; right:0; margin: auto;" src="'+data[i1].imageLink+'"><span class="card-title flow-text"></span></div><div class="card-content"><p class="center-align" >'+ data[i1].courseName+'</p><br><p>Время на изучение: '+data[i1].timeToLearn+' '+ getNumEnding(data[i1].timeToLearn,end) +'</p></div><div class="card-action center-align"><p><a href="'+data[i1].moreLink+'" class="waves-effect col s12 waves-light green btn">Подробнее</a></p></div></div></div></div>';
                }
                insertView+='</div></div>';
                root.innerHTML = insertView;
                // console.log(rawData);
                // console.log(data);
            }
        });



    }
</script>




<script type="application/javascript">
    var Gname = null;
    var Glast_name = null;
    var Gsurname = null;
    var Gemail = null;
    var Gpassword = null;
    var Gtelephone = null;
    var Gborn = null;
    var Gtest5 = null;
    var GuType = null;
    var hasPhoto = false;
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
        if (errEmail && errPass) {
            Materialize.toast('<div class="red-text text-darken-3"><b> Введите ваш email <br> и пароль </b></div>', 4000, 'rounded');
            //       bar.hide();
            return;
        }
        if (errEmail) {
            Materialize.toast('<div class="red-text text-darken-3"><b> Введите ваш email </b></div>', 4000, 'rounded');
        }
        if (errPass) {
            Materialize.toast('<div class="red-text text-darken-3"><b>Введите ваш пароль</b></div>', 4000, 'rounded');
        }

        if (errors) {
            //          bar.hide();
            return;
        }
        $.ajax({
            type: 'post',
            url: '<%=NSDConstants.HOST+"/login"%>',
            data: {
                email: email,
                password: password
            },
            success: function (data) {
                if (data == -1) {
                    Materialize.toast('<div class="red-text text-darken-3"><b>Неверный логин <br> или пароль</b></div>', 4000, 'rounded');
                    bar.hide();
                }
                else window.location.href = "<%=NSDConstants.HOST+"/profile"%>";
            }
        });
    }
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
        if (errEmail && errPass) {
            Materialize.toast('<div class="red-text text-darken-3"><b> Введите ваш email <br> и пароль </b></div>', 4000, 'rounded');
            //          $('#progress_bar').modal('close');
            return;
        }
        if (errEmail) {
            Materialize.toast('<div class="red-text text-darken-3"><b> Введите ваш email </b></div>', 4000, 'rounded');
        }
        if (errPass) {
            Materialize.toast('<div class="red-text text-darken-3"><b>Введите ваш пароль</b></div>', 4000, 'rounded');
        }

        if (errors) {
//            $('#progress_bar').modal('close');
            return;
        }
        $.ajax({
            type: 'post',
            url: 'https://doctrado-sviasy.rhcloud.com/login',
            data: {
                email: email,
                password: password
            },
            success: function (data) {
                if (data == -1) {
                    Materialize.toast('<div class="red-text text-darken-3"><b>Неверный логин <br> или пароль</b></div>', 4000, 'rounded');
                    //  $('#progress_bar').modal('close');
                }
                else window.location.href = "<%=NSDConstants.HOST+"/profile"%>";
            }
        });
    }


    function getNumEnding(iNumber, aEndings) {
        var sEnding, i;
        iNumber = iNumber % 100;
        if (iNumber >= 11 && iNumber <= 19) {
            sEnding = aEndings[2];
        }
        else {
            i = iNumber % 10;
            switch (i) {
                case (1):
                    sEnding = aEndings[0];
                    break;
                case (2):
                case (3):
                case (4):
                    sEnding = aEndings[1];
                    break;
                default:
                    sEnding = aEndings[2];
            }
        }
        return sEnding;


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

        if (nameR == "") {
            error = true;
            nameREr = true;
        }
        if (last_nameR == "") {
            error = true;
            last_nameREr = true;
        }
        if (surnameR == "") {
            error = true;
            surnameREr = true;
        }
        if (emailR == "") {
            error = true;
            emailREr = true;
        }
        if (passwordR == "") {
            error = true;
            passwordREr = true;
        }
        if (telephone == "") {
            error = true;
            telephoneEr = true;
        }
        if (born == "") {
            error = true;
            bornEr = true;
        }
        if (test5 == "") {
            error = true;
            testEr = true;
        }

        if (error) {
            if (nameREr || last_nameREr || surnameREr || emailREr || passwordREr || telephoneEr || bornEr || testEr) {
                Materialize.toast('<div class="red-text text-darken-3"><b>Заполните все поля</b></div>', 4000, 'rounded');

                return;
            }
        }

        GuType = accept;

        $.ajax({
            type: 'post',
            url: 'https://doctrado-sviasy.rhcloud.com/validate_user',
            data: {
                email: emailR,
                password: passwordR,
                name: nameR,
                last_name: last_nameR,
                surname: surnameR,
                telephone: telephone,
                born: born,
                type: accept
            },
            success: function (data) {
                if (data == 0) {
                    $('#modal3').modal('close');
                    $('#modal1').modal('close');
                    $('#modal2').modal('close');

                    if (accept == 's') {
                        $('#modal4').modal('open');

                        GuType = "s";
                    }

                    if (accept == 't') $('#modal5').modal('open');
                    {

                        GuType = "t";
                    }


                    Gname = nameR;
                    Glast_name = last_nameR;
                    Gsurname = surnameR;
                    Gemail = emailR;
                    Gpassword = passwordR;
                    Gtelephone = telephone;
                    Gborn = born;
                    Gtest5 = test5;


                    //  $('#progress_bar').modal('close');
                }

            }
        });


    }
    function finishReqS() {
        //
        //alert("st /n "+Gemail);


        $.ajax({
            type: 'post',
            url: '<%=NSDConstants.HOST+"/register"%>',
            data: {
                name: Gname,
                last_name: Glast_name,
                surname: Gsurname,
                email: Gemail,
                password: Gpassword,
                telephone: Gtelephone,
                born: Gborn,
                ifAccept: Gtest5,
                Type: 's',
                hasPhoto: hasPhoto
            },
            success: function (data) {

                if (data == 0) {
                        var form = new FormData();
                        var photo = $('#avatar-input').prop('files')[0];
                    form.append('type', 'avatar');
                    form.append('photo', photo);

                    $.ajax({

                            type: 'post',
                            url: '<%=NSDConstants.HOST+"/uploadDocument"%>',
                            processData: false,
                            contentType: false,
                            cache: false,
                            data: form,
                        success: function (data) {
                            window.location.href = '<%=NSDConstants.HOST+"/profile"%>'
                        }




                        });
                    }
                }


        });

    }
    function finishReqT() {
        var photo = $('#avatar-inputA').prop('files')[0];
        var doc = $('#conf_doc').prop('files')[0];
        var teacher_ex = document.getElementById('teacher_ex').value;
        if (teacher_ex == '' || teacher_ex == "") {
            Materialize.toast('<div class="red-text text-darken-3"><b>Заполните все поля</b></div>', 4000, 'rounded');
            return;
        }

        if (doc == null) {

            Materialize.toast('<div class="red-text text-darken-3"><b>Добавьте подтверждающие документы</b></div>', 4000, 'rounded');
            return;
        }

        $.ajax({
            type: 'post',
            url: '<%=NSDConstants.HOST+"/register"%>',
            data: {
                name: Gname,
                last_name: Glast_name,
                surname: Gsurname,
                email: Gemail,
                password: Gpassword,
                telephone: Gtelephone,
                born: Gborn,
                ifAccept: Gtest5,
                Type: 't',
                hasPhoto: hasPhoto,
                addDoc: true,
                teacher_ex: teacher_ex
            },
            success: function (data) {

                if (data == 0) {
                    var form = new FormData();


                    form.append('type', 'avatar');
                    form.append('photo', photo);
                    var docLoaded = false;
                    var imgLoaded = false;

                    var docForm = new FormData();
                    docForm.append('type', 'conf_doc');
                    docForm.append('doc', doc);

                    $.ajax({

                        type: 'post',
                        url: '<%=NSDConstants.HOST+"/uploadDocument"%>',
                        processData: false,
                        contentType: false,
                        cache: false,
                        data: form,
                        success: function (data) {
                            imgLoaded = true;
                            if (docLoaded && imgLoaded)
                                window.location.href = '<%=NSDConstants.HOST+"/profile"%>'
                        }


                    });


                    $.ajax({

                        type: 'post',
                        url: '<%=NSDConstants.HOST+"/uploadDocument"%>',
                        processData: false,
                        contentType: false,
                        cache: false,
                        data: docForm,
                        success: function (data) {
                            docLoaded = true;
                            if (docLoaded && imgLoaded)
                                window.location.href = "<%=NSDConstants.HOST+"/profile"%>"
                        }


                    });
                }
            }


        });


        //    alert("te");
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

        if (nameR == "") {
            error = true;
            nameREr = true;
        }
        if (last_nameR == "") {
            error = true;
            last_nameREr = true;
        }
        if (surnameR == "") {
            error = true;
            surnameREr = true;
        }
        if (emailR == "") {
            error = true;
            emailREr = true;
        }
        if (passwordR == "") {
            error = true;
            passwordREr = true;
        }
        if (telephone == "") {
            error = true;
            telephoneEr = true;
        }
        if (born == "") {
            error = true;
            bornEr = true;
        }
        if (test5 == "") {
            error = true;
            testEr = true;
        }

        if (error) {
            if (nameREr || last_nameREr || surnameREr || emailREr || passwordREr || telephoneEr || bornEr || testEr) {
                Materialize.toast('<div class="red-text text-darken-3"><b>Заполните все поля</b></div>', 4000, 'rounded');
                return;
            }
        }
        $.ajax({
            type: 'post',
            url: '<%=NSDConstants.HOST+"/validate_user"%>',
            data: {
                email: emailR,
                password: passwordR,
                name: nameR,
                last_name: last_nameR,
                surname: surnameR,
                telephone: telephone,
                born: born,
                type: accept
            },
            success: function (data) {
                if (data == 0) {
                    $('#modal3').modal('close');
                    $('#modal1').modal('close');
                    $('#modal2').modal('close');

                    if (accept == 's') {
                        $('#modal4').modal('open');

                        GuType = "s";
                    }

                    if (accept == 't') $('#modal5').modal('open');
                    {

                        GuType = "t";
                    }


                    Gname = nameR;
                    Glast_name = last_nameR;
                    Gsurname = surnameR;
                    Gemail = emailR;
                    Gpassword = passwordR;
                    Gtelephone = telephone;
                    Gborn = born;
                    Gtest5 = test5;


                    //  $('#progress_bar').modal('close');
                }

            }
        });
    }
    $("#avatar-input").change(function () {
        hasPhoto = false;
        var file, img;
        var _URL = window.URL || window.webkitURL;
        if ((file = this.files[0])) {
            if (this.files[0].size > 5242880) {
                document.getElementById("avatar-input").value = "";
                alert("Размер картинки не должен превышать 5Мб");
                return;
            }
            img = new Image();
            img.onload = function () {
                hasPhoto = true;
                $("#avatar-img").css('width', '100%').css('height', '100%');
                document.getElementById('avatar-img').src = img.src;
            };
            img.onerror = function () {
                alert("Выбранный файл не является картинкой!");
            };
            img.src = _URL.createObjectURL(file);
        }
    });
    function uploadPhoto() {
        $("#avatar-input").click();
    }


    $("#avatar-inputA").change(function () {
        hasPhoto = false;
        var file, img;
        var _URL = window.URL || window.webkitURL;
        if ((file = this.files[0])) {
            if (this.files[0].size > 5242880) {
                document.getElementById("avatar-inputA").value = "";
                alert("Размер картинки не должен превышать 5Мб");
                return;
            }
            img = new Image();
            img.onload = function () {
                hasPhoto = true;
                $("#avatar-imgA").css('width', '100%').css('height', '100%');
                document.getElementById('avatar-imgA').src = img.src;
            };
            img.onerror = function () {
                alert("Выбранный файл не является картинкой!");
            };
            img.src = _URL.createObjectURL(file);
        }
    });
    function uploadPhotoA() {
        $("#avatar-inputA").click();
    }
    $('#document-input').change(function () {
        var document = $(this).prop('files')[0];
        var alert_document = $('#alert-2-confirmation');
        alert_document.fadeOut();
        if (document == undefined) {
            alert_document.text("Для регистрации профиля преподавателя необходимо предоставить подтверждающие документы").fadeIn();
            return;
        }
        else if (document.size > 10485760) {
            alert_document.text("Размер документа не должен превышать 10Мб!").fadeIn();
            return;
        }
        $('.reg-popup__condition').text("Спасибо, Ваш файл будет загружен при нажатии на кнопку \"Готово\"!");
    });

</script>


<script>
    $(document).ready(function () {
        // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
        $('.modal').modal();

    });
    $(document).ready(function () {
        $('.parallax').parallax();
        $(".button-collapse").sideNav();
    });
    $('.datepicker').pickadate({
        selectMonths: true,//Creates a dropdown to control month
        selectYears: 15,//Creates a dropdown of 15 years to control year
//The title label to use for the month nav buttons
        labelMonthNext: 'Следущий месяц',
        labelMonthPrev: 'Прошлый месяц',
//The title label to use for the dropdown selectors
        labelMonthSelect: 'Выберите месяц',
        labelYearSelect: 'Выберите год',
//Months and weekdays
        monthsFull: ['Январь', 'Ферваль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'],
        monthsShort: ['Янв', 'Фев', 'Март', 'Апр', 'Mай', 'Июн', 'Июл', 'Авг', 'Сент', 'Окт', 'Ноябр', 'Декбр'],
        weekdaysFull: ['Воскресенье', 'Понедельник', 'Вторник', 'Среда', 'Четверг', 'Пятница', 'Субота'],
        weekdaysShort: ['Вс', 'Пн', 'Вт', 'Ср', 'Чтв', 'Птн', 'Сб'],
//Materialize modified
        weekdaysLetter: ['Вс', 'Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб'],
//Today and clear
        today: 'Сегодня',
        clear: 'Очистить',
        close: 'X',
//The format to show on the `input` element
        format: 'dd/mm/yyyy'
    });

</script>
</body>
</html>
