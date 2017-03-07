<%--
  Created by IntelliJ IDEA.
  User: Леша
  Date: 06.02.2017
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="NSD.NSDConstants" %>
<%@ page import="com.mysql.jdbc.Statement" %>
<%@ page import="model.Answer" %>
<%@ page import="model.Question" %>
<%@ page import="model.Test" %>
<%@ page import="utils.StrFormatter" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%
    request.setCharacterEncoding("UTF-8");

    boolean iAmAuthor = false;
    ArrayList<String> tempList = new ArrayList<String>();
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

    Test finalTest = new Test();










    String dQuery = "";
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


        query = "SELECT * FROM  `subCourse` WHERE  `parentCourse` = '" + id + "'";


        rs = stmt.executeQuery(query);
        while (rs.next()) {
            tempList = new ArrayList<String>();
            for (int i = 1; i <= 6; i++) {
                tempList.add(rs.getString(i));
            }
            themes.add(tempList);

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



//bubble sort #optimism)Mark
        for (int i = themes.size() - 1; i >= 0; i--) {
            for (int j = 0; j < i; j++) {
                if (Integer.parseInt(themes.get(j).get(4)) > Integer.parseInt(themes.get(j + 1).get(4))) {
                    ArrayList<String> t = themes.get(j);
                    themes.set(j, themes.get(j + 1));
                    themes.set(j + 1, t);
                }
            }
        }

        query = "SELECT * \n" +
                "FROM  `test` WHERE `parentCourse` = '"+id+"' ";


        rs = stmt.executeQuery(query);
        while (rs.next()){

            finalTest.testUUID = rs.getString(3);
        }

        if(finalTest.testUUID!=null){
            query = "SELECT * FROM `question` WHERE `parentTest` = '"+finalTest.testUUID+"'";
            rs = stmt.executeQuery(query);
            while (rs.next()){

            if(finalTest.questions==null){ finalTest.questions=new ArrayList<Question>(); }

            Question question = new Question();
            question.question = rs.getString(3);
            question.questionUUID = rs.getString(4);

            finalTest.questions.add(question);

            }

            for(int i=0;i<finalTest.questions.size();i++){

              if(finalTest.questions.get(i).answers==null){ finalTest.questions.get(i).answers = new ArrayList<Answer>(); }

              query = "SELECT * FROM `answer` WHERE `parentQuestion` = '"+finalTest.questions.get(i).questionUUID+"'";

                rs = stmt.executeQuery(query);

                while (rs.next()) {

                    Answer answer = new Answer();
                    answer.Answer = rs.getString(2);
                    answer.QuestionUUID = rs.getString(4);
                    answer.isTrue = rs.getInt(3);
                    finalTest.questions.get(i).answers.add(answer);


                }
            }



        }




    } catch (SQLException e) {


        dQuery = e.getLocalizedMessage();
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


        .test-modal {
            width: 75% !important;
            max-height: 100% !important;
            overflow-y: hidden !important;
        }

        #background{
            position:absolute;
            z-index:0;
            background:white;
            display:block;
            min-height:50%;
            min-width:50%;
            color:yellow;
        }

        #content{
            position:absolute;
            z-index:1;
        }

        #bg-text
        {
            color:lightgrey;
            font-size:120px;
            transform:rotate(300deg);
            -webkit-transform:rotate(300deg);
        }




    </style>

    <meta charset="utf-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="csrf-token" content="Wx6PFl4mn9yqYIFxDmcvdgOH6tNtWn3dVOktVC7V">
    <title>Doctrado</title>

    <link rel="shortcut icon" href="https://doctrado.me/img/favicon.ico">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/js/materialize.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="../css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>

    <% if(!iAmAuthor){ %>
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
    <%}%>

</head>


<div id="test-dialog" class="modal modal-fixed-footer test-modal">
    <div class="modal-content" id="test-container">
        <h6 class="center center-align">Редактирование Теста</h6>



        <ul class="collapsible" data-collapsible="accordion" id="test-ul">


        </ul>
        <div class="col s12 row" href="javascript:void(0);" onclick="addTest();"><a
                class="btn col s12 center center-align">+</a></div>

    </div>
    <div class="modal-footer">
        <a href="javascript:void(0);" onclick="toJSON();" class=" waves-effect waves-green btn-flat ">Применить
            изменения</a>
    </div>
</div>




<% if(iAmAuthor){ %>
   <body>
<%}else{%>
<body style="
-moz-user-select: none;
-webkit-user-select: none;
-ms-user-select: none;
-o-user-select: none;
user-select: none;
">
<%}
%>



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

<div class="container">


        <div class="col s12 m12 l12 ">
            <div class="col s12 card-panel grey lighten-5 z-depth-1">
                <div class="col s12 row valign-wrapper">
                    <div class="col s5">
                        <img style="width:200px;height:200px;overflow:hidden"
                             src="<%=NSDConstants.HOST+"/uploadDocument?path="+avatarPath%>" alt=""
                             class=" responsive-img"> <!-- notice the "circle" class -->
                    </div>

                    <div class="col s7">
                        <div class="row valign-wrapper">
    <span class="col s12 black-text center center-align ">
                  <h5 class="row col s12 center center-align ">
                      <%=strings.get(2) + ""%></h5>
                     <h6 class="row col s12 center center-align "> <%=strings.get(4)%></h6>



</span>

                        </div>
                    </div>
                </div>

                <div class="col s12 row">
                    <div class="col s12 m4 l4 center-align">
                        <div class="center center-align">
                            <div class="chip  orange darken-3 white-text  center center-align"><img
                                    src="http://www.navcesto.ru/upload/iblock/228/22812763d41b9cb278b0e7d8d669126f.jpg"
                                    alt="Contact Person">ІТР
                            </div>
                        </div>
                    </div>
                    <div class="col s12 m4 l4 center-align">
                        <div class="center center-align">
                            <div class="chip  green darken-3 white-text center center-align"><img
                                    src="http://greenologia.ru/wp-content/uploads/2015/01/Kraski-360x236.jpg"
                                    alt="Contact Person">Лако-краска
                            </div>
                        </div>
                    </div>
                    <div class="col s12 m4 l4 center-align">
                        <div class="center center-align">
                            <div class="chip yellow darken-3 white-text center center-align"><img
                                    src="https://skn-group.ru/upload/iblock/e2f/e2fb5963746f7dcbc743c6e68d561798.jpg"
                                    alt="Contact Person">Промбез
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

</div>

<script src="/js/tinymce/tinymce.min.js"></script>





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
            "           <div class=\"col center center-align s6 m6 l6\"> <a href=\"javascript:void(0);\" id=\"input\" onclick=\"func" + themes.get(i).get(4) + "();\"\n" +
            "                                                       class=\"menu-elem waves-effect center center-align green darken-3 waves-light btn white-text\"\n" +
            "           >Сохранить изменения</a></div>\n" +
            "                <div class=\"col center center-align s6 m6 l6\">   <a href=\"javascript:void(0);\"" +
            "                                                              class=\"menu-elem  waves-effect center center-align red darken-3 waves-light btn white-text\" onclick=\"del" + themes.get(i).get(4) + "();\">Удалить тему</a></div>\n" +
            "              "+
            "            </div>\n" +
            "\n" +
            "\n" +
            "            <textarea id=\"content" + themes.get(i).get(4) + "\" name=\"content" + themes.get(i).get(4) + "\">\n" +
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
            sun.misc.BASE64Decoder decoder = new sun.misc.BASE64Decoder();
        %><%=
    "  <div class=\"collapsible-body\">  <span>\n" +
            new String(decoder.decodeBuffer(themes.get(i).get(2)),"UTF-8") +
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
    <div class="row col s12 center center-align">
        <a href="#test-dialog" class="col s12 waves-effect center modal-trigger center-align waves-light btn white-text orange darken-3">Итоговый тест</a>
    </div>
    <%
        }
    %>


</div>






<script>
    $(document).ready(function(){
        $('.collapsible').collapsible();
    });



    function getUUID() {
        return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
            var r = Math.random() * 16 | 0, v = c == 'x' ? r : r & 0x3 | 0x8;
            return v.toString(16);
        });

    }


    var GlobalChildNodesSize = 1;
    var test;
    var stringTest = '';
    function deleteAnswer(id) {

//    console.log('del: ' + id);


        var answer = document.getElementById(id);
        var pAnswer = answer.parentNode.parentNode;
        var table = answer.parentNode.parentNode.parentNode;
        table.removeChild(pAnswer);
//    console.log('pAnswer');
//    console.log(pAnswer);
//
//    console.log('table');






    }

    function deleteQuestion(id) {
        console.log('del: ' + id);

        var elem = document.getElementById(id);

        var operandChild = elem.parentNode.parentNode.parentNode;
        var operandParent = operandChild.parentNode;

        console.log(operandChild);
        console.log(operandParent);


        operandParent.removeChild(operandChild);


    }



    function loadingTest(ltest) {


        for (var i = 0; i < ltest.questions.length; i++) {
            //https://doctrado-sviasy.rhcloud.com/test?course=bd325b1e-5541-4906-bbaa-fe3e3275fb81

            addTest(ltest.questions[i].question, ltest.questions[i].numeric, ltest.questions[i].answers);


        }
    }

    function loadTest(json) {
        var object = JSON.parse(json);
        var toselect = [];

        for (var i = 0; i < object.length; i++) {


            var inputView = "";
            inputView += "<li id = \"question-list-" + i + "\">";
            inputView += "                <div class=\"collapsible-header center center-align\">Вопрос<\/div>";
            inputView += "                <div class=\"collapsible-body\">";
            inputView += "   <div class=\"row col s12 center center-align\">";
            inputView += "<a href=\"javascript:void(0);\" id = \"del-" + i + "\" onclick=\"deleteQuestion(this.id);\" class=\"btn col s12 center center-align red darken-3\">Удалить вопрос<\/a>";
            inputView += "                        <\/div>";
            inputView += "                    <div class=\"row\">";
            inputView += "                        <div class=\"input-field col s12\">";
            inputView += "                            <input id=\"question-name-" + i + "\" type=\"text\" class=\"validate\" value=\"" + object[i].name + "\">";
            inputView += "                            <label for=\"question-name-" + i + "\">Вопрос<\/label>";
            inputView += "                        <\/div>";
            inputView += "                    <\/div>";
            inputView += "";
            inputView += "                    <table class=\"striped responsive-table centered\" id=\"answer-table-" + i + "\">";
            inputView += "                        <thead>";
            inputView += "                        <tr>";
            inputView += "                            <th data-field=\"answer-name\">Ответ<\/th>";
            inputView += "                            <th data-field=\"answer-is-true\">Правильный ответ<\/th> <th data-field=\"del\">&nbsp;<\/th>";
            inputView += "";
            inputView += "                        <\/tr>";

            for (var j = 0; j < object[i].answers.length; j++) {

                inputView += '<tr><td><div class="left-align  input-field col s12"><input id="answer-name-' + j + '" type="text" value="' + object[i].answers[j].name + '" class="validate"><label for="answer-name-' + j + '">Ответ</label></div></td><td><div class=" switch center center-align"><label>Нет<input';
                inputView += ' id = "isTrue-' + j + '-' + i + '" type="checkbox"><span class="lever"></span>Да</label></div></td><td><a href=\"javascript:void(0);\" id = \"del-a-' + i + j + '\" onclick=\"deleteAnswer(this.id);\" class=\"btn col s12 center center-align red darken-3\"><i class=\"material-icons\">delete</i></a><\/a></td></tr>';
                if (object[i].answers[j].isTrue) {
                    toselect.push('isTrue-' + j + '-' + i + '');
                }
            }

            inputView += "                        <\/thead>";
            inputView += "                     ";
            inputView += "               ";
            inputView += "                    <\/table>";
            inputView += "                    <div class=\"col s12 row\" id=\"" + i + "\" href = \"javascript:void(0);\" onclick = \"addAnswer(this.id);\"> <a class=\"btn col s12 center center-align\">+<\/a><\/div>";
            inputView += "                <\/div>";
            inputView += "            <\/li>";


            $("#test-container ul").append(inputView);

            for (var z = 0; z < toselect.length; z++) {
                var input = document.getElementById(toselect[z]);
                input.checked = true;
            }

            Materialize.updateTextFields();


        }

    }


    function addTest() {


        var test_container = document.getElementById('test-ul');
        var counter = test_container.childElementCount + 1;

        var inputView = "";
        inputView += "<li id = \"question-list-" + counter + "\">";
        inputView += "                <div class=\"collapsible-header center center-align\">Вопрос<\/div>";
        inputView += "                <div class=\"collapsible-body\">";
        inputView += "   <div class=\"row col s12 center center-align\">";
        inputView += "<a href=\"javascript:void(0);\" id = \"del-" + counter + "\" onclick=\"deleteQuestion(this.id);\" class=\"btn col s12 center center-align red darken-3\">Удалить вопрос<\/a>";
        inputView += "                    <\/div>";
        inputView += "                    <div class=\"row\">";
        inputView += "                        <div class=\"input-field col s12\">";
        inputView += "                            <input id=\"question-name-" + counter + "\" type=\"text\" class=\"validate\" >";
        inputView += "                            <label for=\"question-name-" + counter + "\">Вопрос<\/label>";
        inputView += "                        <\/div>";
        inputView += "                    <\/div>";
        inputView += "";
        inputView += "                    <table class=\"striped responsive-table centered\" id=\"answer-table-" + counter + "\">";
        inputView += "                        <thead>";
        inputView += "                        <tr>";
        inputView += "                            <th data-field=\"answer-name\">Ответ<\/th>";
        inputView += "                            <th data-field=\"answer-is-true\">Правильный ответ<\/th> <th data-field=\"del\">&nbsp;<\/th>";
        inputView += "";
        inputView += "                        <\/tr>";
        inputView += "                        <\/thead>";
        inputView += "                     ";
        inputView += "               ";
        inputView += "                    <\/table>";
        inputView += "                    <div class=\"col s12 row\" id=\"" + counter + "\" href = \"javascript:void(0);\" onclick = \"addAnswer(this.id);\"> <a class=\"btn col s12 center center-align\">+<\/a><\/div>";
        inputView += "                <\/div>";
        inputView += "            <\/li>";

        $("#test-container ul").append(inputView);


        // var ul = document.getElementById('test-ul');


        //console.log( ul.innerHTML);
        //toJSON();

    }

    function toJSON() {

        //   var ul = document.getElementById('test-ul');


        var retVal = [];


        $('ul li').each(function (i) {
            var Question = {};


            var questionID = $(this).attr("id");
            var questionName = "";


            console.log(questionID);

            var input = $('#' + questionID + " div:last-child div:first-child ~ div div:last-child input:first-child");
            //  var inputA = $('#'+questionID+ " div:last-child div:first-child").next().lastChild.find("input");
            Question.name = input.val();
            console.log(input.val());
            //    console.log(inputA.a)
            var myTableArray = [];
            var Answers = $('#' + questionID + " div:last-child table tr");
            $('#' + questionID + " div:last-child table tr").each(function () {

                var arrayOfThisRow = {};
                var tableData = $(this).find('td');
                var counter = 1;
                tableData.each(function () {

                    if (counter == 1) {
                        counter += 1;

                        arrayOfThisRow.name = $(this).find('input').val();


                    } else {
                        var elem = $(this).find('input');

                        arrayOfThisRow.isTrue = elem.is(":checked");

                    }

                });
                if (!isEmpty(arrayOfThisRow)) {
                    myTableArray.push(arrayOfThisRow);
                }


                // console.log(myTableArray);


            });

            //  console.log(Answers);

            Question.answers = myTableArray;
            retVal.push(Question);


        });

        console.log(JSON.stringify(retVal));


    }

    var hasOwnProperty = Object.prototype.hasOwnProperty;

    function isEmpty(obj) {

        // null and undefined are "empty"
        if (obj == null) return true;

        // Assume if it has a length property with a non-zero value
        // that that property is correct.
        if (obj.length > 0)    return false;
        if (obj.length === 0)  return true;

        // If it isn't an object at this point
        // it is empty, but it can't be anything *but* empty
        // Is it empty?  Depends on your application.
        if (typeof obj !== "object") return true;

        // Otherwise, does it have any properties of its own?
        // Note that this doesn't handle
        // toString and valueOf enumeration bugs in IE < 9
        for (var key in obj) {
            if (hasOwnProperty.call(obj, key)) return false;
        }

        return true;
    }

    function addAnswer(sender_id) {
        //  alert(sender_id);

        var table = document.getElementById('answer-table-' + sender_id);
        var counter = table.rows.length;
        $('#' + table.id + ' tr:last').after('<tr><td><div class="left-align  input-field col s12"><input id="answer-name-' + counter + '" type="text" class="validate"><label for="answer-name-' + counter + '">Ответ</label></div></td><td><div class=" switch center center-align"><label>Нет<input type="checkbox"><span class="lever"></span>Да</label></div></td><td><a href=\"javascript:void(0);\" id = \"del-a-' + counter + '\" onclick=\"deleteAnswer(this.id);\" class=\"btn col s12 center center-align red darken-3\"><i class=\"material-icons\">delete</i></a><\/a></td></tr>');


    }


    $(document).ready(function () {
        // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
        $('.modal').modal();

    });

    function addTheme() {

        $.ajax({
            type: 'post',
            url: 'https://doctrado-sviasy.rhcloud.com/addCourse',
            data: {
                parent: '<%=id%>',
                number: '<%=themes.size()+1%>'
            },
            success: function (data) {
                window.location.reload();
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
    <% if(iAmAuthor){
        %><%="  tinymce.init({\n" +
"        selector: 'textarea',\n" +
"        height: 500,\n" +
"  entity_encoding : \"utf-8\","+
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




    $( window ).load(function(){

        <%
      for(int it=0;it<themes.size();it++){
           sun.misc.BASE64Decoder decoder = new sun.misc.BASE64Decoder();
    %>
        tinymce.get('content<%= themes.get(it).get(4) %>').setContent("<%= StrFormatter.forJSON(new String(decoder.decodeBuffer(themes.get(it).get(2)),"UTF-8"))%>");

        <%
      }
        %>
    });


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
             ", id :  \""+themes.get(i).get(0)+
"            \"}, " +
"            success: function (data) {\n" +
"\n"           %> if(data=="0"){  Materialize.toast('Изменения успешно сохранены', 4000, 'rounded'); } <%=
"            }\n" +
"        });\n" +
"    }\n" %>


    function del<%=themes.get(i).get(4)%>() {
        $.ajax({
            type: 'post',
            url:'https://doctrado-sviasy.rhcloud.com/deleteTheme',
            data:{
                id:'<%=themes.get(i).get(0)%>',
                parent:'<%=id%>',
                number:'<%=themes.get(i).get(4)%>'

            },
            success: function (data) {
                if(data==0){

                    window.location.reload();

                }
            }

        });
    }


    <%





            }



    }
    %>


    function closeTest() {

        $('#test-dialog').modal('close');
        Materialize.toast("Изменения успешно сохранены")

    }


    function wait(ms) {
        var start = new Date().getTime();
        var end = start;
        while (end < start + ms) {
            end = new Date().getTime();
        }
    }

</script>

3
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

