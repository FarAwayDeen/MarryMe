using Marryme.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Marryme.BAL.MarrymeAdminManager
{
    public class MembersManager
    {
        private static MarrymeEntities db = new MarrymeEntities();
        public static CallBackData FetchMembers(Paging paging)
        {
            CallBackData msg = new CallBackData();
            try
            {
                var filterData = paging.SearchJson.Deserialize<MemberRegistration>();
                List<MembersFetch_Result> results = db.MembersFetch(paging.DisplayLength, paging.DisplayStart, paging.SortColumn, paging.SortOrder, filterData.Search, filterData.Active, 0).ToList();
                results.ForEach(s =>
                {
                    s.Code = s.Id.EncodeQueryString();
                });
                msg = results.ToDataTable(paging);
            }
            catch (Exception ex)
            {
                msg.msg.Success = false;
                ex.LogError("BusinessLogic.BAL.Matrimony.Admin/FetchMembers");
            }
            return msg;
        }
        public static Message DocumentList()
        {
            Message msg = new Message();
            try
            {
                List<FetchDocuments_Result> documentList = db.FetchDocuments().ToList();
                if (documentList != null)
                {
                    documentList.ForEach(x =>
                    {
                        x.Id = x.Id;
                        x.Name = x.Name;
                        x.DocName = x.DocName;
                        x.FilePath = string.Concat("/Images/Documents/" + x.Id + "/" + x.FilePath);
                    });

                }
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
        public static Message GetMemberById(long id)
        {
            Message msg = new Message();
            try
            {
                var member = db.MemberRegistrations.FirstOrDefault(s => s.Id == id);
                var memberLoginDetail = db.MemberLoginDetails.FirstOrDefault(s => s.MemberId == member.Id);
                msg.Data = new
                {
                    Member = member,
                    MemberLoginDetail = memberLoginDetail
                };
            }
            catch (Exception ex)
            {
                msg.Success = false;
                ex.LogError("BusinessLogic.BAL.Matrimony.Admin/GetMemberById");
            }
            return msg;
        }
        public static Message IsActiveInActive(long id, bool status)
        {
            Message msg = new Message();
            try
            {
                var existingMember = db.MemberRegistrations.FirstOrDefault(s => s.Id == id);
                var existingMemberLoginDetail = db.MemberLoginDetails.FirstOrDefault(s => s.MemberId == existingMember.Id);
                existingMemberLoginDetail.IsActive = status;
                db.SaveChanges();
            }
            catch (Exception ex)
            {
                msg.Success = false;
                ex.LogError("BusinessLogic.BAL.Matrimony.Admin/IsActiveInActive");
            }
            return msg;
        }
        public static Message GetMemberDetailById(Int64 memberId)
        {
            Message msg = new Message();
            try
            {
                FetchMemberDetail_Result memberDetail = db.FetchMemberDetail(memberId).FirstOrDefault();
                //memberDetail.ProfilePicPath = string.Concat(Static.ClientUrl, "/Images/ProfilePictures/" + memberDetail.Id + "/" + memberDetail.ProfilePicPath);
                // if (memberDetail.IsMobilePic == true)
                if (memberDetail.IsMobilePic == true)
                {
                    //    prsonalInfo.ProfilePicPath = string.IsNullOrWhiteSpace(prsonalInfo.ProfilePicPath) ? string.Concat(Static.WebSiteUrl + "/", "Content/NoImage/noimage.png") : string.Concat("/Images/ProfilePictures/" + prsonalInfo.Id + "/" + prsonalInfo.ProfilePicPath);
                    memberDetail.ProfilePicPath = string.IsNullOrWhiteSpace(memberDetail.ProfilePicPath) ? string.Concat(Static.WebSiteUrl + "/", "Content/NoImage/noimage.png") : memberDetail.ProfilePicPath;
                }
                else
                {
                    memberDetail.ProfilePicPath = string.Concat(Static.WebSiteUrl, "/Images/ProfilePictures/" + memberDetail.Id + "/" + memberDetail.ProfilePicPath);
                }
                //if (!string.IsNullOrEmpty(memberDetail.ProfilePicPath)) {
                //memberDetail.ProfilePicPath = string.Concat("/Images/ProfilePictures/" + memberDetail.Id + "/" + memberDetail.ProfilePicPath);
                //}
                msg.Data = memberDetail;
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("BusinessLogic.BAL.Matrimony.Admin/MembersManager/GetMemberDetailById");
            }
            return msg;
        }
    }
}
