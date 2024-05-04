
app.controller("PaymentOptionController", function ($scope, $compile) {
    $scope.PaymentOption = {
        Search: "",
        Active: ""
        //Status: ""
    };
    $scope.PaymentOptionFetch = function () {
        $("#tblPaymentOption").dataTable().fnDestroy();
        PaymentOptionBindGrid();
    }
    //function PreBinds() {
    //    Get("/Generic/ActiveStatusList", true).then(function (result) {
    //        $scope.ActiveStatus = result.Data.ActiveStatus;
    //        $scope.$apply();
    //    });
    //}
    PaymentOptionBindGrid();
    function PaymentOptionBindGrid() {
        $("#tblPaymentOption").advancedDataTable({
            url: "/PaymentOptions/Fetch",
            postData: $scope.PaymentOption,
            bindingData: [
                {
                    "render": function (data, type, row) {
                        return '<span title="' + row.BankName + '">' + row.BankName + '</span>';
                    },
                },
                { "data": "PaymentType" },
                { "data": "AccountTitle" },
                { "data": "AccountNumber" },
                { "data": "BranchCode" },
                {
                    "render": function (data, type, row) {
                        return Label(row.IsActive, true);
                    },
                },
                
                {
                    "render": function (data, type, row) {
                        var editer = "No Action";
                        editer = ` <li>
										<a href= "/PaymentOptions/Setup/?Code=`+ row.Code + `" ><i class ="ti-pencil"></i> Edit</a>
										</li>
										<li>
										<a href="javascript: void(0);" onClick= "DeletePaymentOption('` + row.Code + `')" ><i class ="ti-trash"></i> Delete</a>
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
                "aTargets": [1, 5]
            }]
        });
    }

    $scope.DeletePaymentOption= function (recordId) {
        Get("/PaymentOptions/Delete?code=" + recordId).then(function (d) {
            if (d.Success)
                $scope.PaymentOptionFetch()
            ShowMessage(d)
        });
        //$scope.apply();
    }
});

//Jquery Functions
function DeletePaymentOption(recordId) {
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
        angular.element(document.getElementById('DivPaymentOptiontManagement')).scope().DeletePaymentOption(recordId);
    }).catch(function (err) { });
}