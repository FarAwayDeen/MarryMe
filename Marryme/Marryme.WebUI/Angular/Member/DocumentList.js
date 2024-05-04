
app.controller("DocumentListController", function ($scope, $compile) {
    $scope.DocumentList = {
        Search: "",
        Active: ""
    };
    DocumentListTable();

    function DocumentListTable() {
        Get("/Member/DocumentListById", true).then(function (result) {
            $scope.Docs = result.Data;
            console.log($scope.Docs);
            $scope.$apply();
        });

        $scope.DeleteImage = function (DocTypeID) {
            console.log(DocTypeID);
            Get("/Member/DeleteImage?docId=" + DocTypeID).then(function (d) {
                if (d.Success)
                    RedirectDelay("/Member/DocumentList")
                ShowMessage(d)
            });
        }

        //$("#DocumentTable").advancedDataTable({
        //    url: "/Member/DocumentListById",
        //    postData: $scope.DocumentList,
        //    bindingData: [
        //        //{ "data": "UserName" },
        //        //{ "data": "AccountName" },
        //        //{ "data": "Amount" },
        //        //{
        //        //    "render": function (data, type, row) {
        //        //        return moment(row.PaymentDate).format('DD/MM/YYYY');
        //        //    },
        //        //},
        //        { "data": "DocName" },
        //        //{ "data": "FilePath" },
        //        {
        //            "render": function (data, type, row) {
        //                return '<img src="' + row.FilePath + '" style="width:50px">';
        //            },
        //        },

        //    ],
        //    createdRow: function (row, data, dataIndex) {
        //    },
        //    disableSorting: [{
        //        "bSortable": false,
        //        "aTargets": [0]
        //    }]
        //});
    }
    $scope.DetailUser = function (Code) {
        Get("/Payment/UserDetail?code=" + Code).then(function (result) {
            if (result.Success)
                console.log(result);
            $scope.user.Email = result.Data.Email;
            $scope.user.FullName = result.Data.FullName;
            $scope.user.PhoneNumber = result.Data.PhoneNumber;
            $scope.$apply();
            ShowMessage(result)
        });
    }
    $scope.AcceptRequest = function (Code) {
        console.log(Code);
        Get("/Payment/AcceptPayment?code=" + Code).then(function (result) {
            if (result.Success)
                ShowMessage(result)
            setTimeout(function () {
                window.location.href = "/Payment/WithDrawRequests";
            }, 1000);
        });
    }
    $scope.RejectRequest = function (Code) {
        console.log(Code);
        Get("/Payment/RejectPayment?code=" + Code).then(function (result) {
            if (result.Success)
                ShowMessage(result)
            setTimeout(function () {
                window.location.href = "/Payment/WithDrawRequests";
            }, 1000);
        });
    }
    $scope.Deletetoastr = function (DocTypeID) {
        DeleteImage(DocTypeID);
    }
});

//Jquery Functions
function DeleteImage(DocTypeID) {
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
        
        angular.element(document.getElementById('DocumentTable')).scope().DeleteImage(DocTypeID);
       
    });
}
function UserDetail(Code) {
    angular.element(document.getElementById('withDrawPaymentManagement')).scope().DetailUser(Code);
}
function AcceptRequest(Code) {
    swal({
        title: 'Are you sure you want to Accept it?',
        text: 'You will not be able to revert this!',
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#d33',
        cancelButtonColor: '#3085d6',
        confirmButtonText: 'Yes, Accept it!',
        cancelButtonText: 'No!',
        confirmButtonClass: 'btn btn-success',
        cancelButtonClass: 'btn btn-danger',
        showLoaderOnConfirm: true
    }).then(function () {
        angular.element(document.getElementById('withDrawPaymentManagement')).scope().AcceptRequest(Code);
    });
}
function RejectRequest(Code) {
    swal({
        title: 'Are you sure you want to Reject it?',
        text: 'You will not be able to revert this!',
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#d33',
        cancelButtonColor: '#3085d6',
        confirmButtonText: 'Yes, Reject it!',
        cancelButtonText: 'No!',
        confirmButtonClass: 'btn btn-success',
        cancelButtonClass: 'btn btn-danger',
        showLoaderOnConfirm: true
    }).then(function () {
        angular.element(document.getElementById('withDrawPaymentManagement')).scope().RejectRequest(Code);
    });
}

