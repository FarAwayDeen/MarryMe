using Marryme.BAL.ViewModels;
using Marryme.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Marryme.BAL.MarrymeClientManager
{
    public class ExsitingWifeDetailManager
    {
        private static readonly MarrymeEntities db = new MarrymeEntities();
        public static Message SaveWifeDetail(ExsitingWifeDetailVM model)
        {
            Message msg = new Message();
            try
            {
                WifeDetailResult Detail = db.WifeDetailResults.Where(s => s.MemberId == model.MemberId && s.ExsitingWife == model.ExsitingWife).FirstOrDefault();
                if (Detail == null)
                {
                    Detail = new WifeDetailResult
                    {
                        MemberId = model.MemberId,
                        HaveWife = model.HaveWife,
                        WifeAge = model.Age,
                        EducationLevelId = model.EducationLevelId,
                        ExsitingWife = model.ExsitingWife,
                        WifeJob = model.Job,
                        WifeKids = model.Kids,
                        WifeLocation = model.Location,
                        MarriageYear = model.MarriageYear,
                        WifeReligion = model.Religion
                    };
                    db.WifeDetailResults.Add(Detail);
                    db.SaveChanges();
                }
                else if (Detail != null)
                {
                    //Detail.ExsitingWife = model.ExsitingWife;
                    Detail.HaveWife = model.HaveWife;
                    Detail.MarriageYear = model.MarriageYear;
                    Detail.WifeAge = model.Age;
                    Detail.EducationLevelId = model.EducationLevelId;
                    Detail.WifeJob = model.Job;
                    Detail.WifeKids = model.Kids;
                    Detail.WifeLocation = model.Location;
                    Detail.WifeReligion = model.Religion;
                    Detail.LivingStatus = model.LivingStatus;
                    db.SaveChanges();
                }
                //model.WifeKidzDetails.ForEach(x => { x.MemberId = model.MemberId; x.ExistingWife = model.ExsitingWife; });
                bool result = SaveKidzDetail(model.WifeKidzDetails, model.MemberId, model.ExsitingWife);
                msg.Success = true;
                msg.Detail = "Wife Detail Saved Successfully.";
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("WifeDetailManager/WifeDetail");
            }
            return msg;
        }

        public static Boolean SaveKidzDetail(List<WifeKidzDetailVM> model, int memberId, byte? exsitingWife)
        {
            Message msg = new Message();
            try
            {
                List<ExisitingKidsDetailResult> Detail = db.ExisitingKidsDetailResults.Where(x => x.MemberId == memberId && x.ExistingWife == exsitingWife).ToList();
                List<ExisitingKidsDetailResult> lstDetail = new List<ExisitingKidsDetailResult>();
                if (Detail.Count >0) db.ExisitingKidsDetailResults.RemoveRange(Detail);
                foreach (var item in model)
                {
                    var detail = new ExisitingKidsDetailResult
                    {
                        MemberId = memberId,
                        ExistingWife = exsitingWife,
                        KidAge = item.Age,
                        KidGender = item.Gender,
                        KidLocation = item.Location,
                        KidMaritalStatus = item.Status
                    };
                    lstDetail.Add(detail);
                }

                db.ExisitingKidsDetailResults.AddRange(lstDetail);
                int result = db.SaveChanges();
                return result > 0 ? true : false;
                //if (Detail == null)
                //{

                //}
                //else if (Detail != null)
                //{
                //    Detail.ExsitingWife = model.ExsitingWife;
                //    Detail.HaveWife = model.HaveWife;
                //    Detail.MarriageYear = model.MarriageYear;
                //    Detail.WifeAge = model.Age;
                //    Detail.WifeEducation = model.Education;
                //    Detail.WifeJob = model.Job;
                //    Detail.WifeKids = model.Kids;
                //    Detail.WifeLocation = model.Location;
                //    Detail.WifeReligion = model.Religion;
                //    db.SaveChanges();
                //}

                msg.Success = true;
                msg.Detail = "Existing Kidz Detail Saved Successfully.";
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("WifeDetailManager/WifeKidzDetail");
            }
            return true;
        }
        public static Message WifeKidsDetailGetById(Int64 memberId)
        {
            Message msg = new Message();
            try
            {
                List<FetchWifeKidsDetailByMemberId_Result> wifeKidzDetais= db.FetchWifeKidsDetailByMemberId(memberId).ToList();
                List<WifeKidzDetailVM> kidsDetail = new List<WifeKidzDetailVM>();
                foreach (var item in wifeKidzDetais)
                {
                    WifeKidzDetailVM wifeKid = new WifeKidzDetailVM
                    {
                        MemberId = item.MemberId,
                       ExistingWife = item.ExistingWife,
                        Age = item.KidAge,
                        Gender = item.KidGender,
                        Location = item.KidLocation,
                        Status = item.KidMaritalStatus
                    };
                    kidsDetail.Add(wifeKid);
                }
               
                msg.Data = kidsDetail;
                msg.Success = true;
                msg.Detail = "Wife Detail Fected Successfully!";
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("Client/PersonalDetailManager/PersonalInfoDetailGetById");
            }
            return msg;
        }
        public static Message WifeDetailGetById(Int64 memberId)
        {
            Message msg = new Message();
            try
            {
                var wifeDetailById = db.FetchWifeDetailByMemberId(memberId).FirstOrDefault();
                //pDetail.LanguageTypeCode = Convert.ToString(pDetail.LanguageId);
                msg.Data = wifeDetailById;
                msg.Success = true;
                msg.Detail = "Wife Detail Fected Successfully!";
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("Client/PersonalDetailManager/PersonalInfoDetailGetById");
            }
            return msg;
        }
        public static Message WifeDetailGetBy_ExistingWifeNo(Int64 memberId,int WifeNo)
        {
            Message msg = new Message();
            try
            {
                var wifeDetailById = db.FetchWifeDetailByMemberId(memberId).Where(x=> x.ExsitingWife == WifeNo).FirstOrDefault();
                //pDetail.LanguageTypeCode = Convert.ToString(pDetail.LanguageId);
                msg.Data = wifeDetailById != null ? wifeDetailById : new FetchWifeDetailByMemberId_Result();
                msg.Success = true;
                msg.Detail = "Wife Detail Fected Successfully!";
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("Client/PersonalDetailManager/PersonalInfoDetailGetById");
            }
            return msg;
        }
        public static Message WifeKidsDetailGet_ByWifeNo(Int64 memberId,int WifeNo)
        {
            Message msg = new Message();
            try
            {
                List<FetchWifeKidsDetailByMemberId_Result> wifeKidzDetais = db.FetchWifeKidsDetailByMemberId(memberId).Where(x=>x.ExistingWife == WifeNo).ToList();
                List<WifeKidzDetailVM> kidsDetail = new List<WifeKidzDetailVM>();
                foreach (var item in wifeKidzDetais)
                {
                    WifeKidzDetailVM wifeKid = new WifeKidzDetailVM
                    {
                        MemberId = item.MemberId,
                        ExistingWife = item.ExistingWife,
                        Age = item.KidAge,
                        Gender = item.KidGender,
                        Location = item.KidLocation,
                        Status = item.KidMaritalStatus
                    };
                    kidsDetail.Add(wifeKid);
                }

                msg.Data = kidsDetail;
                msg.Success = true;
                msg.Detail = "Wife Detail Fected Successfully!";
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("Client/PersonalDetailManager/PersonalInfoDetailGetById");
            }
            return msg;
        }
    }
}
