app.directive('multiSelect', function () {

    function link(scope, element) {
        var options = {
            enableClickableOptGroups: true,
            onChange: function () {
                element.change();
            }
        };
        element.multiselect(options);
    }

    return {
        restrict: 'A',
        link: link
    };
});

app.config(['$provide', function ($provide) {
    $provide.decorator('selectDirective', ['$delegate', function ($delegate) {
        var directive = $delegate[0];

        directive.compile = function () {

            function post(scope, element, attrs, ctrls) {
                directive.link.post.apply(this, arguments);

                var ngModelController = ctrls[1];
                if (ngModelController && attrs.multiSelect !== null) {
                    originalRender = ngModelController.$render;
                    ngModelController.$render = function () {
                        originalRender();
                        element.multiselect('refresh');
                    };
                }
            }

            return {
                pre: directive.link.pre,
                post: post
            };
        };

        return $delegate;
    }]);
}]);