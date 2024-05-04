using Marryme.BAL.ViewModels;
using Marryme.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace Marryme.BAL.MarrymeClientManager
{
    public class MemberManger
    {
        private static readonly MarrymeEntities db = new MarrymeEntities();
        public static string GetMemberNameById(Int64 memberId)
        {
            Message msg = new Message();
            try
            {
                return db.MemberRegistrations.FirstOrDefault(s => s.Id == memberId).Name;
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("MemberManger/GetMemberNameById");
            }
            return string.Empty;
        }
        public static string GetMemberGenderById(Int64 memberId)
        {
            Message msg = new Message();
            try
            {
                return db.MemberRegistrations.FirstOrDefault(s => s.Id == memberId).Gender;
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("MemberManger/GetMemberGenderById");
            }
            return string.Empty;
        }
        public static string GetUserRoleById(Int64 memberId)
        {
            Message msg = new Message();
            try
            {
                 long? role=  db.MemberRegistrations.FirstOrDefault(s => s.Id == memberId).UserRole;
                return ((UserRole)role).ToString();
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("MemberManger/GetMemberGenderById");
            }
            return string.Empty;
        }
        public static Message PersonalInfo(MemberRegistration model, HttpPostedFileBase file, bool isMobilePic = false)
        {

            Message msg = new Message();
            try
            {
                //Logic for member memberRegistration
                MemberRegistration memberRegistration = db.MemberRegistrations.FirstOrDefault(s => s.Id == model.Id);
                memberRegistration.NoOfChildren = model.NoOfChildren;
                memberRegistration.Subcast = model.Subcast;
                memberRegistration.Gender = model.Gender;
                memberRegistration.NoOfMarriage = model.NoOfMarriage;
                memberRegistration.Name = model.Name;
                memberRegistration.MaritalStatus = model.MaritalStatus;               

                //memberRegistration.AboutMe = model.AboutMe;

                //Logic for member apperance
                MemberAppearance memberAppearance = db.MemberAppearances.FirstOrDefault(s => s.MemberId == model.Id);
                if (memberAppearance == null)
                {
                    memberAppearance = new MemberAppearance
                    {
                        MemberId = model.Id
                    };

                }

               // memberAppearance.Height = model.Height;
                memberAppearance.PhysicalStatus = model.PhysicalStatus;
                memberAppearance.HeightUnit = model.HeightUnit;
                memberAppearance.Feet = model.Feet;
                memberAppearance.Centimeters = model.Centimeters;
                memberAppearance.Inches = model.Inches;
                if (memberAppearance.Id.IsNullOrZero())
                {
                    db.MemberAppearances.Add(memberAppearance);
                }               
                db.SaveChanges();
                if (file != null && !string.IsNullOrEmpty(file.FileName))
                {
                    if (!isMobilePic)
                    {
                        var filePath = file.UploadFile("/Images/ProfilePictures/" + model.Id + "/", model.ProfilePicPath, true, false, true);
                        db.MemberRegistrations.FirstOrDefault(s => s.Id == model.Id).ProfilePicPath = filePath.Data;
                        // db.MemberRegistrations.FirstOrDefault(s => s.Id == model.Id).ProfilePicPath = memberRegistration.ImageBase64;
                        db.MemberRegistrations.FirstOrDefault(s => s.Id == model.Id).IsMobilePic = isMobilePic;
                        db.SaveChanges();
                    }
                }
                if (!string.IsNullOrWhiteSpace(model.ImageBase64) && isMobilePic)
                {
                    db.MemberRegistrations.FirstOrDefault(s => s.Id == model.Id).ProfilePicPath = model.ImageBase64;
                    db.MemberRegistrations.FirstOrDefault(s => s.Id == model.Id).IsMobilePic = isMobilePic;
                    db.SaveChanges();
                }
                msg.Success = true;
                msg.Detail = "Personal Information Saved Successfully.";
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("Client/MemberManger/PersonalInfo");
            }
            return msg;
        }
        public static Message DocFile(UploadDocumentsVM model, HttpPostedFileBase file)
        {

            Message msg = new Message();
            try
            {
                var DocTypeID = Convert.ToInt32(model.List);
                //Logic for member memberRegistration
                UploadDocument Docs = db.UploadDocuments.FirstOrDefault(s => s.DocTypeID == DocTypeID && s.MemberId == model.MemberId);
                if (Docs != null)
                {

                    if (file != null && !string.IsNullOrEmpty(file.FileName))
                    {
                        var filePath = file.UploadFile("/Images/Documents/" + model.MemberId + "/", model.FilePath, true, false, true);
                        db.UploadDocuments.FirstOrDefault(s => s.DocTypeID == DocTypeID && s.MemberId == model.MemberId).FilePath = filePath.Data;
                        db.SaveChanges();

                    }
                }
                else
                {
                    Docs = new UploadDocument
                    {
                        MemberId = model.MemberId,
                        DocTypeID = DocTypeID
                    };
                    db.UploadDocuments.Add(Docs);
                    db.SaveChanges();
                    if (file != null && !string.IsNullOrEmpty(file.FileName))
                    {
                        var filePath = file.UploadFile("/Images/Documents/" + model.MemberId + "/", model.FilePath, true, false, true);
                        db.UploadDocuments.FirstOrDefault(s => s.DocTypeID == DocTypeID && s.MemberId == model.MemberId).FilePath = filePath.Data;
                        db.SaveChanges();

                    }
                }
                msg.Success = true;
                msg.Detail = "Document Uploaded Successfully.";
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("Client/MemberManger/DocumentUpload");
            }
            return msg;
        }
        public static Message DocumentListById(Int64 memberId)
        {
            Message msg = new Message();
            try
            {
                //Logic for get Marital Status from member registration
                //msg.Data= db.FetchProfilePersonalInfo(memberId).FirstOrDefault();
                List<FetchDucomentLisById_Result> documentList = db.FetchDucomentLisById(memberId).ToList();
                //if (isMobile)
                //{

                if (documentList != null)
                {
                    documentList.ForEach(x =>
                    {
                        x.DocName = x.DocName;
                        x.FilePath = string.Concat("/Images/Documents/" + memberId + "/" + x.FilePath);

                    });

                }

                //}
                //else
                //{
                //    prsonalInfo.ProfilePicPath = string.Concat(Static.WebSiteUrl, "/Images/ProfilePictures/" + prsonalInfo.Id + "/" + prsonalInfo.ProfilePicPath);
                //}
                msg.Success = true;
                //msg.Detail = "Document Loaded Successfully!";
                msg.Data = documentList;
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("Client/MemberManger/PersonalInfoGetById");
            }
            return msg;
        }
        public static Message DeleteImage(int MemberId, int documentId)
        {
            Message msg = new Message();
            try
            {
                var db = Static.DbContext;
                db.Configuration.ProxyCreationEnabled = false;
                db.UploadDocuments.Remove(db.UploadDocuments.FirstOrDefault(x => x.DocTypeID == documentId && x.MemberId == MemberId));
                db.SaveChanges();
                msg.Detail = "Request processed successfully.";
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Info = true;
                msg.Detail = Message.DeleteError;
                ex.LogError("/MemberManger/DocumentImage");
            }

            return msg;
        }
        public static Message PersonalInfoGetById(Int64 memberId, bool isMobile = false)
        {
            Message msg = new Message();
            try
            {
                //Logic for get Marital Status from member registration
                //msg.Data= db.FetchProfilePersonalInfo(memberId).FirstOrDefault();
                FetchProfilePersonalInfo_Result prsonalInfo = db.FetchProfilePersonalInfo(memberId).FirstOrDefault();
                //if (isMobile)
                //{
                if (prsonalInfo.IsMobilePic == true)
                {
                    prsonalInfo.ProfilePicPath = string.IsNullOrWhiteSpace(prsonalInfo.ProfilePicPath) ? string.Concat(Static.WebSiteUrl + "/", "Content/NoImage/noimage.png") : prsonalInfo.ProfilePicPath;
                }
                else
                {
                    prsonalInfo.ProfilePicPath = string.Concat(Static.WebSiteUrl, "/Images/ProfilePictures/" + prsonalInfo.Id + "/" + prsonalInfo.ProfilePicPath);
                }
                //}
                //else
                //{
                //    prsonalInfo.ProfilePicPath = string.Concat(Static.WebSiteUrl, "/Images/ProfilePictures/" + prsonalInfo.Id + "/" + prsonalInfo.ProfilePicPath);
                //}
                msg.Data = prsonalInfo;
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("Client/MemberManger/PersonalInfoGetById");
            }
            return msg;
        }
        public static Message PreBindMemberList(int? pageindex, int? pagesize, string search, string gender, int? country, int? relegion, string maritalStatus, long memberId)
        {

            Message msg = new Message();
            try
            {
                if (search == "undefined")
                {
                    search = "";
                }
                if (gender == "undefined")
                {
                    gender = "";
                }
                if (maritalStatus == "undefined")
                {
                    maritalStatus = "";
                }
                List<FetchMemberList_Result> member = db.FetchMemberList(pageindex, pagesize, search, gender, country, relegion, maritalStatus, memberId).ToList();
                member.ForEach(s =>
                {
                    s.Code = s.Id.EncodeQueryString();
                    s.ShowName = s.NickName;
                    //Old code for Full name
                    //string[] name = s.Name.Split(' ');
                    //if (name.Length > 1)
                    //{
                    //    s.ShowName = string.Concat(name[0], " ", (string.IsNullOrWhiteSpace(name[1]) ? "" : name[1].Substring(0, 1)));
                    //}
                    //else
                    //{
                    //    s.ShowName = s.Name;
                    //}
                    //s.ProfilePicPath = string.Concat("/Images/ProfilePictures/" + s.Id + "/" + s.ProfilePicPath);
                    if (s.IsMobilePic == true)
                    {
                        //    prsonalInfo.ProfilePicPath = string.IsNullOrWhiteSpace(prsonalInfo.ProfilePicPath) ? string.Concat(Static.WebSiteUrl + "/", "Content/NoImage/noimage.png") : string.Concat("/Images/ProfilePictures/" + prsonalInfo.Id + "/" + prsonalInfo.ProfilePicPath);
                        s.ProfilePicPath = string.IsNullOrWhiteSpace(s.ProfilePicPath) ? string.Concat(Static.WebSiteUrl + "/", "Content/NoImage/noimage.png") : s.ProfilePicPath;
                    }
                    else
                    {
                        s.ProfilePicPath = string.Concat(Static.WebSiteUrl, "/Images/ProfilePictures/" + s.Id + "/" + s.ProfilePicPath);
                    }
                    s.age = s.DOB != null ? Convert.ToDateTime(s.DOB).GetAge() : 0;
                    s.HighestEducation = s.HighestEducation != null ? s.HighestEducation : "N/A";
                    s.Religion = s.Religion != null ? s.Religion : "N/A";
                    //    s.Name = s.NickName ?? "N/A";
                });
                msg.Data = new
                {
                    MemberList = member,
                    totalcount = member.FirstOrDefault(s => s.totalcount > 0) == null ? 0 : member.FirstOrDefault(s => s.totalcount > 0).totalcount
                };
            }
            catch (Exception ex)
            {
                msg.Success = false;
            }
            return msg;

        }
        public static Message PreBindMyMatches(int? pageindex, int? pagesize, long memberId,SearchFilterPrams prams)
        {
            if (prams.Gender == "All") prams.Gender = "";
            int? state =string.IsNullOrEmpty(prams.StateTypeCode)?0: Convert.ToInt32(prams.StateTypeCode.DecodeQueryString());
            int? city = string.IsNullOrEmpty(prams.CityTypeCode)?0: Convert.ToInt32(prams.CityTypeCode.DecodeQueryString());
            Message msg = new Message();
            try
            {                
                List<FetchMyMatches_Result> member = db.FetchMyMatches(pageindex, pagesize,prams.Search,prams.Gender, prams.Country,state, city, prams.RelegionSect, prams.MaritalStatus, prams.Age, prams.Language, prams.kidz, prams.income, prams.Height, prams.Weight, prams.Complexion, prams.BodyType, prams.PhysicalStatus, prams.FamilyStatus,prams.FamilyValue, prams.EductionLevels, prams.Employment, memberId).ToList();
                member.ForEach(s =>{ s.Code = s.Id.EncodeQueryString(); });
                msg.Data = new
                {
                    MemberList = member,
                    totalcount = member.FirstOrDefault(s => s.totalcount > 0) == null ? 0 : member.FirstOrDefault(s => s.totalcount > 0).totalcount
                };
            }
            catch (Exception ex)
            {
                msg.Success = false;
            }
            return msg;

        }
        public static Message GetMemberDetailById(Int64 memberId, bool isMobile = false)
        {
            Message msg = new Message();
            try
            {
                FetchMemberDetailById_Result memberDetail = db.FetchMemberDetailById(memberId).FirstOrDefault();
                //memberDetail.ProfilePicPath = string.Concat("/Images/ProfilePictures/" + memberDetail.Id + "/" + memberDetail.ProfilePicPath);
                //if (isMobile)
                //{
                //if (memberDetail.IsMobilePic == true)
                //{
                //    //    prsonalInfo.ProfilePicPath = string.IsNullOrWhiteSpace(prsonalInfo.ProfilePicPath) ? string.Concat(Static.WebSiteUrl + "/", "Content/NoImage/noimage.png") : string.Concat("/Images/ProfilePictures/" + prsonalInfo.Id + "/" + prsonalInfo.ProfilePicPath);
                //    memberDetail.ProfilePicPath = string.IsNullOrWhiteSpace(memberDetail.ProfilePicPath) ? string.Concat(Static.WebSiteUrl + "/", "Content/NoImage/noimage.png") : memberDetail.ProfilePicPath;
                //}
                //else
                //{
                //    memberDetail.ProfilePicPath = string.Concat(Static.WebSiteUrl, "/Images/ProfilePictures/" + memberDetail.Id + "/" + memberDetail.ProfilePicPath);
                //}
                //}
                //else
                //{
                //    memberDetail.ProfilePicPath = string.Concat(Static.WebSiteUrl, "/Images/ProfilePictures/" + memberDetail.Id + "/" + memberDetail.ProfilePicPath);
                //}
                msg.Data = new
                {
                    memberDetail,
                    fieldPermissions = FieldPermissionManager.GetActiveSections(memberId).Data
                };
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("Marryme.Client/MemberManger/GetMemberDetailById");
            }
            return msg;
        }
        // public static Message ViewPhone(long memberId, long viewerId)
        //{
        //    Message msg = new Message();
        //    try
        //    {
        //        int counter = 0;
        //        var packageDetail = db.MemberPackageSubscriptionDetails.FirstOrDefault(s => s.MemberId == memberId && s.IsActive);
        //        if (db.MemberMobileViews.Any(s => s.MemberId == memberId && s.ViewerId == viewerId))
        //        {
        //            msg.Success = true;
        //            counter = db.MemberMobileViews.Where(s => s.ViewerId == viewerId).Count();
        //            msg.Detail = "Phone No is not Counted. " + counter;
        //        }
        //        else
        //        {
        //            if (db.MemberMobileViews.Any(s => s.ViewerId == viewerId))
        //            {
        //                counter = db.MemberMobileViews.Where(s => s.ViewerId == viewerId).Count();
        //            }
        //            if (counter <= packageDetail.TotalNoOfContactsToShow)
        //            {
        //                db.MemberMobileViews.Add(new MemberMobileView { MemberId = memberId, ViewerId = viewerId });
        //                db.MemberPackageSubscriptionDetails.FirstOrDefault(s => s.MemberId == memberId && s.IsActive).UsedNoOfContacts += 1;
        //                db.SaveChanges();
        //            }
        //            else
        //            {
        //                msg.Success = false;
        //                msg.Detail = "Your Limit is Already Reached. " + counter;
        //            }
        //        }
        //        //   msg.Detail = counter.ToString();
        //    }
        //    catch (Exception ex)
        //    {
        //        msg.Success = false;
        //        ex.LogError("BusinessLogic.BAL.Matrimony.Client/MemberManger/ViewPhone");
        //    }
        //    return msg;
        //}
    }
}
