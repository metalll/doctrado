<%--
  Created by IntelliJ IDEA.
  User: NSD
  Date: 15.12.16
  Time: 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="csrf-token" content="wb8DCE4voP8NZqb4mACe0iFTsDe6uaspkdsg3zui" />
    <title>Doctrado</title>
    <link rel="stylesheet" href="css/app.css">
    <link rel="shortcut icon" href="https://doctrado.me/img/favicon.ico">
</head>
<style type="text/css">
    textarea::-webkit-input-placeholder {text-align: center;font-family: "Panton", sans-serif;font-weight:800;}
    input::-webkit-input-placeholder {text-align: center;font-family: "Panton", sans-serif;font-weight:800;}
    #third_step_form input {
        min-height: 50px;
    }
</style>
<body>
<div id="loading-bg" style="display:none;">
    <div style="position: fixed;  background: rgba(0, 0, 0, 0.6);  width: 100%;  height: 100%;z-index: 1001;"></div>
    <div style="position: fixed; z-index: 1001; left: 50%; top: 50%; transform: translate(-50%, -50%);text-align:center;font-family: 'Panton', sans-serif; font-weight: 600; color: rgb(255, 253, 255);">
        <img src="css/ajax-loader.gif" style="max-width:200px; max-height: 200px;margin-bottom: 20px;">
        <p>Создание курса<br>Пожалуйста, не закрывайте страницу до окончания создания курса!</p>
        <p id="course-info-status">Создание информации о курсе: ...</p>
        <p id="course-photo-status">Загрузка изображения курса: ...</p>
        <p id="final-info-status">Создание финального теста: ...</p>
        <p id="themes-info-status">Создание тем курса: 0/0</p>
        <p id="files-info-status">Загрузка файлов курса: 0/0</p>
    </div>
</div>
<style>
    .head:before {
        content: ' ';
        background-color:rgba(255,255,255,0.35);
        position: absolute;
        top:0;
        bottom:0;
        left:0;
        right:0;
    }
</style>
<header class="head">
    <nav class="header__top-bar" style="position: absolute; z-index:2; width:100%;">
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
                        <a class="login-btn" id="profile-button" href="profile" style="margin-right:10px;">Кабинет</a><a class="login-btn" href="logout">Выход</a>
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
                                <a class="menu-elem" href="./course">Курсы</a>
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
    <section class="head__headofcreating">
        <div class="row">
            <div class="small-12 columns">
                <h2 class="creating-course__title-header">
                    Приумножай свой опыт с каждым днем
                </h2>
                <p class="creating-course__text">
                    Создание курса
                </p>
            </div>
        </div>
    </section>
</header>
<section class="main-container">
    <section class="content__firststep">
        <form id="first_step_form">
            <div class="row">
                <div style="margin:80px 0 0;" class="small-12 medium-12 columns end">
                    <h1 class="creating-course__title" style="margin:0 auto;width:200px;">шаг 1</h1>
                    <div class="row" style="margin-top:30px;">
                        <div class="medium-3 columns">
                            <p style="text-align:center;line-height: 2.4375rem;font-weight: 800;font-family: 'Panton', sans-serif;">Выберите категорию:</p>
                        </div>
                        <div class="medium-9 columns">
                            <select id="category-select" style="font-weight: 800;font-family: 'Panton', sans-serif;border: 1px solid black;">
                                <option selected disabled>Выберите категорию</option>
                                <option disabled value="35"></option>
                                <option disabled value="11">Security</option>
                                <option disabled value="30">Охорона праці</option>
                                <option value="33">- Охорона праці ІТР</option>
                                <option value="31">- Охорона праці при роботі з інструментами та пристроями</option>
                                <option value="34">- Правила охорони праці під час виконання робіт на висоті</option>
                                <option disabled value="32">Охорона праці</option>
                                <option disabled value="24">Охорона праці ІТР</option>
                                <option disabled value="25">ОХОРОНА ПРАЦІ ІТР</option>
                                <option disabled value="16">Охорона праці ІТР &quot; Лакофарба &quot;</option>
                                <option value="21">- Охорона праці ІТР &quot; Лакофарба&quot;</option>
                                <option disabled value="18">Охорона праці автонавантажувачі &quot; Лакофарба&quot;</option>
                                <option disabled value="19">Охорона праці лабораторія &quot; Лакофарба&quot;</option>
                                <option disabled value="17">Охорона праці працівників &quot;Лакофарба&quot;</option>
                                <option disabled value="13">Проф.тех. образование</option>
                                <option value="14">- Пожарная безопасность</option>
                                <option disabled value="9">Прочее</option>
                                <option value="10">- Другое</option>
                                <option disabled value="37">Техника Безопасности</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="small-12 medium-6 columns">
                            <label><input type="text" name="course_name" placeholder="Название Вашего курса" onkeydown="$('#alert-0').fadeOut();"></label>
                            <p class="reg-alert" id="alert-0">Заполните это поле</p>
                        </div>
                        <div class="small-12 medium-6 columns">
                            <label><input type="text" name="course_time" placeholder="Время на прохождения курса*" onkeydown="$('#alert-1').fadeOut();"></label>
                            <p class="reg-alert" id="alert-1">Заполните это поле</p>
                        </div>
                        <div class="small-12 medium-6 columns show-for-small-only" style="height:3rem;margin-bottom: 25px;text-align:center;">
                            <p style="font-weight: 800;font-family: 'Panton', sans-serif;">*Указывайте полностью (например "12 дней")</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="small-12 medium-6 columns">
                            <label><textarea style="height:120px;" name="course_desc" placeholder="Описание Вашего курса (задачи, цели, польза и прочее)" onkeydown="$('#alert-2').fadeOut();"></textarea></label>
                            <p class="reg-alert" id="alert-2">Заполните это поле</p>
                        </div>
                        <div class="small-12 medium-6 columns hide-for-small-only" style="height:3rem;margin-bottom: 25px;text-align:center;">
                            <p style="font-weight: 800;font-family: 'Panton', sans-serif;">*Указывайте полностью (напр. "12 дней")</p>
                        </div>
                        <div class="medium-6 columns">
                            <button type="button" class="file-upload-2" onclick="$('#course-photo-input').click()">
                                ДОБАВИТЬ ИЗОБРАЖЕНИЯ КУРСА
                            </button>
                        </div>
                        <input type="file" style="display: none;" id="course-photo-input">
                    </div>
                    <div class="row" style="margin-bottom: 150px;">
                        <div class="small-12 medium-6 columns">
                            <label>
                                <input class="for-centered-text" type="text" name="course_price" placeholder="Цена за прохождение (в грн.)**" onkeydown="$('#alert-3').fadeOut();">
                                <p class="reg-alert" id="alert-3">Цена должна быть указана в цифрах</p>
                                <p style="font-size:1rem;font-weight: 800;font-family: 'Panton', sans-serif;text-align:center;">**Оставьте это поле пустым, если Ваш курс бесплатен</p>
                            </label>
                        </div>
                        <div class="small-6 medium-3 columns">
                            <a class="creating button secondary"><span class="class">отмена</span></a>
                        </div>
                        <div class="small-6 medium-3 columns">
                            <a class="creating button success" onclick="$('#first_step_form').submit();"><span class="class">далее</span></a>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </section>

    <section class="content__secondstep" style="display:none;">
        <form id="second_step_form">
            <div class="add-link-popout">
                <div class="video-link-container">
                    <div class="video-link-wrapper">
                        <div class="row">
                            <div class="small-12 medium-6 medium-offset-3 columns">
                                <div class="row">
                                    <div class="add-link">
                                        <input type="text" placeholder="Вставьте ссылку на видео с youtube" name="theme_video">
                                        <p class="reg-alert" id="alert-video">Неправильный формат ссылки Youtube!</p>
                                        <div class="add-video-link-buttons">
                                            <div class="row">
                                                <div class="small-6 medium-6 columns">
                                                    <a onclick="cancellationButton()" class="creating button success "><span class="class">Отменить</span></a>
                                                </div><div class="small-6 medium-6 columns">
                                                <a class="creating button success" onclick="saveVideoLink()"><span class="class">Сохранить</span></a>
                                            </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="theme-creating" class="row content-container" style="margin-top:0;">
                <div id="creating-theme" class="small-12 medium-12 columns end" style="display:block;">

                    <h1 class="creating-course__title" style="margin:0 auto;margin-top:50px;width:200px;">шаг 2</h1>
                    <p class="creating-theme__text">Создание тем курса</p>

                    <p id="about-second-step" class="creating-theme__text" style="font-size: 1.3rem;">Тема номер: 1</p>
                    <div class="row">
                        <div class="small-12 medium-6 columns"><a id="prev-theme-button" class="creating button non-active-button success" onclick="prevTheme()" style="font-size:1rem;"><span class="class"><i class="fa fa-long-arrow-left"></i></span></a></div>
                        <div class="small-12 medium-6 columns"><a id="next-theme-button" class="creating button non-active-button success" onclick="nextTheme()" style="font-size:1rem;"><span class="class"><i class="fa fa-long-arrow-right"></i></span></a></div>
                    </div>

                    <div class="row">
                        <div class="small-12 medium-6 columns">
                            <label>
                                <input type="text" placeholder="Название темы" name="theme_name">
                            </label>
                        </div>
                        <div class="small-12 medium-6 columns">
                            <div class="add-files title-files" style="margin-top:0;background-color: #2980b9;border: 0;">Добавление материалов</div>
                        </div>
                    </div>
                    <div class="row" style="text-align: center;">
                        <div class="small-12 medium-6 columns">
                            <label>
                                <textarea style="height:220px;" placeholder="Описание темы" name="theme_desc"></textarea>
                            </label>
                        </div>
                        <div class="small-12 medium-6 columns">
                            <div class="row">
                                <div class="small-12 medium-6 columns">
                                    <div class="hidden-add-files hidden-title-files" style="margin-top:0;background-color: #2980b9;border: 0;">Добавление материалов</div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="small-12 medium-4 columns end">
                                    <button type="button" class="file-upload" onclick="$('#theme_presentation').click()">
                                        <img src="img/picture.png" alt="">
                                    </button>
                                    <input type="file" accept="application/pdf" class="file-input" id="theme_presentation" style="display: none;">
                                    <label class="about-button">Презентация</label>
                                    <p class="reg-alert" style="font-size: 0.7rem;" id="alert-theme-presentation"></p>
                                </div>
                                <div class="small-12 medium-4 columns end">
                                    <button type="button" class="file-upload" onclick="$('#theme_file').click()">
                                        <img src="img/file.png" alt="">
                                    </button>
                                    <input type="file" accept="application/pdf" class="file-input" id="theme_file" style="display: none;">
                                    <label class="about-button">Файл</label>
                                    <p class="reg-alert" style="font-size: 0.7rem;" id="alert-theme-file"></p>
                                </div>
                                <div class="small-12 medium-4 columns end">
                                    <button type="button" onclick="addVideoLink()" class="file-upload"><img src="img/video.png" alt="">
                                    </button>
                                    <label class="about-button">Видео</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="small-6 medium-6 columns">
                                    <a onclick="newSubTheme()"  class="creating button secondary"><span class="class">добавить подтему</span></a>
                                </div>
                                <div class="small-6 medium-6 columns">
                                    <a onclick="addTest()" class="creating button success"><span class="class">добавить тест</span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="small-6 medium-6 columns">
                            <a onclick="deleteTheme()" class="creating button secondary"><span class="class">удалить тему</span></a>
                        </div>
                        <div class="small-6 medium-6 columns">
                            <a onclick="newTheme()" class="creating button success"><span class="class">добавить тему</span></a>
                        </div>
                    </div>
                    <p class="creating-theme__text">Завершение создания курса</p>
                    <div class="row" id="finish-row">
                        <div class="small-4 columns" style="margin-bottom: 100px;">
                            <a onclick="goStepOne()" class="creating button success"><span class="class">Вернуться к шагу 1</span></a>
                        </div>
                        <div class="small-4 columns">
                            <a onclick="addFinalTest()" class="creating button secondary"><span class="class">добавить итоговый тест</span></a>
                            <p class="reg-alert" id="alert-final">Наличие финального теста обязательно</p>
                        </div>
                        <div class="small-4 columns">
                            <a onclick="finishCourse()" class="creating button success"><span class="class">завершить</span></a>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <form id="third_step_form" style="display:none;">
            <div class="row">
                <div class="small-12 medium-12 columns end" style="margin-bottom:100px;">
                    <h1 class="creating-course__title" style="margin:0 auto;margin-top:50px;width:200px;">шаг 3</h1>
                    <p class="creating-theme__text">Создание теста для темы</p>
                    <div class="row final-type-select" style="display:none;">
                        <div class="small-12 medium-6 columns">
                            <a class="creating button secondary" onclick="setAutoFinal()" id="autoFinal"><span class="class">Автоматическое создание теста (из тестов тем)</span></a>
                        </div>
                        <div class="small-12 medium-6 columns">
                            <a class="creating button success" onclick="setManualFinal()" id="manualFinal"><span class="class">Ручное создание теста</span></a>
                        </div>
                    </div>
                    <div class="small-12 columns">
                        <p class="reg-alert auto-alert" style="position: static;">Тесты тем отсутствуют. Автоматическое создание невозможно.</p>
                    </div>
                    <div class="row  non-auto-questions">
                        <p id="qNumber" class="creating-theme__text" style="margin-top:50px;font-size: 1.3rem;"></p>
                    </div>
                    <div class="row  non-auto-questions">
                        <div class="small-12 medium-6 columns">
                            <a class="creating button non-active-button success" onclick="prevQuestion()" id="prevQuestion" style="font-size:1rem;"><span class="class"><i class="fa fa-long-arrow-left"></i></span></a>
                        </div>
                        <div class="small-12 medium-6 columns">
                            <a class="creating button non-active-button success" onclick="nextQuestion()" id="nextQuestion" style="font-size:1rem;"><span class="class"><i class="fa fa-long-arrow-right"></i></span></a>
                        </div>
                    </div>
                    <div id="start-of-questions" class="row  non-auto-questions" style="margin-top:30px;">
                        <div class="small-12 medium-6 columns">
                            <label><textarea id="question-text" placeholder="Ваш вопрос" style="min-height: 7rem;"></textarea></label>
                        </div>
                        <div class="small-12 medium-6 columns">
                            <div class="row">
                                <div class="medium-12 columns">
                                    <div class="add-files title-files" style="margin-top:0;margin-bottom: 1rem;background-color: #2980b9;border: 0;">Тип вопроса</div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="small-12 medium-6 columns">
                                    <a id="question-open" class="creating button secondary" onclick="setOpenQuestion()" style="min-height:3rem;"><span class="class">открытый вопрос</span></a>
                                </div>
                                <div class="small-12 medium-6 columns">
                                    <a id="question-options" class="creating button switch-success" onclick="setOptionQuestion()" style="min-height:3rem;"><span class="class">варианты ответа</span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="answers" class="non-auto-questions">
                    </div>
                </div>
                <div class="row  non-auto-questions" style="margin:0 auto 120px;">
                    <div class="small-6 medium-4 columns">
                        <a class="creating button secondary" onclick="deleteQuestion()"><span class="class">Удалить вопрос</span></a>
                    </div>

                    <div class="small-6 medium-4 columns">
                        <a class="creating button secondary" onclick="finishTest()"><span class="class">завершить создание теста</span></a>
                    </div>
                    <div class="small-6 medium-4 columns">
                        <a class="creating button success" onclick="newQuestion()"><span class="class">новый вопрос</span></a>
                    </div>
                </div>
                <div class="row auto-questions" style="display:none; margin:0 auto 120px;">
                    <div class="small-12 medium-12 columns">
                        <a class="creating button secondary" onclick="finishTest()"><span class="class">завершить создание теста</span></a>
                    </div>
                </div>
            </div>
        </form>
    </section>
</section>

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
<script src="js/jquery.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/foundation.min.js"></script>
<script src="js/creating-course.js"></script>
</body>
</html>
