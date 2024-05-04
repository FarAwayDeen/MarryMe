app.controller("PackageSetupController", function ($scope, $compile) {
    $scope.Package = {
    };
    $scope.EncodedZero = "AQAAAB%2bLCAAAAAAABAAzAAAh39v0AQAAAA%3d%3d";
    ClearFields();
   
    PackagesFetchById();
    PreBinds();
    function PreBinds() {
        Get("/Generic/PreBindPackageTypes", true).then(function (result) {
            $scope.PackageTypes = result.Data.PackageTypeList;
            $scope.$apply();
        });
    }
    function ClearFields() {
        $scope.Package.Id = 0;
        $scope.Package.PackageTypeId = "";
        $scope.Package.PackageTypeCode = "";
        $scope.Package.CanMemberViewMobileNo = true;
        $scope.Package.NumberOfMobileNo = "";
        $scope.Package.IsAstroMatches = true;
        $scope.Package.NumberOfAstroMatches = "";
        $scope.Package.IsProfileHighlighter = true;
        $scope.Package.NumberOfProfileHighlighter = "";
        $scope.Package.CanViewPhoto = true;
        $scope.Package.IsVisibleHighProfile = true;
        $scope.Package.CanChat = true;
        $scope.Package.IsActive = true;
        $("#frmPackage").parsley().reset();
    }
    $scope.Save = function () {
        $('#frmPackage').parsley().reset();
        var parsleyForm = $('#frmPackage').parsley();
        parsleyForm.validate();
        if (!parsleyForm.isValid())
            return false;
        //$scope.PageContent.PageDescription = $('#txtDescription').summernote('code');
        $scope.Package.CanMemberViewMobileNo = $("#chkCanMemberViewMobileNo").iChecked();
        $scope.Package.IsAstroMatches = $("#chkIsAstroMatches").iChecked();
       // $scope.Package.IsProfileHighlighter = $("#chkIsProfileHighlighter").iChecked();
        $scope.Package.CanViewPhoto = $("#chkCanViewPhoto").iChecked();
        $scope.Package.IsVisibleHighProfile = $("#chkIsVisibleHighProfile").iChecked();
        $scope.Package.CanChat = $("#chkCanChat").iChecked();
        $scope.Package.IsActive = $("#chkIsActive").iChecked();
        var formData = new FormData();

        formData.append("Package", JSON.stringify($scope.Package));
        SaveAndUpload("/Package/Save", formData, false, $("#btnPackage")).then(function (d) {
            if (d.Success) {
                BlockUI(false, $("#btnPackage"));
                // redirect to another page
                RedirectDelay("/Package/Packages");
            }
            ShowMessage(d);
        });
    }


    function PackagesFetchById() {
        var obj = FetchParams();
        if (obj != null && !IsNullOrEmpty(obj.Code)) {
            Post('/Package/GetById', { code: obj.Code }).then(function (result) {
                if (result.Success) {
                    ClearFields();
                    $scope.Package.Id = result.Data.Id;
                    $scope.Package.PackageTypeId = result.Data.PackageTypeId;
                    $scope.Package.PackageTypeCode = result.Data.PackageTypeCode;
                    $scope.Package.CanMemberViewMobileNo = result.Data.CanMemberViewMobileNo;
                    if (result.Data.CanMemberViewMobileNo)
                        $("#chkCanMemberViewMobileNo").bootstrapToggle('on');
                    else
                        $("#chkCanMemberViewMobileNo").bootstrapToggle('off');
                    $scope.Package.NumberOfMobileNo = result.Data.NumberOfMobileNo;
                    $scope.Package.IsAstroMatches = result.Data.IsAstroMatches;
                    if (result.Data.IsAstroMatches)
                        $("#chkIsAstroMatches").bootstrapToggle('on');
                    else
                        $("#chkIsAstroMatches").bootstrapToggle('off');
                    $scope.Package.NumberOfAstroMatches = result.Data.NumberOfAstroMatches;
                    $scope.Package.CanChat = result.Data.CanChat;
                    if (result.Data.CanChat)
                        $("#chkCanChat").bootstrapToggle('on');
                    else
                        $("#chkCanChat").bootstrapToggle('off');
                    $scope.Package.NumberOfChatMessages = result.Data.NumberOfChatMessages;
                    $scope.Package.CanViewPhoto = result.Data.CanViewPhoto;
                    if (result.Data.CanViewPhoto)
                        $("#chkCanViewPhoto").bootstrapToggle('on');
                    else
                        $("#chkCanViewPhoto").bootstrapToggle('off');
                    $scope.Package.IsVisibleHighProfile = result.Data.IsVisibleHighProfile;
                    if (result.Data.IsVisibleHighProfile)
                        $("#chkIsVisibleHighProfile").bootstrapToggle('on');
                    else
                        $("#chkIsVisibleHighProfile").bootstrapToggle('off');
                    $scope.Package.CanChat = result.Data.CanChat;
                    if (result.Data.CanChat)
                        $("#chkCanChat").bootstrapToggle('on');
                    else
                        $("#chkCanChat").bootstrapToggle('off');
                    $scope.Package.IsActive = result.Data.IsActive;
                   // $('#txtDescription').summernote('code', result.Data.PageDescription);
                    if (result.Data.IsActive)
                        $("#chkIsActive").bootstrapToggle('on');
                    else
                        $("#chkIsActive").bootstrapToggle('off');

                    console.log(result);
                    $scope.$apply();
                }
            });
        }

    }

});