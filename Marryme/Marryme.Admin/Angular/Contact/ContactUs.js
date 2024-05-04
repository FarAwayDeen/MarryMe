
app.controller("ContactUsController", function ($scope, $compile) {
    $scope.ContactUs = {
        Search: "",
        Active: ""
        //Status: ""
    };
    $scope.ContactUsFetch = function () {
        $("#tblContactUs").dataTable().fnDestroy();
        ContactUsBindGrid();
    }

    ContactUsBindGrid();
    function ContactUsBindGrid() {
        $("#tblContactUs").advancedDataTable({
            url: "/ContactUs/Fetch",
            postData: $scope.ContactUs,
            bindingData: [
                {
                    "render": function (data, type, row) {
                        return '<span title="' + row.Name + '">' + row.Name + '</span>';
                    },
                },
                { "data": "Email" },
                { "data": "Subject" },
                { "data": "Message" },

                {
                    "render": function (data, type, row) {
                        var editer = "No Action";
                        editer = ` <li>
										<a href="javascript: void(0);" onClick= "ViewDetail('` + row.Code + `')"   ><i class ="ti-eye"></i> View Detail</a>
										</li>
										<li>
										<a href="javascript: void(0);" onClick= "DeleteContact('` + row.Code + `')" ><i class ="ti-trash"></i> Delete</a>
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

    $scope.ViewDetail = function (Code){
        Post('/ContactUs/GetById', { code: Code }).then(function (result) {
            if (result.Success) {
                $scope.ContactUs.Id = result.Data.Id;
                $scope.ContactUs.Name = result.Data.Name;
                $scope.ContactUs.Email = result.Data.Email;
                $scope.ContactUs.Subject = result.Data.Subject;
                $scope.ContactUs.Message = result.Data.Message;
                console.log(result);
                $scope.$apply();
            }
        });
    }

    $scope.DeleteContact = function (recordId) {
        Get("/ContactUs/Delete?code=" + recordId).then(function (d) {
            if (d.Success)
                $scope.ContactUsFetch()
            ShowMessage(d)
        });
        //$scope.apply();
    }
});

//Jquery Functions

function DeleteContact(recordId) {
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
        angular.element(document.getElementById('DivContactUs')).scope().DeleteContact(recordId);
    }).catch(function (err) { });

}
function ViewDetail(Code) {
    angular.element(document.getElementById('DivContactUs')).scope().ViewDetail(Code);
    $("#contactUsModal").modal('show');
}
