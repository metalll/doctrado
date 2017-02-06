<%@ page import="NSD.NSDConstants" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ru">

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
    <title>Doctrado</title>
    <!-- CSS  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <meta charset="utf-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="csrf-token" content="Wx6PFl4mn9yqYIFxDmcvdgOH6tNtWn3dVOktVC7V">
    <title>Doctrado</title>

    <link rel="shortcut icon" href="https://doctrado.me/img/favicon.ico">
    <link rel="stylesheet" href="./NSDcss/login.css">


    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/js/materialize.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css">

    <link href="./css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">


</head>
<body>



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
                    <a class="menu-elem" data-anchor="/courses">Курсы</a>
                </li>
                <li>
                    <a class="menu-elem" data-anchor="#contacts">Контакты</a>
                </li>
                <li><a href="<%=NSDConstants.HOST+"/logout"%>" class="menu-elem waves-effect waves-light red btn white-text darken-3" >Выход</a></li>


            </ul>

            <ul id="nav-mobile" class="side-nav">
                <li><a href="#">Navbar Link</a></li>
            </ul>
            <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
        </div>
    </nav>
</div>
<div class="container">
<p></p>
<div class="row">
    <div class="col s12">
        <div class="row">
            <div class="input-field col s12">
                <i class="material-icons prefix">textsms</i>
                <input type="text" id="autocomplete-input" class="autocomplete">
                <label for="autocomplete-input">Autocomplete</label>
            </div>
        </div>
    </div>
</div>
<p></p>



    <div class="row">

        <div class="row col s4">
            <div class="col s12 m12 l12">
                <div class="medium card">
                    <div class="card-image">
                        <img src="../img/course.jpg">
                        <span class="card-title flow-text"></span>
                    </div>
                    <div class="card-content">
                        <p> ПОЖАРНО-ТЕХНИЧЕСКИЙ МИНИМУМ
                        </p><br>
                        <p>Время на изучение: 5 дней</p>
                    </div>
                    <div class="card-action center-align">
                        <p> <a class="waves-effect col s12 waves-light green btn">Подробнее</a>  </p>
                    </div>
                </div>
            </div>
        </div>

        <div class="row col s4">
            <div class="col s12 m12 l12">
                <div class="medium card">
                    <div class="card-image">
                        <img src="../img/picture.png">
                        <span class="card-title">Card Title</span>
                    </div>
                    <div class="card-content">
                        <p>I am a very simple card. I am good at containing small bits of information.
                            I am convenient because I require little markup to use effectively.</p>
                    </div>
                    <div class="card-action">
                        <a href="#">This is a link</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row col s4">
            <div class="col s12 m12 l12">
                <div class="medium card">
                    <div class="card-image">
                        <img src="../img/picture.png">
                        <span class="card-title">Card Title</span>
                    </div>
                    <div class="card-content">
                        <p>I am a very simple card. I am good at containing small bits of information.
                            I am convenient because I require little markup to use effectively.</p>
                    </div>
                    <div class="card-action">
                        <a href="#">This is a link</a>
                    </div>
                </div>
            </div>
        </div>

    </div></div>

<div class="container">
    <div class="row">

        <div class="row col s4">
            <div class="col s12 m12 l12">
                <div class="medium card">
                    <div class="card-image">
                        <img src="../img/course.jpg">
                        <span class="card-title flow-text"></span>
                    </div>
                    <div class="card-content">
                        <p> ПОЖАРНО-ТЕХНИЧЕСКИЙ МИНИМУМ
                        </p><br>
                        <p>Время на изучение: 5 дней</p>
                    </div>
                    <div class="card-action center-align">
                        <p> <a class="waves-effect col s12 waves-light green btn">Подробнее</a>  </p>
                    </div>
                </div>
            </div>
        </div>

        <div class="row col s4">
            <div class="col s12 m12 l12">
                <div class="medium card">
                    <div class="card-image">
                        <img src="../img/picture.png">
                        <span class="card-title">Card Title</span>
                    </div>
                    <div class="card-content">
                        <p>I am a very simple card. I am good at containing small bits of information.
                            I am convenient because I require little markup to use effectively.</p>
                    </div>
                    <div class="card-action">
                        <a href="#">This is a link</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row col s4">
            <div class="col s12 m12 l12">
                <div class="medium card">
                    <div class="card-image">
                        <img src="../img/picture.png">
                        <span class="card-title">Card Title</span>
                    </div>
                    <div class="card-content">
                        <p>I am a very simple card. I am good at containing small bits of information.
                            I am convenient because I require little markup to use effectively.</p>
                    </div>
                    <div class="card-action">
                        <a href="#">This is a link</a>
                    </div>
                </div>
            </div>
        </div>

    </div></div>

<div class="container">
    <div class="row">

        <div class="row col s4">
            <div class="col s12 m12 l12">
                <div class="medium card">
                    <div class="card-image">
                        <img src="../img/course.jpg">
                        <span class="card-title flow-text"></span>
                    </div>
                    <div class="card-content">
                        <p> ПОЖАРНО-ТЕХНИЧЕСКИЙ МИНИМУМ
                        </p><br>
                        <p>Время на изучение: 5 дней</p>
                    </div>
                    <div class="card-action center-align">
                        <p> <a class="waves-effect col s12 waves-light green btn">Подробнее</a>  </p>
                    </div>
                </div>
            </div>
        </div>

        <div class="row col s4">
            <div class="col s12 m12 l12">
                <div class="medium card">
                    <div class="card-image">
                        <img src="../img/picture.png">
                        <span class="card-title">Card Title</span>
                    </div>
                    <div class="card-content">
                        <p>I am a very simple card. I am good at containing small bits of information.
                            I am convenient because I require little markup to use effectively.</p>
                    </div>
                    <div class="card-action">
                        <a href="#">This is a link</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row col s4">
            <div class="col s12 m12 l12">
                <div class="medium card">
                    <div class="card-image">
                        <img src="../img/picture.png">
                        <span class="card-title">Card Title</span>
                    </div>
                    <div class="card-content">
                        <p>I am a very simple card. I am good at containing small bits of information.
                            I am convenient because I require little markup to use effectively.</p>
                    </div>
                    <div class="card-action">
                        <a href="#">This is a link</a>
                    </div>
                </div>
            </div>
        </div>

    </div></div>

<div class="container">
    <div class="row">

        <div class="row col s4">
            <div class="col s12 m12 l12">
                <div class="medium card">
                    <div class="card-image">
                        <img src="../img/course.jpg">
                        <span class="card-title flow-text"></span>
                    </div>
                    <div class="card-content">
                        <p> ПОЖАРНО-ТЕХНИЧЕСКИЙ МИНИМУМ
                        </p><br>
                        <p>Время на изучение: 5 дней</p>
                    </div>
                    <div class="card-action center-align">
                        <p> <a class="waves-effect col s12 waves-light green btn">Подробнее</a>  </p>
                    </div>
                </div>
            </div>
        </div>

        <div class="row col s4">
            <div class="col s12 m12 l12">
                <div class="medium card">
                    <div class="card-image">
                        <img src="../img/picture.png">
                        <span class="card-title">Card Title</span>
                    </div>
                    <div class="card-content">
                        <p>I am a very simple card. I am good at containing small bits of information.
                            I am convenient because I require little markup to use effectively.</p>
                    </div>
                    <div class="card-action">
                        <a href="#">This is a link</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row col s4">
            <div class="col s12 m12 l12">
                <div class="medium card">
                    <div class="card-image">
                        <img src="../img/picture.png">
                        <span class="card-title">Card Title</span>
                    </div>
                    <div class="card-content">
                        <p>I am a very simple card. I am good at containing small bits of information.
                            I am convenient because I require little markup to use effectively.</p>
                    </div>
                    <div class="card-action">
                        <a href="#">This is a link</a>
                    </div>
                </div>
            </div>
        </div>

    </div></div>





<script type="application/javascript" >

    $(document).ready(function () {
        $('input.autocomplete').autocomplete({
            data: {
                "Apple": null,
                "Microsoft": null,
                "Google": 'http://placehold.it/250x250'
            },
            limit: 20, // The max amount of results that can be shown at once. Default: Infinity.
        });
    });




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


                    if(accept=='s') $('#modal4').modal('open');

                    if(accept=='t') $('#modal5').modal('open');
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

                    if(accept=='s') $('#modal4').modal('open');

                    if(accept=='t') $('#modal5').modal('open');




                    //  $('#progress_bar').modal('close');
                }

            }
        });
    }
</script>



<div>
    <footer class="page-footer center-align grey darken-4 white-text">
        <div class="container">
            <div class="footer-copyright">
                <div class="container">Doctrado © 2016</div>
            </div>
        </div>
    </footer>
</div>
</body>
</html>

