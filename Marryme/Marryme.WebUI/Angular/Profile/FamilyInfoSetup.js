app.controller("FamilyInfoSetupController", function ($scope, $compile) {
    $scope.FamilyInfo = {
    };
    $scope.EncodedZero = "AQAAAB%2bLCAAAAAAABAAzAAAh39v0AQAAAA%3d%3d";
    ClearFields();
    FetchProfileFamilyDetail();
    PreBindFamilyValue();
    PreBindFamilyType();
    PreBindFamilyStatus();
    function PreBindFamilyValue() {
        Get("/Generic/FetchOptions?type=FamilyValue", true).then(function (result) {
            $scope.FamilyValueList = result.Data;
            $scope.$apply();
            //console.log($scope.FamilyValueList);
        });
    }
    function PreBindFamilyType() {
        Get("/Generic/FetchOptions?type=FamilyType", true).then(function (result) {
            $scope.FamilyTypeList = result.Data;
            $scope.$apply();
           //console.log($scope.FamilyTypeList);
        });
    }
    function PreBindFamilyStatus() {
        Get("/Generic/FetchOptions?type=FamilyStatus", true).then(function (result) {
            $scope.FamilyStatusList = result.Data;
            $scope.$apply();
           //console.log($scope.FamilyStatusList);
        });
    }
    function ClearFields() {
        $scope.FamilyInfo.Id = 0;
        $scope.FamilyInfo.MemberId = 0;
        $scope.FamilyInfo.ParentContactNo = "";
        $scope.FamilyInfo.FamilyValue = "";
        $scope.FamilyInfo.FamilyType = "";
        $scope.FamilyInfo.FamilyStatus = "";
        $("#frmFamilyInfo").parsley().reset();
    }
    $scope.Save = function () {
        console.log($scope.FamilyInfo);
        $('#frmFamilyInfo').parsley().reset();
        var parsleyForm = $('#frmFamilyInfo').parsley();
        parsleyForm.validate();
        if (!parsleyForm.isValid())
            return false;
        //$scope.PageContent.PageDescription = $('#txtDescription').summernote('code');
        var formData = new FormData();
        formData.append("FamilyInfo", JSON.stringify($scope.FamilyInfo));
        console.log(formData);
        SaveAndUpload("/Member/FamilyInfo", formData, false, $("#btnFamilyInfo")).then(function (d) {
            if (d.Success) {
                //BlockUI(false, $("#btnFamilyInfo"));
                // redirect to another page
                //RedirectDelay("/Package/Packages");
            }
            ShowMessage(d);
        });
    }

    function FetchProfileFamilyDetail() {
        Post('/Member/FetchProfileFamilyDetail', '', true).then(function (result) {
            if (result.Success && result.Data != null) {
                $scope.FamilyInfo.ParentContactNo = result.Data.ParentContactNo;
                $scope.FamilyInfo.FamilyValue = result.Data.FamilyValue;
                $scope.FamilyInfo.FamilyType = result.Data.FamilyType;
                $scope.FamilyInfo.FamilyStatus = result.Data.FamilyStatus;
                $scope.$apply();
            }
        });
    }

});