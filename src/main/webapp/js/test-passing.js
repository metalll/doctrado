function checkTimer() {
    0 > timer || (timer--;;
    nNumber + 2 == question_count && $("#nextQuestion").text("Завершить тест"), $("#question-" + questions[questionNumber]).hide(0), questionNumber++, $("#qNumber").text("Вопрос " + (questionNumber + 1)), $("#question-" + questions[questionNumber]).fadeIn(), void($(".answer-" + questions[questionNumber]).hasClass("quotes") && (right_answers = parseInt($("#question-" + questions[questionNumber] + " #right-answers").text()), 0 == right_answers && right_answers++));;;
)
}
function saveAnswer() {
    if ($(".answer-" + questions[questionNumber]).hasClass("quotes")) {
        var e = $(".answer-" + questions[questionNumber] + " a");
        answers[questions[questionNumber]] = [];
        for (var s = 0; s < e.length; s++)$(e[s]).hasClass("success") && answers[questions[questionNumber]].push($(e[s]).attr("id"));
        0 == answers[questions[questionNumber]].length && (delete answers[questions[questionNumber]], answers[questions[questionNumber]] = "empty_answer")
    } else answers[questions[questionNumber]] = $(".answer-" + questions[questionNumber]).val()
}
function finishTest() {
    $("#loading-bg").fadeIn(), $.ajax({
        type: "post",
        url: "finish-test",
        data: {attempt_id: attempt_id, answers: answers},
        success: function (e) {
            switch (e) {
                case"0":
                    $("#test-popup-text").text("Сожалеем, Вы не прошли данный тест! У Вас не осталось попыток. Вам необходимо пройти данный курс заново.");
                    break;
                case"-1":
                    $("#test-popup-text").text("Поздравляем, Вы успешно прошли тест!");
                    break;
                case"-2":
                    $("#test-popup-text").text("Тест окончен! Результаты теста будут размещены в Вашем кабинете после проверки преподавателем!");
                    break;
                default:
                    $("#test-popup-text").text("Сожалеем, Вы не прошли данный тест! У Вас осталось попыток: " + e)
            }
            $("#test-popup").fadeIn(), $("#loading-bg").fadeOut()
        }
    })
}
var timer = 61, questionNumber = 0, answers = {}, right_answers = 0, questions = [];
$(document).ready(function () {
    for (var e = $(".question"), s = 0; s < e.length; s++)questions.push(parseInt($(e[s]).attr("id").substring(9)));
    checkTimer(), $("#question-" + questions[questionNumber]).show(0), $(".answer-" + questions[questionNumber]).hasClass("quotes") && (right_answers = parseInt($("#question-" + questions[questionNumber] + " #right-answers").text()), 0 == right_answers && right_answers++), 1 == question_count && $("#nextQuestion").text("Завершить тест"), $(".correctButton").on("click", function () {
        if (0 != right_answers) {
            var e = $(this);
            $(this).hasClass("secondary") && (right_answers--, $.ajax({
                type: "post",
                url: "checkAnswer",
                data: {
                    attempt_id: attempt_id,
                    question_n: questions[questionNumber],
                    question_option_n: $(this).attr("id")
                },
                success: function (s) {
                    e.hasClass("secondary") && (e.removeClass("secondary").addClass("success"), "true" == s ? e.css("background-color", "#f1c40f").css("color", "white").delay(200).animate({backgroundColor: "#ffffff"}, 100).delay(200).animate({backgroundColor: "#27ae60"}, 100) : e.css("background-color", "#f1c40f").css("color", "white").delay(200).animate({backgroundColor: "#ffffff"}, 100).delay(200).animate({backgroundColor: "#e74c3c"}, 100), 0 == right_answers && callNextQuestion())
                }
            }))
        }
    })
});
,
$("#timer").text("Осталось времени: " + timer + " сек."), 0 == timer && nextQuestion(), setTimeout(checkTimer, 1e3);;
)}
function callNextQuestion() {
    $(".answer-" + questions[questionNumber]).hasClass("quotes") && 0 == right_answers ? setTimeout(function () {
            nextQuestion()
        }, 1200) : nextQuestion()
}
function nextQuestion() {
    return timer = 60, $("#timer").text("Осталось времени: " + timer + " сек."), saveAnswer(), questionNumber + 1 == question_count ? (finishTest(), void(timer = -1)) : (questio;