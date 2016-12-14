var connection;
var sessions;
var videoContainer;
var roomsList;
var last_message_id;

$(document).ready(function() {
    $("#chat-form").submit(function(event) {
        event.preventDefault();
        sendMessage();
    });

    $("#chat-inputbox").keyup(function(event) {
        if (event.which == 13 && !event.shiftKey) {
            sendMessage();
        }
    });

    $.ajax({
        type: 'post',
        url: '../getAllMessages',
        data: {
            webinar: webinar_id
        },
        success: function(response) {
            var messages = response[0];
            var chat = $("#chat-textbox");
            for (var i = 0; i < messages.length; i++) {
                var message = "<a class='user-chat-link' href='../profile/" + messages[i]['user_id'] + "'>" + messages[i]['name'] + " " + messages[i]['surname'] + "</a> [" + messages[i]['message_time'].substr(11, 5) + "]: " + messages[i]['message_text'] + "<br>";
                chat.append(message);
            }
            chat.scrollTop(chat[0].scrollHeight);
            last_message_id = response[1];
            setInterval(function() {getNewMessages()}, 1000);
        }
    });

    videoContainer = document.getElementById('video-container') || document.body;
    roomsList = document.getElementById('rooms-list');
    connection = new RTCMultiConnection();
    sessions = {};

    connection.session = {
        audio: true,
        video: true,
        oneway: true
    };

    connection.onstream = function(e) {
        e.mediaElement.width = 600;
        videoContainer.insertBefore(e.mediaElement, videoContainer.firstChild);
    };

    connection.onstreamended = function() {
        $("#broadcast-button-student").html("<span class='class'>Трансляция завершилась</span>").attr('onclick', '');
        $("#video-container").empty();
    };

    connection.onNewSession = function(session) {
        if (sessions[session.sessionid]) {
            return;
        }
        sessions[session.sessionid] = session;
        $("#broadcast-button-student").html("<span class='class'>Подключиться к трансляции</span>").attr('onclick', 'connectToBroadcast()');
        connectToBroadcast();
    };

    connection.connect();
});

function startBroadcast() {
    connection.open(webinar_id.toString());
    $("#broadcast-button-teacher").attr('onclick', 'stopBroadcast()').html("<span class='class'>Остановить трансляцию</span>");
}

function stopBroadcast() {
    connection.close();
    $("#broadcast-button-teacher").attr('onclick', 'startBroadcast()').html("<span class='class'>Начать трансляцию</span>");
}

function connectToBroadcast() {
    var session = sessions[webinar_id];
    connection.join(session);
    $("#broadcast-button-student").html("<span class='class'>Покинуть трансляцию</span>").attr('onclick', 'disconnectFromBroadcast()');
}

function disconnectFromBroadcast() {
    connection.close();
    $("#broadcast-button-student").html("<span class='class'>Подключиться к трансляции</span>").attr('onclick', 'connectToBroadcast()');
    $("#video-container").empty();
}

function sendMessage() {
    var input = $("#chat-inputbox");
    var message = input.val();
    input.val('');
    if (message!="") {
        $.ajax({
            type: 'post',
            url: '../sendMessage',
            data: {
                sender: user_id,
                webinar: webinar_id,
                message: message
            },
            success: function(time) {
                message = "<a class='user-chat-link' href='../profile/" + user_id + "'>" + user_name + "</a> [" + time + "]: " + message + "<br>";
                var chat = $("#chat-textbox");
                chat.append(message);
                chat.scrollTop(chat[0].scrollHeight);
            }
        });
    }
}

function getNewMessages() {
    $.ajax({
        type: 'post',
        url: '../getNewMessages',
        data: {
            sender: user_id,
            webinar: webinar_id,
            message_id: last_message_id
        },
        success: function(response) {
            var messages = response[0];
            var chat = $("#chat-textbox");
            for (var i = 0; i < messages.length; i++) {
                var message = "<a class='user-chat-link' href='../profile/" + messages[i]['user_id'] + "'>" + messages[i]['name'] + " " + messages[i]['surname'] + "</a> [" + messages[i]['message_time'].substr(11, 5) + "]: " + messages[i]['message_text'] + "<br>";
                chat.append(message);
            }
            if (messages.length > 0) chat.scrollTop(chat[0].scrollHeight);
            last_message_id = response[1];
        }
    });
}