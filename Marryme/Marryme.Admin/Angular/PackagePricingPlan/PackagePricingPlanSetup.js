app.controller("PackagePricingPlanController", function ($scope, $compile) {
    $scope.PackagePricingPlan = {
    };
    $scope.EncodedZero = "AQAAAB%2bLCAAAAAAABAAzAAAh39v0AQAAAA%3d%3d";
    ClearFields();
   
    PackagePricingPlanFetchById();
    PreBinds();
    function PreBinds() {
        Get("/Generic/PreBindPackageDuration", true).then(function (result) {
            $scope.PackageDuration = result.Data.PackageDurationList;
            $scope.$apply();
        });
    }
    PreBindPackages();
    function PreBindPackages() {
        Get("/Generic/PreBindPackages", true).then(function (result) {
            $scope.Packages = result.Data.PackageTypeList;
            $scope.$apply();
        });
    }
    //function PreBindCoursesParent() {
    //    Get("/Generic/CoursesInstructor", true).then(function (result) {
    //        $scope.CoursesInstructor = result.Data;
    //        $scope.$apply();
    //    });
    //}
    function ClearFields() {
        $scope.PackagePricingPlan.Id = 0;
        $scope.PackagePricingPlan.PackageId = 0;
        $scope.PackagePricingPlan.PackageTypeCode = "";
        $scope.PackagePricingPlan.PackageDuration = "AQAAAB%2bLCAAAAAAABAAzAAAh39v0AQAAAA%3d%3d";
        $scope.PackagePricingPlan.PackagePrice = "";
        $("#frmPackagePricingPlan").parsley().reset();
    }
    $scope.Save = function () {
        $('#frmPackagePricingPlan').parsley().reset();
        var parsleyForm = $('#frmPackagePricingPlan').parsley();
        parsleyForm.validate();
        if (!parsleyForm.isValid())
            return false;
        // $scope.PageContent.PageDescription = $('#txtDescription').summernote('code');
        //$scope.PageContent.IsActive = $("#chkIsActive").iChecked();
        var formData = new FormData();

        formData.append("PackagePricingPlan", JSON.stringify($scope.PackagePricingPlan));
        SaveAndUpload("/PackagePricingPlan/Save", formData, false, $("#btnPackagePricingPlan")).then(function (d) {
            if (d.Success) {
                BlockUI(false, $("#btnPackagePricingPlan"));
                // redirect to another page
                RedirectDelay("/PackagePricingPlan/PackagePricingPlans");
            }
            ShowMessage(d);
        });
    }


    function PackagePricingPlanFetchById() {
        var obj = FetchParams();
        if (obj != null && !IsNullOrEmpty(obj.Code)) {
            Post('/PackagePricingPlan/GetById', { code: obj.Code }).then(function (result) {
                if (result.Success) {
                    ClearFields();
                    console.log(result.Data);
                    $scope.PackagePricingPlan.Id = result.Data.Id;
                    $scope.PackagePricingPlan.PackageId = result.Data.PackageId;
                    $scope.PackagePricingPlan.PackageDuration = result.Data.PackageDuration;
                    $scope.PackagePricingPlan.PackagePrice = result.Data.PackagePrice;
                    $scope.PackagePricingPlan.PackageTypeCode = result.Data.PackageTypeCode;
                    setTimeout(function () {
                        $("#ddlPackageDuration").val(result.Data.PackageDuration);
                    }, 2000);
                    // $scope.PageContent.IsActive = result.Data.IsActive;
                    // $('#txtDescription').summernote('code', result.Data.PageDescription);
                    //if (result.Data.IsActive)
                    //    $("#chkIsActive").bootstrapToggle('on');
                    //else
                    //    $("#chkIsActive").bootstrapToggle('off');
                    $scope.$apply();
                }
            });
        }

    }


});