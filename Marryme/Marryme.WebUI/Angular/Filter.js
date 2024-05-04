app.filter('trustAsHtml', ['$sce', function ($sce) {
    return function (text) {
        return $sce.trustAsHtml(text);
    };
}]);

app.filter("jsonDate", function () {
    var re = /\/Date\(([0-9]*)\)\//;
    return function (x) {
        if (x != null) {
            var m = x.match(re);
            if (m) return new Date(parseInt(m[1]));
            else return null;
        } else return null;
       
    };
});