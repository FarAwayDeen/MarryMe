using Marryme.BAL;
using Marryme.BAL.MarrymeClientManager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Marryme.WebUI.Controllers
{
    
    public class GenericController : Controller
    {
        #region For Pre Bind DropDowns From CR_List 
        
        public JsonResult FetchOptions(string type)
        {
            var typeId = (long)type.GetMyEnum();
            Message msg = Generic.FetchCRListByID(typeId, string.Empty);
            if (msg == null)
            {
                msg = new Message();
            }
            return Json(msg, JsonRequestBehavior.AllowGet);
        }      
        #endregion
        // GET: Generic
        public JsonResult PreBindRegisteredBy()
        {
            return Json(Generic.RegisteredBy, JsonRequestBehavior.AllowGet);
        }
        public JsonResult PreBindGender()
        {
            return Json(Generic.Gender, JsonRequestBehavior.AllowGet);
        }
        public JsonResult PreBindGender2()
        {
            return Json(Generic.Gender2, JsonRequestBehavior.AllowGet);
        }
        public JsonResult ExsitingWife()
        {
            return Json(Generic.ExsitingWife, JsonRequestBehavior.AllowGet);
        }
        public JsonResult ExsitingWifeLivingStatus()
        {
            return Json(Generic.ExsitingWifeLivingStatus, JsonRequestBehavior.AllowGet);
        }
        public JsonResult TrueFalse()
        {
            return Json(Generic.TrueFalse, JsonRequestBehavior.AllowGet);
        }
        public JsonResult PreBindLookingFor()
        {
            return Json(Generic.LookingFor, JsonRequestBehavior.AllowGet);
        }
        public JsonResult MarriageNo()
        {
            return Json(Generic.MarriageNo, JsonRequestBehavior.AllowGet);
        }
        public JsonResult WifeNo()
        {
            return Json(Generic.WifeNo, JsonRequestBehavior.AllowGet);
        }
        public JsonResult PreBindMaritalStatusForMale()
        {
            return Json(Generic.MaritalStatusMale, JsonRequestBehavior.AllowGet);
        }
        public JsonResult PreBindEductionLevel()
        {
            return Json(Generic.EducationLevel, JsonRequestBehavior.AllowGet);
        }
        public JsonResult PreBindMaritalStatusForFemale()
        {
            return Json(Generic.MaritalStatusFemale, JsonRequestBehavior.AllowGet);
        }
        public JsonResult PreBindMaritalStatusForMaleFemale()
        {
            return Json(Generic.MaritalStatusMaleFemale, JsonRequestBehavior.AllowGet);
        }
        public JsonResult PreBindDay()
        {
            return Json(Generic.Day, JsonRequestBehavior.AllowGet);
        }
        public JsonResult PreBindMonth()
        {
            return Json(Generic.Month, JsonRequestBehavior.AllowGet);
        }
        public JsonResult PreBindYear()
        {
            return Json(Generic.Year, JsonRequestBehavior.AllowGet);
        }
        public JsonResult PreBindCountryLivingIn()
        {
            return Json(Generic.PreBindCountryLivingIn, JsonRequestBehavior.AllowGet);
        }
        public JsonResult PreBindCountries()
        {
            return Json(Generic.PreBindCountries, JsonRequestBehavior.AllowGet);
        }
        public JsonResult PreBindCities(string stateId)
        {
            return Json(Generic.PreBindCities(stateId), JsonRequestBehavior.AllowGet);
        }
        public JsonResult PreBindStates(string countryId)
        {            
            return Json(Generic.PreBindStates(countryId), JsonRequestBehavior.AllowGet);
        }
        public JsonResult PreBindStatesForReligius(string countryCodeId)
        {
            return Json(Generic.PreBindStates(countryCodeId), JsonRequestBehavior.AllowGet);
        }
        public JsonResult PreBindReligions()
        {
            return Json(Generic.PreBindReligion, JsonRequestBehavior.AllowGet);
        }
        public JsonResult DocDropdownList()
        {
            return Json(Generic.DocDropdownList, JsonRequestBehavior.AllowGet);
        }
        public JsonResult PreBindHeight()
        {
            return Json(Generic.Height, JsonRequestBehavior.AllowGet);
        }
        public JsonResult PreBindWeight()
        {
            return Json(Generic.Weight, JsonRequestBehavior.AllowGet);
        }
        public JsonResult PreBindAge()
        {
            return Json(Generic.Age, JsonRequestBehavior.AllowGet);
        }
        public JsonResult PreBindNoOfChild()
        {
            return Json(Generic.NoOfChild, JsonRequestBehavior.AllowGet);
        }
        public JsonResult PreBindPhysicalStatus()
        {
            return Json(Generic.PhysicalStatus, JsonRequestBehavior.AllowGet);
        }
        public JsonResult PreBindEmployedIn()
        {
            return Json(Generic.EmployedIn, JsonRequestBehavior.AllowGet);
        }
        public JsonResult PreBindCurrencySimbals()
        {
            return Json(Generic.CurrencySimbals, JsonRequestBehavior.AllowGet);
        }
        public JsonResult PreBindFamilyValue()
        {
            return Json(Generic.FamilyValue, JsonRequestBehavior.AllowGet);
        }
        public JsonResult PreBindFamilyType()
        {
            return Json(Generic.FamilyType, JsonRequestBehavior.AllowGet);
        }
        public JsonResult PreBindFamilyStatus()
        {
            return Json(Generic.FamilyStatus, JsonRequestBehavior.AllowGet);
        }
        public JsonResult PreBindReligion()
        {
            return Json(Generic.Religion, JsonRequestBehavior.AllowGet);
        }
        public JsonResult PreBindSect()
        {
            return Json(Generic.Sect, JsonRequestBehavior.AllowGet);
        }
        public JsonResult PreBindBodyType()
        {
            return Json(Generic.BodyType, JsonRequestBehavior.AllowGet);
        }
        public JsonResult PreBindComplexion()
        {
            return Json(Generic.Complexion, JsonRequestBehavior.AllowGet);
        }
        public JsonResult PreBindSmokingHabit()
        {
            return Json(Generic.SmokingHabits, JsonRequestBehavior.AllowGet);
        }
        public JsonResult PreBindLanguages()
        {
            return Json(Generic.PreBindLanguages(), JsonRequestBehavior.AllowGet);
        }
        public JsonResult FetchFieldPermissions()
        {
            Message msg;
            if (Session["FieldPermissionList"] == null)
            {
                msg = FieldPermissionManager.GetActiveSections((Session["MemberId"].ToInt64().IsNullOrZero() ? 0 : Session["MemberId"].ToInt64()));
            }
            else
            {
                msg = (Message)Session["FieldPermissionList"];
            }
            return Json(msg, JsonRequestBehavior.AllowGet);
        }
    }
}