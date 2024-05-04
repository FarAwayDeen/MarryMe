app.controller("MyMatchesListController", function ($scope, $compile) {
    $scope.MemberList = {
        Search: "",
        Gender: "",
        Country: "",
        Relegion: 0,
        MaritalStatus: "",
    };
    $scope.EncodedZero = "AQAAAB%2bLCAAAAAAABAAzAAAh39v0AQAAAA%3d%3d";
    ClearFields();
    function ClearFields() {
        /*$scope.MemberList.Country = "AQAAAB%2bLCAAAAAAABAAzAAAh39v0AQAAAA%3d%3d";*/
        $scope.MemberList.Relegion = "AQAAAB%2bLCAAAAAAABAAzAAAh39v0AQAAAA%3d%3d";
    }
    $scope.Members = [];

    $scope.maxsize = 3;

    $scope.totalcount = 0;

    $scope.pageIndex = 1;

    $scope.pageSize = "10";

    $scope.registerlist = function () {      
        $.ajax({
            url: "/Member/PreBindMyMatches?pageindex=" + $scope.pageIndex + "&pagesize=" + $scope.pageSize,
            type: "post", 
            data: $scope.MemberList,
            success: function (result) {
                console.log(result);
                if (result.Success) {

                    $scope.BestMatches = result.Data.MemberList;
                    console.log($scope.BestMatches);
                    $scope.totalcount = result.Data.totalcount
                    $scope.$apply();
                }
                else {
                    $scope.BestMatches = [];
                    $scope.$apply();
                }
            },           
        });
        //Get("/Member/PreBindMyMatches?pageindex=" + $scope.pageIndex + "&pagesize=" + $scope.pageSize
        //    + "&prams=" + JSON.stringify($scope.MemberList) , true).then(function (result) {
        //    console.log(result);
        //    if (result.Success) {

        //        $scope.BestMatches = result.Data.MemberList;
        //        console.log($scope.BestMatches);
        //        $scope.totalcount = result.Data.totalcount
        //        $scope.$apply();
        //    }
        //    else {
        //        $scope.BestMatches = [];
        //        $scope.$apply();
        //    }
        //});
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
            Country: "",
            Relegion: 0,
            MaritalStatus: "",
        }
    }
    PreBindBestMatches();
    function PreBindBestMatches() {
        Get("/Member/PreBindBestMatches", true).then(function (result) {
            $scope.BestMatches = result.Data.MemberList;
            //console.log($scope.BestMatches);
            $scope.$apply();
        });
    }

    PreBindLanguages();
    function PreBindLanguages() {
        Get("/Generic/PreBindLanguages", true).then(function (result) {
            $scope.Languages = result.Data.LanguagesList;
            //console.log($scope.Languages);
            $scope.$apply();
        });
    }
    PreBindComplexion();
    function PreBindComplexion() {
        Get("/Generic/FetchOptions?type=Complexion", true).then(function (result) {
            $scope.ComplexionList = result.Data;
            $scope.$apply();
        });
    }
    PreBindEducation();
    function PreBindEducation() {
        Get("/Generic/FetchOptions?type=EducationLevels", true).then(function (result) {
            $scope.EducationList = result.Data;
            $scope.$apply();
        });
    }
    PreBindEmployedIn();
    function PreBindEmployedIn() {
        Get("/Generic/FetchOptions?type=Employment", true).then(function (result) {
            $scope.EmployeedInList = result.Data;
            $scope.$apply($scope.EmployeedInList);
        });
    }
    PreBindFamilyValue();
    function PreBindFamilyValue() {
        Get("/Generic/FetchOptions?type=FamilyValue", true).then(function (result) {
            $scope.FamilyValueList = result.Data;
            $scope.$apply();
            //console.log($scope.FamilyValueList);
        });
    }
    PreBindPhysicalStatus();
    function PreBindPhysicalStatus() {
        Get("/Generic/FetchOptions?type=PhysicalStatus", true).then(function (result) {
            $scope.PhysicalStatusList = result.Data;
            $scope.$apply();
        });
    }
    PreBindBodyType();
    function PreBindBodyType() {
        Get("/Generic/FetchOptions?type=BodyType", true).then(function (result) {
            $scope.BodyTypeList = result.Data;
            $scope.$apply();
            //console.log($scope.BodyTypeList);
        });
    }
    PreBindFamilyStatus();
    function PreBindFamilyStatus() {
        Get("/Generic/FetchOptions?type=FamilyStatus", true).then(function (result) {
            $scope.FamilyStatusList = result.Data;
            $scope.$apply();
            //console.log($scope.FamilyStatusList);
        });
    }
    PreBindHeight();
    function PreBindHeight() {
        Get("/Generic/PreBindHeight", true).then(function (result) {
            $scope.Heights = result.Data.HeightList;
            //console.log($scope.Heights);
            $scope.$apply();
        });
    }
    PreBindAge();
    function PreBindAge() {
        Get("/Generic/PreBindAge", true).then(function (result) {
            $scope.AgeList = result.Data.AgeList;
            // console.log($scope.AgeList);
            $scope.$apply();
        });
    }
    PreBindWeight();
    function PreBindWeight() {
        Get("/Generic/PreBindWeight", true).then(function (result) {
            $scope.Weights = result.Data.WeightList;
            //console.log($scope.Weights);
            $scope.$apply();
        });
    }
    PreBindNoOfChild();
    function PreBindNoOfChild() {
        Get("/Generic/PreBindNoOfChild", true).then(function (result) {
            $scope.NoOfChildrenList = result.Data.ChildList;
            //console.log($scope.NoOfChildrenList);
            $scope.$apply();
        });
    }
    PreBindCountry();
    function PreBindCountry() {
        Get("/Generic/PreBindCountries", true).then(function (result) {
            $scope.Coutries = result.Data.countryList;
            $scope.$apply();
        });
    }
    function PreBindStates(CountryId) {
        Post("/Generic/PreBindStates", { countryId: CountryId }, true).then(function (result) {
            $scope.States = result.Data.statesList;
            if ($scope.MemberList.StateTypeCode != null && $scope.MemberList.StateTypeCode != "") {
                PreBindCities($scope.MemberList.StateTypeCode);
            }
            $scope.$apply();
        });
    }
    function PreBindCities(stateId) {
        Post("/Generic/PreBindCities", { stateId: stateId }, true).then(function (result) {
            if (result.Data != null) {
                $scope.Cities = result.Data.citiesList;
                $scope.$apply();
            }
        });
    }
    $scope.BindCities = function () {
        PreBindCities($scope.MemberList.StateTypeCode);
    }
    $scope.BindState = function () {
        PreBindStates($scope.MemberList.Country);
        //PreBindStatesForEncode($scope.LocationInfo.CountryLivingInTypeCode);
    }
    PreBindReligion();
    function PreBindReligion() {
        Get("/Generic/FetchOptions?type=Sect", true).then(function (result) {
            $scope.Sects = result.Data;
            //console.log(Sects);
            $scope.$apply();
        });
    }
    PreBindMaritalStatus();
    function PreBindMaritalStatus() {
        Get("/Generic/FetchOptions?type=MaritalStatus", true).then(function (result) {
            $scope.MaritalStatusList = result.Data;
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
            // $scope.registerlist();
            $scope.$apply();
        });
    }
});