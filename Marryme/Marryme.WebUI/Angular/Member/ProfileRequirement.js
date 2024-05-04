app.controller("ProfileRequirementController", function ($scope, $compile) {
    $scope.Model = {
        EducationLevels: [],
        MaritalStatus: [],
        PhysicalStatus: [],
        BodyType: [],
        Complexion: [],
        FamilyValue: [],
        FamilyType: [],
        FamilyStatus: [],
        Religion: [],
        Others: [],
        Employment: [],
        Sect: [],
        SelectedCountry: "",
        SelectedState: "",
        SelectedCity: ""
    };
    $scope.SelectedCategory = {
    };
    $scope.States = [];
    $scope.Cities = [];
    $scope.SelectedCountry = [];
    $scope.SelectedState = [];
    $scope.SelectedCity = [];

    $scope.EnumName = Object.keys($scope.Model);
    BindAllOpetions();
    function BindAllOpetions() {
        angular.forEach($scope.EnumName, (item) => {
            Get("/Generic/FetchOptions?type=" + item).then(function (result) {
                $scope.Model[item] = result.Data;
                $scope.$apply();
                //console.log($scope.Model[item]);
            });
        });
        setTimeout(function () {
            FetcSelectedCategory();
        }, 5000);
    }
    //#reigon for Partener Categories-------------------
    $scope.SavePartnerAllCatgory = function () {
        console.log($scope.Model);
        console.log("selectd models");
        console.log($scope.Model.SelectedCountry);
        console.log($scope.Model.SelectedState);
        console.log($scope.Model.SelectedCity);
        $.ajax({
            type: "POST",
            url: "/Member/SavePartnerStatusAndEducation",
            data: JSON.stringify($scope.Model),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {
                ShowMessage(r);
            }
        });
    }
    var selectedIds = [];
    function FetcSelectedCategory() {
        Get("/Member/FetchSelectedCategories").then(function (result) {
            /* $scope.SelectedCategory = result.Data;*/
            selectedIds = result.Data;
            checkBoxesChecked();
            console.log(selectedIds);
        });
    }
    function checkBoxesChecked() {
        angular.forEach($scope.EnumName, function (modelName) {
            angular.forEach($scope.Model[modelName], function (item) {
                if (selectedIds.indexOf(item.ID) > -1) {
                    item.Status = true;
                    $scope.$apply();
                }
                // console.log(item);
            });
        });
    }
    var studentSelect = $('#ddCountry');
    var  States, Cities
    function FetchPreferredLocation() {
        Get("/Member/FetchPreferredLocation").then(function (result) {
            /* $scope.SelectedCategory = result.Data;*/
            $scope.Locations = result.Data;            
            //var Countries = JSON.parse("[" + $scope.Locations.Countries + "]");
            Countries = ($scope.Locations.Countries).split(",");            
            States = ($scope.Locations.States).split(",");
            Cities = ($scope.Locations.Cities).split(",");
            $('#ddCountry').val(Countries).trigger('change');
            bindStates(Countries);
            bindCities();           
        });
    }

    function bindStates(countries) {
        for (var i = 0; i < countries.length - 1; i++) {           
            $scope.BindStates(countries[i]);
        }
        setTimeout(function () {           
            $('#ddState').val(States).trigger('change');
        }, 3000);
    }
    function bindCities() {
        for (var i = 0; i < States.length; i++) {           
            $scope.BindCities(States[i]);
        }
        setTimeout(function () {            
            $('#ddCity').val(Cities).trigger('change');
        }, 3000);
    }
    PreBindCountryLivingIn();
    function PreBindCountryLivingIn() {
        Get("/Generic/PreBindCountryLivingIn", true).then(function (result) {
            $scope.CoutriesLivingInList = result.Data.countryLivingInList;
            $scope.$apply();
            FetchPreferredLocation();
            // console.log($scope.CoutriesLivingInList);
        });
    }

    $scope.BindStates = function (CountryId, callback) {
        if (typeof CountryId != undefined) {
            Post("/Generic/PreBindStates", { countryId: CountryId }, true).then(function (result) {
                // console.log($scope.States);
                if ($scope.States.length === 0) {
                    $scope.States = result.Data.statesList;
                    $scope.$apply();
                } else {
                    //  console.log(result.Data.statesList);
                    for (var i = 0; i < result.Data.statesList.length; i++) {
                        $scope.States.push(result.Data.statesList[i]);
                    }
                    $scope.$apply();
                }
                //console.log($scope.States);
                //if ($scope.Location.StateId != null && $scope.Location.StateId != "") {
                //    BindCities($scope.Location.StateId);
                //}
            });
        }
    }
    $scope.removeStates = function (countryID) {
        //console.log(countryID + "Country ID");
        //console.log($scope.States);
        //console.log(prevCountryArray);
        //var item = $scope.States.find(item => item.CountryID === countryID);
        //console.log(item);
        var newArray = $scope.States.filter(function (el) {
            return el.CountryID !== countryID
        });
        $scope.States = newArray;
        $scope.$apply();
        //$scope.removeCities(item.StateID);
    };
    $scope.removeCities = function (stateID) {
        //console.log(stateID+"third step");
        var newArray = $scope.Cities.filter(function (el) {
            return el.StateID !== stateID
        });
        // console.log(newArray);       
        $scope.Cities = newArray;
        $scope.$apply();
        //console.log($scope.States);
    };

    let preArray = $("#ddCountry").val();
    $("#ddCountry").change(function () {
        let result = [];
        let removedId = 0;
        let newId = 0;
        for (var i = 0; i < preArray.length; i++) {
            if ($.inArray(preArray[i], $(this).val()) == -1) {
                removedId = preArray[i];
            }
        }
        //console.log(removedId);
        //console.log(preArray);
        result = $(this).val();
        $scope.Model.SelectedCountry = result + "";
        //console.log(result);
        for (var i = 0; i < result.length; i++) {
            if ($.inArray(result[i], preArray) == -1) {
                newId = result[i];
            }
        }
        if (removedId > 0) {
            $scope.removeStates(parseInt(removedId));
            ///if (preVStateId !== null && result.length > 0) {
            //}
            preArray = result;
        } else if (newId > 0) {
            preArray = result;
            /*let currentStateId = (result[result.length - 1]);*/
            //console.log(newId);
            /* if (currentStateId != null)*/
            $scope.BindStates(newId);
        }
        // console.log(result); // Previous arry value to console
    });
    $scope.BindCities = function (stateId) {
        if (typeof stateId !== undefined) {
            Post("/Generic/PreBindCities", { stateId: stateId }, true).then(function (result) {
                if ($scope.Cities.length === 0) {
                    $scope.Cities = result.Data.citiesList;
                    $scope.$apply();
                    // console.log($scope.Cities);
                } else {
                    // console.log($scope.Cities);
                    for (var i = 0; i < result.Data.citiesList.length; i++) {
                        $scope.Cities.push(result.Data.citiesList[i]);
                    }
                    $scope.$apply();
                }
                // console.log($scope.Cities);
                //if ($scope.Location.StateId != null && $scope.Location.StateId != "") {
                //    BindCities($scope.Location.StateId);
                //}
            });
        }

    }

    let prevStateArray = $("#ddState").val();
    $("#ddState").change(function () {
        let result = [];
        let removedId = 0;
        let newId = 0;
        for (var i = 0; i < prevStateArray.length; i++) {
            if ($.inArray(prevStateArray[i], $(this).val()) == -1) {
                removedId = prevStateArray[i];
            }
        }
        //console.log('PrevArry');
        //console.log(preArray);
        //console.log($(this).val());

        //console.log('prev Array')
        //console.log(prevStateArray)
        result = $(this).val();
        $scope.Model.SelectedState = result + "";
        // console.log('new Array')
        // console.log(result);
        for (var i = 0; i < result.length; i++) {
            if ($.inArray(result[i], prevStateArray) == -1) {
                newId = result[i];
            }
        }
        if (removedId > 0) {
            $scope.removeCities(parseInt(removedId));
            prevCountryArray = result;
        } else if (newId > 0) {
            // console.log("else block")
            prevStateArray = result;
            /*let currentId = (result[result.length - 1]);*/
            //console.log(newId);
            //if (currentId != null)
            $scope.BindCities(newId);
        }
        // console.log(result); // Previous arry value to console
    });
    $("#ddCity").change(function () {
        var result = $(this).val();
        // console.log("cities"); // output value to console
        // console.log(result); // output value to console
        $scope.Model.SelectedCity = result + "";
    });
});