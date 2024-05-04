using Marryme.BAL;
using Marryme.BAL.MarrymeAdminManager;
using Marryme.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Marryme.Admin.Controllers
{
    public class ApplicationSettingController : Controller
    {
        // GET: ApplicationSetting
        public ActionResult setup()
        {
            return View();
        }
        public JsonResult SaveUpdate()
        {
            var data = Request.Unvalidated.Form["ApplicationSetting"].ToString().Deserialize<ApplicationSetting>();
            return Json(ApplicationSettingManager.SaveUpdate(data, Request.Files["Image"]), JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetById()
        {
            return Json(ApplicationSettingManager.GetById(), JsonRequestBehavior.AllowGet);
        }
    }
}