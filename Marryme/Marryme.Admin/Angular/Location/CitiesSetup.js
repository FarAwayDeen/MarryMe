app.controller("CitySetupController", function ($scope, $compile) {
    $scope.City = {
    };
    $scope.CountryTypeCode = "";
    $scope.StateTypeCode = "";
    $scope.EncodedZero = "AQAAAB%2bLCAAAAAAABAAzAAAh39v0AQAAAA%3d%3d";
    ClearFields();

    CityFetchById();

    
    function PreBindCountry() {
        Get("/Generic/PreBindCountries", true).then(function (result) {
            $scope.CountryList = result.Data.countryList;
            $scope.$apply();
            $('#ddlCountry').val($scope.CountryTypeCode).trigger('change');
        });
    }
    function PreBindStates(CountryId) {
        Post("/Generic/PreBindStatesForReligius", { countryCodeId: CountryId }, true).then(function (result) {
            $scope.StateList = result.Data.statesList;
            $scope.$apply();
            $('#ddlState').val($scope.StateTypeCode).trigger('change');
        });
    }

    //function PreBindCities(stateId) {
    //    Post("/Generic/PreBindCities", { stateId: stateId }, true).then(function (result) {
    //        $scope.CityList = result.Data.citiesList;
    //        $scope.$apply();
    //    });
    //}



    function ClearFields() {
        $scope.City.CityID = 0;
        $scope.City.Name = "";
        $scope.City.StateID = "";
        $scope.City.CountryTypeCode = "";
        //$scope.City.StateTypeCode = "";

        $("#frmCity").parsley().reset();
    }

    $scope.BindStates = function () {
        console.log($scope.City.CountryTypeCode);
        PreBindStates($scope.City.CountryTypeCode);
    }

    //$scope.BindCities = function () {
    //    PreBindCities($scope.City.StateTypeCode);
    //}

    $scope.Save = function () {
        $('#frmCity').parsley().reset();
        var parsleyForm = $('#frmCity').parsley();
        parsleyForm.validate();
        if (!parsleyForm.isValid())
            return false;
        var formData = new FormData();

        formData.append("Cities", JSON.stringify($scope.City));
        SaveAndUpload("/Location/SaveUpdateCity", formData, false, $("#btnCity")).then(function (d) {
            if (d.Success) {
                BlockUI(false, $("#btnCity"));
                // redirect to another page
                RedirectDelay("/Location/Cities");
            }
            ShowMessage(d);
        });
    }


    function CityFetchById() {
        var obj = FetchParams();
        if (obj != null && !IsNullOrEmpty(obj.Code)) {
            Post('/Location/CityGetById', { code: obj.Code }).then(function (result) {
                if (result.Success) {
                    ClearFields();
                    $scope.City.CityID = result.Data.CityID;
                    $scope.City.Name = result.Data.Name;
                    $scope.City.StateID = result.Data.StateID;
                    if (result.Data.CountryTypeCode != null && result.Data.CountryTypeCode != "") {
                        PreBindCountry(result.Data.CountryTypeCode);
                        $scope.CountryTypeCode = result.Data.CountryTypeCode;
                    }
                    if (result.Data.StateTypeCode != null && result.Data.StateTypeCode != "") {
                        PreBindStates(result.Data.StateTypeCode);
                        $scope.StateTypeCode = result.Data.StateTypeCode;
                    }
                    $scope.$apply();


                }
            });
        }
        else {
            PreBindCountry();
        }
    }

});