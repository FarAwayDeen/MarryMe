app.controller("RegistrarPersonalInfoController", function ($scope, $compile) {
    $scope.PersonalInfo = {
    };
    $scope.EncodedZero = "AQAAAB%2bLCAAAAAAABAAzAAAh39v0AQAAAA%3d%3d";
    ClearFields();

    PreBindGender();
    PreBindReligion();
    PreBindSect();
    PreBindMaritalStatusMale();
    PreBindEducation();
    PreBindEmployedIn();
    PersonalInfoFetchById();

    function PreBindEducation() {
        Get("/Generic/FetchOptions?type=EducationLevels", true).then(function (result) {
            $scope.EducationList = result.Data;
            $scope.$apply();
        });
    }
    function PreBindEmployedIn() {
        Get("/Generic/FetchOptions?type=Employment", true).then(function (result) {
            $scope.EmployeedInList = result.Data;
            $scope.$apply($scope.EmployeedInList);
        });
    }
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

    function PreBindGender() {
        Get("/Generic/PreBindGender", true).then(function (result) {
            $scope.GenderList = result.Data.GenderList;
            $scope.$apply();
        });
    }

    function PreBindReligion() {
        Get("/Generic/FetchOptions?type=Religion", true).then(function (result) {
            $scope.Religions = result.Data;
            $scope.$apply();
            //console.log($scope.Religions);
        });
    }

    function PreBindSect() {
        Get("/Generic/FetchOptions?type=Sect", true).then(function (result) {
            $scope.Sects = result.Data;
            $scope.$apply();
            //console.log($scope.Sects);
        });
    }


    function ClearFields() {
        $scope.PersonalInfo.Id = 0;
        $scope.PersonalInfo.Email = "";
        $scope.PersonalInfo.ProfilePicPath = "";
        $scope.PersonalInfo.MaritalStatus = "";
        $scope.PersonalInfo.Gender = "";
        $scope.PersonalInfo.EductionLevels = "";
        $scope.PersonalInfo.Employment = "";
        $scope.PersonalInfo.Religion = "";
        $scope.PersonalInfo.Sect = "";
        if ($("#frmPersonalInfo").parsley() != null && $("#frmPersonalInfo").parsley() != 'undefined') {
            $("#frmPersonalInfo").parsley().reset();
        }
    }
    $scope.Save = function () {
        console.log($scope.PersonalInfo);
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
        SaveAndUpload("/MarriageRegistration/PersonalInfo", formData, false, $("#btnPersonalInfo")).then(function (d) {
            if (d.Success) {
                //BlockUI(false, $("#btnPersonalInfo"));
                // redirect to another page
                //RedirectDelay("/Package/Packages");
            }
            ShowMessage(d);
        });
    }
    function PersonalInfoFetchById() {
        Post('/MarriageRegistration/PersonalInfoGetById', '', true).then(function (result) {
            if (result.Success) {
                ClearFields();
                $scope.PersonalInfo.Id = result.Data.Id;
                $scope.PersonalInfo.Email = result.Data.Email;
                $scope.PersonalInfo.Name = result.Data.Name;
                $scope.PersonalInfo.MaritalStatus = (result.Data.MaritalStatus).toString();
                $scope.PersonalInfo.Gender = result.Data.Gender;
                $scope.PersonalInfo.EductionLevels = (result.Data.EductionLevels).toString();
                $scope.PersonalInfo.Employment = (result.Data.Employment).toString();
                $scope.PersonalInfo.ProfilePicPath = result.Data.ProfilePicPath;
                $scope.PersonalInfo.ReligionId = (result.Data.ReligionId).toString();
                $scope.PersonalInfo.SectId = (result.Data.SectId).toString();
                $scope.$apply();
            }
            //console.log($scope.PersonalInfo);
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