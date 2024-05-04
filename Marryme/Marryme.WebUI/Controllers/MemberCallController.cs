using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Marryme.WebUI.Controllers
{
    public class MemberCallController : Controller
    {
        // GET: MemberCall
     
        public ActionResult LiveStreaming()
        {
            if (Session["MemberId"] != null)
            {
                return View();
            }
            return RedirectToAction("Index", "Home");
        }
    }
}