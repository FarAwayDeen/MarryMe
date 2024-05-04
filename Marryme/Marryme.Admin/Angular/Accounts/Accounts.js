//var app = angular.module('MatrimonyAdminAccountsModule', []);
app.controller("AccountsController", function ($scope) {
    $scope.Login = {
        Email: "",
        Password: "",
        Remember: false
    };
    $scope.ForgetPassword = {
        Email: ""
    };
    $scope.ChangePassword = {
        OldPassword: "",
        Password: "",
        ConfirmPassword: ""
    };
    ChangePasswordClearFields();
    function ChangePasswordClearFields() {
        $scope.ChangePassword.OldPassword = "";
        $scope.ChangePassword.Password = "";
        $scope.ChangePassword.ConfirmPassword = "";
        $("#frmAuthenticate").parsley().reset();
     
    }
    ClearFields();
    function ClearFields() {
        $scope.Login.Email = "";
        $scope.Login.Password = "";
        $scope.Login.Remember = false;
        $("#frmAuthenticate").parsley().reset();

    }
    ClearForgetPasswordFields();
    function ClearForgetPasswordFields() {
        $scope.ForgetPassword.Email = "";
        $("#frmAuthenticate").parsley().reset();
      
    }

    $scope.SaveChangePassword = function () {
        $('#frmAuthenticate').parsley().reset();
        var parsleyForm = $('#frmAuthenticate').parsley();
        parsleyForm.validate();
        if (!parsleyForm.isValid())
            return false;

        var formData = new FormData();
        formData.append("ChangePasswordForm", JSON.stringify($scope.ChangePassword));
        SaveAndUpload("/Account/SaveChangePassword", formData, false, $("#btnAuthenticate")).then(function (d) {
            ChangePasswordClearFields();
            $scope.$apply();
            console.log(d);
            if (d.Warning && d.Detail != null) {
                ShowMessage(d);
            }
            else if (d.Success) {
                ImmediateRedirect(d.returnUrl);
            }
        });
    };
    $scope.Authenticate = function () {
        $('#frmAuthenticate').parsley().reset();
        var parsleyForm = $('#frmAuthenticate').parsley();
        parsleyForm.validate();
        if (!parsleyForm.isValid())
            return false;

        var formData = new FormData();
        console.log('Loaded');
        console.log($scope.Login);
        formData.append("AuthForm", JSON.stringify($scope.Login));
        SaveAndUpload("/Account/Authenticate", formData, false, $("#btnAuthenticate")).then(function (d) {
     
            $scope.Login.Password = "";
            $scope.Login.Remember = false;
            $("#frmAuthenticate").parsley().reset();
            $scope.$apply();
            console.log(d);
            if (d.Warning && d.Detail != null) {
                ShowMessage(d);
                //BlockUI(false, $("#btnAuthenticate"));
            }
            else if (d.Success) {
                BlockUI(false, $("#btnAuthenticate"));
                ImmediateRedirect(d.returnUrl);
            }
        });
    };
    $scope.RequestForgetPassword = function () {
        $('#frmAuthenticate').parsley().reset();
        var parsleyForm = $('#frmAuthenticate').parsley();
        parsleyForm.validate();
        if (!parsleyForm.isValid())
            return false;

        var formData = new FormData();
        formData.append("ForgetPasswordForm", JSON.stringify($scope.ForgetPassword));
        SaveAndUpload("/Account/RequestForgotPassword", formData, false, $("#btnAuthenticate")).then(function (d) {
            ClearForgetPasswordFields();
            $scope.$apply();
            SuccessMessage(d.Detail);
            //window.location.href = "/Accounts/Login";
        });
    };
    function ImmediateRedirect(url) {
        window.location.href = url;
    }
});