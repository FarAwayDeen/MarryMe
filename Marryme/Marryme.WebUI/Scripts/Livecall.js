var getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia;
var local_stream;
var screenStream;
var peer = null;
var currentPeer = null
var screenSharing = false

var MessageModel = {
    Info: false,
    Success: false,
    Detail: ""
}

$(document).ready(function () {
    //var pageURL = $(location).attr("href");
    //var Roomid = pageURL.substring(pageURL.lastIndexOf('=') + 1);
    const params = new Proxy(new URLSearchParams(window.location.search), {
        get: (searchParams, prop) => searchParams.get(prop),
    });
    var Roomid = params.id;
    CreateOrJoinRoom(Roomid);

});
var hours = 0;
var mins = 0;
var seconds = 0;
function resetTime() {
    hours = 0;
    mins = 0;
    seconds = 0;
    $("#hours", "#mins").html("00:");
    $("#seconds").html("00");
}
function stopTime() {
    clearTimeout(timex);
}
function startTimer() {
    timex = setTimeout(function () {
        seconds++;
        if (seconds > 59) {
            seconds = 0;
            mins++;
            if (mins > 59) {
                mins = 0;
                hours++;
                if (hours < 10) {
                    $("#hours").text("0" + hours + ":");
                } else $("#hours").text(hours + ":");
            }
            if (mins < 10) {
                $("#mins").text("0" + mins + ":");
            } else $("#mins").text(mins + ":");
        }
        if (seconds < 10) {
            $("#seconds").text("0" + seconds);
        } else {
            $("#seconds").text(seconds);
        }
        startTimer();
    }, 1000);
}


function CreateOrJoinRoom(Roomid) {
    peer = new Peer(Roomid)
    peer.on('open', (id) => {
        console.log("Peer Connected with ID: ", id)
        getUserMedia({ video: true, audio: true }, (stream) => {
            local_stream = stream;
            setLocalStream(local_stream)
        }, (err) => {
            console.log(err)
        })
        
        //notify("Waiting for peer to join.")
        MessageModel.Success = true;
        MessageModel.Detail = "Waiting for peer to join";
        ShowMessage(MessageModel);
    });
    peer.on('call', (call) => {
        call.answer(local_stream);
        startTimer();
        call.on('stream', (stream) => {
            setRemoteStream(stream)
        })
        currentPeer = call;
    });
    peer.on('error', function (err) {
        // can check following condition but for now I'm going to Join directly
        /*  err.message = ID "123" is taken */
        //let expectedMsg = 'ID "' + Roomid.toString() + '" is taken';
        //if (err.message == expectedMsg) {
        //    joinRoom(Roomid);
        //}
        joinRoom(Roomid);
        console.log(err.message);
    });

    //peer.on('close', () => {
    //    console.log("conn close event");
    //    MessageModel.Success = true;
    //    MessageModel.Detail = "Call Ended by Participant";
    //    ShowMessage(MessageModel);
    //    //setTimeout(function () {
    //    //    window.location.href = "/MemberChat/LiveChat";
    //    //}, 1000);
    //});
}

function setLocalStream(stream) {

    let video = document.getElementById("local-video");
    video.srcObject = stream;
    video.muted = true;
    video.play();
}
function setRemoteStream(stream) {

    let video = document.getElementById("remote-video");
    video.srcObject = stream;
    video.play();
}

//function notify(msg) {
//    let notification = document.getElementById("notification")
//    notification.innerHTML = msg
//    notification.hidden = false
//    setTimeout(() => {
//        notification.hidden = true;
//    }, 3000)
//}

function joinRoom(Roomid) {
    peer = new Peer();
    peer.on('open', (id) => {
        console.log("Connected with Id: " + id)
        MessageModel.Success = true;
        MessageModel.Detail = "Connected Successfully";
        ShowMessage(MessageModel);
        startTimer();
        console.log('console after time');

        getUserMedia({ video: true, audio: true }, (stream) => {
            local_stream = stream;
            setLocalStream(local_stream)
            //notify("Joining peer")
            let call = peer.call(Roomid, stream);
            call.on('stream', (stream) => {
                setRemoteStream(stream);
            });
            currentPeer = call;
        }, (err) => {
            console.log(err)
        });

    });
}

function EndCall() {
    // Go back to the menu
    //document.querySelector("#menu").style.display = "block";
    //document.querySelector("#live").style.display = "none";
    // If there is no current call, return
    MessageModel.Success = true;
    MessageModel.Detail = "Call Ended Successfully";
    ShowMessage(MessageModel);
    setTimeout(function () {
        window.location.href = "/MemberChat/LiveChat";
    }, 1000);

    if (!currentPeer) return;
    // Close the call, and reset the function
    try {
        currentPeer.close();

    } catch { }
    currentPeer = undefined;
}
