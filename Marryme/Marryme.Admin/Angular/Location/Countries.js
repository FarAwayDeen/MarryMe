
app.controller("CountryController", function ($scope, $compile) {
    $scope.Country = {
        Search: "",
        Active: ""
        //Status: ""
    };
    $scope.CountriesFetch = function () {
        $("#tblCountry").dataTable().fnDestroy();
        CountryBindGrid();
    }
    //function PreBinds() {
    //    Get("/Generic/ActiveStatusList", true).then(function (result) {
    //        $scope.ActiveStatus = result.Data.ActiveStatus;
    //        $scope.$apply();
    //    });
    //}
    CountryBindGrid();
    function CountryBindGrid() {
        $("#tblCountry").advancedDataTable({
            url: "/Location/FetchCountries",
            postData: $scope.Country,
            bindingData: [
                {
                    "render": function (data, type, row) {
                        return '<span title="' + row.Name + '">' + row.Name + '</span>';
                    },
                },
                { "data": "ISO" },
                {
                    "render": function (data, type, row) {
                        var editer = "No Action";
                        editer = ` <li>
										<a href= "/Location/SetupCountry?Code=`+ row.Code + `" ><i class ="ti-pencil"></i> Edit</a>
										</li>
										<li>
										<a href="javascript: void(0);" onClick= "DeleteCountry('` + row.Code + `')" ><i class ="ti-trash"></i> Delete</a>
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
                "aTargets": [1,1]
            }]
        });
    }

    $scope.DeleteCountry = function (recordId) {
        Get("/Location/DeleteCountry?code=" + recordId).then(function (d) {
            if (d.Success)
                $scope.CountriesFetch()
            ShowMessage(d)
        });
        //$scope.apply();
    }
});

//Jquery Functions
function DeleteCountry(recordId) {
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
        angular.element(document.getElementById('DivCountry')).scope().DeleteCountry(recordId);
    }).catch(function (err) { });
}