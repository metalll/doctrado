$.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
});

$(document).foundation();

$(document).ready(function () {

    // Dashboard Navigation (Desktop + Mobile)
    var dashboard_nav = $('#dashboard__nav');

    $('#dashboard-btn').click(function () {
        if (dashboard_nav.css('transform') === 'matrix(1, 0, 0, 1, 0, 0)') {
            dashboard_nav.css('transform', 'translate(100%)');
        } else {
            dashboard_nav.css('transform', 'translate(0)');
        }
    });

    // Dashboard Menu Functional
    var dash_menu_item = $('.dashboard__menu-elem');

    dash_menu_item.on('click', function () {
        var self = this;
        var dash_content = $('#' + $(self).attr('data-content'));

        if ($(dash_content).css('display') === 'none' && $(self).hasClass('active') === false) {
            dash_menu_item.removeClass('active');
            $('.dashboard__content').hide();
            $(self).addClass('active');
            $(dash_content).fadeIn();
        }
    });

    // Courses and Themes Functional

    // // Course Select

    var course_select = $('#course-choose-courses');

    course_select.on('change', function () {
        $('.course-panel').fadeOut(0);
        $('.change-category-block').fadeOut(0);
        $('#' + $(this).val()).fadeIn();
    });

    $("#course-choose-certificates").change(function() {
        $('.course-panel-certificates').fadeOut(0);
        $('.add-student-panel-field').fadeOut(0);
        $('#' + $(this).val()).fadeIn();
    });

    // // Delete Course Button
    var delete_course = $('.delete-course');

    delete_course.on('click', function () {
        $('.delete-course-popup-wrapper').fadeIn();
    });

    $('.delete-course-popup-button, .delete-course-popup-bg').on('click', function () {
        $('.delete-course-popup-wrapper').fadeOut()
    });

    // // Delete Theme Button
    var delete_btn = $('.course-panel-button');

    delete_btn.on('click', function () {
        var current_theme = $('#' + $(this).attr('data-delete'));
        current_theme.remove();
    });

    // // Add Student Button

    $('.add-student-button').on('click', function () {
        var add_student_panel = $('.add-student-panel-field');

        if($(add_student_panel).css('display') === 'none') {
            $(add_student_panel).fadeIn();
        }
    });

    // // Add Subcategory Button
    $('#add-subcategory-button').on('click', function () {
        var add_subcategory_panel = $('.subcategory-creating-panel');

        if($(add_subcategory_panel).css('display') === 'none') {
            $(add_subcategory_panel).fadeIn();
        }
    });

    // // Add Category Button

    $('#add-category-button').on('click', function () {
        var add_category_panel = $('.category-creating-panel');

        if($(add_category_panel).css('display') === 'none') {
            $(add_category_panel).fadeIn();
        }
    });

    //Statistics loading

    $('#year-select').change(function() {
        loadPayouts();
    });

    $('#month-select').change(function() {
        loadPayouts();
    });

    //Categories
    $('.category-choose').change(function() {
        $('.subcategory-creating-panel').fadeOut();
        var value = $(this).val();
        if (value.indexOf('-')==-1) {
            $('.subcat-button').hide(0);
            $('.cat-button').fadeIn();
        }
        else {
            $('.cat-button').hide(0);
            $('.subcat-button').fadeIn();
        }
    });

    $(".change-category-button").click(function() {
        var block = $(".change-category-block");
        if (block.css('display')=="none") {
            block.fadeIn();
        }
        else {
            block.fadeOut();
        }
    });
	
	$('.cancel-btn').on('click', function () {
        $('.cancel-popup-wrapper').fadeIn();
    });

    $('#cancel-popup-close, .cancel-popup-bg').on('click', function () {
        $('.cancel-popup-wrapper').fadeOut();
    });
});

function loadPayouts() {
    var table = $("#payouts_table");
    $.ajax({
        type: 'post',
        url: 'getPayouts',
        data: {
            month: $('#month-select').val(),
            year: $('#year-select').val()
        },
        success: function(payouts) {
            $('.payouts_tr').remove();
            for (var i = 0; i < payouts.length; i++) {
                table.append('<tr class="payouts_tr">' +
                    '<td style="text-align: center;" rowspan="' + payouts[i]['courses'].length + '"><a class="dashboard-url" href="profile/' + payouts[i]['teacher']['user_id'] + '">' + payouts[i]['teacher']['name'] + ' ' + payouts[i]['teacher']['surname'] +'</a><br><br>Номер карты:<br>' + payouts[i]['teacher']['card'] + '</td>' +
                    '<td style="text-align: center;word-break: break-all;">' + payouts[i]['courses'][0]['course_name'] + '</td>' +
                    '<td style="text-align: center;">' + payouts[i]['courses'][0]['course_sum'] + ' грн.</td>' +
                    '<td style="text-align: center;" rowspan="' + payouts[i]['courses'].length + '">' + payouts[i]['sum'] + ' грн.</td></tr>');
                if (payouts[i]['courses'].length>1) {
                    for (var j = 1; j< payouts[i]['courses'].length; j++) {
                        table.append('<tr class="payouts_tr">' +
                            '<td style="text-align: center;word-break: break-word;">' + payouts[i]['courses'][j]['course_name'] + '</td>' +
                            '<td style="text-align: center;">' + payouts[i]['courses'][j]['course_sum'] + ' грн.</td></tr>');
                    }
                }
            }
            table.fadeOut().finish().fadeIn();
        }
    })
}

//New teachers confirm
function confirmTeacher(id) {
    var button = $("#teacher-"+id+" button");
    button.attr('onclick', '');
    $.ajax({
        type: 'post',
        url: 'confirmTeacher',
        data: {
            id: id
        },
        success: function() {
            button.text('Подтвержден');
            $("#teacher-"+id).hide(600);
        }
    });
}

//Delete Course
function deleteCourse() {
    var course_id = $('#course-choose-courses').val().split('-')[1];
    $.ajax({
        type: 'post',
        url: 'deleteCourse',
        data: {
            id: course_id
        },
        success: function() {
            location.reload();
        }
    });
}

//Categories
function createCategory() {
    var name = $("#category_name").val();
    $.ajax({
        type: 'post',
        url: 'createCategory',
        data: {
            name: name
        },
        success: function() {
            location.reload();
        }
    });
}

function createSubcategory() {
    var name = $("#subcategory_name").val();
    var cat = $('.category-choose').val();
 //   var parent =
    $.ajax({
        type: 'post',
        url: 'createSubcategory',
        data: {
            name: name,
            cat: cat
        },
        success: function() {
            location.reload();
        }
    });
}

function deleteCategory() {
    var cat = $('.category-choose').val();
    if (cat.indexOf('-')!=-1) {
        cat = cat.split('-');
        var subcat = cat[1];
        cat = cat[0];
        $.ajax({
            type: 'post',
            url: 'deleteCategory',
            data: {
                cat: cat,
                subcat: subcat
            },
            success: function() {
                location.reload();
            }
        });
    }
    else {
        $.ajax({
            type: 'post',
            url: 'deleteCategory',
            data: {
                cat: cat
            },
            success: function() {
                location.reload();
            }
        });
    }
}

function changeCategory(id) {
    var cat = $("#change-category-select-"+id).val().split('-')[1];
    $.ajax({
        type: 'post',
        url: 'changeCategory',
        data: {
            cat: cat,
            id: id
        },
        success: function() {
            $('.change-category-block').fadeOut();
        }
    });
}

//Certificates

function saveCertificate(id) {
    var number = $("#existing-certificate-number-"+id).val();
    $.ajax({
        type: 'post',
        url: 'saveCertificate',
        data: {
            number: number,
            id: id
        },
        success: function() {
            location.reload();
        }
    });
}

function addCertificate(id) {
    var name = $("#certificate-name-"+id).val();
    var number = $("#certificate-number-"+id).val();
    $.ajax({
        type: 'post',
        url: 'addCertificate',
        data: {
            name: name,
            number: number,
            id: id
        },
        success: function() {
            location.reload();
        }
    });
}

function initDeleteCourse(id) {
    $("#delete-course-button").attr('onclick', 'deleteCourse('+id+')');
}

function initDenyTeacher(id) {
    $("#cancel-popup-ok").attr('onclick', 'denyTeacher('+id+')');
}

function denyTeacher(id) {
    var reason = $("#cancel-popup-reason").val();
    if (reason!="") {
        reason = $("#cancel-popup-select").val() + ". Подробнее: " + reason;
    }
    else {
        reason = $("#cancel-popup-select").val();
    }
    $.ajax({
        type: 'post',
        url: 'convertToStudent',
        data: {
            reason: reason,
            user_id: id
        },
        success: function() {
            $("#teacher-"+id).hide(600);
            $('.cancel-popup-wrapper').fadeOut();
        }
    });
}