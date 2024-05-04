using Marryme.BAL;
using Marryme.BAL.MarrymeClientManager;
using Marryme.BAL.ViewModels;
using Marryme.DAL;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Marryme.WebUI.Controllers
{
    [SessionTimeout]
    public class MemberController : Controller
    {
        // GET: Member         
        public ActionResult ProfileWizard()
        {
            return View();
        }
        public ActionResult MyMatches()
        {
            return View();
        }
        public ActionResult ProfileRequirement()
        {
            return View();
        }        
        public ActionResult MemberDetail()
        {
            return View();
        }
        public ActionResult UploadDocs()
        {
            return View();
        }
        public ActionResult DocumentList()
        {
            return View();
        }
        public ActionResult ChangePassword()
        {
            return View();
        }
        //public JavaScriptResult Doclist()
        //{
        //    Message msg = MemberManger.Doclist();
        //    return Json(msg, JsonRequestBehavior.AllowGet);
        //}
        public JsonResult DeleteImage(string docId)
        {
            var documentId = Convert.ToInt32(docId);
            var MemberId = Convert.ToInt32(Session["MemberId"]);
            return Json(MemberManger.DeleteImage(MemberId, documentId), JsonRequestBehavior.AllowGet);
        }
        public JsonResult MemberDetailById(string MemberId)
        {
            Int64 memberId = Convert.ToInt64(MemberId.DecodeQueryString());
            Message msg = MemberManger.GetMemberDetailById(memberId);
            return Json(msg, JsonRequestBehavior.AllowGet);
        }
        //public JsonResult ViewPhone(string memberId)
        //{
        //    return Json(MemberManger.ViewPhone(memberId.DecodeQueryString().ToInt64(),Session["MemberId"].ToInt64()), JsonRequestBehavior.AllowGet);
        //}
        public ActionResult WifeDetail()
        {
            return View();
        }
        [HttpPost]
        public JsonResult SaveWifeDetail()
        {
            var member = Request.Unvalidated.Form["WifeDetail"].ToString().Deserialize<ExsitingWifeDetailVM>();
            member.MemberId = Convert.ToInt32(Session["MemberId"]);
            return Json(ExsitingWifeDetailManager.SaveWifeDetail(member), JsonRequestBehavior.AllowGet);

        }
        //[HttpPost]
        //public JsonResult SaveKidzDetail(List<WifeKidzDetailVM> member)
        //{
        //    //var member = Request.Unvalidated.Form["WifeKidsDetail"].ToString().Deserialize<WifeKidzDetailVM>();
        //    int MemberId = Convert.ToInt32(Session["MemberId"]);
        //    return Json(ExsitingWifeDetailManager.SaveKidzDetail(member, MemberId), JsonRequestBehavior.AllowGet);

        //}
       
      
        [HttpPost]
        public JsonResult FetchWifeDetailById()
        {
            Int64 memberId = Convert.ToInt64(Session["MemberId"]);
            Message msg = ExsitingWifeDetailManager.WifeDetailGetById(memberId);
            if (msg == null)
            {
                msg = new Message();
            }
            return Json(msg, JsonRequestBehavior.AllowGet);
        }

        public JsonResult FetchWifeDetailById(int ExsitingWife)
        {
            Int64 memberId = Convert.ToInt64(Session["MemberId"]);
            Message msg = ExsitingWifeDetailManager.WifeDetailGetBy_ExistingWifeNo(memberId, ExsitingWife);
            if (msg == null)
            {
                msg = new Message();
            }
            return Json(msg, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult FetchWifeKidzDetailById()
        {
            Int64 memberId = Convert.ToInt64(Session["MemberId"]);
            Message msg = ExsitingWifeDetailManager.WifeKidsDetailGetById(memberId);
            if (msg == null)
            {
                msg = new Message();
            }
            return Json(msg, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult FetchWifeKidzDetailById(int ExsitingWife)
        {
            Int64 memberId = Convert.ToInt64(Session["MemberId"]);
            Message msg = ExsitingWifeDetailManager.WifeKidsDetailGet_ByWifeNo(memberId,ExsitingWife);
            if (msg == null)
            {
                msg = new Message();
            }
            return Json(msg, JsonRequestBehavior.AllowGet);
        }
        public ActionResult MarriagePolicy()
        {
            return View();
        }
        public ActionResult DivorcePolicy()
        {
            return View();
        }
        public ActionResult AcceptanceCriteria()
        {
            return View();
        }
        public JsonResult AcceptanceQuestionList()
        {
            long memberId = 0;
            string memberGender = "";
            if (Session["MemberId"] != null)
            {
                memberId = Convert.ToInt64(Session["MemberId"]);
                memberGender = Convert.ToString(Session["Gender"]);
            }
            return Json(AcceptanceCriteriaManager.AcceptanceQuestionList(memberId), JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult SaveCriteria()
        {
            var member = Request.Unvalidated.Form["Acceptance"].ToString().Deserialize<AcceptanceCriteriaVM>();
            member.MemberId = Convert.ToInt32(Session["MemberId"]);
            return Json(AcceptanceCriteriaManager.SaveCriteria(member), JsonRequestBehavior.AllowGet);
           
        }        
        public JsonResult FetchAcceptanceCriteriaById()
        {
            Int64 memberId = Convert.ToInt64(Session["MemberId"]);
            Message msg = AcceptanceCriteriaManager.AcceptanceCriteriaGetById(memberId);
            if (msg == null)
            {
                msg = new Message();
            }
            return Json(msg, JsonRequestBehavior.AllowGet);
        }
        public JsonResult PersonalInfo()
        {
            var member = Request.Unvalidated.Form["PersonalInfo"].ToString().Deserialize<MemberRegistration>();
            member.Id = Convert.ToInt32(Session["MemberId"]);
            member.Email = Convert.ToString(Session["Email"]);
            return Json(MemberManger.PersonalInfo(member, Request.Files["Image"]), JsonRequestBehavior.AllowGet);
        }
        public JsonResult DocFile()
        {
            var member = Request.Unvalidated.Form["UploadDocs"].ToString().Deserialize<UploadDocumentsVM>();
            member.MemberId = Convert.ToInt32(Session["MemberId"]);
            return Json(MemberManger.DocFile(member, Request.Files["Image"]), JsonRequestBehavior.AllowGet);
        }
        public JsonResult DocumentListById()
        {
            Int64 memberId = Convert.ToInt64(Session["MemberId"]);
            Message msg = MemberManger.DocumentListById(memberId);
            if (msg == null)
            {
                msg = new Message();
            }
            return Json(msg, JsonRequestBehavior.AllowGet);
        }
        public JsonResult PersonalInfoGetById()
        {
            Int64 memberId = Convert.ToInt64(Session["MemberId"]);
            Message msg = MemberManger.PersonalInfoGetById(memberId);
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
        public JsonResult EducationInfo()
        {
            var member = Request.Unvalidated.Form["EducationInfo"].ToString().Deserialize<MemberEducationDetail>();
            member.MemberId = Convert.ToUInt32(Session["MemberId"]);
            return Json(EducationManager.EducationInfo(member), JsonRequestBehavior.AllowGet);
        }
        public JsonResult FetchProfileEducationDetail()
        {
            Int64 memberId = Convert.ToInt64(Session["MemberId"]);
            Message msg = EducationManager.FetchProfileEducationDetail(memberId);
            if (msg == null)
            {
                msg = new Message();
            }
            return Json(msg, JsonRequestBehavior.AllowGet);
        }
        public JsonResult FamilyInfo(MemberFamilyDetail model)
        {
            var member = Request.Unvalidated.Form["FamilyInfo"].ToString().Deserialize<MemberFamilyDetail>();
            member.MemberId = Convert.ToUInt32(Session["MemberId"]);
            return Json(FamilyManager.FamilyInfo(member), JsonRequestBehavior.AllowGet);
        }
        public JsonResult FetchProfileFamilyDetail()
        {
            Int64 memberId = Convert.ToInt64(Session["MemberId"]);
            Message msg = FamilyManager.FetchProfileFamilyDetail(memberId);
            if (msg == null)
            {
                msg = new Message();
            }
            return Json(msg, JsonRequestBehavior.AllowGet);
        }
        public JsonResult ReligiousInfo()
        {
            var member = Request.Unvalidated.Form["ReligiousInfo"].ToString().Deserialize<MemberReligiousDetail>();
            member.MemberId = Convert.ToUInt32(Session["MemberId"]);
            return Json(ReligiousManager.ReligiousInfo(member), JsonRequestBehavior.AllowGet);
        }
        public JsonResult FetchProfileReligiousDetail()
        {
            Int64 memberId = Convert.ToInt64(Session["MemberId"]);
            Message msg = ReligiousManager.FetchProfileReligiousDetail(memberId);
            if (msg == null)
            {
                msg = new Message();
            }
            return Json(msg, JsonRequestBehavior.AllowGet);
        }
        public JsonResult PersonalDetail()
        {
            var member = Request.Unvalidated.Form["PersonalDetail"].ToString().Deserialize<MemberAppearance>();
            member.MemberId = Convert.ToUInt32(Session["MemberId"]);
            return Json(PersonalDetailManager.PersonalDetail(member), JsonRequestBehavior.AllowGet);
        }
        public JsonResult FetchPersonalInfoDetailById()
        {
            Int64 memberId = Convert.ToInt64(Session["MemberId"]);
            Message msg = PersonalDetailManager.PersonalInfoDetailGetById(memberId);
            if (msg == null)
            {
                msg = new Message();
            }
            return Json(msg, JsonRequestBehavior.AllowGet);
        }
        public JsonResult FetchPartnerCategoryById()
        {
            Int64 memberId = Convert.ToInt64(Session["MemberId"]);
            Message msg = ProfileRequirementManager.PartnerCategoryGetById(memberId);
            if (msg == null)
            {
                msg = new Message();
            }
            return Json(msg, JsonRequestBehavior.AllowGet);
        }
        public JsonResult AboutMe()
        {
            var member = Request.Unvalidated.Form["AboutMe"].ToString().Deserialize<MemberRegistration>();
            member.Id = Convert.ToUInt32(Session["MemberId"]);
            return Json(AboutmeManager.AboutMe(member), JsonRequestBehavior.AllowGet);
        }
        public JsonResult FetchProfileAboutMeDetailById()
        {
            Int64 memberId = Convert.ToInt64(Session["MemberId"]);
            Message msg = AboutmeManager.GetById(memberId);
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
        public JsonResult PreBindMemberList(int? pageindex, int? pagesize, string search, string gender, int? country, int? relegion, string maritalStatus)
        {
            long memberId = 0;
            if (Session["MemberId"] != null)
            {
                memberId = Convert.ToInt64(Session["MemberId"]);
            }
            if (gender.Equals(Gender2.All.ToString()))
            {
                gender = string.Empty;
            }
            return Json(MemberManger.PreBindMemberList(pageindex, pagesize, search, gender, country, relegion, maritalStatus, memberId), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult PreBindMyMatches(int? pageindex, int? pagesize, SearchFilterPrams data )
        {
            long memberId = memberId = Convert.ToInt64(Session["MemberId"]); ;
            var Gen = Convert.ToString(Session["Gender"]);
            

            return Json(MemberManger.PreBindMyMatches(pageindex,pagesize, memberId,data), JsonRequestBehavior.AllowGet);
        }
        public JsonResult PreBindBestMatches()
        {
            long memberId = 0;
            var Gen = Convert.ToString(Session["Gender"]);
            if (Session["MemberId"] != null)
            {
                memberId = Convert.ToInt64(Session["MemberId"]);
            }            
            return Json(BestMatchesManager.PreBindBestMatches(memberId), JsonRequestBehavior.AllowGet);
        }
        public ActionResult MemberList()
        {
            return View();
        }
        
       
        [HttpPost]
        public JsonResult PartnerCatagoryCheck(string status, int Id)
        {
            //var member = Request.Unvalidated.Form["PartnerCategory"].ToString().Deserialize<PartnerCategories>();
            //member.MemberId = Convert.ToUInt32(Session["MemberId"]);
            //return Json(ProfileRequirementManager.PartnerCatagoryCheck(member), JsonRequestBehavior.AllowGet);
            long memberId = 0;
            if (Session["MemberId"] != null)
            {
                memberId = Convert.ToInt64(Session["MemberId"]);
            }

            return Json(ProfileRequirementManager.PartnerCatagoryCheck(status, Id, memberId), JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult WifeNoCheck(string status, int Id)
        {
            //var member = Request.Unvalidated.Form["PartnerCategory"].ToString().Deserialize<PartnerCategories>();
            //member.MemberId = Convert.ToUInt32(Session["MemberId"]);
            //return Json(ProfileRequirementManager.PartnerCatagoryCheck(member), JsonRequestBehavior.AllowGet);
            long memberId = 0;
            if (Session["MemberId"] != null)
            {
                memberId = Convert.ToInt64(Session["MemberId"]);
            }

            return Json(ProfileRequirementManager.PartnerCatagoryCheck(status, Id, memberId), JsonRequestBehavior.AllowGet);
        }

        #region Divorce/Khula Policy
        [HttpPost]
        public JsonResult SaveDivorcePolicy()
        {
            var member = Request.Unvalidated.Form["Policy"].ToString().Deserialize<DivorcePolicyVM>();
            member.MemberId = Convert.ToInt32(Session["MemberId"]);
            return Json(DivorcePolicyManager.SaveDivorcePolicy(member), JsonRequestBehavior.AllowGet);

        }
        public JsonResult DivorcePolicyFetchById(string option)
        {
            Int64 memberId = Convert.ToInt64(Session["MemberId"]);
            Message msg = DivorcePolicyManager.DivorcePolicyFetchById(memberId, option);
            if (msg == null)
            {
                msg = new Message();
            }
            return Json(msg, JsonRequestBehavior.AllowGet);
        }
        #endregion
        #region Profile Requirement Page
        #region Partner categories       
        [HttpPost]
        public JsonResult SavePartnerStatusAndEducation(AllCategory model)
        {            
            int MemberId = Convert.ToInt32(Session["MemberId"]);            
            return Json(ProfileRequirementManager.SavePartnerStatusAndEducation(model, MemberId), JsonRequestBehavior.AllowGet);

        }    
        public JsonResult FetchSelectedCategories()
        {
            Int64 memberId = Convert.ToInt64(Session["MemberId"]);
            Message msg = ProfileRequirementManager.FetchCategoryByID(memberId);
            if (msg == null)
            {
                msg = new Message();
            }
            return Json(msg, JsonRequestBehavior.AllowGet);
        }
        public JsonResult FetchPreferredLocation()
        {
            Int64 memberId = Convert.ToInt64(Session["MemberId"]);
            Message msg = ProfileRequirementManager.FetchPreferredLocationByID(memberId);
            if (msg == null)
            {
                msg = new Message();
            }
            return Json(msg, JsonRequestBehavior.AllowGet);
        }
        #endregion
        #endregion
    }
}