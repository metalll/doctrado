<%@ page import="NSD.NSDConstants" %>
<%@ page import="auth_system.UUIDGenerator" %>
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
                "FROM `teacher`\n" +
                "WHERE `id` LIKE '" + uToken + "'");
        while (rs.next()) {

            for (int i = 1; i <= 5; i++) {
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

    <link rel="shortcut icon" href="/img/favicon.ico">
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

<div id="addingCourse" class="modal">
    <!-- <div id="progress" class="center center-block"></div>-->
    <div class="modal-content">
        <h4 class="center-align">Создание курса</h4>
        <div class="row">
            <h5 class="center-align black-text"></h5>
            <form class="col s12" name="login-form" id="login-form" method="post" action="javascript:void(null);"
                  onsubmit="createCourse()">
                <div class="row">
                    <div class="input-field col s12">
                        <input id="courseName" type="text" data-error="" class="validate">
                        <label for="courseName">Название курса</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input id="courseDesr" type="text" class="validate">
                        <label for="courseDesr">Описание курса</label>
                    </div>
                </div>

                <div class="input-field col s12">
                    <select id="courseCategory" class="icons" multiple>

                        <option value="" disabled selected>Выберите категории</option>
                        <option value="" data-icon="/img/work_icon.png" class="circle">Бизнес</option>
                        <option value="" data-icon="/img/security.png" class="circle">Безопасность</option>
                        <option value="" data-icon="/img/it.png" class="circle">IT</option>
                    </select>
                    <label>Категории курса</label>
                </div>


                <div class="row">

                    <h6 class="col s4">Время на изучение курса</h6>

                    <p class="range-field col s8">
                        <input type="range" id="timeToLearn" min="1" max="100"/>
                    </p>

                </div>

                <div class="row">
                    <h6 class="col s12 center center-align"> Изображение курса </h6>
                </div>


                <div class="row">

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

                </div>

                <div class="row">
                    <div class="col s3 left-align">
                        <a href="#!" class=" modal-action modal-close waves-effect btn waves-green">Отмена</a>
                    </div>
                    <div class="col s9 center-align">
                        <button class="btn waves-effect waves-light" type="submit" name="create">Создать курс
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

            <a id="logo-container" href="#" class="brand-logo "><img src="../img/logo.png"></a>

            <ul class="right hide-on-med-and-down">

                <!--<li><a class="waves-effect waves-light black modal-trigger white-text" href="#modal3">Вход</a></li>-->
                <li>
                    <a class="menu-elem" data-anchor="#about">О проекте</a>
                </li>
                <%--<li>--%>
                <%--<a class="menu-elem" data-anchor="#capabilities">Возможности</a>--%>
                <%--</li>--%>
                <li>
                    <a class="menu-elem" href="./certificates">Сертификаты</a>
                </li>
                <li>
                    <a class="menu-elem" data-anchor="#courses">Курсы</a>
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
            <a href="#" data-activates="nav-mobile" class="button-collapse black-text"><i
                    class="material-icons">menu</i></a>
        </div>
    </nav>
</div>
<br>


<div class="container">
    <div class="col s12 m8 offset-m2 l6 offset-l3">
        <div class="card-panel grey lighten-5 z-depth-1">
            <div class="row valign-wrapper">
                <div class="col s10">
                    <img style="width:200px;height:200px;overflow:hidden"
                         src="<%=NSDConstants.HOST+"/uploadDocument?path="+avatarPath.get(3)%>" alt=""
                         class="circle responsive-img"> <!-- notice the "circle" class -->
                </div>

                <div class="col s9">
                    <div class="row valign-wrapper">
              <span class="black-text center center-align ">
                  <h5>
                   <%=strings.get(1) + " " + strings.get(2) + " " + strings.get(3)%> <br>
                      Дата рождения: <%= strings.get(7) %><br>
                      Опыт:<%= strings.get(16) %>
                  </h5>
              </span>
                    </div>
                </div>
            </div>


        </div>
    </div>
</div>


<div class="container">

    <div class="col s12">
        <div class="row">
            <p><a class="waves-effect col s12 waves-light btn disabled">Преподаватель</a></p>
        </div>
    </div>

    <div class="col s12">
        <div class="row">
            <p><a class="waves-effect col s12 waves-light green btn">Подробнее</a></p>
        </div>
    </div>

    <div class="col s12">
        <div class="row">
            <p><a class="waves-effect col s12 waves-light orange btn">Ваша статистика</a></p>
        </div>

    </div>


</div>

</div>

<div class="row">

    <div class="row col s10 push-s1">


        <p><a class="waves-effect col s6 waves-light  darken-3 green btn">Ваши курсы<span
                class="badge pink white-text darken-2">0</span>
        </a></p>

        <p><a class="waves-effect col s6 waves-light darken-3 orange btn">Оповещения<span
                class="badge pink white-text darken-2">0</span>
        </a></p>

    </div>

</div>

<div class="container">
<div class="row valign-wrapper">

    <div class="col s8 left left-align">
        <h4> Ваши курсы: </h4>
    </div>
    <div class="col s4 center center-align">
        <a href="#addingCourse" class="waves-effect modal-trigger waves-light green btn white-text darken-3"> Создать
            курс </a>
    </div>


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
                        <p><a class="waves-effect col s12 waves-light green btn">Подробнее</a></p>
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
                        <p class="center-align"> ПОЖАРНО-ТЕХНИЧЕСКИЙ МИНИМУМ
                        </p><br>
                        <p>Время на изучение: 5 дней</p>
                    </div>
                    <div class="card-action center-align">
                        <p><a class="waves-effect col s12 waves-light green btn">Подробнее</a></p>
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

    </div>
</div>

<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="../js/materialize.min.js"></script>
<script type="application/javascript">


    function createCourse() {
        var name = document.getElementById('courseName').value;
        var desr = document.getElementById('courseDesr').value;
        var hasPhoto = false;
        var learnPeriod = document.getElementById('timeToLearn').value;


        var result = [];
        var options = document.getElementById('courseCategory');
        var opt;
        var uuid = <%UUIDGenerator.Generate();%>;
        for (var i = 0, iLen = options.length; i < iLen; i++) {
            opt = options[i];

            if (opt.selected) {
                result.push(opt.value || opt.text);
            }
        }


        $.ajax({
            type: 'post',
            url: 'https://doctrado-sviasy.rhcloud.com/createCourse',
            data: {
                name: name,
                descr: desr,
                learnPeriod: learnPeriod,
                categories: result,
                uuid: uuid

            },
            success: function (data) {

                    Materialize.toast('<div class="red-text text-darken-3"><b>Неверный логин <br> или пароль</b></div>', 4000, 'rounded');
                    var form = FormData();
                    var photoT = $('#avatar-input').prop('files')[0];
                    form.append('type', 'photo');
                    form.append('uuid', uuid);
                    form.append('photo', photoT);


                    $.ajax({

                        type: 'post',
                        url: 'https://doctrado-sviasy.rhcloud.com/uploadDocument',
                        processData: false,
                        contentType: false,
                        cache: false,
                        data: form,
                        success: function (data) {
                            // window.location.href = "http://doctrado-sviasy.rhcloud.com/profile"
                        }


                    });


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



</script>

<script>
    $(document).ready(function () {
        // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
        $('.modal').modal();

    });
    $(document).ready(function () {
        $('select').material_select();
    });

    $(document).ready(function () {
        $('.parallax').parallax();
        //  alert(<%= avatarPath %>);

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
