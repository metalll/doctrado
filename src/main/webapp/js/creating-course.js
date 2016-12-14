$(document).foundation();
$.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
});

var is_photo = false;
var themes = [];
var cur_t = 0;
var cur_st = 0;
var cur_q = 0;
var opt_n;
var course;
var final_test_type = 'manual';

$(document).ready(function() {
    themes[cur_t] = [];
    themes[cur_t][cur_st] = {};

    $("#course-photo-input").change(function() {
        is_photo = false;
        var file, img;
        var _URL = window.URL || window.webkitURL;
        if ((file = this.files[0])) {
            if (this.files[0].size > 5242880) {
                alert("Размер картинки не должен превышать 5Мб");
                return;
            }
            img = new Image();
            img.onload = function() {
                is_photo = true;
                $(".head").css('background-image', 'url(' + img.src + ')');
                $("html, body").animate({scrollTop:0}, 800);
            };
            img.onerror = function() {
                alert("Выбранный файл не является картинкой!");
            };
            img.src = _URL.createObjectURL(file);
        }
    });

    $("#first_step_form").submit(function(event) {
        course = {};
        event.preventDefault();
        var photo = $('#course-photo-input').prop('files')[0];
        course['course_photo'] = is_photo;
        var errors = false;
        var form = $(this).serializeArray();
        for (var i = 0; i < form.length-1; i++) {
            var alert_c = $('#alert-' + i);
            var key = form[i]['name'];
            var value = form[i]['value'];
            alert_c.fadeOut();
            if (value == "") {
                alert_c.text('Заполните это поле').fadeIn();
                errors = true;
            }
            else course[key] = value;
        }
        $("#alert-3").fadeOut();
        course['course_price'] = form[3]['value'];
        if (course['course_price'] == "") course['course_price'] = 0;
        else {
            course['course_price'] = parseFloat(course['course_price'].replace(',','.').replace(' ',''));
            if (isNaN(course['course_price'])) {
                $("#alert-3").fadeIn();
                errors = true;
            }
        }
        if (errors) return;
        $.ajax({
            type: 'post',
            url: 'validate_course',
            data: {
                course_name: course['course_name']
            },
            success: function(data) {
                if (data==1) $("#alert-0").text('Курс с таким названием уже существует').fadeIn();
                else {
                    course['category_id'] = $('#category-select').val();
                    $('.content__firststep').fadeOut(0);
                    $('.content__secondstep').fadeIn();
                }
            }
        });
    });

    $("#theme_presentation").on('change', function() {
        var f = $('#theme_presentation').prop('files')[0];
        var p = $("#alert-theme-presentation");
        p.fadeOut();
        if (f.size>10485760) {
            p.text("Размер до 10Мб").fadeIn();
        }
        if (f.type!="application/pdf") {
            p.text("Только pdf формат").fadeIn();
        }
    });
});


function saveTheme() {
    var theme = themes[cur_t][cur_st];
    var errors = false;
    theme['presentation'] = $('#theme_presentation').prop('files')[0];
    var presentation_alert = $("#alert-theme-presentation");
    presentation_alert.fadeOut();
    if (theme['presentation']!=undefined) {
        if (theme['presentation'].size>10485760) {
            presentation_alert.text("Размер до 10Мб").fadeIn();
            theme['theme_presentation'] = false;
            errors = true;
        }
        if (theme['presentation'].type!="application/pdf") {
            presentation_alert.text("Только pdf формат").fadeIn();
            theme['theme_presentation'] = false;
            errors = true;
        }
        theme['theme_presentation'] = true;
    }
    else theme['theme_presentation'] = false;
    theme['file'] = $('#theme_file').prop('files')[0];
    var file_alert = $("#alert-theme-file");
    file_alert.fadeOut();
    if (theme['file']!=undefined) {
        if (theme['file'].size>10485760) {
            file_alert.text("Размер до 10Мб").fadeIn();
            theme['theme_file'] = false;
            errors = true;
        }
        if (theme['file'].type!="application/pdf") {
            file_alert.text("Только pdf формат").fadeIn();
            theme['theme_file'] = false;
            errors = true;
        }
        theme['theme_file'] = true;
    }
    else theme['theme_file'] = false;
    var form = $("#second_step_form").serializeArray();
    for (var i = 1; i < form.length; i++) {
        var key = form[i]['name'];
        var value = form[i]['value'];
        if (value == "") {
            theme[key] = "-";
        }
        else theme[key] = value;
    }
    if (errors) return false;
    themes[cur_t][cur_st] = theme;
    return true;
}

function loadTheme() {
    $("#second_step_form")[0].reset();
    var prev = $("#prev-theme-button");
    var next = $("#next-theme-button");
    if (cur_t==0&&cur_st==0) {
        if(!prev.hasClass("non-active-button")) prev.addClass("non-active-button");
    }
    else prev.removeClass("non-active-button");
    if (cur_t==themes.length-1&&cur_st==themes[cur_t].length-1) {
        if(!next.hasClass("non-active-button")) next.addClass("non-active-button");
    }
    else next.removeClass("non-active-button");
    var theme = themes[cur_t][cur_st];
    $('input[name=theme_name]').val(theme['theme_name']);
    $('textarea[name=theme_desc]').val(theme['theme_desc']);
    if (theme['theme_file']) document.getElementById('theme_file').files[0] = theme['file'];
    if (theme['theme_presentation']) document.getElementById('theme_presentation').files[0] = theme['presentation'];
    if (cur_st==0) $('#about-second-step').text("Тема номер " + (cur_t+1));
    else $('#about-second-step').text("Тема номер " + (cur_t+1) + "." + cur_st);
}

function newSubTheme() {
    if (saveTheme()) {
        cur_st++;
        themes[cur_t][cur_st] = {};
        $("html, body").animate({scrollTop: $("#about-second-step").offset().top}, 400);
        $("#creating-theme").finish().css('position', 'relative').animate({
            opacity: '0',
            left: '-=1000px'
        }, 400, 'easeInQuint', function () {
            loadTheme();
        }).animate({left: '+=2000px'}, 0).animate({opacity: '1', left: '-=1000px'}, 400, 'easeOutQuint', function () {
            $(this).css('position', 'static')
        });
    }
}

function newTheme() {
    if (saveTheme()) {
        cur_t = themes.length;
        cur_st = 0;
        themes[cur_t] = [];
        themes[cur_t][cur_st] = {};
        $("html, body").animate({scrollTop: $("#about-second-step").offset().top}, 400);
        $("#creating-theme").finish().css('position', 'relative').animate({
            opacity: '0',
            left: '-=1000px'
        }, 400, 'easeInQuint', function () {
            loadTheme();
        }).animate({left: '+=2000px'}, 0).animate({opacity: '1', left: '-=1000px'}, 400, 'easeOutQuint', function () {
            $(this).css('position', 'static')
        });
    }
}

function prevTheme() {
    if (cur_t==0&&cur_st==0) return;
    if (saveTheme()) {
        if (cur_t == 0 && cur_st == 0) return;
        if (cur_st == 0) {
            cur_t--;
            cur_st = themes[cur_t].length - 1;
        }
        else cur_st--;
        $("#creating-theme").finish().css('position', 'relative').animate({
            opacity: '0',
            left: '+=1000px'
        }, 400, 'easeInQuint', function () {
            loadTheme();
        }).animate({left: '-=2000px'}, 0).animate({
            opacity: '1',
            left: '+=1000px'
        }, 400, 'easeOutQuint', function () {
            $(this).css('position', 'static')
        });
    }
}

function nextTheme() {
    if (cur_t==themes.length&&cur_st==themes[cur_t].length) return;
    if (saveTheme()) {
        if (cur_t == themes.length - 1 && cur_st == themes[cur_t].length - 1) return;
        if (cur_st == themes[cur_t].length - 1) {
            cur_t++;
            cur_st = 0;
        }
        else cur_st++;
        $("#creating-theme").finish().css('position', 'relative').animate({
            opacity: '0',
            left: '-=1000px'
        }, 400, 'easeInQuint', function () {
            loadTheme();
        }).animate({left: '+=2000px'}, 0).animate({
            opacity: '1',
            left: '-=1000px'
        }, 400, 'easeOutQuint', function () {
            $(this).css('position', 'static')
        });
    }
}

function addVideoLink() {
    var v = $('input[name=theme_video]');
    if (themes[cur_t][cur_st]['theme_video']==""||themes[cur_t][cur_st]['theme_video']==undefined) v.val("");
    else v.val("www.youtube.com/watch?v=" + themes[cur_t][cur_st]['theme_video']);
    $(".add-link-popout").fadeIn();
    $("#alert-video").fadeOut();
}

function saveVideoLink() {
    themes[cur_t][cur_st]['theme_video'] = youtube_parser($('input[name=theme_video]').val());
    if (themes[cur_t][cur_st]['theme_video']=="") $("#alert-video").fadeIn();
    else cancellationButton();
}

function cancellationButton() {
    $(".add-link-popout").fadeOut(function () {$('input[name=theme_video]').val("");});
}

function youtube_parser(url){
    var regExp = /^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#\&\?]*).*/;
    var match = url.match(regExp);
    return (match&&match[7].length==11)? match[7] : "";
}

function saveQuestion() {
    var q_text = $("#question-text").val();
    if (q_text=="") {
        q_text = "-";
    }
    themes[cur_t][cur_st]['questions'][cur_q]['question_text'] = q_text;
    var t;
    if ($("#question-open").hasClass("switch-success")) t = "open";
    else t = "options";
    themes[cur_t][cur_st]['questions'][cur_q]['question_type'] = t;
    if (t=="options") {
        var form = $("#third_step_form").serializeArray();
        themes[cur_t][cur_st]['questions'][cur_q]['options'] = [];
        for (var i=0; i<form.length; i++) {
            themes[cur_t][cur_st]['questions'][cur_q]['options'][i] = {};
            var key = form[i]['name'];
            var value = form[i]['value'];
            if (value == "") {
                themes[cur_t][cur_st]['questions'][cur_q]['options'][i][key] = "-";
            }
            else themes[cur_t][cur_st]['questions'][cur_q]['options'][i][key] = value;
            themes[cur_t][cur_st]['questions'][cur_q]['options'][i]['question_option_correct'] = $("#answer-"+i+" #correctButton").hasClass('right-answer');
        }
    }
    return true;
}

function setOpenQuestion() {
    var o = $("#question-open");
    if (o.hasClass("switch-success")) return;
    o.removeClass("secondary").addClass("switch-success");
    $("#question-options").removeClass("switch-success").addClass("secondary");
    $("#answers").fadeOut();
}

function setOptionQuestion() {
    var q = $("#question-options");
    if (q.hasClass("switch-success")) return;
    q.removeClass("secondary").addClass("switch-success");
    $("#question-open").removeClass("switch-success").addClass("secondary");
    $("#answers").fadeIn();
}

function setCorrect(n) {
    var button = $("#answer-" + n +" #correctButton");
    if (button.hasClass('wrong-answer')) {
        button.removeClass('wrong-answer').addClass('right-answer');
        button.html("<span class='class'>правильный вариант</span>");
    }
    else {
        button.removeClass('right-answer').addClass('wrong-answer');
        button.html("<span class='class'>неправильный вариант</span>");
    }
}

function newOption() {
    if (opt_n==0) {
        $("#answer-0 #deleteButton").removeClass('non-active-button');
    }
    opt_n++;
    $('<div class="quotes row" id="answer-'+ opt_n +'">' +
        '<div class="small-12 medium-6 columns"><label><input name="question_option_text" type="text" placeholder="Вариант ответа"></label><p class="reg-alert">Заполните это поле</p></div>' +
        '<div class="small-12 medium-3 columns"><a class="creating button wrong-answer" id="correctButton" onclick="setCorrect('+ opt_n +')"><span class="class">неправильный вариант</span></a></div>' +
        '<div class="small-12 medium-3 columns"><a class="creating button secondary" id="deleteButton" onclick="deleteOption('+ opt_n +')"><span class="class">удалить вариант</span></a></div>' +
        '</div>').insertBefore("#new-option-row");
}

function deleteOption(n) {
    if (opt_n==0) return;
    $("#answer-" + n).remove();
    if (n==opt_n) {
        opt_n--;
        if (opt_n == 0) {
            $("#answer-0 #deleteButton").addClass('non-active-button');
        }
        return;
    }
    for (var i = n+1; i<=opt_n; i++) {
        $("#answer-" + i +" #correctButton").attr('onclick', 'setCorrect('+ (i-1) +')');
        $("#answer-" + i +" #deleteButton").attr('onclick', 'deleteOption('+ (i-1) +')');
        $("#answer-" + i).attr('id', "answer-" + (i-1));
    }
    opt_n--;
    if (opt_n == 0) {
        $("#answer-0 #deleteButton").addClass('non-active-button');
    }
}

function resetQuestion() {
    $("#answers").html('<div class="row">' +
        '<p class="creating-theme__text" style="font-size: 1.2rem;">Варианты</p>' +
        '</div>' +
        '<div class="quotes row" id="answer-0">' +
        '<div class="small-12 medium-6 columns">' +
        '<label><input name="question_option_text" type="text" placeholder="Вариант ответа"></label>' +
        '<p class="reg-alert">Заполните это поле</p>' +
        '</div><div class="small-6 medium-3 columns">' +
        '<a class="creating button wrong-answer" onclick="setCorrect(0)" id="correctButton"><span class="class">неправильный вариант</span></a>' +
        '</div><div class="small-6 medium-3 columns">' +
        '<a class="creating button secondary non-active-button" onclick="deleteOption(0)" id="deleteButton"><span class="class">удалить вариант</span></a>' +
        '</div></div>' +
        '<div class="row" id="new-option-row"><div class="small-12 medium-6 medium-centered columns"><a class="creating button success" onclick="newOption()"> <span class="class">добавить вариант</span></a></div></div></div>');
    setOptionQuestion();
    $("#question-text").val("");
    $("#qNumber").text("Вопрос " + (cur_q+1));
}

function newQuestion() {
    if (saveQuestion()) {
        cur_q = themes[cur_t][cur_st]['questions'].length;
        opt_n = 0;
        themes[cur_t][cur_st]['questions'][cur_q] = {};
        $("#third_step_form").finish().css('position', 'relative').animate({
            opacity: '0',
            left: '-=1000px'
        }, 400, 'easeInQuint', function () {
            if ($("#prevQuestion").hasClass('non-active-button')) $("#prevQuestion").removeClass('non-active-button');
            resetQuestion();
        }).animate({left: '+=2000px'}, 0).animate({opacity: '1', left: '-=1000px'}, 400, 'easeOutQuint', function () {
            $(this).css('position', 'static')
        });
    }
}

function loadQuestion() {
    $("#qNumber").text("Вопрос " + (cur_q+1));
    $("#question-text").val(themes[cur_t][cur_st]['questions'][cur_q]['question_text']);
    var answers = $("#answers");
    if (themes[cur_t][cur_st]['questions'][cur_q]['question_type'] == "open") {
        answers.hide(0);
        setOpenQuestion();
        $("#answers").html('<div class="row">' +
            '<p class="creating-theme__text" style="font-size: 1.2rem;">Варианты</p>' +
            '</div>' +
            '<div class="quotes row" id="answer-0">' +
            '<div class="small-12 medium-6 columns">' +
            '<label><input name="question_option_text" type="text" placeholder="Вариант ответа"></label>' +
            '<p class="reg-alert">Заполните это поле</p>' +
            '</div><div class="small-6 medium-3 columns">' +
            '<a class="creating button wrong-answer" onclick="setCorrect(0)" id="correctButton"><span class="class">неправильный вариант</span></a>' +
            '</div><div class="small-6 medium-3 columns">' +
            '<a class="creating button secondary non-active-button" onclick="deleteOption(0)" id="deleteButton"><span class="class">удалить вариант</span></a>' +
            '</div></div>' +
            '<div class="row" id="new-option-row"><div class="small-12 medium-6 medium-centered columns"><a class="creating button success" onclick="newOption()"> <span class="class">добавить вариант</span></a></div></div></div>');
    }
    else {
        answers.html('<div class="row" id="new-option-row"><div class="small-12 medium-6 medium-centered columns"><a class="creating button success" onclick="newOption()"> <span class="class">добавить вариант</span></a></div></div></div>');
        setOptionQuestion();
        for (opt_n = 0; opt_n<themes[cur_t][cur_st]['questions'][cur_q]['options'].length; opt_n++) {
            $('<div class="quotes row" id="answer-'+ opt_n +'">' +
                '<div class="small-12 medium-6 columns"><label><input name="question_option_text" type="text" placeholder="Вариант ответа" value="' + themes[cur_t][cur_st]["questions"][cur_q]["options"][opt_n]["question_option_text"] + '"></label></div>' +
                '<div class="small-12 medium-3 columns"><a class="creating button wrong-answer" id="correctButton" onclick="setCorrect('+ opt_n +')"><span class="class">неправильный вариант</span></a></div>' +
                '<div class="small-12 medium-3 columns"><a class="creating button secondary" id="deleteButton" onclick="deleteOption('+ opt_n +')"><span class="class">удалить вариант</span></a></div>' +
                '</div>').insertBefore("#new-option-row");
            if (themes[cur_t][cur_st]["questions"][cur_q]["options"][opt_n]["question_option_correct"]) setCorrect(opt_n);
        }
    }
}

function prevQuestion() {
    if (cur_q<1) return;
    if (saveQuestion()) {
        cur_q--;
        $("#third_step_form").finish().css('position', 'relative').animate({
            opacity: '0',
            left: '+=1000px'
        }, 400, 'easeInQuint', function () {
            loadQuestion();
            if ($("#nextQuestion").hasClass('non-active-button')) $("#nextQuestion").removeClass('non-active-button');
            if (cur_q<1) {
                if (!$("#prevQuestion").hasClass('non-active-button')) $("#prevQuestion").addClass('non-active-button');
            }
        }).animate({left: '-=2000px'}, 0).animate({opacity: '1', left: '+=1000px'}, 400, 'easeOutQuint', function () {
            $(this).css('position', 'static')
        });
    }
}

function nextQuestion() {
    if (cur_q==themes[cur_t][cur_st]["questions"].length-1) return;
    if (saveQuestion()) {
        cur_q++;
        $("#third_step_form").finish().css('position', 'relative').animate({
            opacity: '0',
            left: '-=1000px'
        }, 400, 'easeInQuint', function () {
            loadQuestion();
            if ($("#prevQuestion").hasClass('non-active-button')) $("#prevQuestion").removeClass('non-active-button');
            if (cur_q >= themes[cur_t][cur_st]["questions"].length - 1) {
                if (!$("#nextQuestion").hasClass('non-active-button')) $("#nextQuestion").addClass('non-active-button');
            }
        }).animate({left: '+=2000px'}, 0).animate({
            opacity: '1',
            left: '-=1000px'
        }, 400, 'easeOutQuint', function () {
            $(this).css('position', 'static')
        });
    }
}

function deleteQuestion() {
    if (themes[cur_t][cur_st]['questions'].length>1) {
        var form = $("#third_step_form");
        form.fadeOut(function () {
            if (cur_q==themes[cur_t][cur_st]['questions'].length-1) {
                delete themes[cur_t][cur_st]['questions'][cur_q];
                cur_q--;
                themes[cur_t][cur_st]['questions'].length--;
                loadQuestion();
                if (cur_q==0) if (!$("#prevQuestion").hasClass('non-active-button')) $("#prevQuestion").addClass('non-active-button');
                form.fadeIn();
                return;
            }
            for (var i = cur_q; i < themes[cur_t][cur_st]['questions'].length-1; i++) {
                themes[cur_t][cur_st]['questions'][i] = themes[cur_t][cur_st]['questions'][i+1];
            }
            delete themes[cur_t][cur_st]['questions'][themes[cur_t][cur_st]['questions'].length];
            if (cur_q!=0) cur_q--;
            themes[cur_t][cur_st]['questions'].length--;
            loadQuestion();
            if (cur_q==0) if (!$("#prevQuestion").hasClass('non-active-button')) $("#prevQuestion").addClass('non-active-button');
            if (cur_q>=themes[cur_t][cur_st]["questions"].length-1) {
                if (!$("#nextQuestion").hasClass('non-active-button')) $("#nextQuestion").addClass('non-active-button');
            }
            form.fadeIn();
        });
    }
    else {
        delete themes[cur_t][cur_st]['questions'];
        $("#third_step_form").hide(0);
        if (temp_test != undefined) {
            final_test = undefined;
            if (temp_test.length==0) themes[cur_t][cur_st]['questions'] = undefined;
            else themes[cur_t][cur_st]['questions'] = temp_test;
            temp_test = undefined;
        }
        $("#second_step_form").fadeIn(600);
    }
}

function addTest() {
    if (saveTheme()) {
        cur_q = 0;
        if (themes[cur_t][cur_st]['questions'] != undefined) {
            if (themes[cur_t][cur_st]['questions'].length>1) {
                if ($("#nextQuestion").hasClass('non-active-button')) $("#nextQuestion").removeClass('non-active-button');
            }
            else if (!$("#nextQuestion").hasClass('non-active-button')) $("#nextQuestion").addClass('non-active-button');
            if (!$("#prevQuestion").hasClass('non-active-button')) $("#prevQuestion").addClass('non-active-button');
            loadQuestion();
        }
        else {
            themes[cur_t][cur_st]['questions'] = [];
            themes[cur_t][cur_st]['questions'][cur_q] = {};
            opt_n = 0;
            if (!$("#nextQuestion").hasClass('non-active-button')) $("#nextQuestion").addClass('non-active-button');
            if (!$("#prevQuestion").hasClass('non-active-button')) $("#prevQuestion").addClass('non-active-button');
            resetQuestion();
        }
        $("#second_step_form").hide(0);
        $("#third_step_form").fadeIn(600);
        $("html, body").animate({scrollTop:  $("#third_step_form").offset().top}, 800);
    }
}

function finishTest() {
    if (saveQuestion()) {
        $("#third_step_form").hide(0);
        if (temp_test!=undefined) {
            $('.final-type-select').fadeOut(0);
            final_test = themes[cur_t][cur_st]['questions'];
            if (temp_test.length==0) delete themes[cur_t][cur_st]['questions'];
            else themes[cur_t][cur_st]['questions'] = temp_test;
            temp_test = undefined;
            $(".auto-questions").fadeOut();
            $(".non-auto-questions").fadeIn();
        }
        $("#second_step_form").fadeIn(600);
    }
}

function deleteTheme() {
    if ((themes.length>1&&cur_st==0)||cur_st!=0) {
        var form = $("#second_step_form");
        form.fadeOut(function () {
            if(cur_st==0) {
                for (var i = cur_t; i < themes.length-1; i++) {
                    themes[i] = themes[i+1];
                }
                delete themes[themes.length-1];
                cur_st=0;
                if (cur_t!=0) cur_t--;
                themes.length--;
                loadTheme();
            }
            else {
                if (cur_st==themes[cur_t].length-1) {
                    delete themes[cur_t][cur_st];
                    cur_st--;
                    themes[cur_t].length--;
                    loadTheme();
                    form.fadeIn();
                    return;
                }
                for (var i = cur_st; i < themes[cur_t].length-1; i++) {
                    themes[cur_t][i] = themes[cur_t][i+1];
                }
                delete themes[cur_t][themes.length-1];
                cur_st--;
                themes[cur_t].length--;
                loadTheme();
            }
            form.fadeIn();
        });
    }
}

var temp_test;
var final_test;

function addFinalTest() {
    $('.final-type-select').fadeIn(0);
    if (final_test_type=='auto') {
        if (mergeQuestions().length>0) {
            $(".auto-questions").fadeIn();
            $(".non-auto-questions").fadeOut();
        }
        else {
            setManualFinal();
        }
    }
    if (final_test!=undefined&&final_test.length < 1) final_test = undefined;
    temp_test = themes[cur_t][cur_st]['questions'];
    if (temp_test==undefined) temp_test=[];
    themes[cur_t][cur_st]['questions'] = final_test;
    addTest();
}

function finishCourse() {
    if (saveTheme()) {
        var alert_final = $("#alert-final");
        alert_final.fadeOut();
        if (final_test_type=='auto') final_test = mergeQuestions();
        if (final_test!=undefined&&final_test.length < 1) final_test = undefined;
        if (final_test != undefined) {
            $("#loading-bg").fadeIn();
            $.ajax({
                type: 'post',
                url: 'createCourse',
                data: {
                    course: course
                },
                success: function (id) {
                    $("#course-info-status").text("Создание информации о курсе: ГОТОВО");
					var themes_count = 0;
                    var themes_created = 0;
                    var files_count = 0;
                    var files_uploaded = 0;
                    for (var i = 0; i < themes.length; i++) {
                        themes_count += themes[i].length;
                        for (var j = 0; j < themes[i].length; j++) {
                            if (themes[i][j]['theme_presentation']) files_count++;
                            if (themes[i][j]['theme_file']) files_count++;
                        }
                    }
                    $("#themes-info-status").text("Создание тем курса: " + themes_created + "/" + themes_count);
                    $("#files-info-status").text("Загрузка файлов курса: " + files_uploaded + "/" + files_count);
					themes_count++;
                    $.ajax({
                        type: 'post',
                        url: 'createFinalTest',
                        data: {
                            final_test: final_test,
                            id: id
                        },
                        success: function () {
							themes_created++;
                            $("#final-info-status").text("Создание финального теста: ГОТОВО");
							if (files_uploaded==files_count&&themes_count==themes_created) {
								window.location = "http://doctrado.me/course/id"+id;
							}
                        }
                    });
                    if (is_photo&&$('#course-photo-input').prop('files').length>0) {
						files_count++;
                        var photo = $('#course-photo-input').prop('files')[0];
                        var photo_data = new FormData();
                        photo_data.append('photo', photo);
                        photo_data.append('id', id);
                        $.ajax({
                            type: 'post',
                            url: 'uploadCoursePhoto',
                            processData: false,
                            contentType: false,
                            cache: false,
                            data: photo_data,
                            success: function () {
								files_uploaded++;
                                $("#course-photo-status").text("Загрузка изображения курса: ГОТОВО");
								if (files_uploaded==files_count&&themes_count==themes_created) {
									window.location = "http://doctrado.me/course/id"+id;
								}
                            }
                        });
                    }
                    for (var i = 0; i < themes.length; i++) {
                        for (var j = 0; j < themes[i].length; j++) {
                            var document = themes[i][j]['file'];
                            var presentation = themes[i][j]['presentation'];
                            themes[i][j]['file'] = undefined;
                            themes[i][j]['presentation'] = undefined;
                            $.ajax({
                                type: 'post',
                                url: 'createTheme',
                                data: {
                                    theme: themes[i][j],
                                    t: i,
                                    st: j,
                                    id: id
                                },
                                success: function () {
                                    themes_created++;
                                    $("#themes-info-status").text("Создание тем курса: " + themes_created + "/" + themes_count);
                                    if (files_uploaded==files_count&&themes_count==themes_created) {
                                        window.location = "http://doctrado.me/course/id"+id;
                                    }
                                }
                            });
                            if (themes[i][j]['theme_file']) {
                                var file_data = new FormData();
                                file_data.append('document', document);
                                file_data.append('course_id', id);
                                file_data.append('theme_t', i);
                                file_data.append('theme_st', j);
                                $.ajax({
                                    type: 'post',
                                    url: 'uploadThemeDocument',
                                    processData: false,
                                    contentType: false,
                                    cache: false,
                                    data: file_data,
                                    success: function () {
                                        files_uploaded++;
                                        $("#files-info-status").text("Загрузка файлов курса: " + files_uploaded + "/" + files_count);
                                        if (files_uploaded==files_count&&themes_count==themes_created) {
                                            window.location = "http://doctrado.me/course/id"+id;
                                        }
                                    }
                                });
                            }
                            if (themes[i][j]['theme_presentation']) {
                                var p_data = new FormData();
                                p_data.append('presentation', presentation);
                                p_data.append('course_id', id);
                                p_data.append('theme_t', i);
                                p_data.append('theme_st', j);
                                $.ajax({
                                    type: 'post',
                                    url: 'uploadThemePresentation',
                                    processData: false,
                                    contentType: false,
                                    cache: false,
                                    data: p_data,
                                    success: function () {
                                        files_uploaded++;
                                        $("#files-info-status").text("Загрузка файлов курса: " + files_uploaded + "/" + files_count);
                                        if (files_uploaded==files_count&&themes_count==themes_created) {
                                            window.location = "http://doctrado.me/course/id"+id;
                                        }
                                    }
                                });
                            }
                        }
                    }
                }
            });
        }
        else {
            alert_final.fadeIn().delay(2000).fadeOut();
            $("html, body").animate({scrollTop:  $(document).height()}, 800);
        }
    }
}

function goStepOne() {
    $('.content__secondstep').fadeOut(0);
    $('.content__firststep').fadeIn();
}

function mergeQuestions() {
    var merged = new Array();
    for (var i = 0; i < themes.length; i++) {
        for (var j = 0; j < themes[i].length; j++) {
            if (typeof themes[i][j].questions !=='undefined') {
                for (var k = 0; k < themes[i][j].questions.length; k++) {
                    merged.push(jQuery.extend(true, {}, themes[i][j].questions[k]));
                    merged[merged.length-1]['question_text'] = "auto_" + i + "_" + j + "_" + merged[merged.length-1]['question_text'];
                }
            }
        }
    }
    return merged;
}

function setAutoFinal() {
    var auto = $("#autoFinal");
    var manual = $("#manualFinal");
    if (temp_test!=undefined) {
        final_test = themes[cur_t][cur_st]['questions'];
        if (temp_test.length==0) delete themes[cur_t][cur_st]['questions'];
        else themes[cur_t][cur_st]['questions'] = temp_test;
        temp_test = undefined;
        if (mergeQuestions().length>0) {
            if (auto.hasClass('secondary')) {
                auto.removeClass('secondary').addClass('success');
                manual.removeClass('success').addClass('secondary');
                $(".non-auto-questions").fadeOut();
                $(".auto-questions").fadeIn();
                final_test_type = 'auto';
            }
        }
        else {
            $('.auto-alert').fadeIn().delay(2000).fadeOut();
        }
    }
    if (final_test!=undefined&&final_test.length < 1) final_test = undefined;
    temp_test = themes[cur_t][cur_st]['questions'];
    if (temp_test==undefined) temp_test=[];
    themes[cur_t][cur_st]['questions'] = final_test;
}

function setManualFinal() {
    var auto = $("#autoFinal");
    var manual = $("#manualFinal");
    if (manual.hasClass('secondary')) {
        manual.removeClass('secondary').addClass('success');
        auto.removeClass('success').addClass('secondary');
        $(".auto-questions").fadeOut();
        $(".non-auto-questions").fadeIn();
        final_test_type = 'manual';
    }
}