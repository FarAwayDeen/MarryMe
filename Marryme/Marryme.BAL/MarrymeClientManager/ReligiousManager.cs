using Marryme.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Marryme.BAL.MarrymeClientManager
{
    public class ReligiousManager
    {
        private static readonly MarrymeEntities db = new MarrymeEntities();
        public static Message ReligiousInfo(MemberReligiousDetail model)
        {
            Message msg = new Message();
            try
            {


                //Logic for Member Religious
                MemberReligiousDetail memberReligious = db.MemberReligiousDetails.FirstOrDefault(s => s.MemberId == model.MemberId);
                if (memberReligious == null)
                {
                    memberReligious = new MemberReligiousDetail
                    {
                        MemberId = model.MemberId
                    };
                }

                memberReligious.Religion = model.Religion;
                memberReligious.Sect = model.Sect;
                //memberReligious.Gothra = model.Gothra;
                //memberReligious.Dosham = model.Dosham;
                //memberReligious.TimeOfBirth = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, memberReligious.Hour, memberReligious.Minute, 0);
                //if (!string.IsNullOrEmpty(model.CountryTypeCode))
                //{
                //    memberReligious.CountryOfBirth = model.CountryTypeCode.Contains("%") ? model.CountryTypeCode.DecodeQueryString().ToInt() : model.CountryTypeCode.ToInt();
                //}
                //if (!string.IsNullOrEmpty(model.CityTypeCode))
                //{
                //    memberReligious.CityOfBirth = model.CityTypeCode.Contains("%") ? model.CityTypeCode.DecodeQueryString().ToString() : model.CityTypeCode.ToString();
                //}
                //if (!string.IsNullOrEmpty(model.StateTypeCode))
                //{
                //    memberReligious.StateOfBirth = model.StateTypeCode.Contains("%") ? model.StateTypeCode.DecodeQueryString().ToString() : model.StateTypeCode.ToString();
                //}

                if (memberReligious.Id.IsNullOrZero())
                {
                    db.MemberReligiousDetails.Add(memberReligious);
                }
                db.SaveChanges();
                msg.Success = true;
                msg.Detail = "Religious Information Saved Successfully.";
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("Client/MemberManger/memberReligious");
            }
            return msg;
        }

        /// <summary>
        /// get detail of member religious for profile 
        /// </summary>
        /// <param name="memberId"></param>
        /// <returns></returns>
        public static Message FetchProfileReligiousDetail(Int64 memberId)
        {
            Message msg = new Message();
            try
            {
                MemberReligiousDetail memberReligiousDetail = db.MemberReligiousDetails.FirstOrDefault(s => s.MemberId == memberId);
                //if (memberReligiousDetail != null)
                //{
                //    memberReligiousDetail.CountryTypeCode = Convert.ToString(memberReligiousDetail.CountryOfBirth);
                //    memberReligiousDetail.StateTypeCode = Convert.ToString(memberReligiousDetail.StateOfBirth);
                //    memberReligiousDetail.CityTypeCode = Convert.ToString(memberReligiousDetail.CityOfBirth);
                //}
                return msg.Data = memberReligiousDetail;
            }
            catch (Exception ex)
            {
                return msg;
            }
        }
    }
}
