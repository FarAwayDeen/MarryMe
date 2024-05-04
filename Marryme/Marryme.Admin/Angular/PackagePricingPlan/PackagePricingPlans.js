
app.controller("PackagePricingPlanController", function ($scope, $compile) {
    $scope.PackagePricingPlan = {
        Search: "",
        Active: ""
        //Status: ""
    };
    $scope.PackagePricingPlansFetch = function () {
        $("#tblPackagePricingPlan").dataTable().fnDestroy();
        PackagePricingPlanBindGrid();
    }
    PackagePricingPlanBindGrid();
    function PackagePricingPlanBindGrid() {
        $("#tblPackagePricingPlan").advancedDataTable({
            url: "/PackagePricingPlan/Fetch",
            postData: $scope.PackagePricingPlan,
            bindingData: [
                {
                    "render": function (data, type, row) {
                        return '<span title="' + row.Name + '">' + row.Name + '</span>';
                    },
                },
                { "data": "StrPackageDuration" },
                
                { "data": "PackagePrice" },
                {
                    "render": function (data, type, row) {
                        var editer = "No Action";
                        editer = ` <li>
										<a href= "/PackagePricingPlan/Setup?Code=`+ row.Code + `" ><i class ="ti-pencil"></i> Edit</a>
										</li>
										<li>
										<a href="javascript: void(0);" onClick= "DeletePackagePricingPlan('` + row.Code + `')" ><i class ="ti-trash"></i> Delete</a>
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
                "aTargets": [3]
            }]
        });
    }

    $scope.DeletePackagePricingPlan = function (recordId) {
        Get("/PackagePricingPlan/Delete?code=" + recordId).then(function (d) {
            if (d.Success)
                $scope.PackagePricingPlansFetch()
            ShowMessage(d)
        });
        //$scope.apply();
    }
});

//Jquery Functions
function DeletePackagePricingPlan(recordId) {
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
        angular.element(document.getElementById('DivPackagePricingPlanManagement')).scope().DeletePackagePricingPlan(recordId);
    }).catch(function (err) { });
}