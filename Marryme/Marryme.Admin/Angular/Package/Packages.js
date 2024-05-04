
app.controller("PackageSetupController", function ($scope, $compile) {
    $scope.Packages = {
        Search: "",
        Active: ""
        //Status: ""
    };
    $scope.PackagesFetch = function () {
        $("#tblPackages").dataTable().fnDestroy();
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
        $("#tblPackages").advancedDataTable({
            url: "/Package/Fetch",
            postData: $scope.Packages,
            bindingData: [
                {
                    "render": function (data, type, row) {
                        return '<span title="' + row.PackageTypeName + '">' + row.PackageTypeName + '</span>';
                    },
                },
                {
                    "render": function (data, type, row) {
                        return Label(row.IsActive, true);
                    },
                },
                { "data": "NumberOfMobileNo" },
                { "data": "NumberOfAstroMatches" },
                { "data": "NumberOfChatMessages" },
                {
                    "render": function (data, type, row) {
                        var editer = "No Action";
                        editer = ` <li>
										<a href= "/Package/Setup?Code=`+ row.Code + `" ><i class ="ti-pencil"></i> Edit</a>
										</li>
										<li>
										<a href="javascript: void(0);" onClick= "DeletePackage('` + row.Code + `')" ><i class ="ti-trash"></i> Delete</a>
										</li>`;

                        return `<div class="dropdown"><i class="fa fa-chevron-down dropdown-toggle" data-toggle="dropdown"></i><ul class="dropdown-menu">` + editer + `</ul></div>`;
                    },
                    "className": "dropdown"
                }
            ],
            createdRow: function (row, data, dataIndex) {
            },
            disableSorting: [{
                "bSortable": false,
                "aTargets": [5]
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
        angular.element(document.getElementById('DivPackageManagement')).scope().DeletePackage(recordId);
    }).catch(function (err) { });
}