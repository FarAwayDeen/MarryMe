//import { post } from "jquery";
app.controller("ProfileRequirementController", function ($scope, $compile) {
    $scope.ProfileReurement = {
    };
    $scope.PartnerCategory = {

    };
    $scope.PartnerCategoryModel = {

    };
    $scope.Divorce = {

    };
    ProfileRequirementList();
    ProfileRequirementCheckList();
    FetchFieldPermissions();
    ProfilePartnerCatgoryList();
    FacilitiesForWomanList();
    FacilitiesForManList();
    WomanrightList();
    ProposalQuestionForMan();
    ProposalQuestionForWoMan();
    PreBindMaritalStatusMale();
    PartnerCategoryFetchById();
    PreBindEducation();

    //Dropdown list for yes and No
    $scope.sample = [{
        id: '1',
        name: 'Yes'
    }, {
        id: '2',
        name: 'No'
    }];
    //multi dropdwon Setting
    $scope.myDropdownOptions = [{
        id: "S",
        label: "Standard"
    }, {
        id: "I",
        label: "Intermediate"
    }, {
        id: "B",
        label: "Best available"
    }];
    $scope.myDropdownModel = [$scope.myDropdownOptions[0]];

    $scope.myDropdownSettings = {
        styleActive: true,
        checkBoxes: true,
        smartButtonTextProvider(selectionArray) {
            if (selectionArray.length === 1) {
                return selectionArray[0].label;
            } else {
                return selectionArray.length + ' Selected';
            }
        }
    };





    $scope.setting1 = {
        scrollableHeight: '200px',
        scrollable: true,
        enableSearch: true
    };
    $scope.example14model = [];
    PreBindLookingFor();
    function PreBindLookingFor() {
        Get("/Generic/WifeNo", true).then(function (result) {
            $scope.MarriageNoList = result.Data.WifeNoList;
            //console.log($scope.MarriageNoList);
            $scope.$apply();
            var multipleCancelButton = new Choices('#ddlFacilitiesForWoman', {
                removeItemButton: true,
                maxItemCount: 5,
                searchResultLimit: 5,
                renderChoiceLimit: 5
            });
        });
    }
    //Proposal Questrion Answer Save method
    $scope.ProposalQForMan = function (status, id) {
        //console.log("Function Called");
        //console.log(status + " " + id);
        Post("/Member/ProposalAnswer", { status: status, Id: id }, true).then(function (d) {
            if (d.Success) {
                //BlockUI(false, $("#btnFamilyInfo"));
                // redirect to another page
                //RedirectDelay("/Package/Packages");
            }
            ShowMessage(d);
        });
    }
    //Marriage Duration Call
    $scope.MarriageForMan = function () {
        //console.log("Function Called for Man");
        //console.log(status + " " + id);
        Post("/Member/MarriageDuration", { Duration: $scope.PartnerCategory.ManDuration, DurationFor: "M" }, true).then(function (d) {
            if (d.Success) {
                //BlockUI(false, $("#btnFamilyInfo"));
                // redirect to another page
                //RedirectDelay("/Package/Packages");
            }
            ShowMessage(d);
        });
    }
    $scope.MarriageForWoman = function () {
        //console.log("Function Called for woman");
        //console.log(status + " " + id);
        Post("/Member/MarriageDuration", { Duration: $scope.PartnerCategory.WomanDuration, DurationFor: "W" }, true).then(function (d) {
            if (d.Success) {
                //BlockUI(false, $("#btnFamilyInfo"));
                // redirect to another page
                //RedirectDelay("/Package/Packages");
            }
            ShowMessage(d);
        });
    }
    //Divorce Reason Save Call
    $scope.DivorceReason = function () {
        var reasonQuestion;
        var reason = $scope.Divorce.Reason;
        var Date = $scope.Divorce.Date;
        let convertedDate = JSON.stringify(Date);
        convertedDate = convertedDate.slice(1, 11);
        if ($scope.Divorce.ReasonQuestionWoman =="Yes") {
            reasonQuestion = $scope.Divorce.ReasonQuestionWoman
        }
        if ($scope.Divorce.ReasonQuestionMan =="Yes") {
            reasonQuestion = $scope.Divorce.ReasonQuestionMan
        }
        //console.log("Man Question: " + $scope.Divorce.ReasonQuestionMan + " & " + "Woman Question: " + $scope.Divorce.ReasonQuestionWoman + " & " + "Reaosn: " + $scope.Divorce.Reason + " & " + "Date: " + $scope.Divorce.Date  );
        //console.log("date " + date);
        Post("/Member/DivorceReason", { Question: reasonQuestion, Reason: reason, DivorceDate: convertedDate  }, true).then(function (d) {
            if (d.Success) {
                BlockUI(false, $("#btnDivorceReason"));
                // redirect to another page
                //RedirectDelay("/Package/Packages");
            }
            ShowMessage(d);
        });
    }

    $scope.ProposalQForWoman = function (status, id) {
        //console.log("Function Called");
        //console.log(status + " " + id);
        Post("/Member/ProposalAnswer", { status: status, Id: id }, true).then(function (d) {
            if (d.Success) {
                //BlockUI(false, $("#btnFamilyInfo"));
                // redirect to another page
                //RedirectDelay("/Package/Packages");
            }
            ShowMessage(d);
        });
    }
    //$scope.Category{
    //    id: '',
    //        Value: 
    //}

    $scope.isChecked = function (id, matches) {
        var isChecked = false;
        angular.forEach(matches, function (match) {
            if (match === id) {
                isChecked = true;
            }
        });
        return isChecked;
    }
    //Partner Catagory Checkbox Save method
    //$scope.SavePartnerCatgory = function (status, id) {
    //    //$scope.selectedIdArray = [];
    //    //$scope.selectedIdArray.push({ Category: $scope.PartnerCategory.PartnerCatagoryChecklist })
    //    //console.log('arry data' + $scope.selectedIdArray);
    //    //var formData = new FormData();
    //    //formData.append("PartnerCategory", JSON.stringify($scope.PartnerCategory));
    //    console.log($scope.PartnerCategory);
    //    Post("/Member/PartnerCatagoryCheck", { status: status, Id: id }, true).then(function (d) {
    //        //SaveAndUpload("/Member/PartnerCatagoryCheck", formData, false, $("#btnPartnerCategory")).then(function (d) {
    //        if (d.Success) {
    //            //BlockUI(false, $("#btnFamilyInfo"));
    //            // redirect to another page
    //            //RedirectDelay("/Package/Packages");
    //        }
    //        ShowMessage(d);
    //    });
    //}

    $scope.SaveWifeNo = function (status, id) { 

        console.log($scope.PartnerCategory);
        Post("/Member/WifeNoCheck", { status: status, Id: id }, true).then(function (d) {
            //SaveAndUpload("/Member/PartnerCatagoryCheck", formData, false, $("#btnPartnerCategory")).then(function (d) {
            if (d.Success) {
                //BlockUI(false, $("#btnFamilyInfo"));
                // redirect to another page
                //RedirectDelay("/Package/Packages");
            }
            ShowMessage(d);
        });
    }

    //Array code for Facilities for Woman

    $("select#ddlMaritalStatus").change(function () {
        var result = $(this).find(":selected").text();
        //console.log(result); // output value to console
    });
    function ddlMaritalStatus() {
        var select = document.getElementById('ddlMaritalStatus');
        var text = select.options[select.selectedIndex].text;
        console.log("Function Called" + text);
        //console.log($scope.PartnerCategory.maritalStatus)
    }
    $scope.ddlMaritalStatus = [];
    $("select#ddlMaritalStatus").change(function () {
        $scope.ddlMaritalStatus = [];
        $(this).find(":selected").each(function () {
            //$scope.FacilityForWife = {
                
            //};
            $scope.ddlMaritalStatus.push($(this).text());
        });
        console.log($scope.ddlMaritalStatus); // output value to console
        $scope.PartnerCategoryModel.MaritalStatus = $scope.ddlMaritalStatus;
    });
    $scope.ddlEducationLevel = [];
    $("select#ddlEducationType").change(function () {
        $scope.ddlEducationLevel = [];
        $(this).find(":selected").each(function () {
            //$scope.FacilityForWife = {
                
            //};
            $scope.ddlEducationLevel.push($(this).text());
        });
        console.log($scope.ddlEducationLevel); // output value to console

    });
    // To Save Facilities and checkbox within form
    $scope.PartnerCheckbox = {
        StatusId: 0,
        MaritalStatus: "",
        EducationLevel: ""
    };
    //$scope.FacilitiesDetailList = [];
    $scope.PartnerCheckboxListToSave = [];

        $scope.PartnerCategoryId = [];
    $(document).on('change', '.checkPartner', function () {
        //$scope.FacilitiesDetail = [];
        if (this.checked) {
            $scope.PartnerCategoryId.push($(this).val())
            //console.log($(this).val());
            //$scope.PartnerCheckbox = {
            //    StatusId: $(this).val(),
            //    MaritalStatus: $scope.ddlMaritalStatus,
            //    EducationLevel: $scope.ddlEducationLevel

           // };
          /*  $scope.PartnerCheckboxListToSave.push($scope.PartnerCheckbox);*/
            //$scope.FacilitiesDetail.push(i);
            //console.log($scope.PartnerCheckboxListToSave);
            console.log($scope.PartnerCategoryId);
            $scope.PartnerCategoryModel.PartnerCategoryId = $scope.PartnerCategoryId;

        }
    });   
    //    $scope.FacilityCheckListForWife = [];
    //$("select.checkFacility").change(function () {
    //    console.log("checked Called");
    //    console.log($(this).val());
    //    $scope.FacilityCheckListForWife = [];
    //    $(this).find(":checked").each(function () {
    //        $scope.FacilityCheckForWife = {
    //            StatusId: $(this).text(),
               
    //        };
    //        $scope.FacilityCheckListForWife.push($scope.FacilityCheckForWife);
    //    });
    //    console.log($scope.FacilityCheckListForWife); // output value to console

    //});

    // Facilities for woman
    $scope.SavePartnerAllCatgory = function () {
        //console.log($scope.WifeKidsDetailList);
        //$('#childTable tr').each(function () { var customerId = $(this).find(".customerIDCell").html(); });
        //$scope.PartnerCheckboxListToSave[0] = $scope.ddlMaritalStatus;
        //$scope.ddlMaritalStatus[0] = $scope.ddlEducationLevel;
        console.log($scope.PartnerCategoryModel);
        var jsonObj = JSON.stringify($scope.PartnerCategoryModel);
        console.log(jsonObj);
        //console.log($scope.msg);
        SaveModelObject("/Member/SavePartnerStatusAndEducation", jsonObj, false, $("#btnPartnerCategory")).then(function (d) {
            if (d.Success) {
                BlockUI(false, $("#btnPartnerCategory"));
                // redirect to another page
                //RedirectDelay("/Package/Packages");
            }
            ShowMessage(d);
        });
    }

    $scope.SaveFacilitiesForWoman = function (status, id, wife) {
        console.log("Facilities for woman Status:" + status + " & FacilityID: " + id + " & WifeID: " + wife);
        Post("/Member/SaveFacilityforWoman", { status: status, Id: id, wifeId: wife }, true).then(function (d) {
            if (d.Success) {
                //BlockUI(false, $("#btnFamilyInfo"));
                // redirect to another page
                //RedirectDelay("/Package/Packages");
            }
            ShowMessage(d);
        });
    }
    // Facilities for Man
    $scope.SaveFacilitiesForMan = function (status, id, wife) {
        console.log("Facilities for man Status:" + status + " & FacilityID: " + id + " & WifeID: " + wife);
        Post("/Member/SaveFacilitiesforMan", { status: status, Id: id, wifeId: wife }, true).then(function (d) {
            if (d.Success) {
                //BlockUI(false, $("#btnFamilyInfo"));
                // redirect to another page
                //RedirectDelay("/Package/Packages");
            }
            ShowMessage(d);
        });
    }
    //
    $scope.SaveRightsForWoman = function (status, id) {
        //console.log("Facilities for woman " + status + " & " + id);
        Post("/Member/SaveRightsForWoman", { status: status, Id: id }, true).then(function (d) {
            if (d.Success) {
                //BlockUI(false, $("#btnFamilyInfo"));
                // redirect to another page
                //RedirectDelay("/Package/Packages");
            }
            ShowMessage(d);
        });
    }

    function PreBindEducation() {
        Get("/Generic/PreBindEductionLevel").then(function (result) {
            console.log(result.Data);
            $scope.EducationList = result.Data.EducationLevelList;
            $scope.$apply();
            console.log($scope.EducationList);            
        });
    }
    function PreBindMaritalStatusMale() {
        Get("/Generic/PreBindMaritalStatusForMale", true).then(function (result) {
            $scope.MaritalStatusForMale = result.Data.MaritalStatusMaleList;
            console.log($scope.MaritalStatusForMale);
            $scope.$apply();

            var multipleCancelButton = new Choices('#ddlMaritalStatus', {
                removeItemButton: true,
                maxItemCount: 5,
                searchResultLimit: 5,
                renderChoiceLimit: 5
            });
        });
    }

    PreBindMaritalStatusFemale();
    function PreBindMaritalStatusFemale() {
        Get("/Generic/PreBindMaritalStatusForFemale", true).then(function (result) {
            $scope.MaritalStatusForFemale = result.Data.MaritalStatusFemaleList;
            $scope.$apply();
        });
    }
    function ProfileRequirementList() {
        Get("/Member/FetchProfileRequirement", true).then(function (result) {
            $scope.ProfileFieldList = result.Data.ProfileFieldList;
            //console.log($scope.ProfileFieldList);
            $scope.$apply();
        });
    }
    function ProfileRequirementCheckList() {
        Get("/Member/FetchProfileRequirementCheckList", true).then(function (result) {
            $scope.ProfileCheckList = result.Data.ProfileCheckList;
            //console.log($scope.ProfileCheckList);
            $scope.$apply();
        });
    }
    function ProfilePartnerCatgoryList() {
        Get("/Member/FetchProfilePartnerCatgory", true).then(function (result) {
            $scope.PartnerCatagoryChecklist = result.Data.ParentCatagorylist;
            //console.log($scope.PartnerCatagoryChecklist);
            $scope.$apply();
        });
    }
    function FacilitiesForWomanList() {
        Get("/Member/FacilitiesForWoman", true).then(function (result) {
            $scope.WomanFacilitieschecklist = result.Data.WomanFacilitieslist;
            //console.log($scope.WomanFacilitieschecklist);
            $scope.$apply();
        });
    }
    function FacilitiesForManList() {
        Get("/Member/FacilitiesForMan", true).then(function (result) {
            $scope.ManFacilitieschecklist = result.Data.ManFacilitieslist;
            //console.log($scope.ManFacilitieschecklist);
            $scope.$apply();
        });
    }
    function WomanrightList() {
        Get("/Member/WomanrightList", true).then(function (result) {
            $scope.WomanRightschecklist = result.Data.WomanRightsList;
            //console.log($scope.WomanRightschecklist);
            $scope.$apply();
        });
    }
    function ProposalQuestionForMan() {
        Get("/Member/ProposalQuestionForMan", true).then(function (result) {
            $scope.ProposalQuestionForMan = result.Data.ManQuestionlist;
            //console.log($scope.ProposalQuestionForMan);
            $scope.$apply();
        });
    }
    function ProposalQuestionForWoMan() {
        Get("/Member/ProposalQuestionForWoman", true).then(function (result) {
            $scope.ProposalQuestionForWoMan = result.Data.WomanQuestionlist;
            //console.log($scope.ProposalQuestionForWoMan);
            $scope.$apply();
        });
    }

    $scope.FieldPermissionMessage = 'Visible for paid Members';
    function FetchFieldPermissions() {
        Get("/Generic/FetchFieldPermissions", true).then(function (result) {
            $scope.FetchFieldPermissionList = result.Data;
            //     console.log($scope.FetchFieldPermissionList);
            $scope.$apply();
        });
    }

    function PartnerCategoryFetchById() {
        Post('/Member/FetchPartnerCategoryById', '', true).then(function (result) {
            if (result.Success) {
                //ClearFields();
                //console.log(result.Data);
                //$scope.PartnerCategory = result.Data;
                //console.log($scope.PartnerCategory);
                $scope.selection = [];


                //$scope.PersonalDetail.LanguageTypeCode = result.Data.LanguageTypeCode;
                $scope.$apply();
            }
        });


    }

});