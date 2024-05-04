app.controller("FutureAgreementController", function ($scope, $compile) {    
    $scope.Facilitieschecklist = {

    };

    PreBindFacilities();
    PreBindWifeNo();

    //#region Facilities Functionality    
    function PreBindWifeNo() {
        Get("/Generic/WifeNo", true).then(function (result) {
            $scope.MarriageNoList = result.Data.WifeNoList;
            $scope.$apply();
        });
    }

    function PreBindFacilities() {
        Get("/FutureAgreement/FetchFacilities").then(function (result) {
            $scope.Facilitieschecklist = result.Data;
            $scope.Gender = result.key;
            $scope.$apply();
            //console.log($scope.Gender);                       
        }).then(() => {
            FetcSelectedFacelities();
        });
    }
    
    $scope.SaveFacilitiesForMan = function () {
        //console.log($scope.Facilitieschecklist);            
        $.ajax({
            type: "POST",
            url: "/FutureAgreement/SaveFacilitiesforMan",
            data: JSON.stringify($scope.Facilitieschecklist),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {
                ShowMessage(r);
            }
        });            
    }

    var selectedIds = [];
    function FetcSelectedFacelities() {
        Get("/FutureAgreement/FetchSelectedFacilities").then(function (result) {           
            selectedIds = result.Data;
            if ($scope.Gender == "Female") {
                FemaleCheckBoxesChecked();
            } else if ($scope.Gender == "Male") {
                MaleCheckBoxesChecked();
            }
           // console.log(selectedIds);
        });
    }

    function FemaleCheckBoxesChecked() {
        console.log("Female View");
        angular.forEach($scope.Facilitieschecklist, function (item) {
            angular.forEach(selectedIds, function (selectedItem) {
                if (selectedItem.FacilityId == item.ID) {
                    item.One = selectedItem.One == true ? true : "false";
                    item.Two = selectedItem.Two == true ? true : "false";
                    item.Three = selectedItem.Three == true ? true : "false";
                    item.Four = selectedItem.Four == true ? true : "false";
                    $scope.$apply();                    
                }
            });
        });
    }

    function MaleCheckBoxesChecked() {
        console.log("Male View");
        angular.forEach($scope.Facilitieschecklist, function (item) {
            if (selectedIds.indexOf(item.Id) > -1) {
                item.Status = true;
                $scope.$apply();
            //console.log(item);
            }
        });
    }
    //#endregion    
});