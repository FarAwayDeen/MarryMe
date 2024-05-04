
app.controller("MemberLoginController", function ($scope, $compile) {
    $scope.MemberLogin = {
    };
    clearFields();
    function clearFields() {
        $scope.MemberLogin.Email = "";
        $scope.MemberLogin.Password = "";
        //$("#frmChangePassword").parsley().reset();

    }
    $scope.Login = function () {
        $('#frmMemberLogin').parsley().reset();
        var parsleyForm = $('#frmMemberLogin').parsley();
        parsleyForm.validate();
        if (!parsleyForm.isValid())
            return false;
        //   var formData = new FormData();
        //   formData.append("Account", JSON.stringify($scope.MemberLogin));
        Post("/Account/VerifyUser", { Email: $scope.MemberLogin.Email, Password: $scope.MemberLogin.Password }, false, $("#btnMemberLogin")).then(function (d) {
            if (d.Success) {
                //    BlockUI(false, $("#btnMemberLogin"));
                //console.log(d);
                //ShowMessage(d);
                RedirectDelay("/Member/ProfileWizard");
                //setTimeout(function () {
                //}, 2000);


                //if (d.Info) {
                //} 
            } else {
                //  RedirectDelay("/#hero");
                RedirectDelay("/Account/Login");
                //ShowMessage(d);
                //window.location.reload();
                //console.log('test for console');
            }
            //console.log(d);
            ShowMessage(d);
        });
    }
});