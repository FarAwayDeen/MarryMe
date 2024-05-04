app.controller("PersonalInfoSetupController", function ($scope, $compile) {
    $scope.PersonalInfo = {
    };
    $scope.EncodedZero = "AQAAAB%2bLCAAAAAAABAAzAAAh39v0AQAAAA%3d%3d";
    ClearFields();

    PreBindHeight();
    PreBindNoOfChild();
    PreBindPhysicalStatus();
    PersonalInfoFetchById();
    PreBindGender();
    PreBindLookingFor();
    PreBindCast();
    function PreBindHeight() {
        Get("/Generic/PreBindHeight", true).then(function (result) {
            $scope.Heights = result.Data.HeightList;
            $scope.$apply();
           // consol.log($scope.Height);
        });
    }
    PreBindMaritalStatusMale();
    function PreBindMaritalStatusMale() {
        Get("/Generic/FetchOptions?type=MaritalStatus", true).then(function (result) {
            $scope.MaritalStatusForMale = result.Data;
            $scope.$apply();
           // console.log($scope.MaritalStatusForMale);
        });
    }
    PreBindMaritalStatusFemale();
    function PreBindMaritalStatusFemale() {
        Get("/Generic/PreBindMaritalStatusForFemale", true).then(function (result) {
            $scope.MaritalStatusForFemale = result.Data.MaritalStatusFemaleList;
            $scope.$apply();
        });
    }
    function PreBindNoOfChild() {
        Get("/Generic/PreBindNoOfChild", true).then(function (result) {
            $scope.NoOfChildrenList = result.Data.ChildList;
            $scope.$apply();
        });
    }
    function PreBindPhysicalStatus() {
        Get("/Generic/FetchOptions?type=PhysicalStatus", true).then(function (result) {
            $scope.PhysicalStatusList = result.Data;
            $scope.$apply();
        });
    }
    function PreBindGender() {
        Get("/Generic/PreBindGender", true).then(function (result) {
            $scope.GenderList = result.Data.GenderList;
            $scope.$apply();
        });
    }
    function PreBindCast() {
        Get("/Generic/FetchOptions?type=Cast", true).then(function (result) {
            $scope.CastList = result.Data;
            $scope.$apply();
            // console.log($scope.MaritalStatusForMale);
        });
    }
    function PreBindLookingFor() {
        Get("/Generic/MarriageNo", true).then(function (result) {
            $scope.MarriageNoList = result.Data.MarriageNoList;
            $scope.$apply();
        });
    }


    function ClearFields() {
        $scope.PersonalInfo.Id = 0;
        $scope.PersonalInfo.Email = "";
        $scope.PersonalInfo.NoOfChildren = "None";
        // $scope.PersonalInfo.Height = "";
        $scope.PersonalInfo.PhysicalStatus = "Normal";
        $scope.PersonalInfo.MaritalStatus = "";
        $scope.PersonalInfo.Subcast = "";
        $scope.PersonalInfo.Gender = "";
        $scope.PersonalInfo.NoOfMarriage = "";
        $scope.PersonalInfo.HeightUnit = "cm";
        $scope.PersonalInfo.Feet = "";
        $scope.PersonalInfo.Inches = "";
        $scope.PersonalInfo.Centimeters = "";
        if ($("#frmPersonalInfo").parsley() != null && $("#frmPersonalInfo").parsley() != 'undefined') {
            $("#frmPersonalInfo").parsley().reset();
        }
    }
    $scope.Save = function () {
        $('#frmPersonalInfo').parsley().reset();
        var parsleyForm = $('#frmPersonalInfo').parsley();
        parsleyForm.validate();
        if (!parsleyForm.isValid())
            return false;
        //$scope.PageContent.PageDescription = $('#txtDescription').summernote('code');

        var formData = new FormData();
        var image = $("#profilePic")[0].files;
        if (image.length > 0) {
            formData.append("Image", image[0]);
        }
        formData.append("PersonalInfo", JSON.stringify($scope.PersonalInfo));
        SaveAndUpload("/Member/PersonalInfo", formData, false, $("#btnPersonalInfo")).then(function (d) {
            if (d.Success) {
                //BlockUI(false, $("#btnPersonalInfo"));
                // redirect to another page
                //RedirectDelay("/Package/Packages");
            }
            ShowMessage(d);
        });
    }
    function PersonalInfoFetchById() {
        Post('/Member/PersonalInfoGetById', '', true).then(function (result) {
            if (result.Success) {
                ClearFields();
                // $scope.PersonalInfo.Id = result.Data.Id;
                $scope.PersonalInfo.Email = result.Data.Email;
                $scope.PersonalInfo.Name = result.Data.Name;
                $scope.PersonalInfo.MaritalStatus = (result.Data.MaritalStatus).toString();
                $scope.PersonalInfo.NoOfChildren = result.Data.NoOfChildren;
                $scope.PersonalInfo.PhysicalStatus = result.Data.PhysicalStatus;
                //$scope.PersonalInfo.Height = result.Data.Height;
                $scope.PersonalInfo.Subcast = result.Data.Subcast;
                $scope.PersonalInfo.Gender = result.Data.Gender;
                $scope.PersonalInfo.NoOfMarriage = result.Data.NoOfMarriage;
                $scope.PersonalInfo.ProfilePicPath = result.Data.ProfilePicPath;
                $scope.PersonalInfo.HeightUnit = result.Data.HeightUnit;
                $scope.PersonalInfo.Feet = result.Data.Feet;
                $scope.PersonalInfo.Inches = result.Data.Inches;
                $scope.PersonalInfo.Centimeters = result.Data.Centimeters;
                // $("#ddlHeight").val(result.Data.Height).trigger("change");
                //$("#ddlHeight").multiSelect(result.Data.Height);
                $scope.$apply();
            }
        });
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

    $("#profilePic").change(function () {
        readURL(this);
    });
});