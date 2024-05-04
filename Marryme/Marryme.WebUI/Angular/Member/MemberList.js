app.controller("MemberListController", function ($scope, $compile) {
    $scope.MemberList = {
        Search: "",
        Gender: "All",
        Country: 0,
        Relegion: 0,
        MaritalStatus: "",
    };
    $scope.EncodedZero = "AQAAAB%2bLCAAAAAAABAAzAAAh39v0AQAAAA%3d%3d";
    ClearFields();
    function ClearFields() {
        $scope.MemberList.Country = "AQAAAB%2bLCAAAAAAABAAzAAAh39v0AQAAAA%3d%3d";
        $scope.MemberList.Relegion = "AQAAAB%2bLCAAAAAAABAAzAAAh39v0AQAAAA%3d%3d";
    }
    $scope.Members = [];

    $scope.maxsize = 3;

    $scope.totalcount = 0;

    $scope.pageIndex = 1;

    $scope.pageSize = 8;

    $scope.registerlist = function () {
        Get("/Member/PreBindMemberList?pageindex=" + $scope.pageIndex + "&pagesize=" + $scope.pageSize + "&search=" + $scope.MemberList.Search + "&gender=" + $scope.MemberList.Gender + "&country=" + $scope.MemberList.Country + "&relegion=" + $scope.MemberList.Relegion + "&maritalStatus=" + $scope.MemberList.MaritalStatus, true).then(function (result) {
            //console.log(result);
            if (result.Success) {

                $scope.Members = result.Data.MemberList;

                $scope.totalcount = result.Data.totalcount
                $scope.$apply();
            }
            else {
                $scope.Members = [];
                $scope.$apply();
            }
        });
    }



    $scope.pagechanged = function () {

        $scope.registerlist();

    }

    $scope.changePageSize = function () {

        $scope.pageIndex = 1;

        $scope.registerlist();

    }
    $scope.initializedFilter = function () {
        ClearFields();
        $scope.MemberList = {
            Search: "",
            Gender: "All",
            Country: 0,
            Relegion: 0,
            MaritalStatus: "",
        }
    }

    PreBindCountry();
    function PreBindCountry() {
        Get("/Generic/PreBindCountries", true).then(function (result) {
            $scope.Coutries = result.Data.countryList;
            $scope.$apply();
        });
    }
    PreBindReligion();
    function PreBindReligion() {
        Get("/Generic/PreBindReligions", true).then(function (result) {
            $scope.Religions = result.Data.ReligionList;
            console.log(Religions);
            $scope.$apply();
        });
    }
    PreBindMaritalStatus();
    function PreBindMaritalStatus() {
        Get("/Generic/PreBindMaritalStatusForMaleFemale", true).then(function (result) {
            $scope.MaritalStatusList = result.Data.MaritalStatusMaleFemaleList;
            $scope.$apply();
        });
    }
    PreBindGender();
    function PreBindGender() {
        Get("/Generic/PreBindGender2", true).then(function (result) {
            $scope.GenderList = result.Data.Gender2List;
            $scope.$apply();
        });
    }
    FetchFieldPermissions();
    $scope.FieldPermissionMessage = 'Visible for paid Members';
    function FetchFieldPermissions() {
        Get("/Generic/FetchFieldPermissions", true).then(function (result) {
            $scope.FetchFieldPermissionList = result.Data;
            //     console.log($scope.FetchFieldPermissionList);
            $scope.registerlist();
            $scope.$apply();
        });
    }
});