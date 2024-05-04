using Marryme.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace Marryme.BAL.MarrymeClientManager
{
   public class MarriageRegistrationManager
    {
        private static readonly MarrymeEntities db = new MarrymeEntities();
        public static Message PersonalInfo(MemberRegistration model, HttpPostedFileBase file, bool isMobilePic = false)
        {

            Message msg = new Message();
            try
            {
                //Logic for member memberRegistration Religion and sect save/update in registeration table not in different table
                MemberRegistration memberRegistration = db.MemberRegistrations.FirstOrDefault(s => s.Id == model.Id);
                memberRegistration.Gender = model.Gender;            
                memberRegistration.Name = model.Name;
                memberRegistration.MaritalStatus = model.MaritalStatus;
                memberRegistration.ReligionId = model.ReligionId;
                memberRegistration.SectId = model.SectId;                
                //Education save in different dable
                MemberEducationDetail memberEduca = db.MemberEducationDetails.FirstOrDefault(s => s.MemberId == model.Id);
                if (memberEduca == null)
                {
                    memberEduca = new MemberEducationDetail
                    {
                        MemberId = model.Id
                    };

                }         
                memberEduca.EductionLevels = model.EductionLevels;
                memberEduca.Employment = model.Employment;               
                if (memberEduca.Id.IsNullOrZero())
                {
                    db.MemberEducationDetails.Add(memberEduca);
                }
                db.SaveChanges();
                //MemberReligiousDetail memberRelig = db.MemberReligiousDetails.FirstOrDefault(s => s.MemberId == model.Id);
                //if (memberRelig == null)
                //{
                //    memberRelig = new MemberReligiousDetail
                //    {
                //        MemberId = model.Id
                //    };

                //}
                //memberRelig.Religion = model.Religion;
                //memberRelig.Sect = model.Sect;
                //if (memberRelig.Id.IsNullOrZero())
                //{
                //    db.MemberReligiousDetails.Add(memberRelig);
                //}
                //db.SaveChanges();

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
        public static Message PersonalInfoGetById(Int64 memberId, bool isMobile = false)
        {
            Message msg = new Message();
            try
            {
                //Logic for get Marital Status from member registration
                //msg.Data= db.FetchProfilePersonalInfo(memberId).FirstOrDefault();
                FetchProfilePersonalInfoForRegistrar_Result prsonalInfo = db.FetchProfilePersonalInfoForRegistrar(memberId).FirstOrDefault();
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

    }
}
