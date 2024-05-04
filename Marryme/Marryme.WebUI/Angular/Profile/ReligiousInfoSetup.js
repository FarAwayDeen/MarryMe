app.controller("ReligiousInfoSetupController", function ($scope, $compile) {
    $scope.ReligiousInfo = {
    };
    $scope.EncodedZero = "AQAAAB%2bLCAAAAAAABAAzAAAh39v0AQAAAA%3d%3d";
    ClearFields();
    FetchProfileReligiousDetail();
    //PreBindDosham();
    //function PreBindDosham() {
    //    Get("/Generic/PreBindDosham", true).then(function (result) {
    //        $scope.DoshamList = result.Data.DoshamList;
    //        $scope.$apply();
    //    });
    //}

    PreBindReligion();
    function PreBindReligion() {
        Get("/Generic/FetchOptions?type=Religion", true).then(function (result) {
            $scope.Religions = result.Data;
            $scope.$apply();
            //console.log($scope.Religions);
        });
    }
    PreBindSect();
    function PreBindSect() {
        Get("/Generic/FetchOptions?type=Sect", true).then(function (result) {
            $scope.Sects = result.Data;
            $scope.$apply();
            //console.log($scope.Sects);
        });
    }
    PreBindGender();
    function PreBindGender() {
        Get("/Generic/PreBindGender", true).then(function (result) {
            $scope.GenderList = result.Data;
            $scope.$apply();
        });
    }
    //PreBindMinutes();
    //function PreBindMinutes() {
    //    Get("/Generic/PreBindMinutes", true).then(function (result) {
    //        $scope.Minutes = result.Data.MinutesList;
    //        $scope.$apply();
    //    });
    //}
    //PreBindMeridiem();
    //function PreBindMeridiem() {
    //    Get("/Generic/PreBindMeridiem", true).then(function (result) {
    //        $scope.Meridiems = result.Data.MeridiemList;
    //        $scope.$apply();
    //    });
    //}
    //PreBindChartStyle();
    //function PreBindChartStyle() {
    //    Get("/Generic/PreBindChartStyle", true).then(function (result) {
    //        $scope.ChartStyles = result.Data.ChartStyleList;
    //        $scope.$apply();
    //    });
    //}

    //PreBindCountryName();
    //function PreBindCountryName() {
    //    Get("/Member/FetchCountryNameByMemberId", true).then(function (result) {
    //       // $scope.CountryOfBirth = result.Data[0].Name;
    //        PreBindStates(result.Data[0].Id);
    //        $scope.$apply();
    //    });
    //}
    //PreBindCountry();
    //function PreBindCountry() {
    //    Get("/Generic/PreBindCountries", true).then(function (result) {
    //        $scope.CountryOfBirth = result.Data.countryList;
    //        $scope.$apply();
    //    });
    //}
    //function PreBindStates(CountryId) {
    //    Post("/Generic/PreBindStatesForReligius", { countryCodeId: CountryId }, true).then(function (result) {
    //        $scope.StateOfBirth = result.Data.statesList;
    //        $scope.$apply();
    //    });
    //}

    //function PreBindCities(state) {
    //    Post("/Generic/PreBindCities", { stateId: state }, true).then(function (result) {
    //        $scope.CityOfBirth = result.Data.citiesList;
    //        $scope.$apply();
    //    });
    //}

    function ClearFields() {
        $scope.ReligiousInfo.Id = 0;
        $scope.ReligiousInfo.MemberId = 0;
        $scope.ReligiousInfo.Religion = "";
        $scope.ReligiousInfo.Sect = "";
        //$scope.ReligiousInfo.Gothra = "";
        //$scope.ReligiousInfo.Dosham = "";
        //$scope.ReligiousInfo.Hour = 0;
        //$scope.ReligiousInfo.Minute = 0;
        //$scope.ReligiousInfo.Meridiem = "";
        //$scope.ReligiousInfo.TimeOfBirth = "";
        //$scope.ReligiousInfo.CountryOfBirth = "";
        //$scope.ReligiousInfo.StateOfBirth = "";
        //$scope.ReligiousInfo.CityOfBirth = "";
        //$scope.ReligiousInfo.CountryTypeCode = "";
        //$scope.ReligiousInfo.CityTypeCode = "";
        //$scope.ReligiousInfo.StateTypeCode = "";
        $("#frmReligiousInfo").parsley().reset();
    }

    $scope.BindStates = function () {
        PreBindStates($scope.ReligiousInfo.CountryTypeCode);
    }

    $scope.BindCities = function () {
        PreBindCities($scope.ReligiousInfo.StateTypeCode);
    }

    $scope.Save = function () {
        $('#frmReligiousInfo').parsley().reset();
        var parsleyForm = $('#frmReligiousInfo').parsley();
        parsleyForm.validate();
        if (!parsleyForm.isValid())
            return false;
        //$scope.PageContent.PageDescription = $('#txtDescription').summernote('code');

        var formData = new FormData();

        formData.append("ReligiousInfo", JSON.stringify($scope.ReligiousInfo));
        SaveAndUpload("/Member/ReligiousInfo", formData, false, $("#btnReligiousInfo")).then(function (d) {
            if (d.Success) {
                //BlockUI(false, $("#btnReligiousInfo"));
                // redirect to another page
                //RedirectDelay("/Package/Packages");
            }
            ShowMessage(d);
        });
    }

    function FetchProfileReligiousDetail() {
        Post('/Member/FetchProfileReligiousDetail', '', true).then(function (result) {
            if (result.Success && result.Data != null) {
                $scope.ReligiousInfo.Religion = result.Data.Religion;
                $scope.ReligiousInfo.Sect = result.Data.Sect;
                //$scope.ReligiousInfo.Gothra = result.Data.Gothra;
                //$scope.ReligiousInfo.Dosham = result.Data.Dosham;
                //$scope.ReligiousInfo.Hour = result.Data.Hour;
                //$scope.ReligiousInfo.Minute = result.Data.Minute;
                //$scope.ReligiousInfo.Meridiem = result.Data.Meridiem;
                //$scope.ReligiousInfo.TimeOfBirth = result.Data.TimeOfBirth;
                //$scope.ReligiousInfo.CountryOfBirth = result.Data.CountryOfBirth;
                //$scope.ReligiousInfo.StateOfBirth = result.Data.StateOfBirth;
                //$scope.ReligiousInfo.CityOfBirth = result.Data.CityTypeCode;
                //$scope.ReligiousInfo.CountryTypeCode = result.Data.CountryTypeCode;
                //$scope.ReligiousInfo.CityTypeCode = result.Data.CityTypeCode;
                //$scope.ReligiousInfo.StateTypeCode = result.Data.StateTypeCode;

                //if (result.Data.CountryTypeCode != null && result.Data.CountryTypeCode != "") {
                //    PreBindStates(result.Data.CountryTypeCode);
                //}
                //if (result.Data.StateTypeCode != null && result.Data.StateTypeCode != "") {
                //    PreBindCities(result.Data.StateTypeCode);
                //}


                $scope.$apply();
            }
        });
    }
});