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
    ArrayList<ArrayList<String>> themes = new ArrayList<ArrayList<String>>();
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

        query = "SELECT * FROM `users` WHERE `lastUserToken` = '" + strings.get(7) + "'";
        rs = stmt.executeQuery(query);
        while (rs.next()) {

            for (int i = 1; i <= 12; i++) {
                author.add(rs.getString(i));
            }

        }

        if (uType.equals("t")) {
            query = "SELECT *\n" +
                    "FROM `teacher`\n" +
                    "WHERE `id` LIKE '" + strings.get(7) + "'";
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


        query = "SELECT * \n" +
                "FROM  `subCourse` \n" +
                "WHERE  `parentCourse` LIKE '" + id + "'";
        rs = stmt.executeQuery(query);
        while (rs.next()) {
            ArrayList<String> tempList = new ArrayList<String>();

            for (int i = 0; i <= 5; i++) {
                tempList.add(rs.getString(i));
            }

            themes.add(tempList);

        }

//bubble sort #optimism)
//        for (int i = themes.size() - 1; i >= 0; i--) {
//            for (int j = 0; j < i; j++) {
//                if (Integer.parseInt(themes.get(j).get(4)) > Integer.parseInt(themes.get(j + 1).get(4))) {
//                    ArrayList<String> t = themes.get(j);
//                    themes.set(j, themes.get(j + 1));
//                    themes.set(j + 1, t);
//                }
//            }
//        }




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


        <%


            for (int i = 0; i < themes.size(); i++) {


        %><%="  <li>\n" +
            "        <div class=\"collapsible-header\">\n" +
            "            <div class=\"center-align center\"> Тема " + themes.get(i).get(4) + "</div>\n" +
            "        </div>"%><%
        if (iAmAuthor) {
    %><%="  <div class=\"collapsible-body\"><span class=\"water\">\n" +
            "            <br>\n" +
            "            <div class=\"row col s12\">\n" +
            "\n" +
            "           <div class=\"col center center-align s4\"> <a href=\"javascript:void(0);\" id=\"input\" onclick=\"func" + themes.get(i).get(4) + "();\"\n" +
            "                                                       class=\"menu-elem waves-effect center center-align green darken-3 waves-light btn white-text\"\n" +
            "           >Сохранить изменения</a></div>\n" +
            "                <div class=\"col center center-align s4\">   <a href=\"#\"\n" +
            "                                                              class=\"menu-elem  waves-effect center center-align red darken-3 waves-light btn white-text\">Удалить тему</a></div>\n" +
            "                <div class=\"col center center-align s4\">   <a href=\"#\"\n" +
            "                                                              class=\"menu-elem waves-effect center center-align orange darken-3 waves-light btn white-text\">Тест темы</a> </div>\n" +
            "            </div>\n" +
            "\n" +
            "\n" +
            "            <textarea name=\"content" + themes.get(i).get(4) + "\">\n" +
            "\n" +
            "            </textarea>\n" +
            "\n" +
            "\n" +
            "\n" +
            "\n" +
            "\n" +
            "\n" +
            "\n" +
            "        </span></div>\n" +
            "    </li>"%>
        <%
        } else {
        %><%=
    "  <div class=\"collapsible-body\"><span class=\"water\">\n" +
            themes.get(i).get(2) +
            "        </span></div>\n" +
            "    </li>\n"
    %><%
            }


        }


    %>
</ul>

    <% if (iAmAuthor) {


    %>
    <%=" <div class=\"row col s12 center center-align\">\n" +
            "        <a href=\"javascript:void(0);\"  onclick=\"addTheme();\" class=\" col s12 waves-effect center center-align waves-light btn white-text\"> <i\n" +
            "                class=\"material-icons\">add</i>\n" +
            "    </a>\n" +
            "    </div>"%>
    <%
        }
    %>
</div>
<script src="/js/tinymce/tinymce.min.js"></script>
<script type="application/javascript">


    <% if(iAmAuthor){

        for(int i=0;i<themes.size();i++)
            {

                %>
    <%= " function func"+themes.get(i).get(4)+"() {\n" +
"        $.ajax({\n" +
"            type: 'post',\n" +
"            url: 'https://doctrado-sviasy.rhcloud.com/updateCourseContent',\n" +
"            data: {\n" +
"                content: tinyMCE.get('content"+themes.get(i).get(4)+"').getContent()\n" +
             ", id : "+themes.get(i).get(0)+
"            },\n" +
"            success: function (data) {\n" +
"\n" +
"            }\n" +
"        });\n" +
"    }\n" %>
    <%
        
        
        %><%= " $(document).ready(function () {\n" +
"        tinyMCE.get('content"+themes.get(i).get(4)+"').setContent('"+themes.get(i).get(2)+"');\n" +
"    });" %><%
        
        
            }



    }
    %>


    function addTheme() {

        $.ajax({
            type: 'post',
            url: 'https://doctrado-sviasy.rhcloud.com/addCourse',
            data: {
                parent:<%=id%>,
                number:<%=themes.size()+1%>
            },
            success: function (data) {

            }
        })


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
    <% if(iAmAuthor){
        %><%="  tinymce.init({\n" +
"        selector: 'textarea',\n" +
"        height: 500,\n" +
"        theme: 'modern',\n" +
"        plugins: [\n" +
"            'advlist autolink lists link image charmap print preview hr anchor pagebreak',\n" +
"            'searchreplace wordcount visualblocks visualchars code fullscreen',\n" +
"            'insertdatetime media nonbreaking save table contextmenu directionality',\n" +
"            'emoticons template paste textcolor colorpicker textpattern imagetools codesample toc'\n" +
"        ],\n" +
"        toolbar1: 'undo redo | insert | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',\n" +
"        toolbar2: 'print preview media | forecolor backcolor emoticons | codesample',\n" +
"        image_advtab: true,\n" +
"        language: \"ru\",\n" +
"        translate_mode: true,\n" +
"        templates: [\n" +
"            {title: 'Test template 1', content: 'Test 1'},\n" +
"            {title: 'Test template 2', content: 'Test 2'}\n" +
"        ],\n" +
"        content_css: [\n" +
"            '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',\n" +
"            '//www.tinymce.com/css/codepen.min.css'\n" +
"        ]\n" +
"    });"%><%} %>



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

