app.controller("MemberDetailController", function ($scope, $compile) {
    $scope.MemberDetail = {
    };
    $scope.showPhone = false;
    //GetMemberDetailById();
    FetchFieldPermissions();
    $scope.FieldPermissionMessage = 'Visible for paid Members';
    function FetchFieldPermissions() {
        Get("/Generic/FetchFieldPermissions", true).then(function (result) {
            $scope.FetchFieldPermissionList = result.Data;
            //  console.log($scope.FetchFieldPermissionList);
            //  $scope.$apply();
            GetMemberDetailById();
        });
    }
    var obj = FetchParams();
    $scope.ViewPhoneNo = function () {
        Get("/Member/ViewPhone?MemberId=" + obj.Code, true).then(function (result) {
            if (result.Success) {
                SuccessMessage(result.Detail);
                $scope.showPhone = true;
                $scope.$apply();
            }
        });
    }
    function GetMemberDetailById() {
        if (obj != null && !IsNullOrEmpty(obj.Code)) {
            Post("/Member/MemberDetailById", { MemberId: obj.Code }, true).then(function (result) {
                console.log(result.Data);
                $scope.MemberDetail.Id = result.Data.memberDetail.Id;
                $scope.MemberDetail.Name = result.Data.memberDetail.Name;
                $scope.MemberDetail.ProfileCreatedBy = result.Data.memberDetail.ProfileCreatedBy;
                $scope.MemberDetail.DOB = result.Data.memberDetail.DOB;
                $scope.MemberDetail.MaritalStatus = result.Data.memberDetail.MaritalStatus;
                $scope.MemberDetail.MobileNo = result.Data.memberDetail.MobileNo;
                $scope.MemberDetail.Subcast = result.Data.memberDetail.Subcast;
                $scope.MemberDetail.Country = result.Data.memberDetail.Country;
                $scope.MemberDetail.State = result.Data.memberDetail.State;
                $scope.MemberDetail.City = result.Data.memberDetail.City;
                $scope.MemberDetail.Religion = result.Data.memberDetail.Religion;
                $scope.MemberDetail.AboutMe = result.Data.memberDetail.AboutMe;
                $scope.MemberDetail.HighestEducation = result.Data.memberDetail.HighestEducation;
                $scope.MemberDetail.AnualIncome = result.Data.memberDetail.AnualIncome;
                $scope.MemberDetail.Occupation = result.Data.memberDetail.Occupation;
                $scope.MemberDetail.Language = result.Data.memberDetail.Language;
                //$scope.MemberDetail.EatingHabit = result.Data.memberDetail.EatingHabit;
                //$scope.MemberDetail.DrinkingHabit = result.Data.memberDetail.DrinkingHabit;
                $scope.MemberDetail.SmokingHabit = result.Data.memberDetail.SmokingHabit;
                $scope.MemberDetail.Complexion = result.Data.memberDetail.Complexion;
                $scope.MemberDetail.IsMotherAlive = result.Data.memberDetail.IsMotherAlive;
                $scope.MemberDetail.IsFatherAlive = result.Data.memberDetail.IsFatherAlive;
                $scope.MemberDetail.NoOfBrothers = result.Data.memberDetail.NoOfBrothers;
                $scope.MemberDetail.NoOfSisters = result.Data.memberDetail.NoOfSisters;
                $scope.MemberDetail.FamilyStatus = result.Data.memberDetail.FamilyStatus;
                $scope.MemberDetail.ProfilePicPath = result.Data.memberDetail.ProfilePicPath;
                //$scope.MemberDetail.StateTypeCode = result.Data.memberDetail.StateTypeCode;
                //$scope.MemberDetail.CityTypeCode = result.Data.memberDetail.CityTypeCode;
                //$scope.MemberDetail.CountryTypeCode = result.Data.memberDetail.CountryTypeCode;
                //     console.log($scope.MemberDetail);
                $scope.$apply();
            });
        }
    }

});