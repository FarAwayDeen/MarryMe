app.controller("ProfileController", function ($scope) {
    $scope.Profile = {
        Id: 0,
        FirstName: "",
        LastName: "",
        Email: "",
        // Password: "",
        ProfilePicture: "",
        Phone: "",
        Address: ""
    };
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#imgPreview').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#imgProfile").change(function () {
        readURL(this);
    });
    ClearFields();

    function ClearFields() {
        $scope.Profile.Id = 0;
        $scope.Profile.FirstName = "";
        $scope.Profile.LastName = "";
        $scope.Profile.Email = "";
        $scope.Profile.ProfilePicture = "";
        $scope.Profile.Phone = "";
        $scope.Profile.Address = "";
        angular.element("input[type='file']").val(null);
        PreBind();
    }
    function PreBind() {
        Get("/Account/GetProfile", true).then(function (result) {
            console.log(result);
            $scope.Profile.Id = result.Id;
            $scope.Profile.FirstName = result.FirstName;
            $scope.Profile.LastName = result.LastName;
            $scope.Profile.Email = result.Email;
            //$scope.Profile.Password = result.Data.Password;
            $scope.Profile.ProfilePicture = result.ProfilePicture;
            $scope.Profile.ProfilePictureUrl = result.ProfilePictureUrl;
            $scope.Profile.Phone = result.Phone;
            $scope.Profile.Address = result.Address;
            $scope.$apply();
        });
    }
    $scope.SaveProfile = function () {
        $('#frmAuthenticate').parsley().reset();
        var parsleyForm = $('#frmAuthenticate').parsley();
        parsleyForm.validate();
        if (!parsleyForm.isValid())
            return false;

        var formData = new FormData();
        var profilePicture = $("#imgProfile")[0].files;
        if (profilePicture.length!=0)
            formData.append("ProfilePicture", profilePicture[0])

        formData.append("ProfileForm", JSON.stringify($scope.Profile));
        SaveAndUpload("/Account/SaveProfile", formData, false, $("#btnAuthenticate")).then(function (d) {
            if (d.Success) {
                ClearFields();
                SuccessMessage(d.Detail);
            }
            else {

            }
            //window.location.href = "/Accounts/Login";
        });
    };
});