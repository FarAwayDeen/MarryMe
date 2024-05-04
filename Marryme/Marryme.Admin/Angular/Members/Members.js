
app.controller("MembersController", function ($scope, $compile) {
    $scope.Members = {
        Search: "",
        Active: ""
        //Status: ""
    };
    $scope.MembersFetch = function () {
        $("#tblMembers").dataTable().fnDestroy();
        MembersBindGrid();
    }

    MembersBindGrid();
    function MembersBindGrid() {
        $("#tblMembers").advancedDataTable({
            url: "/Members/Fetch",
            postData: $scope.Members,
            bindingData: [
                {
                    "render": function (data, type, row) {
                        return '<span title="' + row.MemberName + '">' + row.MemberName + '</span>';
                    },
                },
                { "data": "Email" },
                { "data": "Gender" },
                { "data": "LookingFor" },
                {
                    "render": function (data, type, row) {
                        return Label(row.IsActive, true);
                    },
                },
                {
                    "render": function (data, type, row) {
                        return '<span class="text-capitalize">' + row.Subcast + '</span>';
                    },
                },
                {
                    "render": function (data, type, row) {
                        var editer = "No Action";
                        editer = row.IsActive ?
                            ` <li> <a href="javascript: void(0);" onClick="ChangeStatus('` + row.Code + `','` + row.IsActive + `')" ><i class="ti-thumb-down"></i> Block</a> </li>`
                            : `<li> <a href="javascript: void(0);" onClick="ChangeStatus('` + row.Code + `','` + row.IsActive + `')" > <i class="ti-thumb-up"></i>Active</a> </li>`;

                        return `<div class="dropdown"><i class="fa fa-chevron-down dropdown-toggle" data-toggle="dropdown"></i><ul class="dropdown-menu"><li> <a href="/Members/Detail?Code=` + row.Code + `" > <i class="ti-tick"></i>View</a> </li>` + editer + `</ul></div>`;
                    },
                    "className": "dropdown"
                }
            ],
            createdRow: function (row, data, dataIndex) {
            },
            disableSorting: [{
                "bSortable": false,
                "aTargets": [0, 1, 2, 3, 4, 5, 6]
            }]
        });
    }

    //$scope.DeletePaymentOption= function (recordId) {
    //    Get("/PaymentOptions/Delete?code=" + recordId).then(function (d) {
    //        if (d.Success)
    //            $scope.ContactUsFetch()
    //        ShowMessage(d)
    //    });
    //    //$scope.apply();
    //}

    $scope.ChangeStatus = function (recordId, todo) {
        console.log(recordId, todo);
        Get("/Members/ActiveInActive?code=" + recordId + "&IsDoActive=" + todo).then(function (d) {
            if (d.Success)
                $scope.MembersFetch();
            ShowMessage(d)
        });
        //$scope.apply();
    }
});

//Jquery Functions

//function DeletePaymentOption(recordId) {
//    swal({
//        title: 'Are you sure?',
//        text: 'You will not be able to revert this!',
//        type: 'warning',
//        showCancelButton: true,
//        confirmButtonColor: '#d33',
//        cancelButtonColor: '#3085d6',
//        confirmButtonText: 'Yes, delete it!',
//        cancelButtonText: 'No, cancel!',
//        confirmButtonClass: 'btn btn-success',
//        cancelButtonClass: 'btn btn-danger',
//        showLoaderOnConfirm: true
//    }).then(function () {
//        angular.element(document.getElementById('DivPaymentOptiontManagement')).scope().DeletePaymentOption(recordId);
//    }).catch(function (err) { });
//}

//Jquery Functions
function ChangeStatus(recordId, todo) {

    angular.element(document.getElementById('DivMembers')).scope().ChangeStatus(recordId,todo);
}