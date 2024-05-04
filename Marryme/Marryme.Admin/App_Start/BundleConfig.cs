using BundleExtensions;
using System.Web.Optimization;

namespace Marryme.Admin
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/js").Include(
                                "~/Assets/vendor/jquery/jquery.js",
                                "~/Assets/vendor/jquery-ui/jquery-ui.js",
                                "~/Assets/vendor/bootstrap/js/bootstrap.js",
                                "~/Assets/scripts/jquery-cookie.js",
                                "~/Assets/vendor/bootstrap-progressbar/js/bootstrap-progressbar.js",
                                "~/Assets/vendor/parsleyjs/js/parsley.js",
                                "~/Assets/vendor/fuelux/wizard/wizard.js",
                                "~/Assets/scripts/klorofilpro-common.js",
                                "~/Assets/scripts/angular.js",
                                "~/Assets/scripts/DataTable/jquerydataTables.js",
                                 //"~/Assets/vendor/alertifyjs/alertify.js",
                                 "~/Assets/vendor/iziToast/iziToast-min.js",
                                "~/Assets/vendor/pNotify/pnotifycustommin.js",
                                "~/Assets/vendor/playSound/play.js",
                                "~/Assets/vendor/bootstrap-toggle/js/bootstrap-toggle.js",
                                "~/Assets/vendor/sweetalert2/sweetalert2.js",
                                "~/Assets/vendor/moment/js/moment.js",
                                "~/Assets/vendor/bootstrap-date-time-picker/js/bootstrap-datetimepickermin.js",
                                "~/Assets/vendor/select2/js/select2.js",
                                "~/Assets/vendor/bootstrap-multiselect/bootstrap-multiselect.js",
                                "~/Assets/vendor/jquery-ui/jquery-ui.js",
                                "~/Assets/vendor/jquery-ui/ui/widgets/sortable.js",
                                "~/Assets/vendor/bootstrap-daterangepicker/daterangepicker.js",
                                "~/Assets/vendor/jasny-bootstrap/js/jasny-bootstrap.js",
                                "~/Assets/vendor/iCheck/icheckmin.js",
                                "~/Assets/vendor/summernote/summernote.js",
                                "~/Assets/vendor/bootstrap-tag/bootstrap-tagsinput.js",
                                "~/Assets/vendor/chart-js/Chart.min.js"
                            ));
            bundles.Add(new StyleBundle("~/content/css").IncludeWithCssRewriteUrlTransform(
                                    "~/assets/vendor/bootstrap/css/bootstrap.min.css",
                                    "~/assets/vendor/font-awesome/css/font-awesome.min.css",
                                    "~/assets/vendor/themify-icons/css/themify-icons.css",
                                    "~/assets/css/vendor/animate/animate.min.css",
                                    "~/assets/vendor/chartist/css/chartist-custom.css",
                                    "~/Assets/vendor/bootstrap/css/bootstrap.css",
                                    "~/Assets/vendor/font-awesome/css/font-awesome.css",
                                    "~/Assets/vendor/themify-icons/css/themify-icons.css",
                                    "~/Assets/css/vendor/animate/animate.css",
                                    "~/Assets/vendor/bootstrap-progressbar/css/bootstrap-progressbar.css",
                                    "~/Assets/vendor/dropzone/dropzone.css",
                                    "~/Assets/vendor/bootstrap-toggle/css/bootstrap-toggle.css",
                                    "~/Assets/vendor/sweetalert2/sweetalert2.css",
                                    "~/Assets/vendor/parsleyjs/css/parsley.css",
                                    "~/Assets/vendor/iCheck/blue.css",
                                    "~/Assets/vendor/datatables/css-main/jquery-dataTables.css",
                                     "~/Assets/vendor/iziToast/iziToast-min.css",
                                    //"~/Assets/vendor/alertifyjs/css/themes/default.css",
                                    //"~/Assets/vendor/alertifyjs/css/alertify.css",
                                    "~/Assets/vendor/jasny-bootstrap/css/jasny-bootstrap.css",
                                    "~/Assets/vendor/datatables/css-bootstrap/dataTables.bootstrap.min.css",
                                    "~/Assets/vendor/bootstrap-date-time-picker/css/bootstrap-datetimepickermin.css",
                                    "~/Assets/vendor/select2/css/select2.css",
                                    "~/Assets/vendor/bootstrap-multiselect/bootstrap-multiselect.css",
                                    "~/Assets/vendor/jquery-ui/themes/base/jquery-ui.css",
                                    "~/Assets/vendor/bootstrap-daterangepicker/daterangepicker.css",
                                    "~/Assets/vendor/pNotify/animate.css",
                                    "~/Assets/vendor/pNotify/pnotifycustommin.css",
                                    "~/Assets/css/main.css",
                                    "~/Assets/css/custom.css",
                                    "~/Content/UserDetail.css",
                                    "~/Assets/vendor/summernote/summernote.css",
                                    "~/Assets/vendor/bootstrap-tag/bootstrap-tagsinput.css"
                                    ));
        }
    }
}
