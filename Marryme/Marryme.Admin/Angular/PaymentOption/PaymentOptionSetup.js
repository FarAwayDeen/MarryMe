app.controller("PaymentOptionSetupController", function ($scope, $compile) {
    $scope.PaymentOption = {
    };
    $scope.EncodedZero = "AQAAAB%2bLCAAAAAAABAAzAAAh39v0AQAAAA%3d%3d";
    ClearFields();

    PaymentOptionsFetchById();
    PreBindPaymentType();
    function PreBindPaymentType() {
        Get("/Generic/PreBindPaymentType", true).then(function (result) {
            $scope.PaymentTypeList = result.Data.PaymentTypeList;
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
        $scope.PaymentOption.Id = 0;
        $scope.PaymentOption.PaymentType = "";
        $scope.PaymentOption.BankName = "";
        $scope.PaymentOption.AccountTitle = "";
        $scope.PaymentOption.AccountNumber = "";
        $scope.PaymentOption.BranchCode = "";
        $scope.PaymentOption.IBAN = "";
        $scope.PaymentOption.IsActive = true;
        $scope.PaymentOption.Description = "";
        $("#frmPaymentOptions").parsley().reset();
    }
    $scope.Save = function () {
        $('#frmPaymentOptions').parsley().reset();
        var parsleyForm = $('#frmPaymentOptions').parsley();
        parsleyForm.validate();
        if (!parsleyForm.isValid())
            return false;
        $scope.PaymentOption.Description = $('#txtDescription').summernote('code');
        $scope.PaymentOption.IsActive = $("#chkIsActive").iChecked();
        var formData = new FormData();
        var image = $("#bankLogo")[0].files;
        if (image.length > 0) {
            formData.append("Image", image[0]);
        }
        formData.append("PaymentOption", JSON.stringify($scope.PaymentOption));
        SaveAndUpload("/PaymentOptions/SaveUpdate", formData, false, $("#btnPaymentOption")).then(function (d) {
            if (d.Success) {
                BlockUI(false, $("#btnPaymentOption"));
                // redirect to another page
                RedirectDelay("/PaymentOptions/GetPaymentOptions");
            }
            ShowMessage(d);
        });
    }

    function PaymentOptionsFetchById() {
        var obj = FetchParams();
        if (obj != null && !IsNullOrEmpty(obj.Code)) {
            Post('/PaymentOptions/GetById', { code: obj.Code }).then(function (result) {
                if (result.Success) {
                    ClearFields();
                    $scope.PaymentOption.Id = result.Data.Id;
                    $scope.PaymentOption.PaymentType = result.Data.PaymentType;
                    $scope.PaymentOption.BankName = result.Data.BankName;
                    $scope.PaymentOption.AccountTitle = result.Data.AccountTitle;
                    $scope.PaymentOption.AccountNumber = result.Data.AccountNumber;
                    $scope.PaymentOption.BranchCode = result.Data.BranchCode;
                    $scope.PaymentOption.BankLogo = result.Data.BankLogo;
                    $scope.PaymentOption.IBAN = result.Data.IBAN;
                    $scope.PaymentOption.IsActive = result.Data.IsActive;
                    $scope.PaymentOption.Description = result.Data.Description;
                    $('#txtDescription').summernote('code', result.Data.Description);
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

    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#imgPreview').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#bankLogo").change(function () {
        readURL(this);
    });
});