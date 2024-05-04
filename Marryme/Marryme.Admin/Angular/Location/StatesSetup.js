app.controller("StatesSetupController", function ($scope, $compile) {
    $scope.States = {
    };
    $scope.EncodedZero = "AQAAAB%2bLCAAAAAAABAAzAAAh39v0AQAAAA%3d%3d";
    ClearFields();

    StatesFetchById();


    function PreBindCountry(CountryTypeCode) {
        Get("/Generic/PreBindCountries", true).then(function (result) {
            $scope.Coutries = result.Data.countryList;
            $scope.$apply();
            $('#ddlStates').val(CountryTypeCode).trigger('change');
        });
    }

    function ClearFields() {
        $scope.States.StateID = 0;
        $scope.States.CountryTypeCode = "";
        $scope.States.Name = "";
        $scope.States.CountryID = "";
        $("#frmStates").parsley().reset();
    }


    $scope.Save = function () {
        $('#frmStates').parsley().reset();
        var parsleyForm = $('#frmStates').parsley();
        parsleyForm.validate();
        if (!parsleyForm.isValid())
            return false;
        var formData = new FormData();

        formData.append("States", JSON.stringify($scope.States));
        SaveAndUpload("/Location/SaveUpdateStates", formData, false, $("#btnStates")).then(function (d) {
            if (d.Success) {
                BlockUI(false, $("#btnStates"));
                // redirect to another page
                RedirectDelay("/Location/States");
            }
            ShowMessage(d);
        });
    }


    function StatesFetchById() {
        var obj = FetchParams();
        if (obj != null && !IsNullOrEmpty(obj.Code)) {
            Post('/Location/StatesGetById', { code: obj.Code }).then(function (result) {
                if (result.Success) {
                    console.log(result);
                    ClearFields();
                    $scope.States.StateID = result.Data.StateID;
                    $scope.States.Name = result.Data.Name;
                    $scope.States.CountryID = result.Data.CountryID;
                    $scope.$apply();
                    PreBindCountry(result.Data.CountryTypeCode);
                }
            });
        }
        else {
            PreBindCountry("");
        }
    }

});