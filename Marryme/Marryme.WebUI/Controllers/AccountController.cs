using Marryme.BAL;
using Marryme.BAL.MarrymeClientManager;
using Marryme.DAL;
using System;
using System.Web.Mvc;
using System.Web.Security;

namespace Marryme.WebUI.Controllers
{
    public class AccountController : Controller
    {
        // GET: Account
        public JsonResult VerifyDuplicateEmail(string email)
        {
            Message msg = AccountManager.VerifyDuplicateEmail(email);
            return Json(msg, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Login()
        {
            if (Request.QueryString["EmailConfirmed"] != null)
            {
                bool isEmailConfirmed = Convert.ToBoolean(Request.QueryString["EmailConfirmed"]);
                ViewBag.EmailConfimation = isEmailConfirmed;
            }
            return View();
        }
        public ActionResult Registeration()
        {
            return View();
        }
        public ActionResult RegisterRegistrar()
        {
            return View("~/Views/MarriageRegistration/Registeration.cshtml");
        }       
        public async System.Threading.Tasks.Task<JsonResult> Register()
        {
            try
            {
                var data = Request.Unvalidated.Form["Account"].ToString().Deserialize<MemberRegistration>();
                //FirebaseAuthLink auth = await authProvider.CreateUserWithEmailAndPasswordAsync(data.Email, data.Password, data.Name, false); for mobile auth variable (auth.User.LocalId) 
                var response = AccountManager.Register(data);

                //response.Data = auth.User;
                response.key = data.Password;
                return Json(response, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            //catch (FirebaseAuthException ex)
            {
                Message msg = new Message { Success = false };
                return Json(msg, JsonRequestBehavior.AllowGet);
            }

        }
        public async System.Threading.Tasks.Task<JsonResult> VerifyUser(string email, string password)
        {
            Message msg = new Message();
            try
            {
                //FirebaseAuthLink auth = await authProvider.SignInWithEmailAndPasswordAsync(email, password);
                msg = AccountManager.VerifyUser(email, password);
                if (msg.Success)
                {
                    //Login user here
                    Int64 memberId = Convert.ToInt64(msg.Data);
                    string memberName = MemberManger.GetMemberNameById(memberId);
                    string memberGender = MemberManger.GetMemberGenderById(memberId);
                    string userRoleName = MemberManger.GetUserRoleById(memberId);
                    Session["MemberId"] = memberId;
                    Session["Email"] = email;
                    Session["FullName"] = memberName;
                    Session["SessionHelper"] = memberId;
                    Session["Gender"] = memberGender;
                    Session["Role"] = userRoleName;
                    FormsAuthentication.SetAuthCookie(memberId.ToString(), true);
                    // delete chat session code is below

                    //MemberChatManager.DeleteByMemberId(memberId);

                    // Maintain Field Permission session
                    Session["FieldPermissionList"] = FieldPermissionManager.GetActiveSections(memberId);
                    msg.Detail = "Login SuccessFully";
                }
                else
                {
                    msg.Warning = true;
                    msg.Detail = "User Not Exist or Email not verified.";

                }

                return Json(msg, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Detail = "Email is Not Found or May be not Active Yet";
                // return SignInStatus.Failure;
                return Json(msg, JsonRequestBehavior.AllowGet);
            }
            //  return SignInStatus.Success;
        }
        public ActionResult ConfirmEmail(string Email, string Code)
        {
            if (AccountManager.EmailConfirmation(Email, Code))
            {
                //return View("VerifyEmail");
                return RedirectToAction("Login", "Account", new { EmailConfirmed = true });
            }
            else
            {
                return RedirectToAction("Login", "Account", new { EmailConfirmed = false });
            }

        }
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            Session.Clear();
            Session.Abandon();
            return RedirectToAction("Index", "Home");
        }
        public JsonResult ChangePassword(string oldPassword = "", string newPassword = "")
        {
            string email = Convert.ToString(Session["Email"]);
            //   authProvider.SendPasswordResetEmailAsync();
            return Json(AccountManager.ChangePassword(email, oldPassword, newPassword), JsonRequestBehavior.AllowGet);
        }
    }
}