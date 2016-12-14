
$(document).ready(function() {
    $('#dpt').fdatepicker({
        format: 'yyyy-mm-dd hh:ii',
        disableDblClickSelection: true,
        language: 'vi',
        pickTime: true
    });
});

function saveWebinar() {
    var form = $("#webinar-form").serializeArray();
    var webinar = {};
    for (var i = 0; i < form.length; i++) {
        webinar[form[i]['name']] = form[i]['value'];
    }
    var errors = false;
    if (webinar['subject'] == "") {
        $("#alert-subject").fadeIn().delay(1000).fadeOut();
        errors = true;
    }
    webinar['course_id'] = $("#webinar-course").val();
    if (webinar['course_id'] == "-1") {
        $("#alert-course").fadeIn().delay(1000).fadeOut();
        errors = true;
    }
    if (webinar['datetime'] == "") {
        $("#alert-date").fadeIn().delay(1000).fadeOut();
        errors = true;
    }
    else webinar['datetime'] = webinar['datetime'] + ":00";
    if (errors) return;
    webinar['user_id'] = user_id;
    if (webinar_id == -1) {
        $.ajax({
            type: 'post',
            url: '../createWebinar',
            data: {
                webinar: webinar
            },
            success: function () {
                location.href = "../webinar";
            }
        });
    }
    else {
        $.ajax({
            type: 'post',
            url: '../editWebinar',
            data: {
                webinar: webinar,
                webinar_id: webinar_id
            },
            success: function () {
                location.href = "../webinar";
            }
        });
    }
}