using Marryme.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Marryme.BAL.MarrymeClientManager
{
    public class BestMatchesManager
    {
        private static readonly MarrymeEntities db = new MarrymeEntities();

        public static Message PreBindBestMatches(long memberID) {

            Message msg = new Message();
            try
            {
                List<GetBestMatchingByCRList_Result> members = db.GetBestMatchingByCRList(memberID).ToList();
                members.ForEach(s => { s.Code = s.MemberId.EncodeQueryString(); });
                msg.Data = new
                {
                    MemberList = members,                  
                };
            }
            catch (Exception ex)
            {

            }
            return msg;



        }
        public static Message PreBindMemberList(long memberId, bool isMobile = false)
        {
            Message msg = new Message();
            try
            {
                List<FetchPremiumBestMatches_Result> members = db.FetchPremiumBestMatches(memberId).ToList();
                members.ForEach(s =>
                {
                    // s.Name = s.NickName??"N/A";
                    s.Code = s.Id.EncodeQueryString();
                    s.ShowName = s.NickName;
                    //old code for full Name
                    //string[] name = s.Name.Split(' ');
                    //if (name.Count() > 1)
                    //{
                    //    s.ShowName = string.Concat(name[0], " ", (string.IsNullOrWhiteSpace(name[1]) ? "" : name[1].Substring(0, 1)));
                    //}
                    //else
                    //{
                    //    s.ShowName = s.Name;
                    //}
                    //s.age = s.DOB != null ? Convert.ToDateTime(s.DOB).GetAge() : 0;
                    s.HighestEducation = s.HighestEducation != null ? s.HighestEducation : "N/A";
                    s.Religion = s.Religion != null ? s.Religion.Truncate(15) : "N/A";
                    // if (isMobile)
                    //{
                    if (s.IsMobilePic == true)
                    {
                        //    prsonalInfo.ProfilePicPath = string.IsNullOrWhiteSpace(prsonalInfo.ProfilePicPath) ? string.Concat(Static.WebSiteUrl + "/", "Content/NoImage/noimage.png") : string.Concat("/Images/ProfilePictures/" + prsonalInfo.Id + "/" + prsonalInfo.ProfilePicPath);
                        s.ProfilePicPath = string.IsNullOrWhiteSpace(s.ProfilePicPath) ? string.Concat(Static.WebSiteUrl + "/", "Content/NoImage/noimage.png") : s.ProfilePicPath;
                    }
                    else
                    {
                        s.ProfilePicPath = string.Concat(Static.WebSiteUrl, "/Images/ProfilePictures/" + s.Id + "/" + s.ProfilePicPath);
                    }
                    //}
                    //else
                    //{
                    //    s.ProfilePicPath = string.Concat(Static.WebSiteUrl, "/Images/ProfilePictures/" + s.Id + "/" + s.ProfilePicPath);
                    //}
                    //  s.ProfilePicPath = string.Concat("/Images/ProfilePictures/" + s.Id + "/" + s.ProfilePicPath);
                });
                msg.Data = new
                {
                    MemberList = members,
                    FieldPermissions = FieldPermissionManager.GetActiveSections(memberId).Data
                };
            }
            catch (Exception ex)
            {

            }
            return msg;
        }
    }
}
