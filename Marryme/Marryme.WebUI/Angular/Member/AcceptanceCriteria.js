app.controller("AcceptanceController", function ($scope, $compile) {
    $scope.Acceptance = {
    };
    PersonalInfoDetailFetchById();
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

    $scope.SaveCriteria = function () {
        var formData = new FormData();
        formData.append("Acceptance", JSON.stringify($scope.Acceptance));
        console.log(formData);
        SaveAndUpload("/Member/SaveCriteria", formData, false, $("#btnAcceptance")).then(function (d) {
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

    function PersonalInfoDetailFetchById() {
        Post('/Member/FetchAcceptanceCriteriaById', '', true).then(function (result) {
            if (result.Success) {
                console.log(result.Data);
                //ClearFields();
                // $scope.PersonalInfo.Id = result.Data.Id;
                $scope.Acceptance.Brothers = result.Data.BrothersAproval;
                $scope.Acceptance.Sons = result.Data.SonsAproval;
                $scope.Acceptance.Mother = result.Data.MotherAproval;
                $scope.Acceptance.Father = result.Data.FathersAproval;
                $scope.Acceptance.Uncles = result.Data.UnclesAproval;
                $scope.Acceptance.Aunts = result.Data.AuntsAproval;
                $scope.Acceptance.Daughters = result.Data.DaughtersAproval;
                $scope.Acceptance.Sisters = result.Data.SisterAproval;
                $scope.$apply();
            }
        });


    }

});