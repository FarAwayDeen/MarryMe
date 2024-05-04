
app.controller("PageContentsController", function ($scope, $compile) {
    $scope.PageContents = {
        Search: "",
        Active: ""
        //Status: ""
    };
    $scope.PageContentsFetch = function () {
        $("#tblPageContents").dataTable().fnDestroy();
        PageContentsBindGrid();
    }
    //function PreBinds() {
    //    Get("/Generic/ActiveStatusList", true).then(function (result) {
    //        $scope.ActiveStatus = result.Data.ActiveStatus;
    //        $scope.$apply();
    //    });
    //}
    PageContentsBindGrid();
    function PageContentsBindGrid() {
        $("#tblPageContents").advancedDataTable({
            url: "/PageContent/Fetch",
            postData: $scope.PageContents,
            bindingData: [
                {
                    "render": function (data, type, row) {
                        return '<span title="' + row.PageName + '">' + row.PageName + '</span>';
                    },
                },
                { "data": "PageUrl" },
                {
                    "render": function (data, type, row) {
                        return Label(row.IsActive, true);
                    },
                },
                { "data": "PageDescription" },
                {
                    "render": function (data, type, row) {
                        var editer = "No Action";
                        editer = ` <li>
										<a href= "/PageContent/Index?Code=`+ row.Code + `" ><i class ="ti-pencil"></i> Edit</a>
										</li>
										<li>
										<a href="javascript: void(0);" onClick= "DeletePageContent('` + row.Code + `')" ><i class ="ti-trash"></i> Delete</a>
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
                "aTargets": [1, 3]
            }]
        });
    }

    $scope.DeletePageContent = function (recordId) {
        Get("/PageContent/Delete?code=" + recordId).then(function (d) {
            if (d.Success)
                $scope.PageContentsFetch()
            ShowMessage(d)
        });
        //$scope.apply();
    }
});

//Jquery Functions
function DeletePageContent(recordId) {
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
        angular.element(document.getElementById('DivPageContentManagement')).scope().DeletePageContent(recordId);
    }).catch(function (err) { });
}