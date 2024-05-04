app.controller("MemberDetailController", function ($scope, $compile) {
    $scope.MemberDetail = {
    };

    GetMemberDetailById();
    function GetMemberDetailById() {
        var obj = FetchParams();
        if (obj != null && !IsNullOrEmpty(obj.Code)) {
            Post("/Members/MemberDetailById", { MemberId: obj.Code }, true).then(function (result) {
                $scope.MemberDetail.Id = result.Data.Id;
                $scope.MemberDetail.Name = result.Data.Name;
                $scope.MemberDetail.ProfileCreatedBy = result.Data.ProfileCreatedBy;
                $scope.MemberDetail.DOB = result.Data.DOB;
                $scope.MemberDetail.MaritalStatus = result.Data.MaritalStatus;
                $scope.MemberDetail.MobileNo = result.Data.MobileNo;
                $scope.MemberDetail.Subcast = result.Data.Subcast;
                $scope.MemberDetail.Country = result.Data.Country;
                $scope.MemberDetail.State = result.Data.State;
                $scope.MemberDetail.City = result.Data.City;
                $scope.MemberDetail.Religion = result.Data.Religion;
                $scope.MemberDetail.AboutMe = result.Data.AboutMe;
                $scope.MemberDetail.HighestEducation = result.Data.HighestEducation;
                $scope.MemberDetail.AnualIncome = result.Data.AnualIncome;
                $scope.MemberDetail.Occupation = result.Data.Occupation;
                $scope.MemberDetail.Language = result.Data.Language;
                //$scope.MemberDetail.EatingHabit = result.Data.EatingHabit;
                //$scope.MemberDetail.DrinkingHabit = result.Data.DrinkingHabit;
                $scope.MemberDetail.SmokingHabit = result.Data.SmokingHabit;
                $scope.MemberDetail.Complexion = result.Data.Complexion;
                $scope.MemberDetail.IsMotherAlive = result.Data.IsMotherAlive;
                $scope.MemberDetail.IsFatherAlive = result.Data.IsFatherAlive;
                $scope.MemberDetail.NoOfBrothers = result.Data.NoOfBrothers;
                $scope.MemberDetail.NoOfSisters = result.Data.NoOfSisters;
                $scope.MemberDetail.FamilyStatus = result.Data.FamilyStatus;
                $scope.MemberDetail.ProfilePicPath = result.Data.ProfilePicPath;
                //$scope.MemberDetail.StateTypeCode = result.Data.StateTypeCode;
                //$scope.MemberDetail.CityTypeCode = result.Data.CityTypeCode;
                //$scope.MemberDetail.CountryTypeCode = result.Data.CountryTypeCode;
                console.log(result);
                $scope.$apply();
            });
        }
    }

});