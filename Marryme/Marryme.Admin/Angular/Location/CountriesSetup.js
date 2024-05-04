app.controller("CountrySetupController", function ($scope, $compile) {
    $scope.Country = {
    };
    $scope.EncodedZero = "AQAAAB%2bLCAAAAAAABAAzAAAh39v0AQAAAA%3d%3d";
    ClearFields();
   
    CountryFetchById();

    function ClearFields() {
        $scope.Country.Id = 0;
        $scope.Country.Name = "";
        $scope.Country.ISO = "";
        $("#frmCountry").parsley().reset();
    }
    $scope.Save = function () {
        $('#frmCountry').parsley().reset();
        var parsleyForm = $('#frmCountry').parsley();
        parsleyForm.validate();
        if (!parsleyForm.isValid())
            return false;
        var formData = new FormData();

        formData.append("Countries", JSON.stringify($scope.Country));
        SaveAndUpload("/Location/SaveUpdateCountry", formData, false, $("#btnCountry")).then(function (d) {
            if (d.Success) {
                BlockUI(false, $("#btnCountry"));
                // redirect to another page
                RedirectDelay("/Location/Countries");
            }
            ShowMessage(d);
        });
    }


    function CountryFetchById() {
        var obj = FetchParams();
        if (obj != null && !IsNullOrEmpty(obj.Code)) {
            Post('/Location/CountryGetById', { code: obj.Code }).then(function (result) {
                if (result.Success) {
                    ClearFields();
                    $scope.Country.Id = result.Data.Id;
                    $scope.Country.Name = result.Data.Name;
                    $scope.Country.ISO = result.Data.ISO;
                    $scope.$apply();
                }
            });
        }

    }

});