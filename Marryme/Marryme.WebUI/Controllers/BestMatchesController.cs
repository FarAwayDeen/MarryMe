using Marryme.BAL.MarrymeClientManager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Marryme.WebUI.Controllers
{
    public class BestMatchesController : Controller
    {
        // GET: BestMatches
        public JsonResult FetchBestMatches()
        {
            long memberId = 0;
            if (Session["MemberId"] != null)
            {
                memberId = Convert.ToInt64(Session["MemberId"]);
            }
            return Json(BestMatchesManager.PreBindMemberList(memberId), JsonRequestBehavior.AllowGet);
        }
    }
}