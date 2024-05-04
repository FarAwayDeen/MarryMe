//(function () {
// Defining a connection to the server hub.
var memberHub = $.connection.memberChatHub; // memberChatHub is class name: Note=> So if you have some hub with class name TestHub you must use testHub(first letter is lowercase) 
// Setting logging to true so that we can see whats happening in the browser console log. [OPTIONAL]
$.connection.hub.logging = true;
// Start the hub
$.connection.hub.start().done(function (result) {
    memberHub.server.saveSession($("#currentMemberId").val());
});
// This is the client method which is being called inside the memberHub constructor method every 3 seconds
//memberHub.client.SendServerTime = function (serverTime) {
//    // Set the received serverTime in the span to show in browser
//    $("#newTime").text(serverTime);
//};

// Client method to broadcast the message

memberHub.client.hello = function (message) {
    console.log(message);
    $('.contact.active .preview').html(message);
};

//Button click jquery handler
//$("#btnClick").click(function () {
//    // Call SignalR hub method
//    memberHub.server.helloServer();
//});

memberHub.client.memberReceived = function (Cl_Message, CL_time) {
    console.log(Cl_Message);
    //$('#Chats').append('<li><strong>' + htmlEncode(Cl_Name)
    //    + '</strong>: ' + htmlEncode(Cl_Message) + ' &nbsp; ' + htmlEncode(time) + '</li>');
    //$('#Chats').append('<div class="grid well"><span class="pull-left" style="margin-right: 10px !important;"><a href="javascript:;"><img src="/Images/about-us-page-examples.png" /></a></span><h4 style="margin-top:3px;"><a href="javascript:;">' + htmlEncode(Cl_Name) + '</a></h4><p>' + htmlEncode(Cl_Message) + '<br><span class="alignright" style="height: 16px;"><a href="javascript:;"><span class="pull-right"> ' + htmlEncode(time) + '</span><span class="pull-right Img-Date"><span class="glyphicon glyphicon-dashboard" style="padding-bottom: 10px;"></span></span></a></span></p></div>')
    if (Cl_Message.includes("/Content/UserSendImages/")) {
        Cl_Message = ' <a href="' + Cl_Message + '" class="venobox" data-gall="gallery-item"><img src="' + Cl_Message + '" style="width:250px;border-radius:unset;"/></a>'
    }
    newMessageToMember(Cl_Message, CL_time);
    ChatMembersList(true, "");
    ChatMembersList(false, "");
    //var timer = setTimeout(function () {
    //    $('.venobox').venobox();
    //}, 3000);
    //timer.clearInterval();
};
//var tets=prompt('Please Enter Your Name:', '');
//$("#spUserName").text($('#UserName').val());
//$('#TxtMessage').focus();
//$('.submit').click(function () {
//    console.log("rsar");
//    memberHub.server.helloServer($(".message-input input").val());
//    //$('#TxtMessage').val('').focus();

//});
// angular.element(document.getElementById('frame')).scope().CheckForMessagePermission();
function SendMessage() {
    //    debugger
    var message = $(".message-input .message").val();
    var file = $("#imageFilePath").val();
    //    console.log(file);
    if ($.trim(message) == '' && file == '') {
        return false;
    }
    if (file != "") {
        message = file;
    }
    memberHub.server.sendToMember($("#currentMemberId").val(), $("#selectedMember").val(), message, $("#SessionId").val());
    if (file != "") {
        message = ' <a href="' + message + '" class="venobox" data-gall="gallery-item"><img src="' + message + '" style="width:250px;border-radius:unset;"/></a>';
    }
    myMessage(message);
    //angular.element(document.getElementById('ctrlLiveChat')).scope().CheckForMessagePermission()
    $("#imageFilePath").val('');
}
$(document).ready(function () {
    $("#BtnSend").on("Click", function () {

    });

    //$(".attachment").click(function () {
    //    $("#fileAttachment").trigger("click");

    //});
});
$(window).on('keydown', function (e) {
    if (e.which == 13) {
        SendMessage();
        return false;
    }
});
function myMessage(message) {
    //var message = $(".message-input input").val();
    //if ($.trim(message) == '') {
    //    return false;
    //}
    var imageSrc = $("#profile-img").attr("src");
    $('<li class="sent"><img src="' + imageSrc + '" alt="" /><p>' + message + '</p></li>').appendTo($('.messages ul'));
    $('.message-input input').val(null);
    $('.contact.active .preview').html('<span>You: </span>' + message);
    $(".messages").animate({ scrollTop: $(document).height() }, "fast");
}

function newMessageToMember(clientMessage, time) {
    var message = clientMessage;
    if ($.trim(message) == '') {
        return false;
    }
    var imageSrc = $("#selectedMemberImage").attr("src");
    $('<li class="replies"><img src="' + imageSrc + '" alt="" /><p>' + message + '</p></li>').appendTo($('.messages ul'));
    $('.message-input input').val(null);
    $('.contact.active .preview').html(message);
    $(".messages").animate({ scrollTop: $(document).height() }, "fast");
}
setTimeout(function () {
    $('.venobox').venobox();
}, 1500);

    //function htmlEncode(value) {
    //    var encodedValue = $('<div />').text(value).html();
    //    return encodedValue;
    //}
//}());