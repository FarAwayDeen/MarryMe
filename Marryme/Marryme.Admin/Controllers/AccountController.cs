using Marryme.BAL;
using Marryme.BAL.MarrymeAdminManager;
using Marryme.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace Marryme.Admin.Controllers
{
    public class AccountController : Controller
    {
        // GET: Account
        [AllowAnonymous]
        public ActionResult Index()
        {
            return View();
        }
        [AllowAnonymous]
        public JsonResult Authenticate()
        {
            ValidationMessage msg = AccountsManager.Login(Request.Unvalidated.Form["AuthForm"].ToString().Deserialize<AdminProfile>());
            if (msg.Success && !msg.Warning)
            {
                msg.Detail = "Authenticated SuccessFully.";
                Session["SessionHelper"] = (AdminProfile)msg.Data;
                FormsAuthentication.SetAuthCookie("east", true);
                msg.returnUrl = string.IsNullOrWhiteSpace(Request.QueryString["returnUrl"]) || Request.QueryString["returnUrl"] == "" ? "/Home/Index" : Request.QueryString["returnUrl"];
            }
            else
            {
                msg.Detail = "Invalid Login Attempt.";
            }
            return Json(msg, JsonRequestBehavior.AllowGet);
        }
        [AllowAnonymous]
        public ActionResult ForgetPassword()
        {
            return View();
        }
        [AllowAnonymous]
        public JsonResult RequestForgotPassword()
        {
            return Json(AccountsManager.ForgotPassword(Request.Unvalidated.Form["ForgetPasswordForm"].ToString().Deserialize<AdminProfile>().Email), JsonRequestBehavior.AllowGet);
        }
        public ActionResult MyProfile()
        {
            return View();
        }
        public JsonResult SaveProfile()
        {
            var files = Request.Files["ProfilePicture"];
            var form = Request.Unvalidated.Form["ProfileForm"].ToString().Deserialize<AdminProfile>();
            return Json(AccountsManager.UpdateProfile(form, files), JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetProfile()
        {
            return Json(Static.UserProfile, JsonRequestBehavior.AllowGet);
        }
        public ActionResult ChangePassword()
        {
            try
            {
                return View();
            }
            catch
            {
                return View();
            }
        }
        public JsonResult SaveChangePassword()
        {
            ValidationMessage msg = new ValidationMessage();
            var admin = Request.Unvalidated.Form["ChangePasswordForm"].ToString().Deserialize<AdminProfile>();
            admin.Email = Static.UserProfile.Email;
            if (admin.Password == admin.ConfirmPassword)
            {
                msg = AccountsManager.ChangePassword(admin);
                if (msg.Success && !msg.Warning)
                {
                    msg.Detail = "Authenticated SuccessFully.";
                    Session["SessionHelper"] = (AdminProfile)msg.Data;
                    FormsAuthentication.SetAuthCookie(((AdminProfile)msg.Data).Email, true);
                    msg.returnUrl = "/Account/Index";
                    LogOut();
                }
                else
                {
                    msg.Detail = "Invalid Attempt. Double Check Your Password.";
                    msg.Success = false;
                }
            }
            else
            {
                msg.Warning = true;
                msg.Success = false;
                msg.Detail = "Make Sure You Entered Correct Passwords.";
            }
            return Json(msg, JsonRequestBehavior.AllowGet);
        }
        public ActionResult LogOut()
        {
            FormsAuthentication.SignOut();
            Session.Clear();
            Session.Abandon();
            return View("Index");
        }
    }
}