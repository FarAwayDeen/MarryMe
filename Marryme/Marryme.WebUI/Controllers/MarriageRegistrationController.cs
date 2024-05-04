using Marryme.BAL;
using Marryme.BAL.MarrymeClientManager;
using Marryme.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Marryme.WebUI.Controllers
{
    [SessionTimeout]
    public class MarriageRegistrationController : Controller
    {
        // GET: MarriageRegistration
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Registeration()
        {
            return View();
        }
        public ActionResult RegistrarProfile()
        {
            return View();
        }
        public JsonResult PersonalInfo()
        {
            var member = Request.Unvalidated.Form["PersonalInfo"].ToString().Deserialize<MemberRegistration>();
            member.Id = Convert.ToInt32(Session["MemberId"]);
            member.Email = Convert.ToString(Session["Email"]);
            return Json(MarriageRegistrationManager.PersonalInfo(member, Request.Files["Image"]), JsonRequestBehavior.AllowGet);
        }
        public JsonResult PersonalInfoGetById()
        {
            Int64 memberId = Convert.ToInt64(Session["MemberId"]);
            Message msg = MarriageRegistrationManager.PersonalInfoGetById(memberId);
            if (msg == null)
            {
                msg = new Message();
            }
            return Json(msg, JsonRequestBehavior.AllowGet);
        }
        public JsonResult FetchProfileLocationDetail()
        {
            Int64 memberId = Convert.ToInt64(Session["MemberId"]);
            Message msg = LocationManager.FetchProfileLocationDetail(memberId);
            if (msg == null)
            {
                msg = new Message();
            }
            return Json(msg, JsonRequestBehavior.AllowGet);
       }
        public JsonResult LocationInfo()
        {
            var member = Request.Unvalidated.Form["LocationInfo"].ToString().Deserialize<MemberLocationDetail>();
            member.MemberId = Convert.ToInt32(Session["MemberId"]);
            return Json(LocationManager.LocationInfo(member), JsonRequestBehavior.AllowGet);
        }
    }
}