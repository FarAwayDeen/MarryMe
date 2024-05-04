using Marryme.BAL.MarrymeClientManager;
using Marryme.BAL.ViewModels;
using Marryme.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Marryme.WebUI.Controllers
{
    [SessionTimeout]
    public class FutureAgreementController : Controller
    {
        #region Future Agreement
        public ActionResult Index()
        {
            return View();
        }
        public JsonResult FetchFacilities()
        {
            long memberId = 0;
            string memberGender = "";
            if (Session["MemberId"] != null)
            {
                memberId = Convert.ToInt64(Session["MemberId"]);
                memberGender = Convert.ToString(Session["Gender"]);
            }
            return Json(FutureAgreementManager.FetchFacilities(memberGender), JsonRequestBehavior.AllowGet);
        }
        public JsonResult FetchSelectedFacilities()
        {
            long memberId = 0;
            string memberGender = "";
            if (Session["MemberId"] != null)
            {
                memberId = Convert.ToInt64(Session["MemberId"]);
                memberGender = Convert.ToString(Session["Gender"]);
            }
            return Json(FutureAgreementManager.FetchFacilitiesResultById(memberId, memberGender), JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult SaveFacilityforWoman(string status, int Id, string wifeId)
        {
            long memberId = 0;
            string facilityfor = "W";
            if (Session["MemberId"] != null)
            {
                memberId = Convert.ToInt64(Session["MemberId"]);
            }

            return Json(FutureAgreementManager.SaveFacilities(status, Id, wifeId, facilityfor, memberId), JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult SaveFacilitiesforMan(List<FacilitiesForManVM> model)
        {
            long memberId = 0;
            string gender = "";
            if (Session["MemberId"] != null)
            {
                memberId = Convert.ToInt64(Session["MemberId"]);
               gender = Convert.ToString(Session["Gender"]);
            }

            return Json(FutureAgreementManager.SaveFacilitiesForMan(model, memberId,gender), JsonRequestBehavior.AllowGet);
        }
        #endregion

        public JsonResult FetchProfileRequirement()
        {
            long memberId = 0;
            string memberGender = "";
            if (Session["MemberId"] != null)
            {
                memberId = Convert.ToInt64(Session["MemberId"]);
                memberGender = Convert.ToString(Session["Gender"]);
            }
            return Json(FutureAgreementManager.PreProfileRequirementList(memberId), JsonRequestBehavior.AllowGet);
        }
        public JsonResult FetchProfileRequirementCheckList()
        {
            long memberId = 0;
            if (Session["MemberId"] != null)
            {
                memberId = Convert.ToInt64(Session["MemberId"]);

            }
            return Json(FutureAgreementManager.PreProfileRequirementListCheckList(memberId), JsonRequestBehavior.AllowGet);
        }
        public JsonResult FetchProfilePartnerCatgory()
        {
            long memberId = 0;
            string memberGender = "";
            if (Session["MemberId"] != null)
            {
                memberId = Convert.ToInt64(Session["MemberId"]);
                memberGender = Convert.ToString(Session["Gender"]);
            }
            return Json(FutureAgreementManager.PreProfilePartnerCatgoryList(memberId), JsonRequestBehavior.AllowGet);
        }
        public JsonResult WomanrightList()
        {
            long memberId = 0;
            string memberGender = "";
            if (Session["MemberId"] != null)
            {
                memberId = Convert.ToInt64(Session["MemberId"]);
                memberGender = Convert.ToString(Session["Gender"]);
            }
            return Json(FutureAgreementManager.WomanrightList(), JsonRequestBehavior.AllowGet);
        }
        public JsonResult ProposalQuestionForMan()
        {
            long memberId = 0;
            string memberGender = "";
            if (Session["MemberId"] != null)
            {
                memberId = Convert.ToInt64(Session["MemberId"]);
                memberGender = Convert.ToString(Session["Gender"]);
            }
            return Json(FutureAgreementManager.ProposalQuestionForMan(), JsonRequestBehavior.AllowGet);
        }
        public JsonResult ProposalQuestionForWoman()
        {
            long memberId = 0;
            string memberGender = "";
            if (Session["MemberId"] != null)
            {
                memberId = Convert.ToInt64(Session["MemberId"]);
                memberGender = Convert.ToString(Session["Gender"]);
            }
            return Json(FutureAgreementManager.ProposalQuestionForWoman(), JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult SaveFacilitiesForWoman(List<FacilitiesForWomanVM> member)
        {
            //var member = Request.Unvalidated.Form["WifeKidsDetail"].ToString().Deserialize<WifeKidzDetailVM>();
            int MemberId = Convert.ToInt32(Session["MemberId"]);
            string FacilityFor = "W";
            return Json(FutureAgreementManager.SaveFacilitiesForWoman(member, MemberId, FacilityFor), JsonRequestBehavior.AllowGet);

        }

        public JsonResult SaveRightsForWoman(string status, int Id)
        {
            long memberId = 0;
            if (Session["MemberId"] != null)
            {
                memberId = Convert.ToInt64(Session["MemberId"]);
            }

            return Json(FutureAgreementManager.SaveRightsForWoman(status, Id, memberId), JsonRequestBehavior.AllowGet);
        }
        public JsonResult ProposalAnswer(string status, int Id)
        {
            long memberId = 0;
            if (Session["MemberId"] != null)
            {
                memberId = Convert.ToInt64(Session["MemberId"]);
            }

            return Json(FutureAgreementManager.ProposalAnswer(status, Id, memberId), JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult MarriageDuration(string Duration, string DurationFor)
        {
            long memberId = 0;
            if (Session["MemberId"] != null)
            {
                memberId = Convert.ToInt64(Session["MemberId"]);
            }

            return Json(FutureAgreementManager.MarriageDuration(Duration, DurationFor, memberId), JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult DivorceReason(string Question, string Reason, string DivorceDate)
        {
            long memberId = 0;
            if (Session["MemberId"] != null)
            {
                memberId = Convert.ToInt64(Session["MemberId"]);
            }

            return Json(FutureAgreementManager.DivorceReason(Question, Reason, DivorceDate, memberId), JsonRequestBehavior.AllowGet);
        }
    }
}