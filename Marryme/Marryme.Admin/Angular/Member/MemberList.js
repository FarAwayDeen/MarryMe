
app.controller("MemberListController", function ($scope, $compile) {
    $scope.MemberList = {
        Search: "",
        Active: ""
        //Status: ""
    };
    $scope.MemberListFetch = function () {
        $("#tblMemberList").dataTable().fnDestroy();
        MemberListBindGrid();
    }

    MemberListBindGrid();
    function MemberListBindGrid() {
        $("#tblMemberList").advancedDataTable({
            url: "/Member/Fetch",
            postData: $scope.MemberList,
            bindingData: [
                {
                    "render": function (data, type, row) {
                        return '<span title="' + row.Name + '">' + row.Name + '</span>';
                    },
                },
                { "data": "Email" },
                { "data": "Gender" },
                {
                    "render": function (data, type, row) {
                        return row.HighestEducation||"N/A";
                    },
                },
                { "data": "Religion" },
                {
                    "render": function (data, type, row) {
                        var editer = "No Action";
                        console.log(row);
                        editer = row.IsActive ?
                            ` <li> <a href="javascript: void(0);" onClick="ChangeStatus('` + row.Code + `','` + row.IsActive + `')" ><i class="ti-thumb-down"></i> Block</a> </li>`
                            : `<li> <a href="javascript: void(0);" onClick="ChangeStatus('` + row.Code + `','` + row.IsActive + `')" > <i class="ti-thumb-up"></i>UnBlock</a> </li>`;

                        return `<div class="dropdown"><i class="fa fa-chevron-down dropdown-toggle" data-toggle="dropdown"></i><ul class="dropdown-menu"><li> <a href="/Members/Detail?Code=` + row.Code + `" > <i class="ti-tick"></i>View</a> </li>` + editer + `</ul></div>`;
                    },
                    "className": "dropdown"
                }
            ],
            createdRow: function (row, data, dataIndex) {
            },
            disableSorting: [{
                "bSortable": false,
                "aTargets": [1,2,3, 4,5]
            }]
        });
    }

    $scope.ChangeStatus = function (recordId, todo) {
        console.log(recordId, todo);
        Get("/Members/ActiveInActive?code=" + recordId + "&IsDoActive=" + todo).then(function (d) {
            if (d.Success)
                $scope.MemberListFetch();
            ShowMessage(d)
        });
        //$scope.apply();
    }
});
function ChangeStatus(recordId, todo) {

    angular.element(document.getElementById('DivMemberList')).scope().ChangeStatus(recordId, todo);
}