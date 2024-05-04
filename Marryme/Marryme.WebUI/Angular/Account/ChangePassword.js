
app.controller("ChangePasswordController", function ($scope, $compile) {
    $scope.ChangePassword = {

    };
    clearFields();
    function clearFields() {
        $scope.ChangePassword.OldPassword = "";
        $scope.ChangePassword.NewPassword = "";
        $scope.ChangePassword.ConfirmPassword = "";
        $("#frmChangePassword").parsley().reset();

    }
    $scope.ChangePsw = function () {
        $('#frmChangePassword').parsley().reset();
        var parsleyForm = $('#frmChangePassword').parsley();
        parsleyForm.validate();
        if (!parsleyForm.isValid())
            return false;
        //var formData = new FormData();
        //debugger
        //formData.append("Account", JSON.stringify($scope.ChangePassword));
        Get("/Account/ChangePassword?oldPassword=" + $scope.ChangePassword.OldPassword + "&newPassword=" + $scope.ChangePassword.NewPassword, true).then(function (d) {
            if (d.Success) {
                var parms = FetchParams();
                if (!parms && !parms.oobCode) {

                    return false;
                }
                //VerifyUserExists(parms.oobCode, $scope.ChangePassword.NewPassword);
                //console.log(d);
                ShowMessage(d);
            }
            else {

                ShowMessage(d);
            }
        });
    }
});