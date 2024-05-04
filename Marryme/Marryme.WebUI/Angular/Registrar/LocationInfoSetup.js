app.controller("RegistrarLocationController", function ($scope, $compile) {
    $scope.LocationInfo = {
    };
    $scope.EncodedZero = "AQAAAB%2bLCAAAAAAABAAzAAAh39v0AQAAAA%3d%3d";
    ClearFields();

    PreBindCountryName();
    PreBindCitizenship();
    PreBindCountryLivingIn();
    function PreBindCountryName() {
        Get("/MarriageRegistration/FetchProfileLocationDetail", true).then(function (result) {
            console.log(result.Data);
            $scope.CountryLivingIn = result.Data.Name;
            $scope.LocationInfo.CountryLivingIn = result.Data.CountryLivingIn;
            $scope.LocationInfo.PlaceOfBirth = result.Data.PlaceOfBirth;
            $scope.LocationInfo.StateTypeCode = result.Data.StateTypeCode;
            $scope.LocationInfo.CityTypeCode = result.Data.CityTypeCode;
            $scope.LocationInfo.CountryTypeCode = result.Data.CountryTypeCode;
            $scope.LocationInfo.CountryLivingInTypeCode = result.Data.CountryLivingInTypeCode;
                //console.log(result);
            PreBindStates(result.Data.CountryTypeCode);
            PreBindCities(result.Data.StateTypeCode);
            $scope.$apply();
        });
    }

    function PreBindCitizenship() {
        Get("/Generic/PreBindCountries", true).then(function (result) {
            $scope.Countries = result.Data.countryList;
            $scope.$apply();
        });
    }
    function PreBindCountryLivingIn() {
        Get("/Generic/PreBindCountryLivingIn", true).then(function (result) {
            $scope.CoutriesLivingInList = result.Data.countryLivingInList;
            $scope.$apply();
        });
    }
    function PreBindStates(CountryId) {
        Post("/Generic/PreBindStates", { countryId: CountryId }, true).then(function (result) {
            $scope.States = result.Data.statesList;
            if ($scope.LocationInfo.StateTypeCode != null && $scope.LocationInfo.StateTypeCode != "") {
                PreBindCities($scope.LocationInfo.StateTypeCode);
            }
            $scope.$apply();
        });
    }
    function PreBindCities(stateId) {
        Post("/Generic/PreBindCities", { stateId: stateId }, true).then(function (result) {
            if (result.Data != null) {
                $scope.Cities = result.Data.citiesList;
                $scope.$apply();
            }
        });
    }
    function PreBindStatesForEncode(CountryId) {
        Post("/Generic/PreBindStatesForReligius", { countryCodeId: CountryId }, true).then(function (result) {
            $scope.States = result.Data.statesList;
            if ($scope.LocationInfo.StateTypeCode != null && $scope.LocationInfo.StateTypeCode != "") {
                PreBindCities($scope.LocationInfo.StateTypeCode);
            }
            $scope.$apply();
        });
    }

    function ClearFields() {
        $scope.LocationInfo.Id = 0;
        $scope.LocationInfo.MemberId = 0;
        $scope.LocationInfo.CountryLivingIn = "";
        $scope.LocationInfo.PlaceOfBirth = "";
        $scope.LocationInfo.ResidingState = "";
        $scope.LocationInfo.ResidingCity = "";
        $scope.LocationInfo.Citizenship = "";
        $scope.LocationInfo.CountryTypeCode = "";
        $scope.LocationInfo.CountryLivingInTypeCode = "";
        $scope.LocationInfo.CityTypeCode = "";
        $scope.LocationInfo.StateTypeCode = "";
        $("#frmLocationInfo").parsley().reset();
    }
    $scope.BindCities = function () {
        PreBindCities($scope.LocationInfo.StateTypeCode);
    }
    $scope.BindState = function () {
        PreBindStates($scope.LocationInfo.CountryLivingInTypeCode);
        //PreBindStatesForEncode($scope.LocationInfo.CountryLivingInTypeCode);
    }

    $scope.Save = function () {
        $('#frmLocationInfo').parsley().reset();
        var parsleyForm = $('#frmLocationInfo').parsley();
        parsleyForm.validate();
        if (!parsleyForm.isValid())
            return false;
        //$scope.PageContent.PageDescription = $('#txtDescription').summernote('code');

        var formData = new FormData();

        formData.append("LocationInfo", JSON.stringify($scope.LocationInfo));
        SaveAndUpload("/Member/LocationInfo", formData, false, $("#btnLocationInfo")).then(function (d) {
            if (d.Success) {
                //BlockUI(false, $("#btnLocationInfo"));
                // redirect to another page
                //RedirectDelay("/Package/Packages");
            }
            ShowMessage(d);
        });
    }
});