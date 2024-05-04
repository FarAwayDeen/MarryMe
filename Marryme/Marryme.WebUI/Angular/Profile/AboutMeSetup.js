app.controller("AboutMeSetupController", function ($scope, $compile) {
    $scope.About = {
    };
    $scope.EncodedZero = "AQAAAB%2bLCAAAAAAABAAzAAAh39v0AQAAAA%3d%3d";
    ClearFields();
    AboutMeDetailFetchById();
    //PreBinds();
    //function PreBinds() {
    //    Get("/Generic/PreBindPackageTypes", true).then(function (result) {
    //        $scope.PackageTypes = result.Data.PackageTypeList;
    //        $scope.$apply();
    //    });
    //}
    function ClearFields() {
        $scope.About.Id = 0;
        $scope.About.AboutMe = "";
        $("#frmAboutMe").parsley().reset();
    }
    $scope.Save = function () {
        $('#frmAboutMe').parsley().reset();
        var parsleyForm = $('#frmAboutMe').parsley();
        parsleyForm.validate();
        if (!parsleyForm.isValid())
            return false;
        //$scope.PageContent.PageDescription = $('#txtDescription').summernote('code');

        var formData = new FormData();

        formData.append("AboutMe", JSON.stringify($scope.About));
        SaveAndUpload("/Member/AboutMe", formData, false, $("#btnAboutMe")).then(function (d) {
            if (d.Success) {
                BlockUI(false, $("#btnAboutMe"));
                // redirect to another page
                RedirectDelay("/Member/MemberList");
            }
            ShowMessage(d);
        });
    }
    function AboutMeDetailFetchById() {
        Post('/Member/FetchProfileAboutMeDetailById', '', true).then(function (result) {
            if (result.Success) {
                ClearFields();
                $scope.About.AboutMe = result.Data;
                $scope.$apply();
            }
        });
    }


});