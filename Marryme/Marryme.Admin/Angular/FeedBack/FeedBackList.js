
app.controller("FeedBackController", function ($scope, $compile) {
    $scope.FeedBack = {
        Search: "",
        Active: ""
        //Status: ""
    };
    $scope.FeedBackFetch = function () {
        $("#tblFeedBack").dataTable().fnDestroy();
        FeedBackBindGrid();
    }

    FeedBackBindGrid();
    function FeedBackBindGrid() {
        $("#tblFeedBack").advancedDataTable({
            url: "/FeedBack/Fetch",
            postData: $scope.FeedBack,
            bindingData: [
                {
                    "render": function (data, type, row) {
                        return '<span title="' + row.Name + '">' + row.Name + '</span>';
                    },
                },
                { "data": "Email" },
                { "data": "Designation" },
                { "data": "Message" },
                //{
                //    "render": function (data, type, row) {
                //        return Label(row.IsActive, true);
                //    },
                //},
                {
                    "render": function (data, type, row) {
                        return LabelYesNo(row.IsApproved);
                    },
                },
                {
                    "render": function (data, type, row) {
                        var editer = "No Action";
                        editer = row.IsApproved == true ?
                            ` <li> <a href="javascript: void(0);" onClick="ChangeStatus('` + row.Code + `')" ><i class="ti-thumb-down"></i> Reject</a> </li>`
                            : `<li> <a href="javascript: void(0);" onClick="ChangeStatus('` + row.Code + `')" > <i class="ti-thumb-up"></i>Approve</a> </li>`;

                        return `<div class="dropdown"><i class="fa fa-chevron-down dropdown-toggle" data-toggle="dropdown"></i><ul class="dropdown-menu">` + editer + `</ul></div>`;
                    },
                    "className": "dropdown"
                },
                 {
                    "render": function (data, type, row) {
                        var editer = "No Action";
                        editer = ` <li>
										<a href= "javascript: void(0);" onClick= "ViewDetail('` + row.Code + `')" ><i class ="ti-eye"></i> View Detail</a>
										</li>
										<li>
										<a href="javascript: void(0);" onClick= "DeleteFeedBack('` + row.Code + `')" ><i class ="ti-trash"></i> Delete</a>
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
                "aTargets": [1, 6]
            }]
        });
    }

    $scope.ViewDetail = function (Code) {
        Post('/FeedBack/GetById', { code: Code }).then(function (result) {
            if (result.Success) {
                $scope.FeedBack.Id = result.Data.Id;
                $scope.FeedBack.Name = result.Data.Name;
                $scope.FeedBack.Email = result.Data.Email;
                $scope.FeedBack.Designation = result.Data.Designation;
                $scope.FeedBack.Message = result.Data.Message;
                $scope.FeedBack.IsApproved = result.Data.IsApproved;
                console.log(result);
                $scope.$apply();
            }
        });
    }

    $scope.DeleteFeedBack= function (recordId) {
        Get("/FeedBack/Delete?code=" + recordId).then(function (d) {
            if (d.Success)
                $scope.FeedBackFetch()
            ShowMessage(d)
        });
        //$scope.apply();
    }

    $scope.ChangeStatus = function (recordId) {
        Get("/FeedBack/UpdateStatus?code=" + recordId).then(function (d) {
            if (d.Success)
                $scope.FeedBackFetch();
            ShowMessage(d)
        });
        //$scope.apply();
    }
});

//Jquery Functions

function DeleteFeedBack(recordId) {
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
        angular.element(document.getElementById('DivFeedBack')).scope().DeleteFeedBack(recordId);
    }).catch(function (err) { });
}

//Jquery Functions
function ChangeStatus(recordId) {
    angular.element(document.getElementById('DivFeedBack')).scope().ChangeStatus(recordId);
}
function ViewDetail(Code) {
    angular.element(document.getElementById('DivFeedBack')).scope().ViewDetail(Code);
    $("#feedBackModal").modal('show');
}