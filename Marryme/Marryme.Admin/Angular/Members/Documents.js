
app.controller("DocumentsController", function ($scope, $compile) {
    $scope.DocumentList = {
        Search: "",
        Active: ""
    };
    DocumentListTable();

    function DocumentListTable() {
        Get("/Members/DocumentList", true).then(function (result) {
            $scope.Docs = result.Data;
            console.log($scope.Docs);
            $scope.$apply();
        });

        //$scope.DeleteImage = function (DocTypeID) {
        //    console.log(DocTypeID);
        //    Get("/Member/DeleteImage?docId=" + DocTypeID).then(function (d) {
        //        if (d.Success)
        //            RedirectDelay("/Member/DocumentList")
        //        ShowMessage(d)
        //    });
        //}
    }
   
});


