app.controller("PageContentSetupController", function ($scope, $compile) {
    $scope.PageContent = {
    };
    $scope.EncodedZero = "AQAAAB%2bLCAAAAAAABAAzAAAh39v0AQAAAA%3d%3d";
    ClearFields();
    function readURL(input, element) {

        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $(element).attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    PageContentsFetchById();
    //function PreBinds() {
    //    Get("/Generic/ActiveStatusList", true).then(function (result) {
    //        $scope.ActiveStatus = result.Data.ActiveStatus;
    //        $scope.$apply();
    //    });
    //}
    //function PreBindCoursesParent() {
    //    Get("/Generic/CoursesInstructor", true).then(function (result) {
    //        $scope.CoursesInstructor = result.Data;
    //        $scope.$apply();
    //    });
    //}
    function ClearFields() {
        $scope.PageContent.Id = 0;
        $scope.PageContent.PageName = "";
        $scope.PageContent.PageUrl = "";
        $scope.PageContent.IsActive = true;
        $scope.PageContent.PageDescription = "";
        $("#frmPageContent").parsley().reset();
    }
    $scope.Save = function () {
        $('#frmPageContent').parsley().reset();
        var parsleyForm = $('#frmPageContent').parsley();
        parsleyForm.validate();
        if (!parsleyForm.isValid())
            return false;
        $scope.PageContent.PageDescription = $('#txtDescription').summernote('code');
        $scope.PageContent.IsActive = $("#chkIsActive").iChecked();
        var formData = new FormData();

        formData.append("PageContent", JSON.stringify($scope.PageContent));
        SaveAndUpload("/PageContent/Save", formData, false, $("#btnPageContent")).then(function (d) {
            if (d.Success) {
                BlockUI(false, $("#btnPageContent"));
                // redirect to another page
                RedirectDelay("/PageContent/PageContents");
            }
            ShowMessage(d);
        });
    }


    function PageContentsFetchById() {
        var obj = FetchParams();
        if (obj != null && !IsNullOrEmpty(obj.Code)) {
            Post('/PageContent/GetById', { code: obj.Code }).then(function (result) {
                if (result.Success) {
                    ClearFields();
                    $scope.PageContent.Id = result.Data.Id;
                    $scope.PageContent.PageName = result.Data.PageName;
                    $scope.PageContent.PageUrl = result.Data.PageUrl;
                    $scope.PageContent.PageDescription = result.Data.PageDescription;
                    $scope.PageContent.IsActive =result.Data.IsActive;
                    $('#txtDescription').summernote('code', result.Data.PageDescription);
                    if (result.Data.IsActive)
                        $("#chkIsActive").bootstrapToggle('on');
                    else
                        $("#chkIsActive").bootstrapToggle('off');
                    $scope.$apply();
                }
            });
        }

    }

    $scope.GenerateUrl = function () {
        if (typeof $scope.PageContent.PageName == "undefined" || $scope.PageContent.PageName == null || $scope.PageContent.PageName == "") {
            $scope.PageContent.PageUrl = "";
        }
        else {
            $scope.PageContent.PageUrl = $scope.PageContent.PageName.replace(/[^0-9a-z- ]/gi, '').replace(/ /g, '-').replace(/-{2,}/g, '-');
        }
    }

    $scope.ValidateUrl = function (e) {
        if (typeof $scope.PageContent.PageUrl == "undefined" || $scope.PageContent.PageUrl == null || $scope.PageContent.PageUrl == "") {
            $scope.PageContent.PageUrl = "";
        }
        else {
            $scope.PageContent.PageUrl = $scope.PageContent.PageUrl.replace(/[^0-9a-z- ]/gi, '').replace(/ /g, '-').replace(/-{2,}/g, '-');
        }
    }
});