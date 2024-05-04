using Marryme.BAL.ViewModels;
using Marryme.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Marryme.BAL.MarrymeClientManager
{
    public class ProfileRequirementManager
    {
        private static readonly MarrymeEntities db = new MarrymeEntities();
        #region new functionality
        public static Message FetchAllCRList()
        {
            Message msg = new Message();
            try
            {
                List<GetAllCRList_Result> categories = db.GetAllCRList().ToList();
                var groups = categories.GroupBy(x => x.Title, (key, g) => new { Title = key, Categories = g });
                msg.Data = groups;
                msg.Success = true;
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
        public static Message PartnerCatagoryCheck(string status, int Id, long memberId)
        {
            Message msg = new Message();
            try
            {
                //Logic for Partner Catgory Checkbox Detail
                PartnerCategoryResult partnerCatgory = db.PartnerCategoryResults.FirstOrDefault(s => s.CR_ListId == Id && s.MemberId == memberId);
                if (partnerCatgory == null)
                {
                    partnerCatgory = new PartnerCategoryResult
                    {
                        MemberId = memberId
                    };
                    partnerCatgory.CR_ListId = Id;
                    db.PartnerCategoryResults.Add(partnerCatgory);
                    db.SaveChanges();
                }
                msg.Success = true;
                msg.Detail = "Partner catagory Detail Saved Successfully.";
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("Client/MemberManger/ProfileRequirement Partnercatagory");
            }
            return msg;
        }
        public static Message PartnerCategoryGetById(Int64 memberId)
        {
            Message msg = new Message();
            try
            {
                var pDetail = db.FetchPartnerCategoriesByMemberId(memberId);
                //pDetail.LanguageTypeCode = Convert.ToString(pDetail.LanguageId);
                msg.Data = pDetail;
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("Client/PersonalDetailManager/PersonalInfoDetailGetById");
            }
            return msg;
        }
        #region Partner categories
        public static Message SavePartnerStatusAndEducation(AllCategory model, int MemberId)
        {
            Message msg = new Message();
            try
            {
                ;
                List<PartnerCategoryResult> PartnerCatgoryDetail = new List<PartnerCategoryResult>();

                // Partner Marital  Level Status Save
                List<PartnerCategoryResult> categories = db.PartnerCategoryResults.Where(s => s.MemberId == MemberId).ToList();
                if (categories.Count > 0) db.PartnerCategoryResults.RemoveRange(categories);
                List<long> numArray = new List<long>();
                numArray.AddRange(model.EducationLevels.Where(x => x.Status == "True").Select(y => y.ID).ToList());
                numArray.AddRange(model.MaritalStatus.Where(x => x.Status == "True").Select(y => y.ID).ToList());
                numArray.AddRange(model.PhysicalStatus.Where(x => x.Status == "True").Select(y => y.ID).ToList());
                numArray.AddRange(model.BodyType.Where(x => x.Status == "True").Select(y => y.ID).ToList());
                numArray.AddRange(model.Complexion.Where(x => x.Status == "True").Select(y => y.ID).ToList());
                numArray.AddRange(model.FamilyValue.Where(x => x.Status == "True").Select(y => y.ID).ToList());
                numArray.AddRange(model.FamilyType.Where(x => x.Status == "True").Select(y => y.ID).ToList());
                numArray.AddRange(model.FamilyStatus.Where(x => x.Status == "True").Select(y => y.ID).ToList());
                numArray.AddRange(model.Religion.Where(x => x.Status == "True").Select(y => y.ID).ToList());
                numArray.AddRange(model.Others.Where(x => x.Status == "True").Select(y => y.ID).ToList());
                numArray.AddRange(model.Employment.Where(x => x.Status == "True").Select(y => y.ID).ToList());
                numArray.AddRange(model.Sect.Where(x => x.Status == "True").Select(y => y.ID).ToList());

                if (numArray.Count() > 0)
                {
                    for (int i = 0; i < numArray.Count(); i++)
                    {
                        var detail = new PartnerCategoryResult
                        {
                            MemberId = MemberId,
                            CR_ListId = numArray[i]

                        };
                        PartnerCatgoryDetail.Add(detail);
                    }
                    db.PartnerCategoryResults.AddRange(PartnerCatgoryDetail);
                    db.SaveChanges();
                }
                MemberPreferrdLocation location = db.MemberPreferrdLocations.Where(s => s.MemberId == MemberId).FirstOrDefault();
                if (location != null)
                {
                    location.Countries = model.SelectedCountry;
                    location.States = model.SelectedState;
                    location.Cities = model.SelectedCity;
                    db.SaveChanges();
                }
                else
                {
                    MemberPreferrdLocation memberPreferrd = new MemberPreferrdLocation();


                    memberPreferrd.Countries = model.SelectedCountry;
                    memberPreferrd.States = model.SelectedState;
                    memberPreferrd.Cities = model.SelectedCity;
                    memberPreferrd.MemberId = MemberId;
                    db.MemberPreferrdLocations.Add(memberPreferrd);
                    db.SaveChanges();
                }
                msg.Success = true;
                msg.Detail = "Partner Catagory Saved Successfully.";
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("ProfileRequirementManager/PartnerCatagories");
            }
            return msg;
        }
        public static Message FetchCategoryByID(long memberId)
        {
            Message msg = new Message();
            try
            {
                List<long?> crListIds = db.PartnerCategoryResults.Where(s => s.MemberId == memberId).Select(x => x.CR_ListId).ToList();
                msg.Data = crListIds;
                msg.Success = true;
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("Client/MemberManger/ProfileRequirement Partnercatagory");
            }
            return msg;
        }

        public static Message FetchPartnerCatgories(long memberId)
        {
            Message msg = new Message();
            try
            {
                List<string> categoryIds = db.PartnerCategoryResults.Where(s => s.MemberId == memberId).Select(x => x.CR_ListId.ToString()).ToList();
                msg.Data = categoryIds;
                msg.Success = true;
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("Client/MemberManger/ProfileRequirement Partnercatagory");
            }
            return msg;
        }
        public static Message FetchPreferredLocationByID(long memberId)
        {
            Message msg = new Message();
            try
            {
                MemberPreferrdLocation location = db.MemberPreferrdLocations.Where(s => s.MemberId == memberId).FirstOrDefault();
                msg.Data = location;
                msg.Success = true;
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
    }
}
