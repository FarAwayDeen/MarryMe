using Marryme.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Marryme.BAL.MarrymeClientManager
{
    public class PersonalDetailManager
    {
        private static readonly MarrymeEntities db = Static.DbContext;
        public static Message PersonalDetail(MemberAppearance model)
        {
            Message msg = new Message();
            try
            {
                //Logic for Member Appearance
                MemberAppearance memberAppearance = db.MemberAppearances.FirstOrDefault(s => s.MemberId == model.MemberId);
                if (memberAppearance == null)
                {
                    memberAppearance = new MemberAppearance
                    {
                        MemberId = model.MemberId
                    };
                }

                memberAppearance.Weight = model.Weight;
                memberAppearance.BodyType = model.BodyType;
                memberAppearance.Complexion = model.Complexion;

                if (memberAppearance.Id.IsNullOrZero())
                {
                    db.MemberAppearances.Add(memberAppearance);
                }

                MemberLanguage memberLanguage = db.MemberLanguages.FirstOrDefault(s => s.MemberId == model.MemberId);
                if (memberLanguage == null)
                {
                    memberLanguage = new MemberLanguage
                    {
                        MemberId = model.MemberId,
                    };
                }
                if (!string.IsNullOrEmpty(model.LanguageTypeCode))
                {
                    memberLanguage.LanguageId = model.LanguageTypeCode.Contains("%") ? model.LanguageTypeCode.DecodeQueryString().ToInt() : model.LanguageTypeCode.ToInt();

                }

                //db.MemberLanguages.Add(memberLanguage);
                if (memberLanguage.Id.IsNullOrZero())
                {
                    db.MemberLanguages.Add(memberLanguage);
                }
                else
                {
                    memberLanguage.LanguageId = model.LanguageTypeCode.ToInt();
                }


                //Logic for Member Education
                MemberEducationDetail memberEducation = db.MemberEducationDetails.FirstOrDefault(s => s.MemberId == model.MemberId);
                if (memberEducation != null)
                {
                    memberEducation.Occupation = model.Occupation;
                }
                else
                {
                    memberEducation = new MemberEducationDetail
                    {
                        MemberId = model.MemberId,
                        Occupation = model.Occupation
                    };
                    db.MemberEducationDetails.Add(memberEducation);
                }

                //Logic for Member Life Style
                MemberLifeStyle memberLifeStyle = db.MemberLifeStyles.FirstOrDefault(s => s.MemberId == model.MemberId);
                if (memberLifeStyle == null)
                {
                    memberLifeStyle = new MemberLifeStyle
                    {
                        MemberId = model.MemberId
                    };
                }
                //memberLifeStyle.EatingHabit = model.EatingHabit;
                //memberLifeStyle.DrinkingHabit = model.DrinkingHabit;
                memberLifeStyle.SmokingHabit = model.SmokingHabit;
                memberLifeStyle.Interests = model.Interests;
                memberLifeStyle.Hobbies = model.Hobbies;

                if (memberLifeStyle.Id.IsNullOrZero())
                {
                    db.MemberLifeStyles.Add(memberLifeStyle);
                }
                db.SaveChanges();
                msg.Success = true;
                msg.Detail = "Member Personal Detail Saved Sucessfully.";
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("Client/MemberManger/PersonalDetail");
            }
            return msg;
        }
        public static Message PersonalInfoDetailGetById(Int64 memberId)
        {
            Message msg = new Message();
            try
            {
                var pDetail = db.FetchProfilePersonalInfoDetail(memberId).FirstOrDefault();
                pDetail.LanguageTypeCode = Convert.ToString(pDetail.LanguageId);
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
    }
}
