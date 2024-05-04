app.controller("UploadDocController", function ($scope, $compile) {
    $scope.UploadDocs = {
    };
    $scope.WifeKidsDetail = {
    };

    
    DocDropdownList();
    function DocDropdownList() {
        Get("/Generic/DocDropdownList", true).then(function (result) {
            $scope.Doclist = result.Data.DocumentList;
            console.log($scope.Doclist);
            $scope.$apply();
        });
    }
    //PreBindExsitingWife();
    //function PreBindExsitingWife() {
    //    Get("/Generic/ExsitingWife", true).then(function (result) {
    //        $scope.ExsitingWife = result.Data.ExsitingWifeList;
    //        //console.log($scope.ExsitingWife);
    //        $scope.$apply();
    //    });
    //}

    //$scope.SaveLog = function () {
    //    var formData = new FormData();
    //    var image = $("#recieptfile")[0].files;
    //    if (image.length > 0) {
    //        formData.append("File", image[0]);
    //    }
    //    formData.append("LogTransaction", JSON.stringify($scope.LogTransaction));
    //    console.log($scope.LogTransaction);
    //    SaveAndUpload("/Payment/SaveWithDrawLog", formData, false, $("#btnTransaction")).then(function (d) {
    //        if (d.Success)
    //            //BlockUI(false, $("#btnFamilyInfo"));
    //            // redirect to another page
    //            //RedirectDelay("/Payment/TransactionGrid");
    //            ShowMessage(d);
    //        setTimeout(function () {
    //            window.location.href = "/Payment/TransactionGrid";
    //        }, 1000);
    //    });
    //}

    $scope.Save = function () {
        var formData = new FormData();
        var image = $("#docFile")[0].files;
        if (image.length > 0) {
            formData.append("Image", image[0]);
        }
        formData.append("UploadDocs", JSON.stringify($scope.UploadDocs));
        console.log($scope.UploadDocs);
        SaveAndUpload("/Member/DocFile", formData, false, $("#btnDocs")).then(function (d) {
            if (d.Success) {
                //BlockUI(false, $("#btnPersonalInfo"));
                // redirect to another page
                //RedirectDelay("/Package/Packages");
            }
            ShowMessage(d);
        });
    }
    $scope.showFileinput = function () {
        var value = $scope.UploadDocs.List;
        if (value!=null) {
            $('#uploadbtn').show();
        }
    }
    $scope.filechange = function () {
            $('#uploadbtn').hide();
    }

 
 
    

});