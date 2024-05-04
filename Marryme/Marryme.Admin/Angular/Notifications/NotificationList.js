
app.controller("NotificationController", function ($scope, $compile) {
    $scope.Notification = {
    };
    $scope.EncodedZero = "AQAAAB%2bLCAAAAAAABAAzAAAh39v0AQAAAA%3d%3d";
   
    FeedBackList();
    function FeedBackList() {
        Get("/Notification/FetchFeedBackNotificationList", true).then(function (result) {
            $scope.FeedBackList = result.Data.feedBackNotificationList;
            $scope.$apply();
        });
    }
    ContactUsList();
    function ContactUsList() {
        Get("/Notification/FetchContactUsNotificationList", true).then(function (result) {
            $scope.ContactUsList = result.Data.contactUsNotificationList;
            $scope.$apply();
        });
    }
});