app.controller("MemberChatController", function ($scope, $compile) {
    $scope.SelectedMember = {

    };
    $scope.isFriendList = true
    $scope.SearchKeyWord = "";
    $scope.canSendMessage = true;
    $scope.canSendMessageError = "Please Subscribe any Package to Chat.";
    $scope.CallId = 0;
    // by default load Friends List
    ChatMembersList($scope.isFriendList, $scope.SearchKeyWord);

    $scope.CheckForMessagePermission = function () {
        Get('/MemberChat/CheckForMessagePermission').then(function (result) {
            if (result) {
                $scope.canSendMessage = result;
                $scope.canSendMessageError = "";
                //$("#BtnSend").click(function () {

                //});
                //$(".message").click(function () {

                //});
            }
            else {
                $scope.canSendMessage = result;
                $scope.canSendMessageError = "Please Subscribe any Package to Chat.";
            }
            $scope.$apply();
        });
    }
    /*$scope.CheckForMessagePermission();*/
    function ChatMembersList(isfriend, search) {
        Post("/MemberChat/FetchChatMembers", { isFriend: isfriend, searchKeyWord: search }, true).then(function (result) {
            $scope.ChatMemberList = result.Data.chatMemberList;
            $scope.SelectedMember = $scope.ChatMemberList[0];
            if ($scope.SelectedMember) {

                GetMemberChatConversation($scope.SelectedMember.Id);
            }
            $scope.$apply();
        });
    }

    $scope.GetMemberChat = function (Id) {
        $scope.SelectedMember = $scope.ChatMemberList.find(x => x.Id == Id);
        GetMemberChatConversation($scope.SelectedMember.Id);
       
    }

    function GetMemberChatConversation(selectedMembId) {
        let currentMemeberId= $("#currentMemberId").val();
        console.log(selectedMembId);
        if (currentMemeberId < selectedMembId) {
            $scope.CallId = currentMemeberId + "_" + selectedMembId;
        } else if (selectedMembId < currentMemeberId) {
            $scope.CallId = selectedMembId + "_" + currentMemeberId;
        }
        console.log("Caller ID: " + $scope.CallId);

        Post("/MemberChat/FetchMemberChatConversation", { selectedMemberId: selectedMembId }, true).then(function (result) {
            $scope.ChatMemberConversationList = result.Data.ChatMemberConversation
            $scope.$apply();
            setTimeout(function () {
                $('.venobox').venobox();
            }, 1000);
            $(".messages").animate({ scrollTop: $(document).height() }, "fast");
        });
    }
    $scope.SendChatFriendRequest = function () {
        SendChatFriendRequest($scope.SelectedMember.Id);
    }
    function SendChatFriendRequest(selectedMembId) {
        Post("/MemberChat/SendChatFriendRequest", { selectedMemberId: selectedMembId }, true).then(function (result) {
            if (result.Success) {

            }
            ShowMessage(result);
        });
    }
    $scope.BlockFriend = function () {
        var friendRequestId = 0;
        if ($scope.SelectedMember.FriendRequestId != null) {
            friendRequestId = $scope.SelectedMember.FriendRequestId;
        } else {
            $scope.isFriendList = true;
        }
        BlockFriend($scope.SelectedMember.Id, friendRequestId);

    }
    function BlockFriend(selectedMembId, requestId) {
        Post("/MemberChat/BlockFriend", { selectedMemberId: selectedMembId, friendRequestId: requestId }, true).then(function (result) {
            if (result.Success) {
                RefreshMembers($scope.isFriendList, $scope.SearchKeyWord);
            }
            ShowMessage(result);
        });
    }
    $scope.UnBlockOrAcceptFriend = function () {
        UnBlockOrAcceptFriend($scope.SelectedMember.FriendRequestId);
    }
    function UnBlockOrAcceptFriend(requestId) {
        Post("/MemberChat/UnBlockOrAcceptFriend", { friendRequestId: requestId }, true).then(function (result) {
            if (result.Success) {
                RefreshMembers($scope.isFriendList, $scope.SearchKeyWord);
            }
            ShowMessage(result);
        });
    }

    $scope.FetchMembers = function (isFriendList) {
        $scope.isFriendList = isFriendList;
        $scope.SearchKeyWord = "";
        ChatMembersList(isFriendList, $scope.SearchKeyWord);

    }
    $scope.SearchFriend = function () {
        if ($scope.SearchKeyWord.length > 2 || $scope.SearchKeyWord.length == 0) {
            ChatMembersList($scope.isFriendList, $scope.SearchKeyWord);
        }
    }
    function RefreshMembers(isfriend, search) {
        Post("/MemberChat/FetchChatMembers", { isFriend: isfriend, searchKeyWord: search }, true).then(function (result) {
            $scope.ChatMemberList = result.Data.chatMemberList;
            $scope.SelectedMember = $scope.ChatMemberList.find(x => x.Id == $scope.SelectedMember.Id);
            $scope.$apply();
        });
    }
    $scope.upload = function (files) {
        if (!files) {
            return false;
        }
        Upload.upload({
            url: '/MemberChat/UploadImage',
            data: { file: files }
        }).then(function (resp) {
            // console.log(resp);
            if (resp.data.Success) {
                $("#imageFilePath").val(resp.data.Data);
                $('#BtnSend').trigger('click');
                //  console.log(resp);
            }
            //return resp;
            //   BlockUI(false, $("#btnSaveCourseLesson"));
            // ShowMessage("Saved SuccessFully.");
            //  RedirectDelay("/CourseLesson/CourseLessons");
        }, function (resp) {
            console.log('Error status: ' + resp.status);
        }, function (evt) {
            $scope.Progress = parseInt(100.0 * evt.loaded / evt.total);
        });
    };

});