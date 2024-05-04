app.controller("DivorcePolicyController", function ($scope, $compile) {
    $scope.Policy = {
        dropdownOption: "Divorce"
    };

    //Acceptance Question List from Databse
    //AcceptanceQuestionList();
    //function AcceptanceQuestionList() {
    //    Get("/Member/AcceptanceQuestionList", true).then(function (result) {
    //        $scope.AcceptanceQList = result.Data.AcceptanceQuestionList;
    //        console.log($scope.AcceptanceQList);
    //        $scope.$apply();
    //    });
    //}
    //Dropdown list for yes and No
    $scope.truefalse = [{
        id: '1',
        name: 'Yes'
    }, {
        id: '2',
        name: 'No'
    }];
    $scope.option = function () {
        //console.log('called');
        var result = $scope.Policy.dropdownOption
        if (result == 'Divorce') {
            DivorcePolicyFetchById();
            $('#Divorce').show()
            $('#btnPolicy').show()
            $('#Khula').hide()
        } else if (result == 'Khula') {
            DivorcePolicyFetchById();
            $('#Divorce').hide()
            $('#Khula').show()
            $('#btnPolicy').show()
        } else {
            $('#Divorce').hide()
            $('#Khula').hide()
            $('#btnPolicy').hide()
        }
    }
    $scope.SavePolicy = function () {
        var formData = new FormData();
        formData.append("Policy", JSON.stringify($scope.Policy));
       // console.log($scope.Policy);
        SaveAndUpload("/Member/SaveDivorcePolicy", formData, false, $("#btnPolicy")).then(function (d) {
            if (d.Success) {
                //BlockUI(false, $("#btnFamilyInfo"));
                // redirect to another page
                //RedirectDelay("/Package/Packages");
            }
            ShowMessage(d);
        });
    }

    function ClearFields() {
        //$scope.Acceptance.Id = 0;
        //$scope.Acceptance.MemberId = 0;
        $scope.Acceptance.Brothers = "";
        $scope.Acceptance.Sons = "";
        $scope.Acceptance.Mother = '';
        $scope.Acceptance.Father = "";
        $scope.Acceptance.Uncles = "";
        $scope.Acceptance.Aunts = "";
        $scope.Acceptance.Daughters = "";
        $scope.Acceptance.Sisters = "";
        $("#AcceptanceForm").reset();
    }
    PreBindCurrencySimbals();
    function PreBindCurrencySimbals() {
        Get("/Generic/PreBindCurrencySimbals", true).then(function (result) {
            $scope.CurrencySimbals = result.Data.CurrencySimbalList;
            $scope.$apply();
        });
    }
    DivorcePolicyFetchById();
    function DivorcePolicyFetchById() {
        //var result = $scope.Policy.dropdownOption
        //console.log('Fetch dropdown option ' + result);
        Post('/Member/DivorcePolicyFetchById', { option: $scope.Policy.dropdownOption }, true).then(function (result) {
            if (result.Success) {
               // console.log(result.Data);
                //ClearFields();
                // $scope.PersonalInfo.Id = result.Data.Id;
                if (result.Data.dropdownOption == "Divorce") {
                    console.log("Divorce Code Run");
                    $scope.Policy.dropdownOption = result.Data.dropdownOption;
                    $scope.Policy.DivorceAmountcheckbox = result.Data.Amountcheckbox == "true" ? true : false;
                    $scope.Policy.DivorceAmountFrom = result.Data.AmountFrom;
                    $scope.Policy.DivorceAmountTo = result.Data.AmountTo;
                    $scope.Policy.DivorceHouseCheckBox = result.Data.HouseCheckBox == "true" ? true : false;
                    $scope.Policy.DivorceHouseDetail = result.Data.HouseDetail;
                    $scope.Policy.DivorceMiscellaneousCheckbox = result.Data.MiscellaneousCheckbox == "true" ? true : false;
                    $scope.Policy.DivorceMiscellaneousDetail = result.Data.MiscellaneousDetail;
                    $scope.Policy.DIncomeCurrency = result.Data.IncomeCurrency;
                    $scope.Policy.ThreeDivorcePolicy = result.Data.ThreeDivorcePolicy;
                    $('#Divorce').show();
                    $('#Khula').hide();
                    //console.log($scope.Policy);
                }
                if (result.Data.dropdownOption == "Khula") {
                    console.log("Khula Code Run");
                    $scope.Policy.dropdownOption = result.Data.dropdownOption;
                    $scope.Policy.KhulaAmountcheckbox = result.Data.Amountcheckbox == "true" ? true : false;
                    $scope.Policy.KhulaAmountFrom = result.Data.AmountFrom;
                    $scope.Policy.KhulaAmountTo = result.Data.AmountTo;
                    $scope.Policy.KhulaHouseCheckBox = result.Data.HouseCheckBox == "true" ? true : false;
                    $scope.Policy.KhulaHouseDetail = result.Data.HouseDetail;
                    $scope.Policy.KhulaMiscellaneousCheckbox = result.Data.MiscellaneousCheckbox == "true" ? true : false;
                    $scope.Policy.KIncomeCurrency = result.Data.IncomeCurrency;
                    $scope.Policy.KhulaMiscellaneousDetail = result.Data.MiscellaneousDetail;
                    $('#Khula').show();
                }


                $scope.$apply();
            }
        });


    }

});