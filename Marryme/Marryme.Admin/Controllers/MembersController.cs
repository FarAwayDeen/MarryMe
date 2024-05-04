using Marryme.BAL;
using Marryme.BAL.MarrymeAdminManager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Marryme.Admin.Controllers
{
    public class MembersController : Controller
    {
        // GET: Members
        public ActionResult Index() => View();
        public ActionResult Detail() => View();
        public ActionResult Fetch() => Json(MembersManager.FetchMembers(Request.FetchPaging()), JsonRequestBehavior.AllowGet);

        public ActionResult GetById(string code) => Json(MembersManager.GetMemberById(code.DecodeQueryString().ToInt64()), JsonRequestBehavior.AllowGet);

        public ActionResult ActiveInActive(string code, string IsDoActive) => Json(MembersManager.IsActiveInActive(code.DecodeQueryString().ToInt64(), Convert.ToBoolean(IsDoActive) ? false : true), JsonRequestBehavior.AllowGet);
        public JsonResult MemberDetailById(string MemberId)
        {
            Int64 memberId = Convert.ToInt64(MemberId.DecodeQueryString());
            Message msg = MembersManager.GetMemberDetailById(memberId);
            return Json(msg, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Documents()
        {
            return View();
        }
        public JsonResult DocumentList()
        {
            Message msg = MembersManager.DocumentList();
            if (msg == null)
            {
                msg = new Message();
            }
            return Json(msg, JsonRequestBehavior.AllowGet);
        }
    }
}