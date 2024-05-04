using Marryme.BAL;
using Marryme.BAL.MarrymeAdminManager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Marryme.Admin.Controllers
{
    public class ContactUsController : Controller
    {
        // GET: ContactUs
        public ActionResult GetContactUs()
        {
            return View();
        }
        public JsonResult Fetch()
        {
            return Json(ContactUsManager.Fetch(Request.FetchPaging()), JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetById(string code)
        {
            return Json(ContactUsManager.GetById(code.DecodeQueryString().ToInt()), JsonRequestBehavior.AllowGet);
        }
        public JsonResult Delete(string code)
        {
            return Json(ContactUsManager.Delete(code.DecodeQueryString().ToInt()), JsonRequestBehavior.AllowGet);
        }
        public ActionResult MarkAsRead()
        {
            return Json(JsonRequestBehavior.AllowGet);
        }
    }
}