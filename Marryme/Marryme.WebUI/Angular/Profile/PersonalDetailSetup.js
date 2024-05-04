app.controller("PersonalDetailSetupController", function ($scope, $compile) {
    $scope.PersonalDetail = {
    };
    $scope.EncodedZero = "AQAAAB%2bLCAAAAAAABAAzAAAh39v0AQAAAA%3d%3d";
    ClearFields();

    PreBindBodyType();
    PersonalInfoDetailFetchById();
    function PreBindBodyType() {
        Get("/Generic/FetchOptions?type=BodyType", true).then(function (result) {
            $scope.BodyTypeList = result.Data;
            $scope.$apply();
            //console.log($scope.BodyTypeList);
        });
    }
    PreBindComplexion();
    function PreBindComplexion() {
        Get("/Generic/FetchOptions?type=Complexion", true).then(function (result) {
            $scope.ComplexionList = result.Data;
            $scope.$apply();
           //console.log($scope.ComplexionList);
        });
    }
    //PreBindEatingHabit();
    //function PreBindEatingHabit() {
    //    Get("/Generic/PreBindEatingHabit", true).then(function (result) {
    //        $scope.EatingHabitList = result.Data.EatingHabitsList;
    //        $scope.$apply();
    //    });
    //}
    //PreBindDrinkigHabit();
    //function PreBindDrinkigHabit() {
    //    Get("/Generic/PreBindDrinkingHabit", true).then(function (result) {
    //        $scope.DrinkingHabitList = result.Data.DrinkingHabitsList;
    //        $scope.$apply();
    //    });
    //}
    PreBindSmokingHabit();
    function PreBindSmokingHabit() {
        Get("/Generic/PreBindSmokingHabit", true).then(function (result) {
            $scope.SmokingHabitList = result.Data.SmokingHabitsList;
            $scope.$apply();
        });
    }
    PreBindLanguages();
    function PreBindLanguages() {
        Get("/Generic/PreBindLanguages", true).then(function (result) {
            $scope.Languages = result.Data.LanguagesList;
            $scope.$apply();
        });
    }


    function ClearFields() {
        $scope.PersonalDetail.Id = 0;
        $scope.PersonalDetail.MemberId = 0;
        $scope.PersonalDetail.LanguageId = 0;
        $scope.PersonalDetail.LanguageTypeCode = "";
        $scope.PersonalDetail.Weight = '';
        $scope.PersonalDetail.BodyType = 0;
        $scope.PersonalDetail.Complexion = 0;
        $scope.PersonalDetail.Occupation = "";
        //$scope.PersonalDetail.EatingHabit = "";
        //$scope.PersonalDetail.DrinkingHabit = "";
        $scope.PersonalDetail.SmokingHabit = "";
        $scope.PersonalDetail.Interests = "";
        $scope.PersonalDetail.Hobbies = "";
        $("#frmPersonalDetail").parsley().reset();
    }

    $scope.Save = function () {
        $('#frmPersonalDetail').parsley().reset();
        var parsleyForm = $('#frmPersonalDetail').parsley();
        parsleyForm.validate();
        if (!parsleyForm.isValid())
            return false;
        //$scope.PageContent.PageDescription = $('#txtDescription').summernote('code');

        var formData = new FormData();

        formData.append("PersonalDetail", JSON.stringify($scope.PersonalDetail));
        console.log(formData)
        SaveAndUpload("/Member/PersonalDetail", formData, false, $("#btnPersonalDetail")).then(function (d) {
            if (d.Success) {
                //BlockUI(false, $("#btnPersonalDetail"));
                // redirect to another page
                //RedirectDelay("/Package/Packages");
            }
            ShowMessage(d);
        });
    }

    function PersonalInfoDetailFetchById() {
        Post('/Member/FetchPersonalInfoDetailById', '', true).then(function (result) {
            if (result.Success) {
                ClearFields();
                // $scope.PersonalInfo.Id = result.Data.Id;
                $scope.PersonalDetail.Weight = result.Data.Weight;
                $scope.PersonalDetail.BodyType = result.Data.BodyType;
                $scope.PersonalDetail.Complexion = result.Data.Complexion;
                $scope.PersonalDetail.Occupation = result.Data.Occupation;
                //$scope.PersonalDetail.EatingHabit = result.Data.EatingHabit;
                //$scope.PersonalDetail.DrinkingHabit = result.Data.DrinkingHabit;
                $scope.PersonalDetail.SmokingHabit = result.Data.SmokingHabit;
                $scope.PersonalDetail.Interests = result.Data.Interests;
                $scope.PersonalDetail.Hobbies = result.Data.Hobbies;
                $scope.PersonalDetail.LanguageTypeCode = result.Data.LanguageTypeCode;
                $scope.$apply();
            }
        });


    }
});