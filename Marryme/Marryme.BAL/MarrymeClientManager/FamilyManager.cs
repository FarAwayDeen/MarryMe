using Marryme.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Marryme.BAL.MarrymeClientManager
{
    public class FamilyManager
    {
        private static readonly MarrymeEntities db = Static.DbContext;
        public static Message FamilyInfo(MemberFamilyDetail model)
        {
            Message msg = new Message();
            try
            {
                //Logic for Member Family Detail
                MemberFamilyDetail memberFamily = db.MemberFamilyDetails.FirstOrDefault(s => s.MemberId == model.MemberId);
                if (memberFamily == null)
                {
                    memberFamily = new MemberFamilyDetail
                    {
                        MemberId = model.MemberId
                    };
                }
                memberFamily.ParentContactNo = model.ParentContactNo;
                memberFamily.FamilyValue = model.FamilyValue;
                memberFamily.FamilyType = model.FamilyType;
                memberFamily.FamilyStatus = model.FamilyStatus;
                if (memberFamily.Id.IsNullOrZero())
                {
                    db.MemberFamilyDetails.Add(memberFamily);
                }
                db.SaveChanges();
                msg.Success = true;
                msg.Detail = "Member Family Information Saved Successfully.";
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("Client/MemberManger/FamilyInfo");
            }
            return msg;
        }
        /// <summary>
        /// get detail of member family information for profile 
        /// </summary>
        /// <param name="memberId"></param>
        /// <returns></returns>
        public static Message FetchProfileFamilyDetail(Int64 memberId)
        {
            Message msg = new Message();
            try
            {
                msg.Data = db.MemberFamilyDetails.FirstOrDefault(s => s.MemberId == memberId);
                return msg;
            }
            catch (Exception ex)
            {
                return msg;
            }
        }
    }
}
