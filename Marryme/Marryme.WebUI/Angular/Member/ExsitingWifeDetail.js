app.controller("ExsitingWifeDetailController", function ($scope, $compile) {
    $scope.WifeDetail = {
    };
    $scope.WifeKidsDetail = {
        Id: 0,
        Age: 0,
        Gender: "",
        Location: "",
        Status: ""
    };
    $scope.WifeKidsDetailList = [];
    $scope.EducationList = [];
    $scope.PartnerCategoryModel = [];
    //PersonalInfoDetailFetchById();
    PreBindExsitingWife();
    PreBindYear();
    PreBindReligion();
    PreBindTrueFalse();
    PreBindEducation();
    PreBindEducationLivingStatus()

    function PreBindYear() {
        Get("/Generic/PreBindYear", true).then(function (result) {
            $scope.Years = result.Data.YearList;
            $scope.$apply();
        });
    }
    function PreBindReligion() {
        Get("/Generic/PreBindReligions", true).then(function (result) {
            $scope.Religions = result.Data.ReligionList;
            //console.log($scope.Religions);
            $scope.$apply();
        });
    }
    function PreBindExsitingWife() {
        Get("/Generic/ExsitingWife", true).then(function (result) {
            $scope.ExsitingWife = result.Data.ExsitingWifeList;
            //console.log($scope.ExsitingWife);
            $scope.$apply();
        });
    }
    function PreBindTrueFalse() {
        Get("/Generic/TrueFalse", true).then(function (result) {
            $scope.TrueFalse = result.Data.TrueFalseList;
            //console.log($scope.TrueFalse);
            $scope.$apply();
        });
    }
    function PreBindEducation() {
        Get("/Generic/PreBindEductionLevel", true).then(function (result) {
            $scope.EducationList = result.Data.EducationLevelList;
            $scope.$apply();
            //console.log($scope.EducationList);
        });
    }
    function PreBindEducationLivingStatus() {
        Get("/Generic/ExsitingWifeLivingStatus", true).then(function (result) {
            $scope.ExsitingWifeLivingStatusList = result.Data.ExsitingWifeLivingStatusList;
            $scope.$apply();
        });
    }

    $scope.SaveWifeDetail = function () {
        let NoOfKids = $scope.WifeDetail.Kids;
        if (NoOfKids > 0) {
            $scope.WifeDetail.WifeKidzDetails = $scope.WifeKidsDetailList;
            //console.log($scope.WifeDetail);
        }
        if ($scope.WifeDetail.ExsitingWife == null || $scope.WifeDetail.ExsitingWife == '') {
            //console.log("onotsaved ");
            ShowMessage("Please Select Wife");
            $("#wifeNo").show();
            return;
        }
        var formData = new FormData();
        formData.append("WifeDetail", JSON.stringify($scope.WifeDetail));
        //console.log($scope.WifeDetail);
        SaveAndUpload("/Member/SaveWifeDetail", formData, false, $("#btnWifeDetail")).then(function (d) {
            if (d.Success) {
                //BlockUI(false, $("#btnFamilyInfo"));
                // redirect to another page
                //RedirectDelay("/Package/Packages");
            }
            ShowMessage(d);
        });
    }
    $scope.getDetailsByWife = function () {
        $scope.wifeNo = $scope.WifeDetail.ExsitingWife;
        //console.log($scope.wifeNo);
        if ($scope.wifeNo == null || $scope.wifeNo == '') {
            $("#wifeNo").show();
        } else {
            $("#wifeNo").hide();
            Get('/Member/FetchWifeDetailById?ExsitingWife=' + $scope.wifeNo).then(function (result) {
                if (result.Success) {
                    $scope.WifeDetail.HaveWife = result.Data.HaveWife;
                    $scope.WifeDetail.ExsitingWife = (result.Data.ExsitingWife) != null ? (result.Data.ExsitingWife).toString() : $scope.wifeNo;
                    $scope.WifeDetail.Religion = result.Data.WifeReligion;
                    $scope.WifeDetail.MarriageYear = result.Data.MarriageYear;
                    $scope.WifeDetail.Age = result.Data.WifeAge;
                    $scope.WifeDetail.Education = result.Data.WifeEducation;
                    $scope.WifeDetail.Job = result.Data.WifeJob;
                    $scope.WifeDetail.Location = result.Data.WifeLocation;
                    $scope.WifeDetail.Kids = result.Data.WifeKids;
                    $scope.WifeDetail.EducationLevelId = (result.Data.EducationLevelId) != null ? (result.Data.EducationLevelId).toString() : null;
                    $scope.WifeDetail.LivingStatus = result.Data.LivingStatus;
                    $scope.$apply();
                   // console.log($scope.WifeDetail);
                    WifeKidsDetailFetchByWifeNo();
                }
            });
        }
    }
    $scope.saveKidzDetail = function () {
        console.log($scope.WifeKidsDetailList);
        //$('#childTable tr').each(function () { var customerId = $(this).find(".customerIDCell").html(); });
        var jsonObj = JSON.stringify($scope.WifeKidsDetailList);
        console.log($scope.WifeKidsDetailList);
        console.log(JSON.stringify($scope.WifeKidsDetailList));

        console.log($scope.msg);
        SaveModelObject("/Member/SaveKidzDetail", jsonObj, false, $("#btnWifeKidzDetail")).then(function (d) {
            if (d.Success) {
                BlockUI(false, $("#btnWifeKidzDetail"));
                // redirect to another page
                //RedirectDelay("/Package/Packages");
            }
            ShowMessage(d);
        });
    }

    function ClearFields() {
        //$scope.WifeDetail.Id = 0;
        //$scope.WifeDetail.MemberId = 0;
        $scope.WifeDetail.HaveWife = "";
        $scope.WifeDetail.ExsitingWife = "";
        $scope.WifeDetail.Religion = '';
        $scope.WifeDetail.MarriageYear = "";
        $scope.WifeDetail.Age = "";
        $scope.WifeDetail.Education = "";
        $scope.WifeDetail.Job = "";
        $scope.WifeDetail.Location = "";
        $scope.WifeDetail.Kids = "";
        $scope.WifeDetail.LivingStatus = "";
        // $scope.WifeDetail.WifeKidsDetail =[];
        $("#AcceptanceForm").reset();
    }
    WifeDetailFetchById();
    function WifeDetailFetchById() {
        //console.log($scope.WifeKidsDetail);
        Post('/Member/FetchWifeDetailById', '', true).then(function (result) {
            if (result.Success) {
                //console.log(result.Data);
                //ClearFields();
                // $scope.PersonalInfo.Id = result.Data.Id;
                $scope.WifeDetail.HaveWife = result.Data.HaveWife;
                $scope.WifeDetail.ExsitingWife = (result.Data.ExsitingWife).toString();
                $scope.WifeDetail.Religion = result.Data.WifeReligion;
                $scope.WifeDetail.MarriageYear = result.Data.MarriageYear;
                $scope.WifeDetail.Age = result.Data.WifeAge;
                $scope.WifeDetail.Education = result.Data.WifeEducation;
                $scope.WifeDetail.Job = result.Data.WifeJob;
                $scope.WifeDetail.Location = result.Data.WifeLocation;
                $scope.WifeDetail.Kids = result.Data.WifeKids;
                $scope.WifeDetail.EducationLevelId = (result.Data.EducationLevelId).toString();
                $scope.WifeDetail.LivingStatus = result.Data.LivingStatus;
                $scope.$apply();
                // console.log(result.Data);
                // console.log($scope.WifeDetail);
                $scope.wifeNo = $scope.WifeDetail.ExsitingWife;
                WifeKidsDetailFetchByWifeNo()
            }
        });
    }
    //WifeKidsDetailFetchById();
    function WifeKidsDetailFetchById() {
        Post('/Member/FetchWifeKidzDetailById', '', false).then(function (result) {
            if (result.Success) {
                //  console.log(result.Data);
                //ClearFields();               
                $scope.WifeKidsDetailList = result.Data;
                // console.log(result.Data);
                $("#KidsCard").show();
                // console.log($scope.WifeKidsDetailList);
                $scope.$apply();
                ///BindKidzData();
            }
        });
    }
    function WifeKidsDetailFetchByWifeNo() {
        //console.log("Function called");
        Get('/Member/FetchWifeKidzDetailById?ExsitingWife=' + $scope.wifeNo).then(function (result) {
            if (result.Success) {
                // console.log(result.Data);
                //ClearFields();               
                $scope.WifeKidsDetailList = result.Data;
                // console.log(result.Data);
                $("#KidsCard").show();
                //console.log($scope.WifeKidsDetailList);
                $scope.$apply();
                ///BindKidzData();
            }
        });
    }
    $scope.kidsstrength = function () {
        var strength = $scope.WifeDetail.Kids;
        console.log(strength);
        if (strength > 0 && strength < 12) {
            $("#KidsCard").show();
            //console.log(strenght);
            $scope.KidsStrength = [];
            $scope.WifeKidsDetailList = [];
            for (var i = 1; i <= strength; i++) {
                //console.log(i);
                $scope.WifeKidsDetail = {
                    Id: $scope.WifeKidsDetailList.length + 1,
                    Age: "",
                    Gender: "",
                    Location: "",
                    Status: ""
                };
                $scope.WifeKidsDetailList.push($scope.WifeKidsDetail);
                $scope.KidsStrength.push(i);
                // console.log(strength);
                //$scope.results = angular.toJson($scope.kidsStrength)
            }
            //console.log('after list ' + $scope.KidsStrength);

        } else {
            $("#KidsCard").hide();
        }
    }


    function BindKidzData() {
        var strength = $scope.WifeDetail.Kids;
        console.log("KidsOnload log msg with data: " + strength);
        if (strength > 0 && strength < 12) {
            $("#KidsCard").show();
            //console.log(strenght);
            $scope.KidsStrength = [];
            for (var i = 1; i <= strength; i++) {
                //console.log(i);
                //$scope.WifeKidsDetail = {
                //    Id: $scope.WifeKidsDetailList.length + 1,
                //    Age: $scope.WifeKidsDetailList[i].Age,
                //    Gender: $scope.WifeKidsDetailList[i].Gender,
                //    Location: $scope.WifeKidsDetailList[i].Location,
                //    Status: $scope.WifeKidsDetailList[i].Status
                //};
                //$scope.WifeKidsDetailList.push($scope.WifeKidsDetail);
                WifeKidsDetailList[i].Id = i + 1
                $scope.KidsStrength.push(i);
            }
            //console.log('after list ' + $scope.KidsStrength);
        }

    }

    //kidsOnLoad();
    //function kidsOnLoad() {
    //    setTimeout(function () {
    //        //console.log("KidsOnload log msg");          
    //        var strength = parseInt($scope.WifeDetail.Kids);
    //        //console.log("KidsOnload log msg with data: " + strength);           
    //        if (strength > 0 && strength < 12) {
    //            $("#KidsCard").show();
    //            //console.log(strenght);
    //           //$scope.KidsStrength = [];
    //            for (var i = 1; i <= strength; i++) {
    //                //console.log(i);
    //                $scope.WifeKidsDetail = {
    //                    Id: $scope.WifeKidsDetailList.length + 1,
    //                    Age: 0,
    //                    Gender: "",
    //                    Location: "",
    //                    Status: ""
    //                };
    //                $scope.WifeKidsDetailList.push($scope.WifeKidsDetail);
    //                //$scope.KidsStrength.push(i);
    //                //$scope.results = angular.toJson($scope.kidsStrength)
    //            }
    //            //console.log('after list ' + $scope.KidsStrength);
    //        } 
    //    }, 1500);

    //}

});