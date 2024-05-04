
app.controller("ConfirmPaymentController", function ($scope, $compile) {
    $scope.ConfirmPayment = {
        Search: "",
        Active: ""
        //Status: ""
    };
    $scope.ConfirmPaymentFetch = function () {
        $("#tblConfirmPayment").dataTable().fnDestroy();
        ConfirmPaymentBindGrid();
    }

    ConfirmPaymentBindGrid();
    function ConfirmPaymentBindGrid() {
        $("#tblConfirmPayment").advancedDataTable({
            url: "/MemberSubscription/FetchConfirmPayments",
            postData: $scope.ConfirmPayment,
            bindingData: [
                { "data": "MemberEmail" },
                { "data": "MemberName" },
                {
                    "render": function (data, type, row) {
                        return '<span title="' + row.BankName + '">' + row.BankName + '</span>';
                    },
                },
                { "data": "PackageName" },
                { "data": "PaymentType" },
                { "data": "StrDateTime" },
                { "data": "PaymentAmount" },
                {
                    "render": function (data, type, row) {
                        console.log(row);
                        return '<a href="' + row.DepositSlip + '" class="btn btn-primary" download target="_blank">Preview</a>';
                    },
                },
                { "data": "Status" },
                {
                    "render": function (data, type, row) {
                        var editer = "No Action";
                        editer = row.Status == 'Submitted' ?
                            ` 	<li>
										<a href="javascript: void(0);" onClick= "ApprovedConfirm(` + row.PackageSubscriptionId + `,'Approved')" ><i class ="ti-check-box"></i> Approve</a>
										</li>
                                	<li>
										<a href="javascript: void(0);" onClick= "ApprovedConfirm(` + row.PackageSubscriptionId + `,'Rejected')" ><i class ="ti-close"></i> Reject</a>
										</li>`
                            :
                            row.Status == 'Approved' ?
                                ` 	<li>
										<a href="javascript: void(0);" onClick= "ApprovedConfirm(` + row.PackageSubscriptionId + `,'Rejected')" ><i class ="ti-close"></i> Reject</a>
										</li>`
                                :
                                ` 	<li>
										<a href="javascript: void(0);" onClick= "ApprovedConfirm(` + row.PackageSubscriptionId + `,'Approved')" ><i class ="ti-check-box"></i> Approve</a>
										</li>`
                            ;

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

    $scope.UpdatePaymentStatus = function (recordId, status) {
        Get("/MemberSubscription/UpdatePaymentStatus?packageSubscriptionId=" + recordId + "&status=" + status).then(function (d) {
            if (d.Success)
                $scope.ConfirmPaymentFetch()
            ShowMessage(d)
        });
        //$scope.apply();
    }
});

//Jquery Functions

function ApprovedConfirm(recordId, status) {
    swal({
        title: 'Are you sure?',
        text: 'You will not be able to revert this!',
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#d33',
        cancelButtonColor: '#3085d6',
        confirmButtonText: 'Yes, ' + status + ' it!',
        cancelButtonText: 'No, cancel!',
        confirmButtonClass: 'btn btn-success',
        cancelButtonClass: 'btn btn-danger',
        showLoaderOnConfirm: true
    }).then(function () {
        angular.element(document.getElementById('DivConfirmPayment')).scope().UpdatePaymentStatus(recordId, status);
    }).catch(function (err) { });

}

