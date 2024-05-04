
var app = angular.module('MatrimonyAdminModule', []);
var errorMsg = "Something went wrong. Please try again";
var jqueryDatatable, isNumeric;

$(function ($) {
    $('.datepicker').datetimepicker({ format: 'DD/MM/YYYY', showTodayButton: true, showClear: true, showClose: true });
    $('.timepicker').datetimepicker({ format: 'H:mm:ss', showClear: true, showClose: true });
    $('.datetimepicker').datetimepicker({ format: 'DD/MM/YYYY H:mm', showTodayButton: true, showClear: true, showClose: true });
    $('.datetimepicker-current').datetimepicker({ format: 'DD/MM/YYYY H:mm', defaultDate: new Date(), showTodayButton: true, showClear: true, showClose: true });
    $(".datepicker-current").datetimepicker({ format: 'DD/MM/YYYY', defaultDate: new Date(), showTodayButton: true, showClear: true, showClose: true });
    $('.daterange').daterangepicker({ locale: { format: 'DD/MM/YYYY' } });
    // #StartRegion of Date Range
    $('.DateTo').datetimepicker({ format: 'DD/MM/YYYY H:mm', showTodayButton: true, showClear: true, showClose: true });
    $('.DateFrom').datetimepicker(
        {
            format: 'DD/MM/YYYY H:mm',
            showTodayButton: true,
            showClear: true,
            showClose: true,
            minDate: new Date()
        }).on("dp.change", function (e) {
            var minDate = new Date(e.date._d);
            var val = $('.DateTo').val();
            $('.DateTo').datetimepicker('destroy').datetimepicker({
                format: 'DD/MM/YYYY H:mm',
                showTodayButton: true,
                showClear: true,
                showClose: true,
                minDate: minDate
            });
            if (val == "")
                $('.DateTo').val("")
        });
    $('.SearchDateTo').datetimepicker({ format: 'DD/MM/YYYY', showTodayButton: true, showClear: true, showClose: true });
    $('.SearchDateFrom').datetimepicker(
        {
            format: 'DD/MM/YYYY',
            showTodayButton: true,
            showClear: true,
            showClose: true
        }).on("dp.change", function (e) {
            var minDate = new Date(e.date._d);
            var val = $('.SearchDateTo').val();
            $('.SearchDateTo').datetimepicker('destroy').datetimepicker({
                format: 'DD/MM/YYYY',
                showTodayButton: true,
                showClear: true,
                showClose: true,
                minDate: minDate
            });
            if (val == "")
                $('.SearchDateTo').val("")
        });

    // #EndRegion of Date Range
    //$('.preventTyping').keypress(function (e) {
    //    e.preventDefault();
    //});
    $('.switch').bootstrapToggle();
    $('.select').select2({
        placeholder: {
            id: '-1',
            text: '--- Please Select ---'
        }
    });
    $('.selectSearch').select2({
        placeholder: {
            id: '-1',
            text: '--- All ---'
        }
    });
    $('.summernote').summernote({ height: 300 });
    if (getCookie("panelClass") && getCookie("panelClass") != "undefined" && typeof getCookie("panelClass") != "undefined")
        $("#panel-right-sidebar-compare").addClass(getCookie("panelClass"));
});

function ChangeSearch(e) {
    $("#btnSelectedSearch").html(e.innerHTML + '<i class="fa fa-angle-down" aria-hidden="true"></i>');
}

$.fn.advancedDataTable = function (options) {

    if ($.fn.dataTable.isDataTable(this))
        $(this).dataTable().fnPageChange($(this).dataTable().fnPagingInfo().iPage);
    else {
        $(this).dataTable().fnDestroy();
        jqueryDatatable = $(this).DataTable({
            "processing": true,
            "bSort": true,
            "bFilter": options.filter,
            "bDeferRender": true,
            //dom: 'Bfrtip',
            //lengthMenu: [
            //    [10, 25, 50, -1],
            //    ['10 rows', '25 rows', '50 rows', 'Show all']
            //],
            //buttons: [
            //    'pageLength'
            //],
            "pagingType": "full_numbers",
            //"info": "_TOTAL_ entries",
            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, 'All']],

            "oLanguage": {
                "sSearch": "",
                "sSearchPlaceholder": "Search...",
                "sProcessing": '<img src="/Content/Images/loaderDatatable.gif" style="width: 50px;" />',
                "sLengthMenu": "_MENU_",
                "oPaginate":
                {
                    "sNext": '<i class="fa fa-angle-right"></i>',
                    "sLast": '<i class="fa fa-angle-double-right"></i>',
                    "sFirst": '<i class="fa fa-angle-double-left"></i>',
                    "sPrevious": '<i class="fa fa-angle-left"></i>'
                },
                "sZeroRecords": 'No matching records found',
                "sInfo": 'Showing _START_ to _END_ of _TOTAL_ entries',
                "sEmptyTable": 'No data available in table ',
                "sInfoEmpty": 'Showing 0 to 0 of 0 entries',
                "sInfoFiltered": '(filtered from _MAX_ total entries)',
            },
            "initComplete": function (settings, json) {

                $(".manual-dropdown").empty()
                $("[name=" + $(this).attr("id") + "_length]").addClass("form-control pull-right");
                $("[name=" + $(this).attr("id") + "_length]").detach().prependTo(".manual-dropdown");
                // $(".manual-dropdown").html($(".manual-dropdown").html())
                $(".dataTables_length").remove();

                $("#" + $(this).attr("id") + "_filter > label > input").addClass("form-control");
                $("#" + $(this).attr("id") + "_filter > label > input").detach().prependTo(".claimdocumenttable-filter");
                $(".dataTables_filter").remove();
                $('.i-checks').iCheck({
                    checkboxClass: 'icheckbox_square-blue',
                    radioClass: 'iradio_square-blue'
                });

            },
            "serverSide": true,
            "ajaxSource": options.url,
            //fnServerData method used to inject the parameters into the AJAX call sent to the server-side
            "fnServerData": function (sSource, aoData, fnCallback, oSettings) {
                //BlockUI();

                aoData.push({ "name": "SearchJson", "value": JSON.stringify(options.postData) }); // Add some extra data to the sender

                $.getJSON(sSource, aoData, function (d) {
                    if (!d.msg.Success)
                        ShowMessage(d.msg);
                    else
                        fnCallback(d.Data);
                }).error(function (d, c, dd, t) {
                    if (d.status == 200)
                        AccessDenied();
                    else
                        ErrorMessage('Something went wrong, please try again');
                });
            },
            "bResetDisplay": false,
            "bLengthChange": true,
            "aaSorting": [],
            "createdRow": options.createdRow,
            "drawCallback": function (settings, r, er, err) {
                $('.i-checks').iCheck({
                    checkboxClass: 'icheckbox_square-blue',
                    radioClass: 'iradio_square-blue'
                });

            },
            "columns": options.bindingData,
            "aoColumnDefs": options.disableSorting,
            "rowCallback": function (row, data, index) {


            }
        });
    }
};

$.fn.check = function () {
    return $(this).prop("checked", true);
};
$.fn.iChecked = function () {
    return $(this).prop("checked");
};
$.fn.uncheck = function () {
    return $(this).prop("checked", false);
};

$.fn.checked = function () {
    return $(this).is(":checked");
};
$.fn.multiSelect = function (arrSelected) {
    $(this).val(arrSelected);
    $(this).trigger('change.select2');
    return $(this).val();
};
$.fn.multiSelectVal = function () {
    if ($(this).val() == null)
        return [];
    else
        return $(this).val();
};
$.fn.multiSelectClear = function () {
    $(this).val([]).trigger('change.select2');
    return $(this).val();
};
$.fn.select2Clear = function () {
    $(this).val("").trigger('change.select2');
    return $(this).val();
};
/*Select all*/
$.fn.multiSelectAll = function () {

    $(this).find("option").prop("selected", "selected");
    $(this).trigger("change.select2");
    return $(this).val();

};
/*Prototypes*/
String.prototype.parseBoolean = function () {
    return ("true" == this.toLowerCase()) ? true : false
}


String.prototype.IsNullOrEmpty = function () {
    return ((this == "" || this == null) ? true : false)
}
/*Events*/
$(document).on('ifChanged', ".chk-multiselect", function (event) {

    if (this.checked)
        $(this).parents(".multiselect_wrapper").children("select").multiSelectAll();
    //$(this).parents(".multiselect_wrapper").children("select").find("option").prop("selected", "selected");

    else
        $(this).parents(".multiselect_wrapper").children("select").multiSelectClear();
    //$(this).parents(".multiselect_wrapper").children("select").find("option").removeAttr("selected");

    //$(this).parents(".multiselect_wrapper").children("select").trigger("change");

});
$(document).on("keypress", ".allow-number", function (evt) {
    return AllowNumber(evt);
});

$(document).on("keyup", ".place-comma", function () {
    return $(this).val(ReplaceNumberWithCommas($(this).val()));
});

$(document).on("keyup", ".not-zero", function (e) {

    var code = e.which,
        chr = String.fromCharCode(code), // key pressed converted to s string
        cur = $(this).val(),
        newVal = parseFloat(cur + chr); // what the input box will contain after this key press


    // If this keypress would make the number
    // out of bounds, ignore it
    if (newVal <= 0) {
        return false;
    }
    return true;
});
$(document).on("keypress", ".allow-number-decimal", function (evt) {
    return IsNumeric(evt, this);
});

$(document).on("keypress", ".allow-numbers-with-limited-digits", function (evt) {
    var isNumberic = AllowNumber(evt),
        maxLimit = (typeof $(evt.target).data("max") !== "undefined") ? $(evt.target).data("max") : 10;
    if (isNumberic) {
        if (isNaN(parseInt(String.fromCharCode(evt.keyCode))))
            isNumberic = true;
        else if (parseInt(($(evt.target).val() + "" + String.fromCharCode(evt.keyCode)).replace(/\s+/g, '').length) > parseInt(maxLimit))
            isNumberic = false;
    }
    return isNumberic;
});

$(document).on("keypress", ".allow-numbers-with-limited-value", function (evt) {
    var isNumberic = AllowNumber(evt),
        maxLimit = (typeof $(evt.target).data("max") !== "undefined") ? $(evt.target).data("max") : 10;
    if (isNumberic) {
        if (isNaN(parseInt(String.fromCharCode(evt.keyCode))))
            isNumberic = true;
        else if (parseInt(($(evt.target).val() + "" + String.fromCharCode(evt.keyCode))) > parseInt(maxLimit))
            isNumberic = false;
    }
    return isNumberic;
});

$(document).on("keydown", ".allow-alphabet", function (e) {
    var regex = new RegExp("^[a-z A-Z ]+$");
    var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
    if (regex.test(str) || e.keyCode == 8 || e.keyCode == 46 || e.keyCode == 37 || e.keyCode == 39 || e.keyCode == 9 || e.keyCode == 13)
        return true;
    else {
        e.preventDefault();
        return false;
    }
});
$(document).on("keydown", "input", function (e) {
    var regex = new RegExp("<|>");
    var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
    if (!regex.test(str))
        return true;
    else {
        e.preventDefault();
        return false;
    }
});
$(document).on("keydown", "textarea", function (e) {
    var regex = new RegExp("<|>");
    var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
    if (!regex.test(str))
        return true;
    else {
        e.preventDefault();
        return false;
    }
});
$(document).on("keyup", ".url", function (e) {

    if (typeof $(this).val() == "undefined" || $(this).val() == null || $(this).val() == "") {
        $(this).val() = "";
    }
    else {

        $(this).val($(this).val().replace(/[^0-9a-z- ]/gi, '').replace(/ /g, '-').replace(/-{2,}/g, '-'));
    }
});
$(document).on("click", ".NavBarClass", function (evt) {

    var classname = getCookie('bodyclass');
    if (classname == "") {
        setCookie('bodyclass', 'layout-fullwidth');
    }
    else if (classname == "sidebar-minified") {
        setCookie('bodyclass', 'sidebar-minified layout-fullwidth');
    }
    else if (classname == "sidebar-minified layout-fullwidth") {
        setCookie('bodyclass', 'sidebar-minified');
    }
    else {
        setCookie('bodyclass', '');
    }
    return;
});

$(document).on("click", ".SideBarClass", function (evt) {

    var classname = getCookie('bodyclass');
    if (classname == "") {
        setCookie('bodyclass', 'sidebar-minified');
    }
    else if (classname == "sidebar-minified layout-fullwidth") {
        setCookie('bodyclass', 'sidebar-minified layout-fullwidth');
    }
    else {
        setCookie('bodyclass', '');
    }
    return;
});

/*Functions*/
function setCookie(cname, cvalue) {
    //var d = new Date();
    //d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    //var expires = "expires=" + d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";path=/";
}
function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}
function find(arr, item) {
    if ($.type(arr.find(e => e.Key === item)) === "undefined")
        return "";
    else
        return arr.find(e => e.Key === item).Value;
}
function CopyToClipboard(text) {
    var aux = document.createElement("input");
    aux.setAttribute("value", text);
    document.body.appendChild(aux);
    aux.select();
    document.execCommand("copy");
    document.body.removeChild(aux);

}
function Print() {


    var prtContent = document.getElementById('DivReport');

    var WinPrint = window.open('', '', 'left=0,top=0,width=780,height=600,toolbar=0,scrollbars=1,status=1');
    WinPrint.document.open();



    WinPrint.document.write('<html><head><title>Print Invoice</title>');

    //<link rel="stylesheet" href="/Assets/css/main.css" >
    WinPrint.document.write(`
               <link rel="stylesheet" href="/Assets/css/bootstrap.css">
               <link rel="stylesheet" href="/Assets/vendor/font-awesome/css/font-awesome.css">
               <link rel="stylesheet" href="/Assets/vendor/themify-icons/css/themify-icons.css">
               <link rel="stylesheet" href="/Assets/css/vendor/animate/animate.css">
               <link rel="stylesheet" href="/Assets/vendor/iCheck/blue.css">
               <link rel="stylesheet" href="/Assets/vendor/bootstrap-progressbar/css/bootstrap-progressbar.css">
               <link rel="stylesheet" href="/Assets/vendor/dropzone/dropzone.css">
               <link rel="stylesheet" href="/Assets/vendor/bootstrap-toggle/css/bootstrap-toggle.css">
               <link rel="stylesheet" href="/Assets/vendor/sweetalert2/sweetalert2.css">
               <link rel="stylesheet" href="/Assets/vendor/parsleyjs/css/parsley.css">
               <link rel="stylesheet" href="/Assets/vendor/iziToast/iziToast-min.css">
               <link rel="stylesheet" href="/Assets/vendor/jasny-bootstrap/css/jasny-bootstrap.css">
               <link rel="stylesheet" href="/Assets/vendor/bootstrap-date-time-picker/css/bootstrap-datetimepickermin.css">
               <link rel="stylesheet" href="/Assets/vendor/select2/css/select2.css">
               <link rel="stylesheet" href="/Assets/vendor/bootstrap-multiselect/bootstrap-multiselect.css">
               <link rel="stylesheet" href="/Assets/vendor/jquery-ui/themes/base/jquery-ui.css">
               <link rel="stylesheet" href="/Assets/vendor/bootstrap-daterangepicker/daterangepicker.css">
               <link rel="stylesheet" href="/Assets/vendor/pNotify/animate.css">
               <link rel="stylesheet" href="/Assets/vendor/pNotify/pnotifycustommin.css">
               <link rel="stylesheet" href="/Assets/vendor/dropzone/dropzone.min.css">
               <link rel="stylesheet" href="/Assets/css/linearicons.css">
               <link rel="stylesheet" href="/Assets/css/magnific-popup.css">
               <link rel="stylesheet" href="/Assets/css/nice-select.css">
               <link rel="stylesheet" href="/Assets/css/owl.carousel.css">
               <link rel="stylesheet" href="/Assets/css/simple-line-icons.css">
               <link rel="stylesheet" href="/Assets/vendor/summernote/summernote.css">
               <link rel="stylesheet" href="/Assets/vendor/bootstrap-tag/bootstrap-tagsinput.css">
               <link rel="stylesheet" href="/Assets/css/dashboard.css">
               <link rel="stylesheet" href="/Assets/css/main.css">


            `);
    WinPrint.document.write('</head><body >');
    WinPrint.document.write(prtContent.innerHTML);
    WinPrint.document.write('</body></html>');
    WinPrint.document.close();
    setTimeout(function () {
        WinPrint.print();
    }, 2000);
    //prtContent.innerHTML = strOldOne;
    return false;
}
function IsNullOrEmpty(value) {
    return typeof value == 'string' && !value.trim() || typeof value == 'undefined' || value === null;
}
function IsNumeric(evt, obj) {
    isNumeric = AllowNumber(evt);
    if (!isNumeric) {
        if (evt.which == 46) {
            if (CharCount($(obj).val(), '\\.') > 0)
                isNumeric = false;
            else
                isNumeric = true;
        }
    }
    return isNumeric;
}
function ReplaceNumberWithCommas(val) {
    val = val.toString().replace(/,/g, '');
    //if (val.indexOf(".") > 0)
    //    val = ConvertDecimal(val);

    if (val == undefined || val == "" || val == null || val == NaN) {
        return "";
    }
    else {
        //Seperates the components of the number
        var n = val.toString().split(".");
        //Comma-fies the first part
        n[0] = n[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        //Combines the two sections
        if (val.indexOf(".") > 0)
            return n.join(".");
        else
            return n[0];
    }
}
function RemoveCommasFromNumber(val) {
    val = val.toString();
    if (val == undefined || val == "" || val == null || val == NaN)
        return 0;
    //else if (val.indexOf(".") > 0)
    //    return Number(val.replace(/,/g, ''))
    else
        return Number(val.replace(/,/g, ''));

}

function CheckImage(obj) {
    //obj.onerror = null;
    obj.src = '/Assets/' + 'img' + /*obj.src.split("/")[4] +*/ '/defaultImage.jpg';
}
function Label(isActive, isActiveInactive) {
    if (typeof isActiveInactive === "undefined")
        isActiveInactive = false;

    // return (isActive ? '<span></span>' : '<span class="label label-warning">' + (isActiveInactive ? 'Inactive' : 'Locked') + '</span>');

    return (isActive ? '<span class="badge badge-success">' + (isActiveInactive ? 'Active' : 'Unlocked') + '</span>' : '<span class="badge badge-danger">' + (isActiveInactive ? 'Inactive' : 'Locked') + '</span>');

}
function LabelYesNo(isActive) {

    return (isActive ? '<span class="badge badge-success">Yes</span>' : '<span class="badge badge-danger">No</span>');

    //return (isActive ? '<span class="label label-success">' + (isActiveInactive ? 'Active' : 'Unlocked') + '</span>' : '<span class="label label-warning">' + (isActiveInactive ? 'Inactive' : 'Locked') + '</span>');

}
function RedirectDelay(url) {
    setTimeout(function () { window.location.href = url; }, 2500);
}
function FetchParams() {
    var url = window.location.href;
    var regex = /([^=&?]+)=([^&#]*)/g, params = {}, parts, key, value;

    while ((parts = regex.exec(url)) != null) {

        key = parts[1], value = parts[2];
        var isArray = /\[\]$/.test(key);

        if (isArray) {

            params[key] = params[key] || [];
            params[key].push(value);
        }
        else {

            params[key] = value;
        }
    }

    return params;
}
function FetchParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}
function AllowNumber(evt) {


    var charCode = evt.which;
    return (charCode >= 48 && charCode <= 57)
    //var response = !!(
    //    (charCode >= 48 && charCode <= 57)
    //    || (charCode >= 37 && charCode <= 40)
    //    || (charCode >= 96 && charCode <= 105)
    //    || charCode == 17
    //    || charCode == 13
    //    || charCode == 46
    //    || charCode == 8
    //    || charCode == 9
    //    || charCode == 188);

    //if (charCode >= 48 && charCode <= 57)
    //    response = false;

}
function AllowDecimal(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode;
    if (charCode != 46 && charCode != 190 && charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    } else {
        // If the number field already has . then don't allow to enter . again.
        if (evt.target.value.search(/\./) > -1 && charCode == 46) {
            return false;
        }
        return true;
    }
}
function SuccessMessage(msg) {
    //alertify.success(msg);
    iziToast.success({
        id: 'success',
        title: 'Success',
        message: msg,
        position: 'bottomRight',
        transitionIn: 'bounceInLeft',
        transitionOut: 'flipOutX',
    });
}
function ErrorMessage(msg) {
    //alertify.error(msg);
    iziToast.error({
        id: 'error',
        title: 'Error',
        message: msg,
        position: 'bottomRight',
        transitionIn: 'bounceInLeft',
        transitionOut: 'flipOutX',
    });
}
function WarningMessage(msg) {
    //alertify.warning(msg);
    iziToast.warning({
        id: 'warning',
        title: 'Warning',
        message: msg,
        position: 'bottomRight',
        transitionIn: 'bounceInLeft',
        transitionOut: 'flipOutX',
    });
}
function InfoMessage(msg) {
    //alertify.warning(msg);
    iziToast.info({
        id: 'info',
        title: 'Info',
        message: msg,
        position: 'bottomRight',
        transitionIn: 'bounceInLeft',
        transitionOut: 'flipOutX',
    });
}
function ShowMessage(msg) {
    if (!($.type(msg.Detail) === "undefined")) {
        // alertify.set('notifier', 'delay', 10);
        if (msg.Info) {
            InfoMessage(msg.Detail);
        }
        else if (msg.Warning) {
            WarningMessage(msg.Detail);
        }
        else if (msg.Success) {
            SuccessMessage(msg.Detail);

        }
        else if (!msg.Success) {
            ErrorMessage(msg.Detail);
        }
        else if (msg.Info) {
            InfoMessage(msg.Detail);
        }
        else if (msg.Warning) {
            WarningMessage(msg.Detail);
        }
    }
}
function BlockUI(isBlockUI, e) {
    if (typeof e !== "undefined") {
        if (e.currentTarget == undefined) {
            $(e).find("span:first").hide()
            $(e).attr("disabled", "disabled")
            $(e).find("span:nth-child(2)").show()
        }
        else {
            $(e.currentTarget).find("span:first").hide()
            $(e.currentTarget).attr("disabled", "disabled")
            $(e.currentTarget).find("span:nth-child(2)").show()
        }
    }
    if (typeof isBlockUI === "undefined" || isBlockUI)
        $("#divLoader").fadeIn("slow");
}
function UnBlockUI(e) {
    if (typeof e !== "undefined") {
        if (e.currentTarget == undefined) {
            $(e).find("span:first").show()
            $(e).removeAttr("disabled")
            $(e).find("span:nth-child(2)").hide()
        }
        else {
            $(e.currentTarget).find("span:first").show()
            $(e.currentTarget).removeAttr("disabled")
            $(e.currentTarget).find("span:nth-child(2)").hide()
        }
    }
    else
        $("#divLoader").fadeOut("slow");
}
function AccessDenied() {
    swal({
        title: "Unauthorized access has been detected",
        text: "You are not authorize to perform this action",
        confirmButtonClass: 'btn-danger',
        confirmButtonText: "Ok, got it!",
        type: "error"
    }).then(function () {
        LogOutNotification();
    });
}
function LogOutNotification() {
    var
        closeInSeconds = 5,
        displayText = "You will be redirected to sign-in page in #1 seconds.",
        timer;

    swal({
        title: "You've been signed out!",
        text: displayText.replace(/#1/, closeInSeconds),
        timer: (closeInSeconds + 1) * 1000,
        showConfirmButton: false,
        //type: "info"
    });

    timer = setInterval(function () {

        closeInSeconds--;
        if (closeInSeconds < 0) {
            clearInterval(timer);
            // window.location.reload();
        }

        $('#swal2-content').html(displayText.replace(/#1/, closeInSeconds));

    }, 1000);
}



function ConvertDecimal(value) {
    var multiplier = Math.pow(10, 2);
    return (Math.round(value * multiplier) / multiplier).toFixed(2);
    //return parseFloat(value.toFixed(2));
}

function RoundOff(value) {
    return parseFloat(value.toFixed(2));
}
function GetPackegesHeading(string) {
    var result = "";
    switch (string) {
        case "IsAllowRFQ":
            return "Allow RFQ";
            break;
        case "IsAllowMessage":
            return "Allow Messages";
            break;
        case "IsAllowVideoProduct":
            return "Allow Video Product";
            break;
        case "IsAllowWeblink":
            return "Allow Website link";
            break;
        case "IsAllowDocument":
            return "Allow Document";
            break;
        case "IsAllowRssProductFeed":
            return "Allow RSS Product Feed";
            break;
        case "IsAllowNews":
            return "Allow News";
            break;
        case "IsCreationService":
            return "Creation Service";
            break;
    }
    // return result;
}
function ChangePassword() {
    var changePassword = {
        OldPassword: $("#OldPassword").val(),
        NewPassword: $("#NewPassword").val(),
        ConfirmPassword: $("#ConfirmPassword").val()
    };

    if (changePassword.OldPassword != ""
        && changePassword.NewPassword != ""
        && changePassword.ConfirmPassword != "") {
        Post("/Manage/ChangePassword", { model: changePassword }, false, $("#btnChangePassword")).then(function (d) {
            ShowMessage(d)
            if (d.Success)
                RedirectDelay("/")
        })
    }
}





