<%--
  Created by IntelliJ IDEA.
  User: Леша
  Date: 06.02.2017
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="NSD.NSDConstants" %>
<%@ page import="com.mysql.jdbc.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    boolean iAmAuthor = false;

    Map<String, String[]> paramMap = request.getParameterMap();
    String uType = "";
    String id = paramMap.get("id")[0];
    String avatarPath = "";
    ArrayList<String> author = new ArrayList<String>();
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
        if (cookie.getName().equals(NSDConstants.uTypeCookie))
            uType = cookie.getValue();
    }


    String query = "SELECT * FROM `course` WHERE `id` = \'" + id + "\'";
    ArrayList<String> strings = new ArrayList<String>();

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
            // isSuccess = true;

            for (int i = 1; i <= 8; i++) {
                strings.add(rs.getString(i));
            }
            //strings
            //0 - id
            //1 - photo(not used)
            //2 - createTime(time to learn)
            //3 - courseName
            //4 - courseDescr
            //5 - price
            //6 - categories
            //7 - author
            //  completion.afterOperation(new Teacher();
        }

        query = "SELECT * \n" +
                "FROM  `resourses` \n" +
                "WHERE  `type` =  'photo'\n" +
                "AND  `uuid` =  '" + id + "'\n";
        rs = stmt.executeQuery(query);
        while (rs.next()) {

            avatarPath = rs.getString(4);

        }

        query = "SELECT * FROM `users` WHERE `lastUserToken` = '" + uToken + "'";
        rs = stmt.executeQuery(query);
        while (rs.next()) {

            for (int i = 1; i <= 12; i++) {
                author.add(rs.getString(i));
            }

        }

        if (uType.equals("t")) {
            query = "SELECT *\n" +
                    "FROM `teacher`\n" +
                    "WHERE `id` LIKE '" + uToken + "'";
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                for (int i = 1; i <= 5; i++) {
                    author.add(rs.getString(i));
                }
            }

            if (author.get(10).equals(uToken)) {
                iAmAuthor = true;
            }

        }
        if (uType.equals("s") || uType.equals("")) {
            iAmAuthor = false;
        }

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


    if (iAmAuthor == true) {

%><%= "I am is Author" %><%

} else {

%><%= "I am is dont Author" %><%
    }


%>
<!DOCTYPE html>
<html lang="ru">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
    <title>Doctrado</title>
    <!-- CSS  -->

    <style>
        .water {
            background: #000 url(/img/water.png) round;
            width: 574px;
            height: 334px;
        }

        img.watermark {
            filter: alpha(opacity=75);
            opacity: .75;
        }

    </style>

    <meta charset="utf-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="csrf-token" content="Wx6PFl4mn9yqYIFxDmcvdgOH6tNtWn3dVOktVC7V">
    <title>Doctrado</title>

    <link rel="shortcut icon" href="https://doctrado.me/img/favicon.ico">
    <link rel="stylesheet" href="./NSDcss/login.css">


    <link href="./css/materialize.min.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="./css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>

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
                <li><a href="<%=NSDConstants.HOST+"/logout"%>"
                       class="menu-elem waves-effect waves-light red btn white-text darken-3">Выход</a></li>


            </ul>

            <ul id="nav-mobile" class="side-nav">
                <li><a href="#">Navbar Link</a></li>
            </ul>
            <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
        </div>
    </nav>
</div>
<div class="container">


        <div class="col s12 m8 offset-m2 l6 offset-l3">
            <div class="card-panel grey lighten-5 z-depth-1">
                <div class="row valign-wrapper">
                    <div class="col s4 push-s1">
                        <img style="width:200px;height:200px;overflow:hidden"
                             src="<%=NSDConstants.HOST+"/uploadDocument?path="+avatarPath%>" alt=""
                             class=" responsive-img"> <!-- notice the "circle" class -->
                    </div>

                    <div class="col s7">
                        <div class="row valign-wrapper">
              <span class="black-text center center-align ">
                  <h5>
                      <%=strings.get(2) + ""%></h5><br>
                     <h5> <%=strings.get(4)%></h5>

            <div class="row">
    <div class="col s12">
      <ul class="tabs">
        <li class="tab col s3"><div class="chip">
    <img src="img/it.png" alt="Contact Person">
    Jane Doe
  </div></li>
        <li class="tab col s3"><div class="chip">
    <img src="img/it.png" alt="Contact Person">
    Jane Doe
  </div></li>
        <li class="tab col s3 "><div class="chip">
    <img src="img/it.png" alt="Contact Person">
    Jane Doe
  </div></li>
        <li class="tab col s3"><div class="chip">
    <img src="img/it.png" alt="Contact Person">
    Jane Doe
  </div></li>
      </ul>
    </div>
                                     </div>


              </span>
                        </div>
                    </div>
                </div>


            </div>
        </div>
</div>


<div class="container">
    <div class="row col s12">
        <h5 class="center-align center">Темы курса</h5>
    </div>
<ul class="collapsible" data-collapsible="accordion">
    <li>
        <div class="collapsible-header">
            <div class="center-align center">Тема 1</div>
        </div>
        <div class="collapsible-body"><span class="water">
            <div class="row col s12">

           <div class="col center center-align s4"> <a href="javascript:void(0);" id="input" onclick="funcn();"
                                                       class="menu-elem waves-effect center center-align waves-light btn white-text"
           >Сохранить изменения</a></div>
                <div class="col center center-align s4">   <a href="#"
                                                              class="menu-elem  waves-effect center center-align waves-light btn white-text">Удалить тему</a></div>
                <div class="col center center-align s4">   <a href="#"
                                                              class="menu-elem waves-effect center center-align waves-light btn white-text">Тест темы</a> </div>
            </div>


            <textarea name="content1">

            </textarea>







        </span></div>
    </li>
    <li>
        <div class="collapsible-header">
            <div class="center-align center">Тема 2</div>
        </div>
        <div class="collapsible-body"><span class="water">
            <div class="row col s12">

           <div class="col center center-align s4"> <a href="javascript:void(0);" id="input1" onclick="funcn();"
                                                       class="menu-elem waves-effect center center-align waves-light btn white-text"
           >Сохранить изменения</a></div>
                <div class="col center center-align s4">   <a href="#"
                                                              class="menu-elem  waves-effect center center-align waves-light btn white-text">Удалить тему</a></div>
                <div class="col center center-align s4">   <a href="#"
                                                              class="menu-elem waves-effect center center-align waves-light btn white-text">Тест темы</a> </div>
            </div>


            <textarea name="content2">



            </textarea>







        </span></div>
    </li>

    <li>
        <div class="collapsible-header">
            <div class="center-align center">Тема 3</div>
        </div>
        <div class="collapsible-body"><span class="water">
            <div class="row col s12">

           <div class="col center center-align s4"> <a href="javascript:void(0);" id="input3" onclick="funcn();"
                                                       class="menu-elem waves-effect center center-align waves-light btn white-text"
           >Сохранить изменения</a></div>
                <div class="col center center-align s4">   <a href="#"
                                                              class="menu-elem  waves-effect center center-align waves-light btn white-text">Удалить тему</a></div>
                <div class="col center center-align s4">   <a href="#"
                                                              class="menu-elem waves-effect center center-align waves-light btn white-text">Тест темы</a> </div>
            </div>


            <textarea name="content3">



            </textarea>







        </span></div>
    </li>
</ul>
    <div class="row col s12 center center-align">
        <a class=" col s12 waves-effect center center-align waves-light btn white-text"> <i
                class="material-icons">add</i>
    </a>
    </div>
</div>
<script src="/js/tinymce/tinymce.min.js"></script>
<script type="application/javascript">


    function funcn() {
        $.ajax({
            type: 'post',
            url: 'https://doctrado-sviasy.rhcloud.com/login',
            data: {
                content: tinyMCE.get('content1').getContent()
            },
            success: function (data) {

            }
        });
    }



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
            url: 'https://doctrado-sviasy.rhcloud.com/login',
            data: {
                email: email,
                password: password
            },
            success: function (data) {
                if (data == -1) {
                    Materialize.toast('<div class="red-text text-darken-3"><b>Неверный логин <br> или пароль</b></div>', 4000, 'rounded');
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
                else window.location.href = "https://doctrado-sviasy.rhcloud.com/profile";
            }
        });
    }

    tinymce.init({
        selector: 'textarea',
        height: 500,
        theme: 'modern',
        plugins: [
            'advlist autolink lists link image charmap print preview hr anchor pagebreak',
            'searchreplace wordcount visualblocks visualchars code fullscreen',
            'insertdatetime media nonbreaking save table contextmenu directionality',
            'emoticons template paste textcolor colorpicker textpattern imagetools codesample toc'
        ],
        toolbar1: 'undo redo | insert | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
        toolbar2: 'print preview media | forecolor backcolor emoticons | codesample',
        image_advtab: true,
        language: "ru",
        translate_mode: true,
        templates: [
            {title: 'Test template 1', content: 'Test 1'},
            {title: 'Test template 2', content: 'Test 2'}
        ],
        content_css: [
            '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
            '//www.tinymce.com/css/codepen.min.css'
        ]
    });


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


                    if (accept == 's') $('#modal4').modal('open');

                    if (accept == 't') $('#modal5').modal('open');
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

                    if (accept == 's') $('#modal4').modal('open');

                    if (accept == 't') $('#modal5').modal('open');


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

