function Post(url, data, isBlockUI, e) {
    BlockUI(isBlockUI, e);
    return $.ajax({
        method: "Post",
        url: url,
        // contentType: 'application/json',
        data: data,// JSON.stringify(data),
        success: function (d) {
            UnBlockUI(e);
            if ($.type(d) == "string" && d == "")
                LoginNow()
            //else if ($.type(d) == "string")
            //    AccessDenied();
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            UnBlockUI(e);
            ErrorMessage(errorMsg);
        }
    });
}

function Get(url, isBlockUI, e) {
    BlockUI(isBlockUI, e);
    return $.ajax({
        method: "Get",
        url: url,
        success: function (d) {
            UnBlockUI(e);
            if ($.type(d) == "string" && d == "")
                LoginNow()
            //else if ($.type(d) == "string")
            //    AccessDenied();

        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            UnBlockUI(e);
            ErrorMessage(errorMsg);
        }
    });
}

//function GetWithoutAccess(url, e) {
//    BlockUI(e);
//    return $.ajax({
//        method: "Get",
//        url: url,
//        success: function (d) {
//            UnBlockUI(e);
//        },
//        error: function (XMLHttpRequest, textStatus, errorThrown) {
//            UnBlockUI(e);
//            ErrorMessage("Something went wrong, please try again");
//        }
//    });
//}

//function PostWithoutAccess(url, data, e) {
//    BlockUI(e);
//    return $.ajax({
//        method: "Post",
//        url: url,
//        // contentType: 'application/json',
//        data: data,// JSON.stringify(data),
//        success: function (d) {
//            UnBlockUI(e);
//        },
//        error: function (XMLHttpRequest, textStatus, errorThrown) {
//            UnBlockUI(e);
//            ErrorMessage("Something went wrong, please try again");
//        }
//    });
//}

function SaveAndUpload(url, formData, isBlockUI, e) {
    BlockUI(isBlockUI, e);
    return $.ajax({
        data: formData,
        method: "Post",
        url: url,
        processData: false,
        contentType: false,
        success: function (d) {
            UnBlockUI(e);
            if ($.type(d) == "string" && d == "")
                LoginNow()
            //else if ($.type(d) == "string")
            //    AccessDenied();
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            UnBlockUI(e);
            ErrorMessage(errorMsg);
        }
    });
}
function SaveModelObject(url, formData, isBlockUI, e) {
    //BlockUI(isBlockUI, e);
    return $.ajax({
        method: "POST",
        url: url,
        data: formData,
        headers: {
            'Content-Type': 'application/json'
        }
    }).then(function (data) {
        //alert('success');

        if (data.status) {
            ShowMessage(data)
        }
        else {
            ShowMessage(data)

        }
    }, function (error) {
        //alert('fail');
        ErrorMessage(errorMsg);
    })
}


