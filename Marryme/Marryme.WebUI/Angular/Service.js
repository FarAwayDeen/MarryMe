app.factory('GenericService', function () {
    return {
        ValidateUrl: function (Url) {
            if (typeof Url == "undefined" || Url == null || Url == "") {
                Url = "";
            }
            else {
                Url = Url.replace(/[^0-9a-z- ]/gi, '').replace(/ /g, '-').replace(/-{2,}/g, '-');
            }

            return Url;
        },
        GenerateUrl: function (Name, liveUrl="") {
            var Url, liveUrlshow;
            if (typeof Name == "undefined" || Name == null ||Name == "") {
                Url = "";
            }
            else {
                Url = Name.replace(/[^0-9a-z- ]/gi, '').replace(/ /g, '-').replace(/-{2,}/g, '-');
                liveUrlshow = liveUrl + '/' + Name.replace(/[^0-9a-z- ]/gi, '').replace(/ /g, '-').replace(/-{2,}/g, '-');
            }
            var obj = [];
            obj.push(Url);
            obj.push(liveUrlshow);
            return obj;
        }
    };
});