<%--
  Created by IntelliJ IDEA.
  User: NSD
  Date: 15.12.16
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="csrf-token" content="KWdV7XnA38ecGY0F6TwQXU4uPuxaPnh4W8vsN8u8" />
    <title>Doctrado</title>
    <link rel="stylesheet" href="css/app.css">
    <link rel="shortcut icon" href="https://doctrado.me/img/favicon.ico">
    <style>
        .cancel-popup-wrapper{display:none;position:absolute;top:0;left:0;height:100%;width:100%;z-index:9998}.cancel-popup-wrapper .cancel-popup-bg{position:absolute;top:0;left:0;height:100%;width:100%;background:rgba(0,0,0,.75)}.cancel-popup-wrapper .cancel-popup{position:absolute;left:50%;top:50%;-webkit-transform:translate(-50%,-50%);transform:translate(-50%,-50%);z-index:9999;padding:1.875rem 2.5rem;background:#efefef;text-align:center}.cancel-popup-wrapper .cancel-popup select{font-family:Panton,sans-serif}.cancel-popup-wrapper .cancel-popup textarea{min-height:200px}.cancel-popup-wrapper .cancel-popup-button{font-family:Panton,sans-serif;padding:.625rem 2.5rem;display:inline-block;border:1px solid #000;text-transform:uppercase;font-size:.875rem;margin:0 .625rem}.cancel-popup-wrapper .cancel-popup-button:focus,.cancel-popup-wrapper .cancel-popup-button:hover{background:#000;color:#fff}
    </style>
</head>
<body>
<div class="cancel-popup-wrapper">
    <div class="cancel-popup-bg"></div>
    <div class="cancel-popup">
        <p class="cancel-popup-text">Выберите причину отказа</p>
        <select id="cancel-popup-select">
            <option>Неправильные документы</option>
            <option>Не все документы</option>
            <option>Нечитаемые документы</option>
        </select>
        <p class="cancel-popup-text">Опишите более подробно</p>
        <textarea id="cancel-popup-reason"></textarea>
        <button class="cancel-popup-button" id="cancel-popup-ok">Ок</button>
        <button class="cancel-popup-button" id="cancel-popup-close">Закрыть</button>
    </div>
</div>
<section class="dashboard">
    <div class="show-for-large">
        <nav class="header__top-bar">
            <div class="row collapse">
                <div class="small-12 columns">
                    <div class="title-bar" data-responsive-toggle="main-menu" data-hide-for="large">
                        <button class="menu-icon" type="button" data-toggle></button>
                    </div>
                    <div class="top-bar" id="main-menu">
                        <div class="top-bar-left">
                            <h1 class="site-title">
                                <a href="/">Doctrado</a>
                            </h1>
                        </div>
                        <div class="top-bar-right">
                            <ul class="menu vertical large-horizontal">
                                <li>
                                    <a class="menu-elem" href="./#about">О проекте</a>
                                </li>
                                <li>
                                    <a class="menu-elem" href="./#capabilities">Возможности</a>
                                </li>
                                <li>
                                    <a class="menu-elem" href="./certificates">Сертификаты</a>
                                </li>
                                <li>
                                    <a class="menu-elem" href="./webinar">Вебинары</a>
                                </li>
                                <li>
                                    <a class="menu-elem" href="./#courses">Курсы</a>
                                </li>
                                <li>
                                    <a class="menu-elem" href="./#contacts">Контакты</a>
                                </li>
                            </ul>
                        </div>

                    </div>
                </div>
            </div>
        </nav>
    </div>


    <div class="row expanded collapse">
        <div class="small-12 medium-1 columns hide-for-large">
            <div class="mobile-dash-nav">
                <div class="dashboard__nav-btn">
                    <i id="dashboard-btn" class="fa fa-bars" aria-hidden="true"></i>
                </div>

                <div id="dashboard__nav" class="dashboard__nav" style='min-height: 100%;height:auto;'>

                    <h1><a href="/" class="site-title">Doctrado</a></h1>

                    <h2 class="dashboard__nav-title">Панель управления</h2>

                    <ul class="dashboard__menu">
                        <li class="dashboard__menu-elem active" data-content="dashboard__content-1">Выплаты</li>
                        <li class="dashboard__menu-elem" data-content="dashboard__content-2">Статистика</li>
                        <li class="dashboard__menu-elem" data-content="dashboard__content-3">Новые преподаватели</li>
                        <li class="dashboard__menu-elem" data-content="dashboard__content-4">Управление курсами</li>
                        <li class="dashboard__menu-elem" data-content="dashboard__content-5">Управление сертификатами</li>
                        <li class="dashboard__menu-elem" data-content="dashboard__content-6">Управление категориями</li>
                    </ul>

                    <a href="/" class="exit-btn">Покинуть страницу</a>
                </div>
            </div>
        </div>

        <div class="large-3 columns show-for-large">
            <div class="dashboard__nav">
                <h2 class="dashboard__nav-title">Панель управления</h2>

                <ul class="dashboard__menu">
                    <li class="dashboard__menu-elem active" data-content="dashboard__content-1">Выплаты</li>
                    <li class="dashboard__menu-elem" data-content="dashboard__content-2">Статистика</li>
                    <li class="dashboard__menu-elem" data-content="dashboard__content-3">Новые преподаватели</li>
                    <li class="dashboard__menu-elem" data-content="dashboard__content-4">Управление курсами</li>
                    <li class="dashboard__menu-elem" data-content="dashboard__content-5">Управление сертификатами</li>
                    <li class="dashboard__menu-elem" data-content="dashboard__content-6">Управление категориями</li>
                </ul>

                <a href="/" class="exit-btn">Покинуть страницу</a>

            </div>
        </div>

        <div class="small-12 medium-11 large-9 columns">
            <div class="dashboard__content" id="dashboard__content-1">
                <h3 class="dashboard__title">Выплаты преподавателям</h3>
                <p class="dashboard__subtitle">Преподаватели, их курсы и суммы на которые их приобрели</p>
                <div class="statistic-by-date">
                    <p>Статистика за:</p>
                    <select id="month-select" style="width: 100px;">
                        <option value="01">Январь</option>
                        <option value="02">Февраль</option>
                        <option value="03">Март</option>
                        <option value="04">Апрель</option>
                        <option value="05">Май</option>
                        <option value="06">Июнь</option>
                        <option value="07">Июль</option>
                        <option value="08">Август</option>
                        <option value="09">Сентябрь</option>
                        <option value="10">Октябрь</option>
                        <option value="11">Ноябрь</option>
                        <option value="12">Декабрь</option>
                    </select>
                    <select id="year-select" style="width: 70px;">
                        <option selected>2016</option>
                    </select>
                </div>
                <table class="dashboard__table" id="payouts_table">
                    <thead>
                    <tr>
                        <th class="dashboard__table-title">
                            Преподаватель
                        </th>
                        <th class="dashboard__table-title">
                            Курс
                        </th>
                        <th class="dashboard__table-title">
                            Сумма продаж
                        </th>
                        <th class="dashboard__table-title">
                            Общий заработок
                        </th>
                    </tr>
                    </thead>
                    <tr class="payouts_tr">
                        <td style="text-align: center;" rowspan="2"><a class="dashboard-url" href='profile/20'>Илья Лупоносов</a><br><br>Номер карты:<br>2456548956545654546</td>
                        <td style="text-align: center;word-break: break-all;">Пожарно-технический минимум </td>
                        <td style="text-align: center;">0 грн.</td>
                        <td style="text-align: center;" rowspan="2">0 грн.</td>
                    </tr>
                    <tr class="payouts_tr">
                        <td style="text-align: center;word-break: break-word;">огнетушитель</td>
                        <td style="text-align: center;">0 грн.</td>
                    </tr>
                    <tr class="payouts_tr">
                        <td style="text-align: center;" rowspan="2"><a class="dashboard-url" href='profile/22'>Анна  Гаман</a><br><br>Номер карты:<br>4402711007075615</td>
                        <td style="text-align: center;word-break: break-all;">рмптм</td>
                        <td style="text-align: center;">0 грн.</td>
                        <td style="text-align: center;" rowspan="2">0 грн.</td>
                    </tr>
                    <tr class="payouts_tr">
                        <td style="text-align: center;word-break: break-word;">Охорона праці</td>
                        <td style="text-align: center;">0 грн.</td>
                    </tr>
                    <tr class="payouts_tr">
                        <td style="text-align: center;" rowspan="4"><a class="dashboard-url" href='profile/27'>Виктория Козаченко</a><br><br>Номер карты:<br>55678099977</td>
                        <td style="text-align: center;word-break: break-all;">Здания и сооружения</td>
                        <td style="text-align: center;">0 грн.</td>
                        <td style="text-align: center;" rowspan="4">0 грн.</td>
                    </tr>
                    <tr class="payouts_tr">
                        <td style="text-align: center;word-break: break-word;">Здания и сооружения. Общие требования</td>
                        <td style="text-align: center;">0 грн.</td>
                    </tr>
                    <tr class="payouts_tr">
                        <td style="text-align: center;word-break: break-word;">Охорона праці ІТР</td>
                        <td style="text-align: center;">0 грн.</td>
                    </tr>
                    <tr class="payouts_tr">
                        <td style="text-align: center;word-break: break-word;">Охорона праці під час роботи з інструментами та пристроями</td>
                        <td style="text-align: center;">0 грн.</td>
                    </tr>
                </table>
            </div>
            <div class="dashboard__content" id="dashboard__content-2">
                <h3 class="dashboard__title">Статистика</h3>
                <p class="dashboard__subtitle">Общее количество созданных курсов, количество студентов и
                    преподавателей</p>

                <table class="dashboard__table">
                    <thead>
                    <tr>
                        <th class="dashboard__table-title">
                            Всего курсов создано
                        </th>
                        <th class="dashboard__table-title">
                            Кол-во студентов
                        </th>
                        <th class="dashboard__table-title">
                            Кол-во преподавателей
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td style="text-align: center;">8</td>
                        <td style="text-align: center;">6</td>
                        <td style="text-align: center;">7</td>
                    </tr>
                    </tbody>

                </table>
            </div>
            <div class="dashboard__content" id="dashboard__content-3">
                <h3 class="dashboard__title">Новые преподаватели</h3>
                <p class="dashboard__subtitle">Список неподтвержденных преподавталей, ожидающих подтверждения</p>

                <table class="dashboard__table">
                    <thead>
                    <tr>
                        <th class="dashboard__table-title">
                            Имя преподавателя
                        </th>
                        <th class="dashboard__table-title">
                            Подтверждающие документы
                        </th>
                        <th class="dashboard__table-title">
                            Подтверждение
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
            <div class="dashboard__content" id="dashboard__content-4">
                <h3 class="dashboard__title">Управление курсами</h3>
                <p class="dashboard__subtitle">В данном разделе у Вас есть возможность управлять курсами</p>
                <div class="course-choose-wrapper">
                    <div class="row small-collapse medium-uncollapse">
                        <div class="small-12 columns">
                            <select class="course-choose" id="course-choose-courses">
                                <option value="-1" disabled="disabled" selected>Выберите курс</option>
                                <option value="course-59">Здания и сооружения</option>
                                <option value="course-62">Здания и сооружения. Общие требования</option>
                                <option value="course-53">огнетушитель</option>
                                <option value="course-58">Охорона праці</option>
                                <option value="course-63">Охорона праці ІТР</option>
                                <option value="course-64">Охорона праці під час роботи з інструментами та пристроями</option>
                                <option value="course-51">Пожарно-технический минимум </option>
                                <option value="course-55">рмптм</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="course-panel" id="course-59">
                    <div class="row small-collapse medium-uncollapse">
                        <div class="small-12 medium-4 columns dashboard-margin">
                            <div class="course-panel-button-wrapper">
                                <button onclick="location.href='course/id59'" class="course-panel-button black-button">Перейти к курсу</button>
                            </div>
                        </div>
                        <div class="small-12 medium-4 columns dashboard-margin">
                            <div class="course-panel-button-wrapper">
                                <button class="delete-course course-panel-button red-button" onclick="initDeleteCourse(59)">Удалить курс</button>
                            </div>
                        </div>
                        <div class="small-12 medium-4 columns dashboard-margin">
                            <div class="course-panel-button-wrapper">
                                <button class="course-panel-button black-button change-category-button">Задать категорию</button>
                            </div>
                        </div>
                    </div>
                    <div class="change-category-block" style="display:none;">
                        <div class="small-12 medium-8 columns">
                            <select class="change-category-select" id="change-category-select-59" style="height: auto;font-family: 'Panton', sans-serif;background: #efefef;border: 1px #000 solid;text-transform: uppercase;outline: none;">
                                <option disabled  value="35"></option>
                                <option disabled  value="11">Security</option>
                                <option disabled  value="30">Охорона праці</option>
                                {
                                <option  value="30-33">- Охорона праці ІТР</option>
                                {
                                <option  value="30-31">- Охорона праці при роботі з інструментами та пристроями</option>
                                {
                                <option  value="30-34">- Правила охорони праці під час виконання робіт на висоті</option>
                                <option disabled  value="32">Охорона праці</option>
                                <option disabled  value="24">Охорона праці ІТР</option>
                                <option disabled  value="25">ОХОРОНА ПРАЦІ ІТР</option>
                                <option disabled  value="16">Охорона праці ІТР &quot; Лакофарба &quot;</option>
                                {
                                <option  value="16-21">- Охорона праці ІТР &quot; Лакофарба&quot;</option>
                                <option disabled  value="18">Охорона праці автонавантажувачі &quot; Лакофарба&quot;</option>
                                <option disabled  value="19">Охорона праці лабораторія &quot; Лакофарба&quot;</option>
                                <option disabled  value="17">Охорона праці працівників &quot;Лакофарба&quot;</option>
                                <option disabled  value="13">Проф.тех. образование</option>
                                {
                                <option selected value="13-14">- Пожарная безопасность</option>
                                <option disabled  value="9">Прочее</option>
                                {
                                <option  value="9-10">- Другое</option>
                                <option disabled  value="37">Техника Безопасности</option>
                            </select>
                        </div>
                        <div class="small-12 medium-4 columns">
                            <button onclick="changeCategory(59)" class="course-panel-button green-button">Сохранить</button>
                        </div>
                    </div>
                    <div class="course-panel-theme-wrapper">
                        <div class="course-panel-theme-item">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-8 columns dashboard-margin">
                                    <div class="course-panel-theme">
                                        <p style="line-height: 2rem;font-size: 1rem;" class="course-panel-theme-title">1: Організація безпечної експлуатації будівель та споруд</p>
                                    </div>
                                </div>
                                <div class="small-12 medium-4 columns" style="margin-bottom: 0.625rem;">
                                    <div class="course-panel-button-wrapper">
                                        <button class="course-panel-button green-button" onclick="location.href='edit/id59?theme=0&subtheme=0'">Перейти к теме</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="course-panel-theme-item">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-8 columns dashboard-margin">
                                    <div class="course-panel-theme">
                                        <p style="line-height: 2rem;font-size: 1rem;" class="course-panel-theme-title">2: Паспортизація будівель та споруд</p>
                                    </div>
                                </div>
                                <div class="small-12 medium-4 columns" style="margin-bottom: 0.625rem;">
                                    <div class="course-panel-button-wrapper">
                                        <button class="course-panel-button green-button" onclick="location.href='edit/id59?theme=1&subtheme=0'">Перейти к теме</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="course-panel" id="course-62">
                    <div class="row small-collapse medium-uncollapse">
                        <div class="small-12 medium-4 columns dashboard-margin">
                            <div class="course-panel-button-wrapper">
                                <button onclick="location.href='course/id62'" class="course-panel-button black-button">Перейти к курсу</button>
                            </div>
                        </div>
                        <div class="small-12 medium-4 columns dashboard-margin">
                            <div class="course-panel-button-wrapper">
                                <button class="delete-course course-panel-button red-button" onclick="initDeleteCourse(62)">Удалить курс</button>
                            </div>
                        </div>
                        <div class="small-12 medium-4 columns dashboard-margin">
                            <div class="course-panel-button-wrapper">
                                <button class="course-panel-button black-button change-category-button">Задать категорию</button>
                            </div>
                        </div>
                    </div>
                    <div class="change-category-block" style="display:none;">
                        <div class="small-12 medium-8 columns">
                            <select class="change-category-select" id="change-category-select-62" style="height: auto;font-family: 'Panton', sans-serif;background: #efefef;border: 1px #000 solid;text-transform: uppercase;outline: none;">
                                <option disabled  value="35"></option>
                                <option disabled  value="11">Security</option>
                                <option disabled  value="30">Охорона праці</option>
                                {
                                <option  value="30-33">- Охорона праці ІТР</option>
                                {
                                <option  value="30-31">- Охорона праці при роботі з інструментами та пристроями</option>
                                {
                                <option  value="30-34">- Правила охорони праці під час виконання робіт на висоті</option>
                                <option disabled  value="32">Охорона праці</option>
                                <option disabled  value="24">Охорона праці ІТР</option>
                                <option disabled  value="25">ОХОРОНА ПРАЦІ ІТР</option>
                                <option disabled  value="16">Охорона праці ІТР &quot; Лакофарба &quot;</option>
                                {
                                <option  value="16-21">- Охорона праці ІТР &quot; Лакофарба&quot;</option>
                                <option disabled  value="18">Охорона праці автонавантажувачі &quot; Лакофарба&quot;</option>
                                <option disabled  value="19">Охорона праці лабораторія &quot; Лакофарба&quot;</option>
                                <option disabled  value="17">Охорона праці працівників &quot;Лакофарба&quot;</option>
                                <option disabled  value="13">Проф.тех. образование</option>
                                {
                                <option selected value="13-14">- Пожарная безопасность</option>
                                <option disabled  value="9">Прочее</option>
                                {
                                <option  value="9-10">- Другое</option>
                                <option disabled  value="37">Техника Безопасности</option>
                            </select>
                        </div>
                        <div class="small-12 medium-4 columns">
                            <button onclick="changeCategory(62)" class="course-panel-button green-button">Сохранить</button>
                        </div>
                    </div>
                    <div class="course-panel-theme-wrapper">
                        <div class="course-panel-theme-item">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-8 columns dashboard-margin">
                                    <div class="course-panel-theme">
                                        <p style="line-height: 2rem;font-size: 1rem;" class="course-panel-theme-title">1: Організація безпечної експлуатації будівель та споруд</p>
                                    </div>
                                </div>
                                <div class="small-12 medium-4 columns" style="margin-bottom: 0.625rem;">
                                    <div class="course-panel-button-wrapper">
                                        <button class="course-panel-button green-button" onclick="location.href='edit/id62?theme=0&subtheme=0'">Перейти к теме</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="course-panel" id="course-53">
                    <div class="row small-collapse medium-uncollapse">
                        <div class="small-12 medium-4 columns dashboard-margin">
                            <div class="course-panel-button-wrapper">
                                <button onclick="location.href='course/id53'" class="course-panel-button black-button">Перейти к курсу</button>
                            </div>
                        </div>
                        <div class="small-12 medium-4 columns dashboard-margin">
                            <div class="course-panel-button-wrapper">
                                <button class="delete-course course-panel-button red-button" onclick="initDeleteCourse(53)">Удалить курс</button>
                            </div>
                        </div>
                        <div class="small-12 medium-4 columns dashboard-margin">
                            <div class="course-panel-button-wrapper">
                                <button class="course-panel-button black-button change-category-button">Задать категорию</button>
                            </div>
                        </div>
                    </div>
                    <div class="change-category-block" style="display:none;">
                        <div class="small-12 medium-8 columns">
                            <select class="change-category-select" id="change-category-select-53" style="height: auto;font-family: 'Panton', sans-serif;background: #efefef;border: 1px #000 solid;text-transform: uppercase;outline: none;">
                                <option disabled  value="35"></option>
                                <option disabled  value="11">Security</option>
                                <option disabled  value="30">Охорона праці</option>
                                {
                                <option  value="30-33">- Охорона праці ІТР</option>
                                {
                                <option  value="30-31">- Охорона праці при роботі з інструментами та пристроями</option>
                                {
                                <option  value="30-34">- Правила охорони праці під час виконання робіт на висоті</option>
                                <option disabled  value="32">Охорона праці</option>
                                <option disabled  value="24">Охорона праці ІТР</option>
                                <option disabled  value="25">ОХОРОНА ПРАЦІ ІТР</option>
                                <option disabled  value="16">Охорона праці ІТР &quot; Лакофарба &quot;</option>
                                {
                                <option  value="16-21">- Охорона праці ІТР &quot; Лакофарба&quot;</option>
                                <option disabled  value="18">Охорона праці автонавантажувачі &quot; Лакофарба&quot;</option>
                                <option disabled  value="19">Охорона праці лабораторія &quot; Лакофарба&quot;</option>
                                <option disabled  value="17">Охорона праці працівників &quot;Лакофарба&quot;</option>
                                <option disabled  value="13">Проф.тех. образование</option>
                                {
                                <option selected value="13-14">- Пожарная безопасность</option>
                                <option disabled  value="9">Прочее</option>
                                {
                                <option  value="9-10">- Другое</option>
                                <option disabled  value="37">Техника Безопасности</option>
                            </select>
                        </div>
                        <div class="small-12 medium-4 columns">
                            <button onclick="changeCategory(53)" class="course-panel-button green-button">Сохранить</button>
                        </div>
                    </div>
                    <div class="course-panel-theme-wrapper">
                        <div class="course-panel-theme-item">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-8 columns dashboard-margin">
                                    <div class="course-panel-theme">
                                        <p style="line-height: 2rem;font-size: 1rem;" class="course-panel-theme-title">1: рп 5</p>
                                    </div>
                                </div>
                                <div class="small-12 medium-4 columns" style="margin-bottom: 0.625rem;">
                                    <div class="course-panel-button-wrapper">
                                        <button class="course-panel-button green-button" onclick="location.href='edit/id53?theme=0&subtheme=0'">Перейти к теме</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="course-panel-theme-item">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-8 columns dashboard-margin">
                                    <div class="course-panel-theme">
                                        <p style="line-height: 2rem;font-size: 1rem;" class="course-panel-theme-title">2: рп 6</p>
                                    </div>
                                </div>
                                <div class="small-12 medium-4 columns" style="margin-bottom: 0.625rem;">
                                    <div class="course-panel-button-wrapper">
                                        <button class="course-panel-button green-button" onclick="location.href='edit/id53?theme=1&subtheme=0'">Перейти к теме</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="course-panel-theme-item">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-8 columns dashboard-margin">
                                    <div class="course-panel-theme">
                                        <p style="line-height: 2rem;font-size: 1rem;" class="course-panel-theme-title">3: опн 7</p>
                                    </div>
                                </div>
                                <div class="small-12 medium-4 columns" style="margin-bottom: 0.625rem;">
                                    <div class="course-panel-button-wrapper">
                                        <button class="course-panel-button green-button" onclick="location.href='edit/id53?theme=2&subtheme=0'">Перейти к теме</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="course-panel" id="course-58">
                    <div class="row small-collapse medium-uncollapse">
                        <div class="small-12 medium-4 columns dashboard-margin">
                            <div class="course-panel-button-wrapper">
                                <button onclick="location.href='course/id58'" class="course-panel-button black-button">Перейти к курсу</button>
                            </div>
                        </div>
                        <div class="small-12 medium-4 columns dashboard-margin">
                            <div class="course-panel-button-wrapper">
                                <button class="delete-course course-panel-button red-button" onclick="initDeleteCourse(58)">Удалить курс</button>
                            </div>
                        </div>
                        <div class="small-12 medium-4 columns dashboard-margin">
                            <div class="course-panel-button-wrapper">
                                <button class="course-panel-button black-button change-category-button">Задать категорию</button>
                            </div>
                        </div>
                    </div>
                    <div class="change-category-block" style="display:none;">
                        <div class="small-12 medium-8 columns">
                            <select class="change-category-select" id="change-category-select-58" style="height: auto;font-family: 'Panton', sans-serif;background: #efefef;border: 1px #000 solid;text-transform: uppercase;outline: none;">
                                <option disabled  value="35"></option>
                                <option disabled  value="11">Security</option>
                                <option disabled  value="30">Охорона праці</option>
                                {
                                <option  value="30-33">- Охорона праці ІТР</option>
                                {
                                <option  value="30-31">- Охорона праці при роботі з інструментами та пристроями</option>
                                {
                                <option  value="30-34">- Правила охорони праці під час виконання робіт на висоті</option>
                                <option disabled  value="32">Охорона праці</option>
                                <option disabled  value="24">Охорона праці ІТР</option>
                                <option disabled  value="25">ОХОРОНА ПРАЦІ ІТР</option>
                                <option disabled  value="16">Охорона праці ІТР &quot; Лакофарба &quot;</option>
                                {
                                <option selected value="16-21">- Охорона праці ІТР &quot; Лакофарба&quot;</option>
                                <option disabled  value="18">Охорона праці автонавантажувачі &quot; Лакофарба&quot;</option>
                                <option disabled  value="19">Охорона праці лабораторія &quot; Лакофарба&quot;</option>
                                <option disabled  value="17">Охорона праці працівників &quot;Лакофарба&quot;</option>
                                <option disabled  value="13">Проф.тех. образование</option>
                                {
                                <option  value="13-14">- Пожарная безопасность</option>
                                <option disabled  value="9">Прочее</option>
                                {
                                <option  value="9-10">- Другое</option>
                                <option disabled  value="37">Техника Безопасности</option>
                            </select>
                        </div>
                        <div class="small-12 medium-4 columns">
                            <button onclick="changeCategory(58)" class="course-panel-button green-button">Сохранить</button>
                        </div>
                    </div>
                    <div class="course-panel-theme-wrapper">
                        <div class="course-panel-theme-item">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-8 columns dashboard-margin">
                                    <div class="course-panel-theme">
                                        <p style="line-height: 2rem;font-size: 1rem;" class="course-panel-theme-title">1: Охорона праці</p>
                                    </div>
                                </div>
                                <div class="small-12 medium-4 columns" style="margin-bottom: 0.625rem;">
                                    <div class="course-panel-button-wrapper">
                                        <button class="course-panel-button green-button" onclick="location.href='edit/id58?theme=0&subtheme=0'">Перейти к теме</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="course-panel-theme-item">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-8 columns dashboard-margin">
                                    <div class="course-panel-theme">
                                        <p style="line-height: 2rem;font-size: 1rem;" class="course-panel-theme-title">2: державне соціальне страхування</p>
                                    </div>
                                </div>
                                <div class="small-12 medium-4 columns" style="margin-bottom: 0.625rem;">
                                    <div class="course-panel-button-wrapper">
                                        <button class="course-panel-button green-button" onclick="location.href='edit/id58?theme=1&subtheme=0'">Перейти к теме</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="course-panel-theme-item">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-8 columns dashboard-margin">
                                    <div class="course-panel-theme">
                                        <p style="line-height: 2rem;font-size: 1rem;" class="course-panel-theme-title">3: Нещасні випадки</p>
                                    </div>
                                </div>
                                <div class="small-12 medium-4 columns" style="margin-bottom: 0.625rem;">
                                    <div class="course-panel-button-wrapper">
                                        <button class="course-panel-button green-button" onclick="location.href='edit/id58?theme=2&subtheme=0'">Перейти к теме</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="course-panel-theme-item">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-8 columns dashboard-margin">
                                    <div class="course-panel-theme">
                                        <p style="line-height: 2rem;font-size: 1rem;" class="course-panel-theme-title">4:  навчання і перевірки знань з питань охорони праці</p>
                                    </div>
                                </div>
                                <div class="small-12 medium-4 columns" style="margin-bottom: 0.625rem;">
                                    <div class="course-panel-button-wrapper">
                                        <button class="course-panel-button green-button" onclick="location.href='edit/id58?theme=3&subtheme=0'">Перейти к теме</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="course-panel-theme-item">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-8 columns dashboard-margin">
                                    <div class="course-panel-theme">
                                        <p style="line-height: 2rem;font-size: 1rem;" class="course-panel-theme-title">5: ОП лакофарбової промисловості</p>
                                    </div>
                                </div>
                                <div class="small-12 medium-4 columns" style="margin-bottom: 0.625rem;">
                                    <div class="course-panel-button-wrapper">
                                        <button class="course-panel-button green-button" onclick="location.href='edit/id58?theme=4&subtheme=0'">Перейти к теме</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="course-panel-theme-item">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-8 columns dashboard-margin">
                                    <div class="course-panel-theme">
                                        <p style="line-height: 2rem;font-size: 1rem;" class="course-panel-theme-title">6: Підйомні механізми та автонавантажувачі</p>
                                    </div>
                                </div>
                                <div class="small-12 medium-4 columns" style="margin-bottom: 0.625rem;">
                                    <div class="course-panel-button-wrapper">
                                        <button class="course-panel-button green-button" onclick="location.href='edit/id58?theme=5&subtheme=0'">Перейти к теме</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="course-panel-theme-item">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-8 columns dashboard-margin">
                                    <div class="course-panel-theme">
                                        <p style="line-height: 2rem;font-size: 1rem;" class="course-panel-theme-title">7: Робота з інструментом та пристроями</p>
                                    </div>
                                </div>
                                <div class="small-12 medium-4 columns" style="margin-bottom: 0.625rem;">
                                    <div class="course-panel-button-wrapper">
                                        <button class="course-panel-button green-button" onclick="location.href='edit/id58?theme=6&subtheme=0'">Перейти к теме</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="course-panel-theme-item">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-8 columns dashboard-margin">
                                    <div class="course-panel-theme">
                                        <p style="line-height: 2rem;font-size: 1rem;" class="course-panel-theme-title">8: Робота з інструментом та пристроями</p>
                                    </div>
                                </div>
                                <div class="small-12 medium-4 columns" style="margin-bottom: 0.625rem;">
                                    <div class="course-panel-button-wrapper">
                                        <button class="course-panel-button green-button" onclick="location.href='edit/id58?theme=7&subtheme=0'">Перейти к теме</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="course-panel" id="course-63">
                    <div class="row small-collapse medium-uncollapse">
                        <div class="small-12 medium-4 columns dashboard-margin">
                            <div class="course-panel-button-wrapper">
                                <button onclick="location.href='course/id63'" class="course-panel-button black-button">Перейти к курсу</button>
                            </div>
                        </div>
                        <div class="small-12 medium-4 columns dashboard-margin">
                            <div class="course-panel-button-wrapper">
                                <button class="delete-course course-panel-button red-button" onclick="initDeleteCourse(63)">Удалить курс</button>
                            </div>
                        </div>
                        <div class="small-12 medium-4 columns dashboard-margin">
                            <div class="course-panel-button-wrapper">
                                <button class="course-panel-button black-button change-category-button">Задать категорию</button>
                            </div>
                        </div>
                    </div>
                    <div class="change-category-block" style="display:none;">
                        <div class="small-12 medium-8 columns">
                            <select class="change-category-select" id="change-category-select-63" style="height: auto;font-family: 'Panton', sans-serif;background: #efefef;border: 1px #000 solid;text-transform: uppercase;outline: none;">
                                <option disabled  value="35"></option>
                                <option disabled  value="11">Security</option>
                                <option disabled  value="30">Охорона праці</option>
                                {
                                <option selected value="30-33">- Охорона праці ІТР</option>
                                {
                                <option  value="30-31">- Охорона праці при роботі з інструментами та пристроями</option>
                                {
                                <option  value="30-34">- Правила охорони праці під час виконання робіт на висоті</option>
                                <option disabled  value="32">Охорона праці</option>
                                <option disabled  value="24">Охорона праці ІТР</option>
                                <option disabled  value="25">ОХОРОНА ПРАЦІ ІТР</option>
                                <option disabled  value="16">Охорона праці ІТР &quot; Лакофарба &quot;</option>
                                {
                                <option  value="16-21">- Охорона праці ІТР &quot; Лакофарба&quot;</option>
                                <option disabled  value="18">Охорона праці автонавантажувачі &quot; Лакофарба&quot;</option>
                                <option disabled  value="19">Охорона праці лабораторія &quot; Лакофарба&quot;</option>
                                <option disabled  value="17">Охорона праці працівників &quot;Лакофарба&quot;</option>
                                <option disabled  value="13">Проф.тех. образование</option>
                                {
                                <option  value="13-14">- Пожарная безопасность</option>
                                <option disabled  value="9">Прочее</option>
                                {
                                <option  value="9-10">- Другое</option>
                                <option disabled  value="37">Техника Безопасности</option>
                            </select>
                        </div>
                        <div class="small-12 medium-4 columns">
                            <button onclick="changeCategory(63)" class="course-panel-button green-button">Сохранить</button>
                        </div>
                    </div>
                    <div class="course-panel-theme-wrapper">
                        <div class="course-panel-theme-item">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-8 columns dashboard-margin">
                                    <div class="course-panel-theme">
                                        <p style="line-height: 2rem;font-size: 1rem;" class="course-panel-theme-title">1: Охорона праці. Загальні вимоги</p>
                                    </div>
                                </div>
                                <div class="small-12 medium-4 columns" style="margin-bottom: 0.625rem;">
                                    <div class="course-panel-button-wrapper">
                                        <button class="course-panel-button green-button" onclick="location.href='edit/id63?theme=0&subtheme=0'">Перейти к теме</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="course-panel-theme-item">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-8 columns dashboard-margin">
                                    <div class="course-panel-theme">
                                        <p style="line-height: 2rem;font-size: 1rem;" class="course-panel-theme-title">2: Порядок проведення навчання і перевірки знань  з питань охорони праці</p>
                                    </div>
                                </div>
                                <div class="small-12 medium-4 columns" style="margin-bottom: 0.625rem;">
                                    <div class="course-panel-button-wrapper">
                                        <button class="course-panel-button green-button" onclick="location.href='edit/id63?theme=1&subtheme=0'">Перейти к теме</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="course-panel-theme-item">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-8 columns dashboard-margin">
                                    <div class="course-panel-theme">
                                        <p style="line-height: 2rem;font-size: 1rem;" class="course-panel-theme-title">3: Загальнообов&rsquo;язкове державне соціальне страхування</p>
                                    </div>
                                </div>
                                <div class="small-12 medium-4 columns" style="margin-bottom: 0.625rem;">
                                    <div class="course-panel-button-wrapper">
                                        <button class="course-panel-button green-button" onclick="location.href='edit/id63?theme=2&subtheme=0'">Перейти к теме</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="course-panel-theme-item">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-8 columns dashboard-margin">
                                    <div class="course-panel-theme">
                                        <p style="line-height: 2rem;font-size: 1rem;" class="course-panel-theme-title">4: Розслідування та ведення обліку нещасних випадків, професійних захворювань і аварій на виробництві</p>
                                    </div>
                                </div>
                                <div class="small-12 medium-4 columns" style="margin-bottom: 0.625rem;">
                                    <div class="course-panel-button-wrapper">
                                        <button class="course-panel-button green-button" onclick="location.href='edit/id63?theme=3&subtheme=0'">Перейти к теме</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="course-panel" id="course-64">
                    <div class="row small-collapse medium-uncollapse">
                        <div class="small-12 medium-4 columns dashboard-margin">
                            <div class="course-panel-button-wrapper">
                                <button onclick="location.href='course/id64'" class="course-panel-button black-button">Перейти к курсу</button>
                            </div>
                        </div>
                        <div class="small-12 medium-4 columns dashboard-margin">
                            <div class="course-panel-button-wrapper">
                                <button class="delete-course course-panel-button red-button" onclick="initDeleteCourse(64)">Удалить курс</button>
                            </div>
                        </div>
                        <div class="small-12 medium-4 columns dashboard-margin">
                            <div class="course-panel-button-wrapper">
                                <button class="course-panel-button black-button change-category-button">Задать категорию</button>
                            </div>
                        </div>
                    </div>
                    <div class="change-category-block" style="display:none;">
                        <div class="small-12 medium-8 columns">
                            <select class="change-category-select" id="change-category-select-64" style="height: auto;font-family: 'Panton', sans-serif;background: #efefef;border: 1px #000 solid;text-transform: uppercase;outline: none;">
                                <option disabled  value="35"></option>
                                <option disabled  value="11">Security</option>
                                <option disabled  value="30">Охорона праці</option>
                                {
                                <option  value="30-33">- Охорона праці ІТР</option>
                                {
                                <option selected value="30-31">- Охорона праці при роботі з інструментами та пристроями</option>
                                {
                                <option  value="30-34">- Правила охорони праці під час виконання робіт на висоті</option>
                                <option disabled  value="32">Охорона праці</option>
                                <option disabled  value="24">Охорона праці ІТР</option>
                                <option disabled  value="25">ОХОРОНА ПРАЦІ ІТР</option>
                                <option disabled  value="16">Охорона праці ІТР &quot; Лакофарба &quot;</option>
                                {
                                <option  value="16-21">- Охорона праці ІТР &quot; Лакофарба&quot;</option>
                                <option disabled  value="18">Охорона праці автонавантажувачі &quot; Лакофарба&quot;</option>
                                <option disabled  value="19">Охорона праці лабораторія &quot; Лакофарба&quot;</option>
                                <option disabled  value="17">Охорона праці працівників &quot;Лакофарба&quot;</option>
                                <option disabled  value="13">Проф.тех. образование</option>
                                {
                                <option  value="13-14">- Пожарная безопасность</option>
                                <option disabled  value="9">Прочее</option>
                                {
                                <option  value="9-10">- Другое</option>
                                <option disabled  value="37">Техника Безопасности</option>
                            </select>
                        </div>
                        <div class="small-12 medium-4 columns">
                            <button onclick="changeCategory(64)" class="course-panel-button green-button">Сохранить</button>
                        </div>
                    </div>
                    <div class="course-panel-theme-wrapper">
                        <div class="course-panel-theme-item">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-8 columns dashboard-margin">
                                    <div class="course-panel-theme">
                                        <p style="line-height: 2rem;font-size: 1rem;" class="course-panel-theme-title">1: Загальні положення</p>
                                    </div>
                                </div>
                                <div class="small-12 medium-4 columns" style="margin-bottom: 0.625rem;">
                                    <div class="course-panel-button-wrapper">
                                        <button class="course-panel-button green-button" onclick="location.href='edit/id64?theme=0&subtheme=0'">Перейти к теме</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="course-panel-theme-item">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-8 columns dashboard-margin">
                                    <div class="course-panel-theme">
                                        <p style="line-height: 2rem;font-size: 1rem;" class="course-panel-theme-title">2: Вимоги охорони праці під час виконання робіт з обробки металу та деревини на верстатах</p>
                                    </div>
                                </div>
                                <div class="small-12 medium-4 columns" style="margin-bottom: 0.625rem;">
                                    <div class="course-panel-button-wrapper">
                                        <button class="course-panel-button green-button" onclick="location.href='edit/id64?theme=1&subtheme=0'">Перейти к теме</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="course-panel-theme-item">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-8 columns dashboard-margin">
                                    <div class="course-panel-theme">
                                        <p style="line-height: 2rem;font-size: 1rem;" class="course-panel-theme-title">3: Вимоги охорони праці під час виконання робіт із застосуванням інструменту</p>
                                    </div>
                                </div>
                                <div class="small-12 medium-4 columns" style="margin-bottom: 0.625rem;">
                                    <div class="course-panel-button-wrapper">
                                        <button class="course-panel-button green-button" onclick="location.href='edit/id64?theme=2&subtheme=0'">Перейти к теме</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="course-panel-theme-item">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-8 columns dashboard-margin">
                                    <div class="course-panel-theme">
                                        <p style="line-height: 2rem;font-size: 1rem;" class="course-panel-theme-title">4: Вимоги охорони праці під час виконання робіт із застосуванням вантажопідіймальних машин, вантажозахоплювальних органів та пристроїв, інших пристосувань</p>
                                    </div>
                                </div>
                                <div class="small-12 medium-4 columns" style="margin-bottom: 0.625rem;">
                                    <div class="course-panel-button-wrapper">
                                        <button class="course-panel-button green-button" onclick="location.href='edit/id64?theme=3&subtheme=0'">Перейти к теме</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="course-panel-theme-item">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-8 columns dashboard-margin">
                                    <div class="course-panel-theme">
                                        <p style="line-height: 2rem;font-size: 1rem;" class="course-panel-theme-title">5: Вимоги охорони праці під час виконання зварювальних та вогневих робіт</p>
                                    </div>
                                </div>
                                <div class="small-12 medium-4 columns" style="margin-bottom: 0.625rem;">
                                    <div class="course-panel-button-wrapper">
                                        <button class="course-panel-button green-button" onclick="location.href='edit/id64?theme=4&subtheme=0'">Перейти к теме</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="course-panel" id="course-51">
                    <div class="row small-collapse medium-uncollapse">
                        <div class="small-12 medium-4 columns dashboard-margin">
                            <div class="course-panel-button-wrapper">
                                <button onclick="location.href='course/id51'" class="course-panel-button black-button">Перейти к курсу</button>
                            </div>
                        </div>
                        <div class="small-12 medium-4 columns dashboard-margin">
                            <div class="course-panel-button-wrapper">
                                <button class="delete-course course-panel-button red-button" onclick="initDeleteCourse(51)">Удалить курс</button>
                            </div>
                        </div>
                        <div class="small-12 medium-4 columns dashboard-margin">
                            <div class="course-panel-button-wrapper">
                                <button class="course-panel-button black-button change-category-button">Задать категорию</button>
                            </div>
                        </div>
                    </div>
                    <div class="change-category-block" style="display:none;">
                        <div class="small-12 medium-8 columns">
                            <select class="change-category-select" id="change-category-select-51" style="height: auto;font-family: 'Panton', sans-serif;background: #efefef;border: 1px #000 solid;text-transform: uppercase;outline: none;">
                                <option disabled  value="35"></option>
                                <option disabled  value="11">Security</option>
                                <option disabled  value="30">Охорона праці</option>
                                {
                                <option  value="30-33">- Охорона праці ІТР</option>
                                {
                                <option  value="30-31">- Охорона праці при роботі з інструментами та пристроями</option>
                                {
                                <option  value="30-34">- Правила охорони праці під час виконання робіт на висоті</option>
                                <option disabled  value="32">Охорона праці</option>
                                <option disabled  value="24">Охорона праці ІТР</option>
                                <option disabled  value="25">ОХОРОНА ПРАЦІ ІТР</option>
                                <option disabled  value="16">Охорона праці ІТР &quot; Лакофарба &quot;</option>
                                {
                                <option  value="16-21">- Охорона праці ІТР &quot; Лакофарба&quot;</option>
                                <option disabled  value="18">Охорона праці автонавантажувачі &quot; Лакофарба&quot;</option>
                                <option disabled  value="19">Охорона праці лабораторія &quot; Лакофарба&quot;</option>
                                <option disabled  value="17">Охорона праці працівників &quot;Лакофарба&quot;</option>
                                <option disabled  value="13">Проф.тех. образование</option>
                                {
                                <option selected value="13-14">- Пожарная безопасность</option>
                                <option disabled  value="9">Прочее</option>
                                {
                                <option  value="9-10">- Другое</option>
                                <option disabled  value="37">Техника Безопасности</option>
                            </select>
                        </div>
                        <div class="small-12 medium-4 columns">
                            <button onclick="changeCategory(51)" class="course-panel-button green-button">Сохранить</button>
                        </div>
                    </div>
                    <div class="course-panel-theme-wrapper">
                        <div class="course-panel-theme-item">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-8 columns dashboard-margin">
                                    <div class="course-panel-theme">
                                        <p style="line-height: 2rem;font-size: 1rem;" class="course-panel-theme-title">1: Общая информаия</p>
                                    </div>
                                </div>
                                <div class="small-12 medium-4 columns" style="margin-bottom: 0.625rem;">
                                    <div class="course-panel-button-wrapper">
                                        <button class="course-panel-button green-button" onclick="location.href='edit/id51?theme=0&subtheme=0'">Перейти к теме</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="course-panel-theme-item">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-8 columns dashboard-margin">
                                    <div class="course-panel-theme">
                                        <p style="line-height: 2rem;font-size: 1rem;" class="course-panel-theme-title">2: Виды противогазов.</p>
                                    </div>
                                </div>
                                <div class="small-12 medium-4 columns" style="margin-bottom: 0.625rem;">
                                    <div class="course-panel-button-wrapper">
                                        <button class="course-panel-button green-button" onclick="location.href='edit/id51?theme=1&subtheme=0'">Перейти к теме</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="course-panel-theme-item">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-8 columns dashboard-margin">
                                    <div class="course-panel-theme">
                                        <p style="line-height: 2rem;font-size: 1rem;" class="course-panel-theme-title">3: Тушение пожара</p>
                                    </div>
                                </div>
                                <div class="small-12 medium-4 columns" style="margin-bottom: 0.625rem;">
                                    <div class="course-panel-button-wrapper">
                                        <button class="course-panel-button green-button" onclick="location.href='edit/id51?theme=2&subtheme=0'">Перейти к теме</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="course-panel-theme-item">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-8 columns dashboard-margin">
                                    <div class="course-panel-theme">
                                        <p style="line-height: 2rem;font-size: 1rem;" class="course-panel-theme-title">4: Виды огнетушителей.</p>
                                    </div>
                                </div>
                                <div class="small-12 medium-4 columns" style="margin-bottom: 0.625rem;">
                                    <div class="course-panel-button-wrapper">
                                        <button class="course-panel-button green-button" onclick="location.href='edit/id51?theme=3&subtheme=0'">Перейти к теме</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="course-panel" id="course-55">
                    <div class="row small-collapse medium-uncollapse">
                        <div class="small-12 medium-4 columns dashboard-margin">
                            <div class="course-panel-button-wrapper">
                                <button onclick="location.href='course/id55'" class="course-panel-button black-button">Перейти к курсу</button>
                            </div>
                        </div>
                        <div class="small-12 medium-4 columns dashboard-margin">
                            <div class="course-panel-button-wrapper">
                                <button class="delete-course course-panel-button red-button" onclick="initDeleteCourse(55)">Удалить курс</button>
                            </div>
                        </div>
                        <div class="small-12 medium-4 columns dashboard-margin">
                            <div class="course-panel-button-wrapper">
                                <button class="course-panel-button black-button change-category-button">Задать категорию</button>
                            </div>
                        </div>
                    </div>
                    <div class="change-category-block" style="display:none;">
                        <div class="small-12 medium-8 columns">
                            <select class="change-category-select" id="change-category-select-55" style="height: auto;font-family: 'Panton', sans-serif;background: #efefef;border: 1px #000 solid;text-transform: uppercase;outline: none;">
                                <option disabled  value="35"></option>
                                <option disabled  value="11">Security</option>
                                <option disabled  value="30">Охорона праці</option>
                                {
                                <option  value="30-33">- Охорона праці ІТР</option>
                                {
                                <option  value="30-31">- Охорона праці при роботі з інструментами та пристроями</option>
                                {
                                <option  value="30-34">- Правила охорони праці під час виконання робіт на висоті</option>
                                <option disabled  value="32">Охорона праці</option>
                                <option disabled  value="24">Охорона праці ІТР</option>
                                <option disabled  value="25">ОХОРОНА ПРАЦІ ІТР</option>
                                <option disabled  value="16">Охорона праці ІТР &quot; Лакофарба &quot;</option>
                                {
                                <option  value="16-21">- Охорона праці ІТР &quot; Лакофарба&quot;</option>
                                <option disabled  value="18">Охорона праці автонавантажувачі &quot; Лакофарба&quot;</option>
                                <option disabled  value="19">Охорона праці лабораторія &quot; Лакофарба&quot;</option>
                                <option disabled  value="17">Охорона праці працівників &quot;Лакофарба&quot;</option>
                                <option disabled  value="13">Проф.тех. образование</option>
                                {
                                <option  value="13-14">- Пожарная безопасность</option>
                                <option disabled  value="9">Прочее</option>
                                {
                                <option  value="9-10">- Другое</option>
                                <option disabled  value="37">Техника Безопасности</option>
                            </select>
                        </div>
                        <div class="small-12 medium-4 columns">
                            <button onclick="changeCategory(55)" class="course-panel-button green-button">Сохранить</button>
                        </div>
                    </div>
                    <div class="course-panel-theme-wrapper">
                        <div class="course-panel-theme-item">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-8 columns dashboard-margin">
                                    <div class="course-panel-theme">
                                        <p style="line-height: 2rem;font-size: 1rem;" class="course-panel-theme-title">1: рпр</p>
                                    </div>
                                </div>
                                <div class="small-12 medium-4 columns" style="margin-bottom: 0.625rem;">
                                    <div class="course-panel-button-wrapper">
                                        <button class="course-panel-button green-button" onclick="location.href='edit/id55?theme=0&subtheme=0'">Перейти к теме</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="course-panel-theme-item">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-8 columns dashboard-margin">
                                    <div class="course-panel-theme">
                                        <p style="line-height: 2rem;font-size: 1rem;" class="course-panel-theme-title">2: рпмпм</p>
                                    </div>
                                </div>
                                <div class="small-12 medium-4 columns" style="margin-bottom: 0.625rem;">
                                    <div class="course-panel-button-wrapper">
                                        <button class="course-panel-button green-button" onclick="location.href='edit/id55?theme=1&subtheme=0'">Перейти к теме</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="dashboard__content" id="dashboard__content-5">
                <h3 class="dashboard__title">Управление сертификатами</h3>
                <p class="dashboard__subtitle">В данном разделе у Вас есть возможность управлять сертификатами студентов</p>
                <div class="course-choose-wrapper">
                    <div class="row small-collapse medium-uncollapse">
                        <div class="small-12 columns">
                            <select class="course-choose" id="course-choose-certificates">
                                <option disabled selected>Выберите курс</option>
                                <option value="course-certificates-59">Здания и сооружения</option>
                                <option value="course-certificates-62">Здания и сооружения. Общие требования</option>
                                <option value="course-certificates-53">огнетушитель</option>
                                <option value="course-certificates-58">Охорона праці</option>
                                <option value="course-certificates-63">Охорона праці ІТР</option>
                                <option value="course-certificates-64">Охорона праці під час роботи з інструментами та пристроями</option>
                                <option value="course-certificates-51">Пожарно-технический минимум  - Новых сертификатов: 1</option>
                                <option value="course-certificates-55">рмптм</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div style="display:none;" class="course-panel-certificates" id="course-certificates-59">
                    <div class="add-student-panel-wrapper">
                        <div class="add-student-panel">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-8 columns">
                                    <div class="add-student-panel-quantity">
                                        <p class="add-student-panel-title">Всего зарегистрированных студентов: 1</p>
                                    </div>
                                </div>
                                <div class="small-12 medium-4 columns">
                                    <div class="course-panel-button-wrapper">
                                        <button id="add-student-button" class="course-panel-button green-button add-student-button">
                                            Добавить
                                            студента
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="add-student-panel-field">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-4 columns">
                                    <input id="certificate-name-59" class="student-list-certificate" type="text"
                                           placeholder="Введите ФИО нового студента">
                                </div>
                                <div class="small-12 medium-4 columns">
                                    <input id="certificate-number-59" class="student-list-certificate" type="number"
                                           placeholder="Задайте номер сертификата">
                                </div>
                                <div class="small-12 medium-4 columns">
                                    <button onclick="addCertificate(59)"  class="course-panel-button green-button student-list-button">Сохранить
                                    </button>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="student-list-wrapper">
                        <div class="student-list-item">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-4 columns dashboard-margin">
                                    <a style="cursor:default;" class="student-list-name dashboard-url">Name  student student</a>
                                </div>
                                <div class="small-12 medium-4 columns dashboard-margin">
                                    <input id="existing-certificate-number-12" class="student-list-certificate" type="number"
                                           placeholder="Задайте номер сертификата" value=78945>
                                </div>
                                <div class="small-12 medium-4 columns dashboard-margin">
                                    <button onclick="saveCertificate(12)" class="course-panel-button green-button student-list-button">Сохранить
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="display:none;" class="course-panel-certificates" id="course-certificates-62">
                    <div class="add-student-panel-wrapper">
                        <div class="add-student-panel">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-8 columns">
                                    <div class="add-student-panel-quantity">
                                        <p class="add-student-panel-title">Всего зарегистрированных студентов: 0</p>
                                    </div>
                                </div>
                                <div class="small-12 medium-4 columns">
                                    <div class="course-panel-button-wrapper">
                                        <button id="add-student-button" class="course-panel-button green-button add-student-button">
                                            Добавить
                                            студента
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="add-student-panel-field">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-4 columns">
                                    <input id="certificate-name-62" class="student-list-certificate" type="text"
                                           placeholder="Введите ФИО нового студента">
                                </div>
                                <div class="small-12 medium-4 columns">
                                    <input id="certificate-number-62" class="student-list-certificate" type="number"
                                           placeholder="Задайте номер сертификата">
                                </div>
                                <div class="small-12 medium-4 columns">
                                    <button onclick="addCertificate(62)"  class="course-panel-button green-button student-list-button">Сохранить
                                    </button>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="student-list-wrapper">
                    </div>
                </div>
                <div style="display:none;" class="course-panel-certificates" id="course-certificates-53">
                    <div class="add-student-panel-wrapper">
                        <div class="add-student-panel">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-8 columns">
                                    <div class="add-student-panel-quantity">
                                        <p class="add-student-panel-title">Всего зарегистрированных студентов: 0</p>
                                    </div>
                                </div>
                                <div class="small-12 medium-4 columns">
                                    <div class="course-panel-button-wrapper">
                                        <button id="add-student-button" class="course-panel-button green-button add-student-button">
                                            Добавить
                                            студента
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="add-student-panel-field">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-4 columns">
                                    <input id="certificate-name-53" class="student-list-certificate" type="text"
                                           placeholder="Введите ФИО нового студента">
                                </div>
                                <div class="small-12 medium-4 columns">
                                    <input id="certificate-number-53" class="student-list-certificate" type="number"
                                           placeholder="Задайте номер сертификата">
                                </div>
                                <div class="small-12 medium-4 columns">
                                    <button onclick="addCertificate(53)"  class="course-panel-button green-button student-list-button">Сохранить
                                    </button>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="student-list-wrapper">
                    </div>
                </div>
                <div style="display:none;" class="course-panel-certificates" id="course-certificates-58">
                    <div class="add-student-panel-wrapper">
                        <div class="add-student-panel">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-8 columns">
                                    <div class="add-student-panel-quantity">
                                        <p class="add-student-panel-title">Всего зарегистрированных студентов: 1</p>
                                    </div>
                                </div>
                                <div class="small-12 medium-4 columns">
                                    <div class="course-panel-button-wrapper">
                                        <button id="add-student-button" class="course-panel-button green-button add-student-button">
                                            Добавить
                                            студента
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="add-student-panel-field">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-4 columns">
                                    <input id="certificate-name-58" class="student-list-certificate" type="text"
                                           placeholder="Введите ФИО нового студента">
                                </div>
                                <div class="small-12 medium-4 columns">
                                    <input id="certificate-number-58" class="student-list-certificate" type="number"
                                           placeholder="Задайте номер сертификата">
                                </div>
                                <div class="small-12 medium-4 columns">
                                    <button onclick="addCertificate(58)"  class="course-panel-button green-button student-list-button">Сохранить
                                    </button>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="student-list-wrapper">
                        <div class="student-list-item">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-4 columns dashboard-margin">
                                    <a style="cursor:default;" class="student-list-name dashboard-url">Александра Анатольевна Гаман</a>
                                </div>
                                <div class="small-12 medium-4 columns dashboard-margin">
                                    <input id="existing-certificate-number-11" class="student-list-certificate" type="number"
                                           placeholder="Задайте номер сертификата" value=5246658>
                                </div>
                                <div class="small-12 medium-4 columns dashboard-margin">
                                    <button onclick="saveCertificate(11)" class="course-panel-button green-button student-list-button">Сохранить
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="display:none;" class="course-panel-certificates" id="course-certificates-63">
                    <div class="add-student-panel-wrapper">
                        <div class="add-student-panel">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-8 columns">
                                    <div class="add-student-panel-quantity">
                                        <p class="add-student-panel-title">Всего зарегистрированных студентов: 0</p>
                                    </div>
                                </div>
                                <div class="small-12 medium-4 columns">
                                    <div class="course-panel-button-wrapper">
                                        <button id="add-student-button" class="course-panel-button green-button add-student-button">
                                            Добавить
                                            студента
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="add-student-panel-field">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-4 columns">
                                    <input id="certificate-name-63" class="student-list-certificate" type="text"
                                           placeholder="Введите ФИО нового студента">
                                </div>
                                <div class="small-12 medium-4 columns">
                                    <input id="certificate-number-63" class="student-list-certificate" type="number"
                                           placeholder="Задайте номер сертификата">
                                </div>
                                <div class="small-12 medium-4 columns">
                                    <button onclick="addCertificate(63)"  class="course-panel-button green-button student-list-button">Сохранить
                                    </button>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="student-list-wrapper">
                    </div>
                </div>
                <div style="display:none;" class="course-panel-certificates" id="course-certificates-64">
                    <div class="add-student-panel-wrapper">
                        <div class="add-student-panel">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-8 columns">
                                    <div class="add-student-panel-quantity">
                                        <p class="add-student-panel-title">Всего зарегистрированных студентов: 0</p>
                                    </div>
                                </div>
                                <div class="small-12 medium-4 columns">
                                    <div class="course-panel-button-wrapper">
                                        <button id="add-student-button" class="course-panel-button green-button add-student-button">
                                            Добавить
                                            студента
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="add-student-panel-field">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-4 columns">
                                    <input id="certificate-name-64" class="student-list-certificate" type="text"
                                           placeholder="Введите ФИО нового студента">
                                </div>
                                <div class="small-12 medium-4 columns">
                                    <input id="certificate-number-64" class="student-list-certificate" type="number"
                                           placeholder="Задайте номер сертификата">
                                </div>
                                <div class="small-12 medium-4 columns">
                                    <button onclick="addCertificate(64)"  class="course-panel-button green-button student-list-button">Сохранить
                                    </button>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="student-list-wrapper">
                    </div>
                </div>
                <div style="display:none;" class="course-panel-certificates" id="course-certificates-51">
                    <div class="add-student-panel-wrapper">
                        <div class="add-student-panel">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-8 columns">
                                    <div class="add-student-panel-quantity">
                                        <p class="add-student-panel-title">Всего зарегистрированных студентов: 3</p>
                                    </div>
                                </div>
                                <div class="small-12 medium-4 columns">
                                    <div class="course-panel-button-wrapper">
                                        <button id="add-student-button" class="course-panel-button green-button add-student-button">
                                            Добавить
                                            студента
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="add-student-panel-field">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-4 columns">
                                    <input id="certificate-name-51" class="student-list-certificate" type="text"
                                           placeholder="Введите ФИО нового студента">
                                </div>
                                <div class="small-12 medium-4 columns">
                                    <input id="certificate-number-51" class="student-list-certificate" type="number"
                                           placeholder="Задайте номер сертификата">
                                </div>
                                <div class="small-12 medium-4 columns">
                                    <button onclick="addCertificate(51)"  class="course-panel-button green-button student-list-button">Сохранить
                                    </button>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="student-list-wrapper">
                        <div class="student-list-item">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-4 columns dashboard-margin">
                                    <a style="cursor:default;" class="student-list-name dashboard-url">Name  student student</a>
                                </div>
                                <div class="small-12 medium-4 columns dashboard-margin">
                                    <input id="existing-certificate-number-10" class="student-list-certificate" type="number"
                                           placeholder="Задайте номер сертификата" >
                                </div>
                                <div class="small-12 medium-4 columns dashboard-margin">
                                    <button onclick="saveCertificate(10)" class="course-panel-button green-button student-list-button">Сохранить
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="student-list-item">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-4 columns dashboard-margin">
                                    <a style="cursor:default;" class="student-list-name dashboard-url">Ольга Викторовна Решетник</a>
                                </div>
                                <div class="small-12 medium-4 columns dashboard-margin">
                                    <input id="existing-certificate-number-9" class="student-list-certificate" type="number"
                                           placeholder="Задайте номер сертификата" value=12345>
                                </div>
                                <div class="small-12 medium-4 columns dashboard-margin">
                                    <button onclick="saveCertificate(9)" class="course-panel-button green-button student-list-button">Сохранить
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="display:none;" class="course-panel-certificates" id="course-certificates-55">
                    <div class="add-student-panel-wrapper">
                        <div class="add-student-panel">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-8 columns">
                                    <div class="add-student-panel-quantity">
                                        <p class="add-student-panel-title">Всего зарегистрированных студентов: 0</p>
                                    </div>
                                </div>
                                <div class="small-12 medium-4 columns">
                                    <div class="course-panel-button-wrapper">
                                        <button id="add-student-button" class="course-panel-button green-button add-student-button">
                                            Добавить
                                            студента
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="add-student-panel-field">
                            <div class="row small-collapse medium-uncollapse">
                                <div class="small-12 medium-4 columns">
                                    <input id="certificate-name-55" class="student-list-certificate" type="text"
                                           placeholder="Введите ФИО нового студента">
                                </div>
                                <div class="small-12 medium-4 columns">
                                    <input id="certificate-number-55" class="student-list-certificate" type="number"
                                           placeholder="Задайте номер сертификата">
                                </div>
                                <div class="small-12 medium-4 columns">
                                    <button onclick="addCertificate(55)"  class="course-panel-button green-button student-list-button">Сохранить
                                    </button>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="student-list-wrapper">
                    </div>
                </div>
            </div>
            <div class="dashboard__content" id="dashboard__content-6">
                <h3 class="dashboard__title">Управление категориями</h3>
                <p class="dashboard__subtitle">В данном разделе у Вас есть возможность создать категории и
                    подкатегории для курсов и поиска по ним</p>
                <div class="category-creating-wrapper">
                    <div class="row small-collapse medium-uncollapse">
                        <div class="small-12 columns">
                            <button id="add-category-button" class="course-panel-button category-creating-button">Создать новую категорию
                            </button>
                        </div>
                    </div>
                    <div class="category-creating-panel">
                        <div class="row small-collapse medium-uncollapse">
                            <div class="small-12 medium-8 columns dashboard-margin">
                                <input id="category_name" style="height:auto;" type="text" placeholder="Введите название категории">
                            </div>
                            <div class="small-12 medium-4 columns dashboard-margin">
                                <button onclick="createCategory()" class="course-panel-button green-button">Сохранить</button>
                            </div>
                        </div>
                    </div>
                    <p>Или</p>
                    <div class="row small-collapse medium-uncollapse">
                        <div class="small-12 columns">
                            <select class="category-choose">
                                <option disabled="disabled" selected>Выберите категорию</option>
                                <option value="35"></option>
                                <option value="11">Security</option>
                                <option value="30">Охорона праці</option>
                                {
                                <option value="30-33">- Охорона праці ІТР</option>
                                {
                                <option value="30-31">- Охорона праці при роботі з інструментами та пристроями</option>
                                {
                                <option value="30-34">- Правила охорони праці під час виконання робіт на висоті</option>
                                <option value="32">Охорона праці</option>
                                <option value="24">Охорона праці ІТР</option>
                                <option value="25">ОХОРОНА ПРАЦІ ІТР</option>
                                <option value="16">Охорона праці ІТР &quot; Лакофарба &quot;</option>
                                {
                                <option value="16-21">- Охорона праці ІТР &quot; Лакофарба&quot;</option>
                                <option value="18">Охорона праці автонавантажувачі &quot; Лакофарба&quot;</option>
                                <option value="19">Охорона праці лабораторія &quot; Лакофарба&quot;</option>
                                <option value="17">Охорона праці працівників &quot;Лакофарба&quot;</option>
                                <option value="13">Проф.тех. образование</option>
                                {
                                <option value="13-14">- Пожарная безопасность</option>
                                <option value="9">Прочее</option>
                                {
                                <option value="9-10">- Другое</option>
                                <option value="37">Техника Безопасности</option>
                            </select>
                        </div>
                    </div>

                    <div class="category-button-wrapper">
                        <div class="row small-collapse medium-uncollapse">
                            <div class="small-12 medium-12 columns dashboard-margin subcat-button" style="display:none;">
                                <button onclick="deleteCategory()" class="course-panel-button category-button red-button">Удалить эту подкатегорию
                                </button>
                            </div>
                            <div class="small-12 medium-6 columns dashboard-margin cat-button" style="display:none;">
                                <button onclick="deleteCategory()" class="course-panel-button category-button red-button">Удалить эту категорию
                                </button>
                            </div>
                            <div class="small-12 medium-6 columns dashboard-margin cat-button" style="display:none;">
                                <button id="add-subcategory-button" class="course-panel-button category-button black-button">Создать подкатегорию
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="subcategory-creating-panel">
                        <div class="row small-collapse medium-uncollapse">
                            <div class="small-12 medium-8 columns dashboard-margin">
                                <input id="subcategory_name" style="height:auto;" type="text" placeholder="Введите название подкатегории">
                            </div>
                            <div class="small-12 medium-4 columns dashboard-margin">
                                <button onclick="createSubcategory()" class="course-panel-button green-button">Сохранить</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="dashboard__footer show-for-medium">
    <footer class="footer">
        <div class="row">
            <div class="small-6 medium-4 columns">
                <div class="footer__social">
                    <a class="footer__social-item social-facebook" href="#">
                        <i class="fa fa-facebook"></i>
                    </a>
                    <a class="footer__social-item social-twitter" href="#">
                        <i class="fa fa-twitter"></i>
                    </a>
                </div>
            </div>
            <div class="small-6 medium-4 columns">
                <div class="footer__copyright">
                    Doctrado ©
                </div>
            </div>
            <div class="small-12 medium-4 columns">
                <a href="//elegance.od.ua" class="footer_logo">
                    <img src="img/elegance.png" class="elegance-logo" alt="">
                </a>
            </div>
        </div>
    </footer>
</div>


<div class="delete-course-popup-wrapper">
    <div class="delete-course-popup-bg"></div>
    <div class="delete-course-popup">
        <p class="delete-course-popup-text">Вы уверены, что хотите удалить данный курс?</p>
        <button class="delete-course-popup-button">Отменить</button>
        <button class="delete-course-popup-button" id="delete-course-button">Удалить</button>
    </div>
</div>

<script src="js/jquery.min.js"></script>
<script src="js/foundation.min.js"></script>
<script src="js/dashboard.js"></script>
<script>
    $(document).ready(function() {
        $("#month-select").val('12');
        $('#course-choose-courses').val(-1);
    });
</script>
</body>
</html>
