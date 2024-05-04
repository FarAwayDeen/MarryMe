app.controller("FieldPermissionController", function ($scope, $compile) {
    $scope.Sections = {
    };
    $scope.EncodedZero = "AQAAAB%2bLCAAAAAAABAAzAAAh39v0AQAAAA%3d%3d";
    $scope.CurrentSection = "Registration";
    var previousSection = "";
    $scope.GetSectionsByName = function (sectionName) {
        GetSectionsByName(sectionName);
    }
    ///* first one set active by default */
    //$scope.selectedIndex = 0; 
    //$scope.select = function (CurrentSection) {
    //    $scope.selectedIndex = CurrentSection;
    //};

    $scope.SavePermissions = function () {
        var arr = [];
        $("#container2-" + $scope.CurrentSection + " .box-item-" + $scope.CurrentSection).each(function () {
            var fieldId = $(this).attr("item-id");
            arr.push(fieldId);
        });

        Post("/FieldPermission/UpdateBySection", { sectionName: $scope.CurrentSection, arrFieldId: arr }, true).then(function (d) {
            if (d.Success) {
                // BlockUI(false, $("#SavePermissions"));
                //  RedirectDelay("/FieldPermission/SaveUpdate");
            }
            ShowMessage(d);
        });

    }

    PreBindSectionslist();
    GetSectionsByName($scope.CurrentSection);
    function PreBindSectionslist(strSection) {
        Get("/Generic/PreBindSections?section=" + strSection, true).then(function (result) {
            $scope.SectionsList = result.Data.SectionsList;
            $scope.$apply();
        });
    }
    function GetSectionsByName(strSection) {
        previousSection = $scope.CurrentSection;
        if (strSection === previousSection) {
            return;
        }
        setTimeout(function () {
            $("#container2-" + strSection + " > .box-item-" + previousSection).each(function () {
                $(this).remove();
            });
        }, 1000);
        Get("/FieldPermission/GetSectionsName?section=" + strSection, true).then(function (result) {
            $scope.CurrentSection = strSection;
            $scope.SectionNames = result.Data;
            $scope.$apply();
            //setTimeout(function () {
            $('.box-item-' + strSection).draggable({
                cursor: 'move',
                helper: "clone"
            });

            $("#container1-" + strSection).droppable({
                drop: function (event, ui) {
                    var itemid = $(event.originalEvent.toElement).attr("item-id");
                    $('.box-item-' + strSection).each(function () {
                        if ($(this).attr("item-id") === itemid) {
                            $(this).appendTo("#container1-" + strSection);
                        }
                    });
                }
            });

            $("#container2-" + strSection).droppable({
                drop: function (event, ui) {
                    var itemid = $(event.originalEvent.toElement).attr("item-id");
                    $('.box-item-' + strSection).each(function () {
                        if ($(this).attr("item-id") === itemid) {
                            $(this).appendTo("#container2-" + strSection);
                        }
                    });
                }
            });
            //}, 5000);

        });
    }

});
