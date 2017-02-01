<%@ page import="NSD.NSDConstants" %>
<%@ page import="com.mysql.jdbc.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
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
<%

    ArrayList<String> strings = new ArrayList<String>();
    final String databaseUrl = "jdbc:mysql://127.6.55.2:3306/doctrado?useUnicode=true&amp;characterEncoding=utf8";
    //private static final String databaseUrl = "jdbc:mysql://localhost:3307/tochka";
    final String userName = "adminsBmIZAN";
    final String password = "qIqWymbbb-hk";
    Connection conn = null;
    Statement stmt = null;
    String uToken = null;
    for (Cookie cookie : request.getCookies()) {
        if (cookie.getName().equals(NSDConstants.uTokenCookie))
            uToken = cookie.getValue();
    }


    String query = "SELECT * FROM `users` WHERE `lastUserToken` = '" + uToken + "'";

    ArrayList<String> avatarPath = new ArrayList<String>();  // "/var/lib/openshift/58512d040c1e66ad2d000024/app-root/logs/upload/Hydrangeas.jpg";
    boolean isSuccess = false;
    // String query =  "SELECT * FROM `users` WHERE `login` = '"+uName+"' AND `pass` ='"+uPass+"'";
    try {
        Class.forName("com.mysql.jdbc.Driver");
    } catch (Exception e) {
        e.printStackTrace();
    }
    try {
        conn = DriverManager.getConnection(databaseUrl, userName, password);
        stmt = (Statement) conn.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        while (rs.next()) {
            isSuccess = true;

            for (int i = 1; i <= 12; i++) {
                strings.add(rs.getString(i));
            }

            //  completion.afterOperation(new Teacher();
        }

        rs = stmt.executeQuery("SELECT *\n" +
                "FROM `student`\n" +
                "WHERE `id` LIKE '" + uToken + "'");
        while (rs.next()) {

            for (int i = 1; i <= 1; i++) {
                strings.add(rs.getString(i));
            }

        }

        // if (strings.get(12).equals("YES")) {
        rs = stmt.executeQuery("SELECT * FROM `resourses` WHERE `userInfo` = '" + uToken + "' AND `type` = 'avatar'");

        while (rs.next()) {

                for (int i = 1; i <= 5; i++) {
                    avatarPath.add(rs.getString(i));
}

            }


        //}

    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (stmt != null) try {
            stmt.close();
        } catch (Exception e) {
        }
        if (conn != null) try {
            conn.close();
        } catch (Exception e) {
        }

    }

//    String savatarPath = "";
//    for (int i12 = 0; i12 < avatarPath.size(); i12++) {
//
//        savatarPath += avatarPath.get(i12) + "     ";
//
//
//
//}
    //  response.getWriter().write(savatarPath);
%>
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
<body >



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
                <li><a href="<%=NSDConstants.HOST+"/logout"%>" class="menu-elem waves-effect waves-light red btn white-text darken-3" >Выход</a></li>
            </ul>

            <ul id="nav-mobile" class="side-nav">
                <li><a href="#">Navbar Link</a></li>
            </ul>
            <a href="#" data-activates="nav-mobile" class="button-collapse black-text"><i
                    class="material-icons">menu</i></a>
        </div>
    </nav>
</div>
<br>


<div class="row">

    <div class="col s12">

        <p class="center-block center-align center"><img
                class="col s6 push-s3 pull-s3  center-block responsive-img circle  center center-align"
                src="<%=NSDConstants.HOST+"/uploadDocument?path="+avatarPath.get(3)%>"></p>
    </div>


    <h5 class="center-align col s12"><%=strings.get(1) + " " + strings.get(2) + " " + strings.get(3)%>
        </h5>
    <h5 class="center-align col s12"> Дата рождения: <%= strings.get(7) %>
        </h5>


    </div>

<div class="col s12">
        <div class="row">
            <p><a class="waves-effect col s12 waves-light btn disabled">Студент</a></p>
        </div>
</div>

<div class="col s12">
    <div class="row">
        <p> <a class="waves-effect col s12 waves-light green btn">Подробнее</a>  </p>
    </div>
</div>

<div class="col s12">
    <div class="row">
        <p>   <a class="waves-effect col s12 waves-light orange btn">Ваша статистика</a>  </p>
    </div>

</div>


</div>
<div class="row">

    <div class="row col s10 push-s1">


        <p><a class="waves-effect col s6 waves-light  green btn">Мои курсы<span class="badge new pink darken-2">0</span>
        </a></p>

        <p><a class="waves-effect col s6 waves-light orange btn">Оповещения<span class="badge pink darken-2">0</span>
        </a></p>

    </div>

</div>


<div class="row">

    <div class="col s4 col push-s4 center-align">
        <h3> Ваши курсы: </h3>
    </div>


</div>


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
                        <p class="center-align"> ПОЖАРНО-ТЕХНИЧЕСКИЙ МИНИМУМ
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

<script>
    $(document).ready(function(){
        // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
        $('.modal').modal();

    });
    $(document).ready(function () {
        $('.parallax').parallax();
        alert(<%= avatarPath %>);

    });



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
