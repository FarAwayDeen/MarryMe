app.controller("EducationAndProfSetupController", function ($scope, $compile) {
    $scope.EducationInfo = {
    };
    $scope.EncodedZero = "AQAAAB%2bLCAAAAAAABAAzAAAh39v0AQAAAA%3d%3d";
    ClearFields();
    PreBindCurrencySimbals();
    PreBindEmployedIn();
    PreBindEducation();

    function PreBindEmployedIn() {
        Get("/Generic/FetchOptions?type=Employment", true).then(function (result) {
            $scope.EmployeedInList = result.Data;
            $scope.$apply($scope.EmployeedInList);            
        });
    }
    function PreBindCurrencySimbals() {
        Get("/Generic/PreBindCurrencySimbals", true).then(function (result) {
            $scope.CurrencySimbals = result.Data.CurrencySimbalList;
            $scope.$apply();
        });
    }
    function PreBindEducation() {
        Get("/Generic/FetchOptions?type=EducationLevels", true).then(function (result) {
            $scope.EducationList = result.Data;           
            $scope.$apply();
        });
    }
    function ClearFields() {
        $scope.EducationInfo.Id = 0;
        $scope.EducationInfo.MemberId = 0;
        $scope.EducationInfo.EductionLevels = "";
        $scope.EducationInfo.EmployeedIn = "";
        $scope.EducationInfo.IncomeCurrency = "";
        $scope.EducationInfo.AnnualIncomeFrom = "";
        $scope.EducationInfo.AnnualIncomeTo = "";
        $scope.EducationInfo.Employment = "";
        $("#frmEducationInfo").parsley().reset();
    }
    $scope.Save = function () {
        $('#frmEducationInfo').parsley().reset();
        var parsleyForm = $('#frmEducationInfo').parsley();
        parsleyForm.validate();
        if (!parsleyForm.isValid())
            return false;
        //$scope.PageContent.PageDescription = $('#txtDescription').summernote('code');

        var formData = new FormData();

        formData.append("EducationInfo", JSON.stringify($scope.EducationInfo));
        SaveAndUpload("/Member/EducationInfo", formData, false, $("#btnEducationInfo")).then(function (d) {
            if (d.Success) {
                // BlockUI(false, $("#btnEducationInfo"));
                // redirect to another page
                //RedirectDelay("/Package/Packages");
            }
            ShowMessage(d);
        });
    }

    FetchProfileEducationDetail();
    function FetchProfileEducationDetail() {
        Post('/Member/FetchProfileEducationDetail', '', true).then(function (result) {           
            if (result.Success && result.Data != null) {
                $scope.EducationInfo.EductionLevels = (result.Data.EductionLevels).toString();
                $scope.EducationInfo.Employment = (result.Data.Employment).toString();
                $scope.EducationInfo.IncomeCurrency = result.Data.IncomeCurrency;
                $scope.EducationInfo.AnnualIncomeFrom = result.Data.AnnualIncomeFrom;
                $scope.EducationInfo.AnnualIncomeTo = result.Data.AnnualIncomeTo;
                //$scope.EducationInfo.EductionLevelsId = (result.Data.EductionLevelsId).toString();
                $scope.$apply();
               //console.log($scope.EducationInfo);
            }
        });
    }

});