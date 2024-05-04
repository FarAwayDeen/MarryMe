
app.controller("StatesController", function ($scope, $compile) {
    $scope.States = {
        Search: "",
        Active: ""
        //Status: ""
    };
    $scope.StatesFetch = function () {
        $("#tblStates").dataTable().fnDestroy();
        StatesBindGrid();
    }
    //function PreBinds() {
    //    Get("/Generic/ActiveStatusList", true).then(function (result) {
    //        $scope.ActiveStatus = result.Data.ActiveStatus;
    //        $scope.$apply();
    //    });
    //}
    StatesBindGrid();
    function StatesBindGrid() {
        $("#tblStates").advancedDataTable({
            url: "/Location/FetchStates",
            postData: $scope.States,
            bindingData: [
                {
                    "render": function (data, type, row) {
                        return '<span title="' + row.State + '">' + row.State + '</span>';
                    },
                },
                { "data": "Country" },
                {
                    "render": function (data, type, row) {
                        var editer = "No Action";
                        editer = ` <li>
										<a href= "/Location/SetupStates?Code=`+ row.Code + `" ><i class ="ti-pencil"></i> Edit</a>
										</li>
										<li>
										<a href="javascript: void(0);" onClick= "DeleteStates('` + row.Code + `')" ><i class ="ti-trash"></i> Delete</a>
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

    $scope.DeleteStates = function (recordId) {
        Get("/Location/DeleteStates?code=" + recordId).then(function (d) {
            if (d.Success)
                $scope.StatesFetch()
            ShowMessage(d)
        });
        //$scope.apply();
    }
});

//Jquery Functions
function DeleteStates(recordId) {
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
        angular.element(document.getElementById('DivStates')).scope().DeleteStates(recordId);
    }).catch(function (err) { });
}