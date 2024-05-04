
app.controller("PackageSubscriptionController", function ($scope, $compile) {
    $scope.PackageSubscription = {
        Search: "",
        Active: ""
        //Status: ""
    };
    $scope.PackageSubcriptionFetch = function () {
        $("#tblPackageSubscriptions").dataTable().fnDestroy();
        PackagesBindGrid();
    }
    //PreBinds();
    //function PreBinds() {
    //    Get("/Generic/PreBindPackageTypes", true).then(function (result) {
    //        $scope.PackageTypes = result.Data.PackageTypeList;
    //        $scope.$apply();
    //    });
    //}
    PackagesBindGrid();
    function PackagesBindGrid() {
        $("#tblPackageSubscriptions").advancedDataTable({
            url: "/PackageSubscription/Fetch",
            postData: $scope.PackageSubscription,
            bindingData: [
                //{
                //    "render": function (data, type, row) {
                //        return '<span title="' + row.PackageTypeName + '">' + row.PackageTypeName + '</span>';
                //    },
                //},
                { "data": "Name" },
                { "data": "Package" },
                { "data": "StrStartDate" },
                { "data": "StrEndDate" },
                { "data": "PackageAmount" },
                {
                    "render": function (data, type, row) {
                        return Label(row.IsActive, true);
                    },
                },
                {
                    "render": function (data, type, row) {
                        var editer = "No Action";
                        editer = row.IsActive == true ?
                            ` <li> <a href="javascript: void(0);" onClick="ChangeStatus('` + row.Code + `')" ><i class="ti-check-box"></i> InActive</a> </li>`
                            : `<li> <a href="javascript: void(0);" onClick="ChangeStatus('` + row.Code + `')" > <i class="ti-check-box"></i>Active</a> </li>`;
                          
                        return `<div class="dropdown"><i class="fa fa-chevron-down dropdown-toggle" data-toggle="dropdown"></i><ul class="dropdown-menu">` + editer + `</ul></div>`;
                    },
                    "className": "dropdown"
                }
            ],
            createdRow: function (row, data, dataIndex) {
            },
            disableSorting: [{
                "bSortable": false,
                "aTargets": [6]
            }]
        });
    }

    $scope.DeletePackage = function (recordId) {
        Get("/Package/Delete?code=" + recordId).then(function (d) {
            if (d.Success)
                $scope.PackagesFetch()
            ShowMessage(d)
        });
        //$scope.apply();
    }
    $scope.ChangeStatus = function (recordId) {
        Get("/PackageSubscription/UpdateStatus?code=" + recordId).then(function (d) {
            if (d.Success)
                $scope.PackageSubcriptionFetch();
            ShowMessage(d)
        });
        //$scope.apply();
    }
});

//Jquery Functions
function DeletePackage(recordId) {
    swal({
        title: 'Are you sure?',
        text: 'You will not be able to revert this!',
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#d33',
        cancelButtonColor: '#3085d6',
        confirmButtonText: 'Yes, delete it!',
        cancelButtonText: 'No, cancel!',
        confirmButtonClass: 'btn btn-success',
        cancelButtonClass: 'btn btn-danger',
        showLoaderOnConfirm: true
    }).then(function () {
        angular.element(document.getElementById('DivPackageSubscriptionManagement')).scope().DeletePackage(recordId);
    }).catch(function (err) { });
}

//Jquery Functions
function ChangeStatus(recordId) {
    angular.element(document.getElementById('DivPackageSubscriptionManagement')).scope().ChangeStatus(recordId);
}