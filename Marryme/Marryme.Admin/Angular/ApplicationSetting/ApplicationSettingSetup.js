app.controller("ApplicationSettingSetupController", function ($scope, $compile) {
    $scope.ApplicationSetting = {
    };
    $scope.EncodedZero = "AQAAAB%2bLCAAAAAAABAAzAAAh39v0AQAAAA%3d%3d";
    ClearFields();

    ApplicationSettingFetchById();
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#imgPreview').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#logo").change(function () {
        readURL(this);
    });

    function ClearFields() {
        $scope.ApplicationSetting.Id = 0;
        $scope.ApplicationSetting.ApplicationName = "";
        $scope.ApplicationSetting.Address = "";
        $scope.ApplicationSetting.Phone = "";
        $scope.ApplicationSetting.Email = "";
        $scope.ApplicationSetting.FaceBookLink = "";
        $scope.ApplicationSetting.GoogleLink = "";
        $scope.ApplicationSetting.TwitterLink = "";
        $scope.ApplicationSetting.SkypeLink = "";
        $scope.ApplicationSetting.NTN = "";
        $scope.ApplicationSetting.CompanyName = "";
        $scope.ApplicationSetting.MailingAddress = "";
        $scope.ApplicationSetting.IsActive = true;
        $("#frmApplicationSetting").parsley().reset();
    }
    $scope.Save = function () {
        $('#frmApplicationSetting').parsley().reset();
        var parsleyForm = $('#frmApplicationSetting').parsley();
        parsleyForm.validate();
        if (!parsleyForm.isValid())
            return false;
        $scope.ApplicationSetting.IsActive = $("#chkIsActive").iChecked();
        var formData = new FormData();
        var image = $("#logo")[0].files;
        if (image.length > 0) {
            formData.append("Image", image[0]);
        }
        formData.append("ApplicationSetting", JSON.stringify($scope.ApplicationSetting));
        SaveAndUpload("/ApplicationSetting/SaveUpdate", formData, false, $("#btnApplicationSetting")).then(function (d) {
            if (d.Success) {
                //BlockUI(false, $("#btnApplicationSetting"));
            }
            ShowMessage(d);
        });
    }

    function ApplicationSettingFetchById() {
       // var obj = FetchParams();
        // if (obj != null && !IsNullOrEmpty(obj.Code)) {
        Get('/ApplicationSetting/GetById', "").then(function (result) {
                if (result.Success) {
                    ClearFields();
                    $scope.ApplicationSetting.Id = result.Data.Id;
                    $scope.ApplicationSetting.ApplicationName = result.Data.ApplicationName;
                    $scope.ApplicationSetting.Address = result.Data.Address;
                    $scope.ApplicationSetting.Phone = result.Data.Phone;
                    $scope.ApplicationSetting.Email = result.Data.Email;
                    $scope.ApplicationSetting.Logo = result.Data.Logo;
                    $scope.ApplicationSetting.FaceBookLink = result.Data.FaceBookLink;
                    $scope.ApplicationSetting.GoogleLink = result.Data.GoogleLink;
                    $scope.ApplicationSetting.TwitterLink = result.Data.TwitterLink;
                    $scope.ApplicationSetting.SkypeLink = result.Data.SkypeLink;
                    $scope.ApplicationSetting.NTN = result.Data.NTN;
                    $scope.ApplicationSetting.CompanyName = result.Data.CompanyName;
                    $scope.ApplicationSetting.MailingAddress = result.Data.MailingAddress;
                    $scope.ApplicationSetting.IsActive =result.Data.IsActive;
                    if (result.Data.IsActive)
                        $("#chkIsActive").bootstrapToggle('on');
                    else
                        $("#chkIsActive").bootstrapToggle('off');

                    console.log(result);
                    $scope.$apply();
                }
            });
       // }

    }

});