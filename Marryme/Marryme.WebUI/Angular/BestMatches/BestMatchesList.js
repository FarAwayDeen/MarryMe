
app.controller("BestMatchesController", function ($scope, $compile) {
    $scope.BestMatches = {
    };
    BestMatchesList();
    FetchFieldPermissions();
    //
    function BestMatchesList() {
        Get("/BestMatches/FetchBestMatches", true).then(function (result) {
            $scope.BestMatches = result.Data.MemberList;
               //console.log($scope.BestMatches);
            $scope.$apply();
        });
    }

    $scope.FieldPermissionMessage = 'Visible for paid Members';
    function FetchFieldPermissions() {
        Get("/Generic/FetchFieldPermissions", true).then(function (result) {
            $scope.FetchFieldPermissionList = result.Data;
            //     console.log($scope.FetchFieldPermissionList);
            $scope.$apply();
        });
    }
    
});