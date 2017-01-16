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
            <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
        </div>
    </nav>
</div>
<br>


<div class="row">

    <div class="col s4">

        <img class="col offset-s4 s4 center center-align" src="../img/camera.gif">
    </div>

    <div class="col s4">

            <h5 class="center-align"> Леша Влад Петров </h5>
            <h5 class="center-align"> Дата рождения: 23.12.1991 </h5>
            <h5 class="center-align"> Преподавательский опыт: 100 </h5>

    </div>

    <div class="col s4">
        <div class="row">
       <p> <a  class="waves-effect col s12 waves-light btn disabled">Преподователь</a>  </p>

            <p> <a class="waves-effect col s12 waves-light green btn">Подробнее</a>  </p>

         <p>   <a class="waves-effect col s12 waves-light orange btn">Ваша статистика</a>  </p>
        </div>

    </div>


</div>
<div class="row">

    <div class="row col s10 push-s1">

        <p> <a  class="waves-effect col s4 waves-light btn">Созданные курсы<span class="badge white">0</span></a>  </p>

        <p> <a class="waves-effect col s4 waves-light green btn">Купленые курсы</a> <span class="badge white">0</span> </p>

        <p> <a class="waves-effect col s4 waves-light orange btn">Оповещения</a> <span class="badge white">0</span> </p>

    </div>

</div>

<div class="row">

    <div class="col s4 col push-s4 center-align">
        <a class="waves-effect col s12 waves-light orange btn">Создать курс</a>
    </div>


</div>
<div class="row">

    <div class="col s4 col push-s4 center-align">
        <h3> Ваши курсы: </h3>
    </div>


</div>


<div class="container">



    <div class="row">



        <div class="col s6 m12 l4">
            <div class="row">
                <div class="col s12 m12 l12">
                    <div class="card col s12 m12">
                        <div class="card-image">
                            <img src="https://github.com/metalll/tochka-sviasy-resources-images-/blob/master/GSM/Nokia3310.jpg?raw=true"> </div> <div class="card-content valign-wrapper"> <span class="card-title blue-text left left-align col s8 m8 l8 text-darken-2">Nokia 3310</span><hr>
                        <p class="right-align green-text right col s4 m4 l4">Есть в наличии</p></div>
                        <div class="card-action valign-wrapper">
                            <p class=" green-text left left-align col s7 m7 l7 ">Уточняйте цену</p>
                            <a href="./MOREphone?id=1111&amp;category=GSM" class="waves-effect right-align right waves-light btn blue  col s5 m5 l5">подробнее</a>
                        </div></div></div></div></div>   <div class="col s6 m12 l4">
        <div class="row">
            <div class="col s12 m12 l12">
                <div class="card col s12 m12">
                    <div class="card-image">
                        <img src="https://github.com/metalll/tochka-sviasy-resources-images-/blob/master/CDMA_GSM/lenovoA860.jpg?raw=true"> </div> <div class="card-content valign-wrapper"> <span class="card-title blue-text left left-align col s8 m8 l8 text-darken-2">Lenovo A860</span><hr>
                    <p class="right-align green-text right col s4 m4 l4">Есть в наличии</p></div>
                    <div class="card-action valign-wrapper">
                        <p class=" green-text left left-align col s7 m7 l7 ">Уточняйте цену</p>
                        <a href="./MOREphone?id=1231&amp;category=CDMA_GSM" class="waves-effect right-align right waves-light btn blue  col s5 m5 l5">подробнее</a>
                    </div></div></div></div></div>   <div class="col s6 m12 l4">
        <div class="row">
            <div class="col s12 m12 l12">
                <div class="card col s12 m12">
                    <div class="card-image">
                        <img src="https://github.com/metalll/tochka-sviasy-resources-images-/blob/master/CDMA_GSM/HuaweiY635.jpg?raw=true"> </div> <div class="card-content valign-wrapper"> <span class="card-title blue-text left left-align col s8 m8 l8 text-darken-2">Huawei Y635</span><hr>
                    <p class="right-align green-text right col s4 m4 l4">Есть в наличии</p></div>
                    <div class="card-action valign-wrapper">
                        <p class=" green-text left left-align col s7 m7 l7 ">Уточняйте цену</p>
                        <a href="./MOREphone?id=1263&amp;category=CDMA_GSM" class="waves-effect right-align right waves-light btn blue  col s5 m5 l5">подробнее</a>
                    </div></div></div></div></div>   <div class="col s6 m12 l4">
        <div class="row">
            <div class="col s12 m12 l12">
                <div class="card col s12 m12">
                    <div class="card-image">
                        <img src="https://github.com/metalll/tochka-sviasy-resources-images-/blob/master/CDMA_GSM/HuaweiP8Lite.jpg?raw=true"> </div> <div class="card-content valign-wrapper"> <span class="card-title blue-text left left-align col s8 m8 l8 text-darken-2">Huawei P8 lite</span><hr>
                    <p class="right-align green-text right col s4 m4 l4">Есть в наличии</p></div>
                    <div class="card-action valign-wrapper">
                        <p class=" green-text left left-align col s7 m7 l7 ">Уточняйте цену</p>
                        <a href="./MOREphone?id=1264&amp;category=CDMA_GSM" class="waves-effect right-align right waves-light btn blue  col s5 m5 l5">подробнее</a>
                    </div></div></div></div></div>   <div class="col s6 m12 l4">
        <div class="row">
            <div class="col s12 m12 l12">
                <div class="card col s12 m12">
                    <div class="card-image">
                        <img src="https://github.com/metalll/tochka-sviasy-resources-images-/blob/master/CDMA_GSM/HuaweiB199.jpg?raw=true"> </div> <div class="card-content valign-wrapper"> <span class="card-title blue-text left left-align col s8 m8 l8 text-darken-2">Huawei B199</span><hr>
                    <p class="right-align green-text right col s4 m4 l4">Есть в наличии</p></div>
                    <div class="card-action valign-wrapper">
                        <p class=" green-text left left-align col s7 m7 l7 ">Уточняйте цену</p>
                        <a href="./MOREphone?id=1265&amp;category=CDMA_GSM" class="waves-effect right-align right waves-light btn blue  col s5 m5 l5">подробнее</a>
                    </div></div></div></div></div>   <div class="col s6 m12 l4">
        <div class="row">
            <div class="col s12 m12 l12">
                <div class="card col s12 m12">
                    <div class="card-image">
                        <img src="https://github.com/metalll/tochka-sviasy-resources-images-/blob/master/CDMA_GSM/HuaweiHonor4C.jpg?raw=true"> </div> <div class="card-content valign-wrapper"> <span class="card-title blue-text left left-align col s8 m8 l8 text-darken-2">Huawei Honor 4C
</span><hr>
                    <p class="right-align green-text right col s4 m4 l4">Есть в наличии</p></div>
                    <div class="card-action valign-wrapper">
                        <p class=" green-text left left-align col s7 m7 l7 ">Уточняйте цену</p>
                        <a href="./MOREphone?id=1266&amp;category=CDMA_GSM" class="waves-effect right-align right waves-light btn blue  col s5 m5 l5">подробнее</a>
                    </div></div></div></div></div>   <div class="col s6 m12 l4">
        <div class="row">
            <div class="col s12 m12 l12">
                <div class="card col s12 m12">
                    <div class="card-image">
                        <img src="https://github.com/metalll/tochka-sviasy-resources-images-/blob/master/CDMA/motoG.jpg?raw=true"> </div> <div class="card-content valign-wrapper"> <span class="card-title blue-text left left-align col s8 m8 l8 text-darken-2">Motorola Moto G</span><hr>
                    <p class="right-align green-text right col s4 m4 l4">Есть в наличии</p></div>
                    <div class="card-action valign-wrapper">
                        <p class=" green-text left left-align col s7 m7 l7 ">1600 грн</p>
                        <a href="./MOREphone?id=1267&amp;category=CDMA" class="waves-effect right-align right waves-light btn blue  col s5 m5 l5">подробнее</a>
                    </div></div></div></div></div>   <div class="col s6 m12 l4">
        <div class="row">
            <div class="col s12 m12 l12">
                <div class="card col s12 m12">
                    <div class="card-image">
                        <img src="https://github.com/metalll/tochka-sviasy-resources-images-/blob/master/Mi-Fi/LC11.jpg?raw=true"> </div> <div class="card-content valign-wrapper"> <span class="card-title blue-text left left-align col s8 m8 l8 text-darken-2">Samsung LC11</span><hr>
                    <p class="right-align green-text right col s4 m4 l4">Есть в наличии</p></div>
                    <div class="card-action valign-wrapper">
                        <p class=" green-text left left-align col s7 m7 l7 ">750 грн</p>
                        <a href="./MOREphone?id=1268&amp;category=MIFI" class="waves-effect right-align right waves-light btn blue  col s5 m5 l5">подробнее</a>
                    </div></div></div></div></div>   <div class="col s6 m12 l4">
        <div class="row">
            <div class="col s12 m12 l12">
                <div class="card col s12 m12">
                    <div class="card-image">
                        <img src="https://github.com/metalll/tochka-sviasy-resources-images-/blob/master/Modem/Novatel%20U720.jpg?raw=true"> </div> <div class="card-content valign-wrapper"> <span class="card-title blue-text left left-align col s8 m8 l8 text-darken-2">Novatel U720</span><hr>
                    <p class="right-align green-text right col s4 m4 l4">Нет в наличии</p></div>
                    <div class="card-action valign-wrapper">
                        <p class=" green-text left left-align col s7 m7 l7 ">Уточняйте цену</p>
                        <a href="./MOREphone?id=1269&amp;category=MODEM" class="waves-effect right-align right waves-light btn blue  col s5 m5 l5">подробнее</a>
                    </div></div></div></div></div>   <div class="col s6 m12 l4">
        <div class="row">
            <div class="col s12 m12 l12">
                <div class="card col s12 m12">
                    <div class="card-image">
                        <img src="https://github.com/metalll/tochka-sviasy-resources-images-/blob/master/CDMA_GSM/Motorola%20Moto%20E%20XT1528.png?raw=true"> </div> <div class="card-content valign-wrapper"> <span class="card-title blue-text left left-align col s8 m8 l8 text-darken-2">Motorola Moto E</span><hr>
                    <p class="right-align green-text right col s4 m4 l4">Есть в наличии</p></div>
                    <div class="card-action valign-wrapper">
                        <p class=" green-text left left-align col s7 m7 l7 ">Уточняйте цену</p>
                        <a href="./MOREphone?id=1270&amp;category=CDMA_GSM" class="waves-effect right-align right waves-light btn blue  col s5 m5 l5">подробнее</a>
                    </div></div></div></div></div>   <div class="col s6 m12 l4">
        <div class="row">
            <div class="col s12 m12 l12">
                <div class="card col s12 m12">
                    <div class="card-image">
                        <img src="https://github.com/metalll/tochka-sviasy-resources-images-/blob/master/CDMA_GSM/Xiaomi%20RedMi%203%2016Gb.png?raw=true"> </div> <div class="card-content valign-wrapper"> <span class="card-title blue-text left left-align col s8 m8 l8 text-darken-2">Xiaomi RedMi 3 16Gb</span><hr>
                    <p class="right-align green-text right col s4 m4 l4">Есть в наличии</p></div>
                    <div class="card-action valign-wrapper">
                        <p class=" green-text left left-align col s7 m7 l7 ">Уточняйте цену</p>
                        <a href="./MOREphone?id=1271&amp;category=CDMA_GSM" class="waves-effect right-align right waves-light btn blue  col s5 m5 l5">подробнее</a>
                    </div></div></div></div></div>   <div class="col s6 m12 l4">
        <div class="row">
            <div class="col s12 m12 l12">
                <div class="card col s12 m12">
                    <div class="card-image">
                        <img src="https://github.com/metalll/tochka-sviasy-resources-images-/blob/master/ETC/Xiaomi%20Power%20Bank%2016000%20mAh.png?raw=true"> </div> <div class="card-content valign-wrapper"> <span class="card-title blue-text left left-align col s8 m8 l8 text-darken-2">Xiaomi Power Bank</span><hr>
                    <p class="right-align green-text right col s4 m4 l4">Есть в наличии</p></div>
                    <div class="card-action valign-wrapper">
                        <p class=" green-text left left-align col s7 m7 l7 ">Уточняйте цену</p>
                        <a href="./MOREphone?id=1272&amp;category=ETC" class="waves-effect right-align right waves-light btn blue  col s5 m5 l5">подробнее</a>
                    </div></div></div></div></div>   <div class="col s6 m12 l4">
        <div class="row">
            <div class="col s12 m12 l12">
                <div class="card col s12 m12">
                    <div class="card-image">
                        <img src="https://github.com/metalll/tochka-sviasy-resources-images-/blob/master/CDMA_GSM/Xiaomi%20Mi%204c%2032GB.png?raw=true"> </div> <div class="card-content valign-wrapper"> <span class="card-title blue-text left left-align col s8 m8 l8 text-darken-2">Xiaomi Mi 4c 32GB</span><hr>
                    <p class="right-align green-text right col s4 m4 l4">Есть в наличии</p></div>
                    <div class="card-action valign-wrapper">
                        <p class=" green-text left left-align col s7 m7 l7 ">Уточняйте цену</p>
                        <a href="./MOREphone?id=1273&amp;category=CDMA_GSM" class="waves-effect right-align right waves-light btn blue  col s5 m5 l5">подробнее</a>
                    </div></div></div></div></div>   <div class="col s6 m12 l4">
        <div class="row">
            <div class="col s12 m12 l12">
                <div class="card col s12 m12">
                    <div class="card-image">
                        <img src="https://github.com/metalll/tochka-sviasy-resources-images-/blob/master/CDMA_GSM/Sonim%20Discovery%20A12.png?raw=true"> </div> <div class="card-content valign-wrapper"> <span class="card-title blue-text left left-align col s8 m8 l8 text-darken-2">Discovery A12</span><hr>
                    <p class="right-align green-text right col s4 m4 l4">Есть в наличии</p></div>
                    <div class="card-action valign-wrapper">
                        <p class=" green-text left left-align col s7 m7 l7 ">Уточняйте цену</p>
                        <a href="./MOREphone?id=1274&amp;category=CDMA_GSM" class="waves-effect right-align right waves-light btn blue  col s5 m5 l5">подробнее</a>
                    </div></div></div></div></div>   <div class="col s6 m12 l4">
        <div class="row">
            <div class="col s12 m12 l12">
                <div class="card col s12 m12">
                    <div class="card-image">
                        <img src="https://github.com/metalll/tochka-sviasy-resources-images-/blob/master/CDMA/ZTE%20Warp%20N9101%20CDMA%20Rev.B.png?raw=true"> </div> <div class="card-content valign-wrapper"> <span class="card-title blue-text left left-align col s8 m8 l8 text-darken-2">ZTE Warp N9101</span><hr>
                    <p class="right-align green-text right col s4 m4 l4">Есть в наличии</p></div>
                    <div class="card-action valign-wrapper">
                        <p class=" green-text left left-align col s7 m7 l7 ">Уточняйте цену</p>
                        <a href="./MOREphone?id=1275&amp;category=CDMA" class="waves-effect right-align right waves-light btn blue  col s5 m5 l5">подробнее</a>
                    </div></div></div></div></div>   <div class="col s6 m12 l4">
        <div class="row">
            <div class="col s12 m12 l12">
                <div class="card col s12 m12">
                    <div class="card-image">
                        <img src="https://github.com/metalll/tochka-sviasy-resources-images-/blob/master/Mi-Fi/Novatel%204620L%20FRB.png?raw=true"> </div> <div class="card-content valign-wrapper"> <span class="card-title blue-text left left-align col s8 m8 l8 text-darken-2">Novatel 4620L FRB</span><hr>
                    <p class="right-align green-text right col s4 m4 l4">Есть в наличии</p></div>
                    <div class="card-action valign-wrapper">
                        <p class=" green-text left left-align col s7 m7 l7 ">Уточняйте цену</p>
                        <a href="./MOREphone?id=1276&amp;category=MIFI" class="waves-effect right-align right waves-light btn blue  col s5 m5 l5">подробнее</a>
                    </div></div></div></div></div>   <div class="col s6 m12 l4">
        <div class="row">
            <div class="col s12 m12 l12">
                <div class="card col s12 m12">
                    <div class="card-image">
                        <img src="https://github.com/metalll/tochka-sviasy-resources-images-/blob/master/CDMA_GSM/Xiaomi%20Redmi%202%20Pro%2016GB%20white.png?raw=true"> </div> <div class="card-content valign-wrapper"> <span class="card-title blue-text left left-align col s8 m8 l8 text-darken-2">Redmi 2 Pro</span><hr>
                    <p class="right-align green-text right col s4 m4 l4">Есть в наличии</p></div>
                    <div class="card-action valign-wrapper">
                        <p class=" green-text left left-align col s7 m7 l7 ">Уточняйте цену</p>
                        <a href="./MOREphone?id=1277&amp;category=CDMA_GSM" class="waves-effect right-align right waves-light btn blue  col s5 m5 l5">подробнее</a>
                    </div></div></div></div></div>   <div class="col s6 m12 l4">
        <div class="row">
            <div class="col s12 m12 l12">
                <div class="card col s12 m12">
                    <div class="card-image">
                        <img src="https://github.com/metalll/tochka-sviasy-resources-images-/blob/master/CDMA_GSM/Lenovo%20A2580%20CDMA%2BGSM%20black.png?raw=true"> </div> <div class="card-content valign-wrapper"> <span class="card-title blue-text left left-align col s8 m8 l8 text-darken-2">Lenovo A2580</span><hr>
                    <p class="right-align green-text right col s4 m4 l4">Есть в наличии</p></div>
                    <div class="card-action valign-wrapper">
                        <p class=" green-text left left-align col s7 m7 l7 ">Уточняйте цену</p>
                        <a href="./MOREphone?id=1278&amp;category=CDMA_GSM" class="waves-effect right-align right waves-light btn blue  col s5 m5 l5">подробнее</a>
                    </div></div></div></div></div>   <div class="col s6 m12 l4">
        <div class="row">
            <div class="col s12 m12 l12">
                <div class="card col s12 m12">
                    <div class="card-image">
                        <img src="https://github.com/metalll/tochka-sviasy-resources-images-/blob/master/CDMA/Samsung%20Gusto%203%20CDMA.png?raw=true"> </div> <div class="card-content valign-wrapper"> <span class="card-title blue-text left left-align col s8 m8 l8 text-darken-2">Samsung Gusto 3</span><hr>
                    <p class="right-align green-text right col s4 m4 l4">Есть в наличии</p></div>
                    <div class="card-action valign-wrapper">
                        <p class=" green-text left left-align col s7 m7 l7 ">Уточняйте цену</p>
                        <a href="./MOREphone?id=1279&amp;category=CDMA" class="waves-effect right-align right waves-light btn blue  col s5 m5 l5">подробнее</a>
                    </div></div></div></div></div>   <div class="col s6 m12 l4">
        <div class="row">
            <div class="col s12 m12 l12">
                <div class="card col s12 m12">
                    <div class="card-image">
                        <img src="https://github.com/metalll/tochka-sviasy-resources-images-/blob/master/CDMA_GSM/Lenovo%20K30E%20CDMA%2BGSM%20white.png?raw=true"> </div> <div class="card-content valign-wrapper"> <span class="card-title blue-text left left-align col s8 m8 l8 text-darken-2">Lenovo K30E</span><hr>
                    <p class="right-align green-text right col s4 m4 l4">Есть в наличии</p></div>
                    <div class="card-action valign-wrapper">
                        <p class=" green-text left left-align col s7 m7 l7 ">Уточняйте цену</p>
                        <a href="./MOREphone?id=1280&amp;category=CDMA_GSM" class="waves-effect right-align right waves-light btn blue  col s5 m5 l5">подробнее</a>
                    </div></div></div></div></div>

    </div>
</div>

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
