
app.controller("MemberRegisterSetupController", function ($scope, $compile) {
    $scope.MemberRegister = {
    };

    $scope.EncodedZero = "AQAAAB%2bLCAAAAAAABAAzAAAh39v0AQAAAA%3d%3d";
    ClearFields();
    //if (firebase.apps.length === 0) {
    //    initializeFirebase();
    //}
    //function initializeFirebase() {
    //    var firebaseConfig = {};
    //    Get('/Generic/GetCredentials').then(function (result) {
    //        firebaseConfig = result;
    //        // Initialize Firebase
    //        firebase.initializeApp(firebaseConfig);
    //        firebase.analytics();
    //    });
    //}
    PreBindRegisteredBy();
    function PreBindRegisteredBy() {
        Get("/Generic/PreBindRegisteredBy", true).then(function (result) {          
            if (result.data !== undefined) {
                $scope.RegisteredBy = result.Data.RegisteredByList;
                $scope.$apply();
            }
        });
    }
    PreBindGender();
    function PreBindGender() {
        Get("/Generic/PreBindGender", true).then(function (result) {           
                $scope.GenderList = result.Data.GenderList;
                $scope.$apply();            
        });
    }
    PreBindLookingFor();
    function PreBindLookingFor() {
        Get("/Generic/PreBindLookingFor", true).then(function (result) {
        //console.log(result.Data);           
                $scope.LookingForList = result.Data;
                $scope.$apply();            
        });
    }
   PreBindMaritalStatusMale();
    function PreBindMaritalStatusMale() {
        Get("/Generic/FetchOptions?type=MaritalStatus", true).then(function (result) {
        //console.log(result.Data);
            $scope.MaritalStatusForMale = result.Data;
            $scope.$apply();
        });
    }
    //PreBindMaritalStatusFemale();
    function PreBindMaritalStatusFemale() {
        Get("/Generic/PreBindMaritalStatusForFemale", true).then(function (result) {
        console.log(result.Data);       
                $scope.MaritalStatusForFemale = result.Data.MaritalStatusForFemale;
                $scope.$apply();            
        });
    }
    PreBindDay();
    function PreBindDay() {
        Get("/Generic/PreBindDay", true).then(function (result) {       
                $scope.Days = result.Data.DaysList;
                $scope.$apply();            
        });
    }
    PreBindMonth();
    function PreBindMonth() {
        Get("/Generic/PreBindMonth", true).then(function (result) {      
                $scope.Months = result.Data.MonthList;
                $scope.$apply();            
        });
    }
    PreBindYear();
    function PreBindYear() {
        Get("/Generic/PreBindYear", true).then(function (result) {      
                $scope.Years = result.Data.YearList;
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
    PreBindReligion();
    function PreBindReligion() {
        Get("/Generic/FetchOptions?type=Religion", true).then(function (result) {
                $scope.Religions = result.Data;
                //console.log(result.Data);
                $scope.$apply();         
        });
    }
    //function PreBindCoursesParent() {
    //    Get("/Generic/CoursesInstructor", true).then(function (result) {
    //        $scope.CoursesInstructor = result.Data;
    //        $scope.$apply();
    //    });
    //}
    function ClearFields() {
        $scope.MemberRegister.Id = 0;
        $scope.MemberRegister.ReligionId = 0;
        $scope.MemberRegister.ReligionTypeCode = "";//"AwAAAB%2bLCAAAAAAABAAzNDcEALv2MRsDAAAA";
        $scope.MemberRegister.CountryId = 0;
        $scope.MemberRegister.CountryTypeCode = "";
        $scope.MemberRegister.Name = "";
        $scope.MemberRegister.ProfileCreatedBy = "Self";
        $scope.MemberRegister.LookingFor = "Marriage";
        $scope.MemberRegister.Gender = "Male";
        $scope.MemberRegister.MobileNo = "";
        $scope.MemberRegister.DOB = "";
        $scope.MemberRegister.MaritalStatus = "";
        $scope.MemberRegister.Email = "";
        $scope.MemberRegister.Password = "";
        $scope.isRegistrationSuccess = false;

        //$("#frmMemberRegister").parsley().reset();


    }
    $scope.Save = function () {
        //console.log("Save Function Called");
        //new code
        $('#frmMemberRegister').parsley().reset();
        var parsleyForm = $('#frmMemberRegister').parsley();
        parsleyForm.validate();
        if (!parsleyForm.isValid())
            return false;
        var formData = new FormData();
        Post("/Account/VerifyDuplicateEmail", { email: $scope.MemberRegister.Email }, false).then(function (d) {
            if (d.Warning) {
                // redirect to another page
                ShowMessage(d);
                $("#regEmail").val("")
            }
            else {
                formData.append("Account", JSON.stringify($scope.MemberRegister));
                SaveAndUpload("/Account/Register", formData, false, $("#btnMemberRegister")).then(function (d) {
                    if (d.Success) {
                        // console.log(d);
                        BlockUI(true, $("#btnMemberRegister"));
                        // redirect to another page
                        $scope.isRegistrationSuccess = true;
                        RedirectDelay("/Home/Index/");
                        $scope.$apply();
                        //setTimeout(function () {
                        //    window.location.href = '/Home/Index/';
                        //}, 2000);
                    }
                    else {
                        ShowMessage(d);
                    }
                });
                ShowMessage(d);
            }

        });

        //old code
        //$('#frmMemberRegister').parsley().reset();
        //var parsleyForm = $('#frmMemberRegister').parsley();
        ////console.log(parsleyForm);
        //parsleyForm.validate();
        //if (!parsleyForm.isValid())
        //    return false;
        //var formData = new FormData();
        //Post("/Account/VerifyDuplicateEmail", { email: $scope.MemberRegister.Email }, false).then(function (d) {
        //    if (d.Warning) {
        //        // redirect to another page
        //        ShowMessage(d);
        //        $("#regEmail").val("")
        //    }
        //    else {
        //        formData.append("Account", JSON.stringify($scope.MemberRegister));
        //        SaveAndUpload("/Account/Register", formData, false, $("#btnMemberRegister")).then(function (d) {
        //            if (d.Success) {
        //                // console.log(d);
        //                firebase.auth().signInWithEmailAndPassword(d.Data.Email, d.key).then(function (user) {
        //                    SendEmail(d, user)
        //                    BlockUI(true, $("#btnMemberRegister"));
        //                    ShowMessage(d);
        //                    // redirect to another page
        //                    $scope.isRegistrationSuccess = true;
        //                    $scope.$apply();
        //                }).catch(function (err) {
        //                    BlockUI(false, $("#btnMemberRegister"));
        //                    // redirect to another page
        //                   //}); $scope.isRegistrationSuccess = false;
        //                    $scope.$apply();
        //                });
        //            }
        //            else {
        //                ShowMessage(d);
        //            }
        //        });
        //    }


        //end old code

    }
    function SendEmail(userData, user) {
        //     console.log(userData, user);
        var actionCodeSettings = {
            url: window.location.origin + '/Account/Verify?email=' + firebase.auth().currentUser.email + "&code=" + userData.Code,
            //   iOS: {
            //       bundleId: 'com.companyname.matrimony'
            //   },
            //   android: {
            //       packageName: 'com.companyname.matrimony',
            //       installApp: true,
            //       minimumVersion: '12'
            //    },
            //    handleCodeInApp: false,
            // When multiple custom dynamic link domains are defined, specify which
            // one to use.
            //  dynamicLinkDomain: "example.page.link"
        };
        //  debugger
        firebase.auth().currentUser.sendEmailVerification(actionCodeSettings)
            .then(function () {
                // Verification email sent.
            })
            .catch(function (error) {
                console.log(error)
                // Error occurred. Inspect error.code.
            });
    }
    //$scope.VerifyDuplicateEmail = function () {

    //    var strEmail = $("#regEmail").val()
    //    if (strEmail != null && strEmail!= "") {

    //    }

    //}

});