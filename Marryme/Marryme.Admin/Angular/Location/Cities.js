
app.controller("CitiesController", function ($scope, $compile) {
    $scope.City = {
        Search: "",
        Active: ""
        //Status: ""
    };
    $scope.CitiesFetch = function () {
        $("#tblCities").dataTable().fnDestroy();
        CitiesBindGrid();
    }
    //function PreBinds() {
    //    Get("/Generic/ActiveStatusList", true).then(function (result) {
    //        $scope.ActiveStatus = result.Data.ActiveStatus;
    //        $scope.$apply();
    //    });
    //}
    CitiesBindGrid();
    function CitiesBindGrid() {
        $("#tblCities").advancedDataTable({
            url: "/Location/FetchCities",
            postData: $scope.City,
            bindingData: [
                {
                    "render": function (data, type, row) {
                        return '<span title="' + row.CountryName + '">' + row.CountryName + '</span>';
                    },
                },
                { "data": "StateName" },
                { "data": "CityName" },
                {
                    "render": function (data, type, row) {
                        var editer = "No Action";
                        editer = ` <li>
										<a href= "/Location/SetupCity?Code=`+ row.Code + `" ><i class ="ti-pencil"></i> Edit</a>
										</li>
										<li>
										<a href="javascript: void(0);" onClick= "DeleteCity('` + row.Code + `')" ><i class ="ti-trash"></i> Delete</a>
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
                "aTargets": [1, 1]
            }]
        });
    }

    $scope.DeleteCity = function (recordId) {
        Get("/Location/DeleteCity?code=" + recordId).then(function (d) {
            if (d.Success)
                $scope.CitiesFetch()
            ShowMessage(d)
        });
        //$scope.apply();
    }
});

//Jquery Functions
function DeleteCity(recordId) {
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
        angular.element(document.getElementById('DivCities')).scope().DeleteCity(recordId);
    }).catch(function (err) { });
}