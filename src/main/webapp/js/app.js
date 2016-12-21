$.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
});

$(document).foundation();

// Partners Slider
$(document).ready(function() {
    $('.red-button').on('click',function(){
        $('#modal1').modal('open');
    });


    $('.partners__slider').slick({
        dots: true,
        arrows: false,
        infinite: false,
        speed: 300,
        slidesToShow: 5,
        slidesToScroll: 5,
        responsive: [
            {
                breakpoint: 1024,
                settings: {
                    slidesToShow: 3,
                    slidesToScroll: 3,
                    infinite: true,
                    dots: true
                }
            },
            {
                breakpoint: 600,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 2,
                    dots: false
                }
            },
            {
                breakpoint: 480,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    dots: false
                }
            }
        ]
    });

// Registration Popup

    $('.reg-button').on('click', function () {
        $('.reg-popup').fadeIn();
        $('body').css('overflow-y', 'hidden');
    });

    $('.reg-popup__bg, .reg-popup__close-button').on('click', function () {
        $('.reg-popup, .reg-popup-second').fadeOut();
        $('body').css('overflow-y', 'auto');
    });


    $('.reg-popup__back').on('click', function () {
        $('.reg-popup-second').fadeOut();
        $('.reg-popup').fadeIn();
    });

// Login Popup

    $('#login-btn').on('click', function () {
        $('#login-popup').fadeIn();
        $('body').css('overflow-y', 'hidden');
    });

    $('.login-popup__close-button, .login-popup__bg').on('click', function () {
        $('.login-popup').fadeOut();
        $('body').css('overflow-y', 'auto');
    });

// Registration Form Validation
    var user;
    $('.reg-popup__teacher-submit').click(function() {
        user = {};
        user['user_type'] = 't';
        $('#registration-form').submit();
    });

    $('.reg-popup__student-submit').click(function() {
        user = {};
        user['user_type'] = 's';
        $('#registration-form').submit();
    });

    $('#registration-form').submit(function (event) {
        event.preventDefault();
        var form = $(this).serializeArray();
        var errors = false;
        for (var i=0; i<form.length-1; i++) {
            var alert_c = $('#alert-'+i);
            var key = form[i]['name'];
            var value = form[i]['value'];
            alert_c.fadeOut();
            if (value=="") {
                alert_c.text('Заполните это поле').fadeIn();
                errors = true;
            }
            else user[key]=value;
        }
        user[form[8]['name']] =  form[8]['value'];
        var alert_terms = $("#alert-terms");
        alert_terms.fadeOut();
        if (!$("#terms-checkbox")[0].checked) {
            alert_terms.fadeIn();
            errors = true;
        }
        if (errors) return;
        $.ajax({
            type: 'post',
            url: 'validate_user',
            data: {
                user: user
            },
            success: function(data) {
                switch(parseInt(data)) {
                    case 0:
                        $('.reg-popup').fadeOut();
                        if(user['user_type']=='s') {
                            $("#reg-second-title").html("Регистрация<br>студента");
                            $("#reg-second-column1").hide(0);
                            $("#reg-second-column2").removeClass("medium-6").addClass("medium-12");
                        }
                        else {
                            $("#reg-second-title").html("Регистрация<br>преподавателя");
                            $("#reg-second-column1").show(0);
                            $("#reg-second-column2").removeClass("medium-12").addClass("medium-6");
                        }
                        $('.reg-popup-second').fadeIn();
                        break;
                    case 1:
                        $('#alert-3').text('Данный e-mail уже используется').fadeIn();
                        break;
                    case 2:
                        $('#alert-5').text('Данный телефон уже используется').fadeIn();
                        break;
                    case 3:
                        $('#alert-3').text('Данный e-mail уже используется').fadeIn();
                        $('#alert-5').text('Данный телефон уже используется').fadeIn();
                        break;
                }
            }
        });
    });

    var is_photo = false;

    $("#registration-form-2").submit(function(event) {
        var teacher = {};
        event.preventDefault();
        var photo = $('#avatar-input').prop('files')[0];
        user['photo'] = is_photo;
        var errors = false;
        if(user['user_type']=='t') {
            var form = $(this).serializeArray();
            for (var i=0; i<form.length; i++) {
                var alert_c = $('#alert-2-'+i);
                var key = form[i]['name'];
                var value = form[i]['value'];
                alert_c.fadeOut();
                if (value=="") {
                    alert_c.text('Заполните это поле').fadeIn();
                    errors = true;
                }
                else teacher[key]=value;
            }
            var document = $('#document-input').prop('files')[0];
            var alert_document = $('#alert-2-confirmation');
            alert_document.fadeOut();
            if (document == undefined) {
                alert_document.text("Для регистрации профиля преподавателя необходимо предоставить подтверждающие документы").fadeIn();
                errors = true;
            }
            else if (document.size > 10485760) {
                alert_document.text("Размер документа не должен превышать 10Мб!").fadeIn();
                errors = true;
            }
        }
        var alert_terms = $("#alert-2-terms");
        alert_terms.fadeOut();
        if (!$("#terms-2-checkbox")[0].checked) {
            alert_terms.fadeIn();
            errors = true;
        }
        if (errors) return;
        $.ajax({
            type: 'post',
            url: 'register',
            data: {
                user: user,
                teacher: teacher
            },
            success: function(data) {
                $("#loading-bg").fadeIn();
                var counter = 0;
				if (user['photo']) {
                    counter++;
                }
                if(user['user_type']=='t') {
                    counter++;
                }
                if (user['photo']) {
                    var photo_data = new FormData();
                    photo_data.append('photo', photo);
                    photo_data.append('id', data);
                    $.ajax({
                        type: 'post',
                        url: 'uploadPhoto',
                        processData: false,
                        contentType: false,
                        cache: false,
                        data: photo_data,
                        success: function() {
                            counter--;
                            if (counter==0) {
                                location.reload();
                            }
                        }
                    });
                }
                if(user['user_type']=='t') {
                    var document_data = new FormData();
                    document_data.append('document', document);
                    document_data.append('id', data);
                    $.ajax({
                        type: 'post',
                        url: 'uploadDocument',
                        processData: false,
                        contentType: false,
                        cache: false,
                        data: document_data,
                        success: function() {
                            counter--;
                            if (counter==0) {
                                location.reload();
                            }
                        }
                    });
                }
                if (counter==0) {
                    location.reload();
                }
            }
        });
    });

    //Avatar change


    $("#avatar-input").change(function() {
        is_photo = false;
        var file, img;
        var _URL = window.URL || window.webkitURL;
        if ((file = this.files[0])) {
            if (this.files[0].size > 5242880) {
                document.getElementById("avatar-input").value = "";
                alert("Размер картинки не должен превышать 5Мб");
                return;
            }
            img = new Image();
            img.onload = function() {
                is_photo = true;
                $("#avatar-img").css('width', '100%').css('height', '100%');
                document.getElementById('avatar-img').src = img.src;
            };
            img.onerror = function() {
                alert("Выбранный файл не является картинкой!");
            };
            img.src = _URL.createObjectURL(file);
        }
    });

    //Confirmation document change

    $('#document-input').change(function() {
        var document = $(this).prop('files')[0];
        var alert_document = $('#alert-2-confirmation');
        alert_document.fadeOut();
        if (document == undefined) {
            alert_document.text("Для регистрации профиля преподавателя необходимо предоставить подтверждающие документы").fadeIn();
            return;
        }
        else if (document.size > 10485760) {
            alert_document.text("Размер документа не должен превышать 10Мб!").fadeIn();
            return;
        }
        $('.reg-popup__condition').text("Спасибо, Ваш файл будет загружен при нажатии на кнопку \"Готово\"!");
    });


// Login Form Validation

    $('#login-form').submit(function (event) {
        event.preventDefault();
        var form = $(this).serializeArray();
        var errors = false;
        if (form[0]["value"] == "") {
            $('#alert-login').text('Введите ваш e-mail').fadeIn();
            errors = true;
        }
        else $('#alert-login').fadeOut();
        if (form[1]["value"] == "") {
            $('#alert-login-password').text('Введите ваш пароль').fadeIn();
            errors = true;
        }
        else $('#alert-login-password').fadeOut();
        if (errors) return;
        $.ajax({
            type: 'post',
            url: 'http://doctrado-sviasy.rhcloud.com/login',
            data: {
                email: form[0]['value'],
                password: form[1]['value']
            },
            success: function(data) {
                if (data==-1) $('#alert-login-password').text('Неправильный логин/пароль').fadeIn();
				else window.location.href = "http://doctrado-sviasy.rhcloud.com/profile";
            }
        });
    });

// Scroll to Anchors

    $('.menu-elem').on('click', function () {
        var anchor = $(this).attr("data-anchor");

        $('body, html').animate({
                scrollTop: $(anchor).offset().top
            }, 700
        );
    });

// Send message to mail

    $("#mail-form").submit(function() {
        event.preventDefault();
        var form = $(this).serializeArray();
        for (var i=0; i<5; i++) {
            if (form[i]['value']=="") {
                $('#mail-error-popup').fadeIn();
                $('body').css('overflow-y', 'hidden');
                return;
            }
        }
        $('#mail-popup').fadeIn();
        $('body').css('overflow-y', 'hidden');
        document.getElementById('mail-form').reset();
        $.ajax({
            type: 'post',
            url: 'mail',
            data: {
                'name': form[0]['value'],
                'surname': form[1]['value'],
                'mail': form[2]['value'],
                'phone': form[3]['value'],
                'message': form[4]['value']
            }
        });
    });
});

function uploadPhoto() {
    $("#avatar-input").click();
}