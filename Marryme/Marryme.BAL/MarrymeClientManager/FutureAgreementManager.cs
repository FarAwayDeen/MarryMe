using Marryme.BAL.ViewModels;
using Marryme.DAL;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Marryme.BAL.MarrymeClientManager
{
    public class FutureAgreementManager
    {
        private static readonly MarrymeEntities db = new MarrymeEntities();
        //Profile Requirement Main Heading list
        #region Future Agreement 
        public static Message FetchFacilities(string gender)
        {
            Message msg = new Message();
            try
            {
                SqlParameter param = new SqlParameter("facilityFor", gender);
                if (gender.ToLower() == "female")
                {
                    msg.Data = db.Database.SqlQuery<FetchFacilities_ResultVM>("FetchFacilities @facilityFor", param).ToList();
                    msg.key = gender;
                }
                else
                {
                    msg.Data = db.Database.SqlQuery<FetchFacilities_Result>("FetchFacilities @facilityFor", param).ToList();
                    msg.key = gender;
                }

                //var womanFacilitieslist = db.FetchFacilities(Convert.ToString(gender)).ToList();              
            }
            catch (Exception ex)
            {

            }
            return msg;
        }
        public static Message FetchFacilitiesResultById(long memberId, string gender)
        {
            Message msg = new Message();
            try
            {
                if (gender == "Male")
                {
                    List<long?> manFacilitieslist = db.FacilitiesResultMales.Where(x => x.MemberId == memberId).Select(x => x.FacilityId).ToList();
                    msg.Data = manFacilitieslist;
                }
                else
                {
                    List<FacilitiesResultFemale> feMaleFacilitieslist = db.FacilitiesResultFemales.Where(x => x.MemberId == memberId).ToList();
                    msg.Data = feMaleFacilitieslist;
                }
            }
            catch (Exception ex)
            {

            }
            return msg;
        }
        public static Message SaveFacilitiesForMan(List<FacilitiesForManVM> model, long memnerId, string gender)
        {
            if (gender == "Male")
            {
                List<FacilitiesResultMale> dbExistingFacilities = db.FacilitiesResultMales.Where(item => item.MemberId == memnerId).ToList();
                if (dbExistingFacilities.Count() > 0) db.FacilitiesResultMales.RemoveRange(dbExistingFacilities);
                List<FacilitiesResultMale> facilitiesResultMales = new List<FacilitiesResultMale>();
                IEnumerable<FacilitiesForManVM> facilities = model.Where(facility => facility.Status.ToLower() == "true");
                foreach (var item in facilities)
                {
                    FacilitiesResultMale facilityResult = new FacilitiesResultMale
                    {
                        MemberId = memnerId,
                        FacilityId = item.Id,
                        CreatedDate = DateTime.Now
                    };
                    facilitiesResultMales.Add(facilityResult);
                };
                db.FacilitiesResultMales.AddRange(facilitiesResultMales);
                db.SaveChanges();
            }
            else if (gender == "Female")
            {
                List<FacilitiesResultFemale> dbExistingFacilities = db.FacilitiesResultFemales.Where(item => item.MemberId == memnerId).ToList();
                if (dbExistingFacilities.Count() > 0) db.FacilitiesResultFemales.RemoveRange(dbExistingFacilities);
                List<FacilitiesResultFemale> facilitiesResultFeMales = new List<FacilitiesResultFemale>();
                IEnumerable<FacilitiesForManVM> facilities = model.Where(facility => facility.One.ToLower() == "true" || facility.Two.ToLower() == "true"|| facility.Three.ToLower() == "true"|| facility.Four.ToLower() == "true");
                foreach (var item in facilities)
                {
                    FacilitiesResultFemale facilityResult = new FacilitiesResultFemale
                    {
                        MemberId = memnerId,
                        FacilityId = item.Id,
                        One=Convert.ToBoolean(item.One),
                        Two= Convert.ToBoolean(item.One),
                        Three= Convert.ToBoolean(item.Three),
                        Four= Convert.ToBoolean(item.Four),
                        CreatedDate = DateTime.Now
                    };
                    facilitiesResultFeMales.Add(facilityResult);
                };
                db.FacilitiesResultFemales.AddRange(facilitiesResultFeMales);
                db.SaveChanges();

            }
            Message msg = new Message();
            try
            {

                msg.Success = true;
                msg.Detail = "Facilities Saved Successfully.";
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("Client/MemberManger/ProfileRequirement Partnercatagory");
            }
            return msg;
        }
        #endregion
        public static Message PreProfileRequirementList(long memberId, bool isMobile = false)
        {
            Message msg = new Message();
            try
            {
                List<FetchProfileRequirementList_Result> profilelist = db.FetchProfileRequirementList().ToList();

                msg.Data = new
                {
                    ProfileFieldList = profilelist,
                    FieldPermissions = FieldPermissionManager.GetActiveSections(memberId).Data
                };
            }
            catch (Exception ex)
            {

            }
            return msg;
        }
        public static Message PreProfileRequirementListCheckList(long memberId, bool isMobile = false)
        {
            Message msg = new Message();
            try
            {
                List<FetchProfileRequirementCheckListResult_Result> profilelistCheckList = db.FetchProfileRequirementCheckListResult(memberId).ToList();

                msg.Data = new
                {
                    ProfileCheckList = profilelistCheckList,
                    FieldPermissions = FieldPermissionManager.GetActiveSections(memberId).Data
                };
            }
            catch (Exception ex)
            {

            }
            return msg;
        }
        //Parent Catagory Check box list
        public static Message PreProfilePartnerCatgoryList(long memberId, bool isMobile = false)
        {
            Message msg = new Message();
            try
            {
                List<FetchParentCatagoryList_Result> parentCatagorylist = db.FetchParentCatagoryList().ToList();

                msg.Data = new
                {
                    ParentCatagorylist = parentCatagorylist
                    //FieldPermissions = FieldPermissionManager.GetActiveSections(memberId).Data
                };
            }
            catch (Exception ex)
            {

            }
            return msg;
        }
        public static Message ProposalQuestionForMan()
        {
            var gender = 'M';
            Message msg = new Message();
            try
            {
                List<FetchProposalQuestions_Result> manQuestionlist = db.FetchProposalQuestions(Convert.ToString(gender)).ToList();

                msg.Data = new
                {
                    ManQuestionlist = manQuestionlist
                    //FieldPermissions = FieldPermissionManager.GetActiveSections(memberId).Data
                };
            }
            catch (Exception ex)
            {

            }
            return msg;
        }
        public static Message ProposalQuestionForWoman()
        {
            var gender = 'W';
            Message msg = new Message();
            try
            {
                List<FetchProposalQuestions_Result> womanQuestionlist = db.FetchProposalQuestions(Convert.ToString(gender)).ToList();

                msg.Data = new
                {
                    WomanQuestionlist = womanQuestionlist
                    //FieldPermissions = FieldPermissionManager.GetActiveSections(memberId).Data
                };
            }
            catch (Exception ex)
            {

            }
            return msg;
        }
        public static Message WomanrightList()
        {
            Message msg = new Message();
            try
            {
                List<FetchWomanRights_Result> womanRights = db.FetchWomanRights().ToList();

                msg.Data = new
                {
                    WomanRightsList = womanRights
                    //FieldPermissions = FieldPermissionManager.GetActiveSections(memberId).Data
                };
            }
            catch (Exception ex)
            {

            }
            return msg;
        }
        public static Message WifeNoCheck(string status, int Id, long memberId)
        {
            Message msg = new Message();
            try
            {
                //Logic for Partner Catgory Checkbox Detail
                WifeNumber wifeno = db.WifeNumbers.FirstOrDefault(s => s.ID == Id && s.MemberId == memberId);
                if (wifeno == null)
                {
                    wifeno = new WifeNumber
                    {
                        MemberId = memberId
                    };
                    wifeno.FiledStatus = status;
                    wifeno.WifeNo = Convert.ToString(Id);
                    db.WifeNumbers.Add(wifeno);
                    db.SaveChanges();
                }
                else if (wifeno != null)
                {
                    wifeno.FiledStatus = status;
                    db.SaveChanges();
                }
                msg.Success = true;
                msg.Detail = "Detail Saved Successfully.";
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("Client/MemberManger/ProfileRequirement Partnercatagory");
            }
            return msg;
        }
        public static Message SaveFacilitiesForWoman(List<FacilitiesForWomanVM> model, int MemberId, string FacilityFor)
        {
            Message msg = new Message();
            try
            {
                //List<FacilitiesResult> Detail = db.FacilitiesResults.ToList();
                //List<FacilitiesResult> lstDetail = new List<FacilitiesResult>();
                //var wifeid = model.First().WifeFacilityIds.Count();
                //string[] wifeno = model.First().WifeFacilityIds;
                //for (int i = 0; i < wifeid; i++)
                //{
                //    foreach (var item in model)
                //    {

                //        var detail = new FacilitiesResult
                //        {
                //            MemberId = MemberId,
                //            FacilityFor = FacilityFor,
                //            FacilityId = item.StatusId,
                //            FacilityResult = "true",
                //            WifeNo = wifeno[i]

                //        };
                //        lstDetail.Add(detail);
                //    }

                //}

                //db.FacilitiesResults.AddRange(lstDetail);
                //db.SaveChanges();

                msg.Success = true;
                msg.Detail = "Facilities Saved Successfully.";
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("ProfileRequirementManager/Facilities");
            }
            return msg;
        }
        public static Message SaveFacilities(string status, int Id, string wifeId, string facilityfor, long memberId)
        {
            Message msg = new Message();
            try
            {
                ////Logic for Partner Catgory Checkbox Detail
                //FacilitiesResult facilitiesForWoman = db.FacilitiesResults.FirstOrDefault(s => s.FacilityId == Id && s.MemberId == memberId);
                //if (facilitiesForWoman == null)
                //{
                //    facilitiesForWoman = new FacilitiesResult
                //    {
                //        MemberId = memberId
                //    };
                //    facilitiesForWoman.FacilityResult = status;
                //    facilitiesForWoman.FacilityId = Id;
                //    if (wifeId != null)
                //    {
                //        facilitiesForWoman.WifeNo = wifeId;
                //    }
                //    facilitiesForWoman.FacilityFor = facilityfor;
                //    db.FacilitiesResults.Add(facilitiesForWoman);
                //    db.SaveChanges();
                //}
                //else if (facilitiesForWoman != null)
                //{
                //    facilitiesForWoman.FacilityResult = status;
                //    db.SaveChanges();
                //}
                msg.Success = true;
                msg.Detail = "Facilities Saved Successfully.";
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("Client/MemberManger/ProfileRequirement Partnercatagory");
            }
            return msg;
        }
        public static Message SaveRightsForWoman(string status, int Id, long memberId)
        {
            Message msg = new Message();
            try
            {
                //Logic for Partner Catgory Checkbox Detail
                WomenRightsResult rightsForWoman = db.WomenRightsResults.FirstOrDefault(s => s.WomenRightsId == Id && s.MemberId == memberId);
                if (rightsForWoman == null)
                {
                    rightsForWoman = new WomenRightsResult
                    {
                        MemberId = memberId
                    };
                    rightsForWoman.WomenRightsResult1 = status;
                    rightsForWoman.WomenRightsId = Id;
                    db.WomenRightsResults.Add(rightsForWoman);
                    db.SaveChanges();
                }
                else if (rightsForWoman != null)
                {
                    rightsForWoman.WomenRightsResult1 = status;
                    db.SaveChanges();
                }
                msg.Success = true;
                msg.Detail = "Woman Rights Saved Successfully.";
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("Client/MemberManger/ProfileRequirement Partnercatagory");
            }
            return msg;
        }
        public static Message ProposalAnswer(string status, int Id, long memberId)
        {
            Message msg = new Message();
            try
            {
                //Logic for Partner Catgory Checkbox Detail
                ProposalQuestionsResult answerForMan = db.ProposalQuestionsResults.FirstOrDefault(s => s.ProposalQuestionsId == Id && s.MemberId == memberId);
                //new record
                if (answerForMan == null)
                {
                    answerForMan = new ProposalQuestionsResult
                    {
                        MemberId = memberId
                    };
                    answerForMan.ProposalQuestionsResult1 = status;
                    answerForMan.ProposalQuestionsId = Id;

                    //if (partnerCatgory.PartnerCategoryID.IsNullOrZero())
                    //{
                    //}
                    db.ProposalQuestionsResults.Add(answerForMan);
                    db.SaveChanges();
                }
                //update record
                else if (answerForMan != null)
                {
                    answerForMan.ProposalQuestionsResult1 = status;
                    db.SaveChanges();
                }

                msg.Success = true;
                msg.Detail = "Answered Saved Successfully.";
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("Client/MemberManger/ProfileRequirement Partnercatagory");
            }
            return msg;
        }
        public static Message MarriageDuration(string Duration, string DurationFor, long memberId)
        {
            Message msg = new Message();
            try
            {
                //Logic for Partner Catgory Checkbox Detail
                MarriageDuration duration = db.MarriageDurations.FirstOrDefault(s => s.DurationFrom == DurationFor && s.MemberId == memberId);
                //new record
                if (duration == null)
                {
                    duration = new MarriageDuration
                    {
                        MemberId = memberId
                    };
                    duration.DurationFrom = DurationFor;
                    duration.MarriageDuration1 = Duration;

                    //if (partnerCatgory.PartnerCategoryID.IsNullOrZero())
                    //{
                    //}
                    db.MarriageDurations.Add(duration);
                    db.SaveChanges();
                }
                //update record
                else if (duration != null)
                {
                    duration.MarriageDuration1 = Duration;
                    db.SaveChanges();
                }

                msg.Success = true;
                msg.Detail = "Answered Saved Successfully.";
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("Client/MemberManger/ProfileRequirement Partnercatagory");
            }
            return msg;
        }
        public static Message DivorceReason(string Question, string Reason, string DivorceDate, long memberId)
        {
            Message msg = new Message();
            try
            {

                //string date = DivorceDate.ToString("dd MMM yyyy");
                Divorce divorce = db.Divorces.FirstOrDefault(s => s.DivorceStatus == Question && s.MemberId == memberId);
                //new record
                if (divorce == null)
                {
                    divorce = new Divorce
                    {
                        MemberId = memberId
                    };
                    divorce.DivorceStatus = Question;
                    divorce.DivorceReason = Reason;
                    divorce.DivorceDate = Convert.ToDateTime(DivorceDate);

                    //if (partnerCatgory.PartnerCategoryID.IsNullOrZero())
                    //{
                    //}
                    db.Divorces.Add(divorce);
                    db.SaveChanges();
                }
                //update record
                else if (divorce != null)
                {
                    divorce.DivorceReason = Reason;
                    divorce.DivorceDate = Convert.ToDateTime(DivorceDate);
                    db.SaveChanges();
                }

                msg.Success = true;
                msg.Detail = "Divorce Reason Saved Successfully.";
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("Client/MemberManger/ProfileRequirement Partnercatagory");
            }
            return msg;
        }
    }
}
