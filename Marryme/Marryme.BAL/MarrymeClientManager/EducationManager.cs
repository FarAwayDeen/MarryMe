using Marryme.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Marryme.BAL.MarrymeClientManager
{
    public class EducationManager
    {
        private static readonly MarrymeEntities db = Static.DbContext;
        public static Message EducationInfo(MemberEducationDetail model)
        {
            Message msg = new Message();
            try
            {
                //Logic for Member Education Detail
                MemberEducationDetail memberEducation = db.MemberEducationDetails.FirstOrDefault(s => s.MemberId == model.MemberId);
                if (memberEducation == null)
                {
                    memberEducation = new MemberEducationDetail
                    {
                        MemberId = model.MemberId
                    };
                }

                //memberEducation.HighestEducation = model.HighestEducation;
                memberEducation.Employment = model.Employment;
                memberEducation.IncomeCurrency = model.IncomeCurrency;
                memberEducation.AnnualIncomeFrom = model.AnnualIncomeFrom;
                memberEducation.AnnualIncomeTo = model.AnnualIncomeTo;
                memberEducation.EductionLevels = model.EductionLevels;
                if (memberEducation.Id.IsNullOrZero())
                {
                    db.MemberEducationDetails.Add(memberEducation);
                }
                db.SaveChanges();
                msg.Success = true;
                msg.Detail = "Education Detail Saved Successfully.";
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("Client/MemberManger/EducationInfo");
            }
            return msg;
        }

        /// <summary>
        /// get detail of member education for profile 
        /// </summary>
        /// <param name="memberId"></param>
        /// <returns></returns>
        public static Message FetchProfileEducationDetail(Int64 memberId)
        {
            Message msg = new Message();
            try
            {
                msg.Data = db.MemberEducationDetails.FirstOrDefault(s => s.MemberId == memberId);
                msg.Success = true;
                return msg;
            }
            catch (Exception ex)
            {
                return msg;
            }
        }
    }
}
