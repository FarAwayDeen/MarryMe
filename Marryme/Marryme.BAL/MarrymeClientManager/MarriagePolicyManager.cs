using Marryme.BAL.ViewModels;
using Marryme.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Marryme.BAL.MarrymeClientManager
{
    public class MarriagePolicyManager
    {
        private static readonly MarrymeEntities db = new MarrymeEntities();
        public static Message SaveMarriagePolicy(MarriagePolicyVM model)
        {
            Message msg = new Message();
            try
            {
                MarriagePolicy policy = db.MarriagePolicies.FirstOrDefault(s => s.MemberId == model.MemberId && s.dropdownOption == model.dropdownOption);
                if (policy == null)
                {
                    if (model.dropdownOption == "Divorce")
                    {
                        policy = new MarriagePolicy
                        {
                            MemberId = model.MemberId,
                            dropdownOption = model.dropdownOption,
                            Amountcheckbox = model.DivorceAmountcheckbox,
                            AmountDetail = model.DivorceAmountDetail,
                            HouseCheckBox = model.DivorceHouseCheckBox,
                            HouseDetail = model.DivorceHouseDetail,
                            MiscellaneousCheckbox = model.DivorceMiscellaneousCheckbox,
                            MiscellaneousDetail = model.DivorceMiscellaneousDetail
                        };
                    }
                    if (model.dropdownOption == "Khula")
                    {
                        policy = new MarriagePolicy
                        {
                            MemberId = model.MemberId,
                            dropdownOption = model.dropdownOption,
                            Amountcheckbox = model.KhulaAmountcheckbox,
                            AmountDetail = model.KhulaAmountDetail,
                            HouseCheckBox = model.KhulaHouseCheckBox,
                            HouseDetail = model.KhulaHouseDetail,
                            MiscellaneousCheckbox = model.KhulaMiscellaneousCheckbox,
                            MiscellaneousDetail = model.KhulaMiscellaneousDetail
                        };
                    }
                    msg.Success = true;
                    msg.Detail = "Marriage Policy Saved Successfully!";
                    db.MarriagePolicies.Add(policy);
                    db.SaveChanges();
                }
                else if (policy != null && model != null)
                {
                    if (model.dropdownOption == "Divorce")
                    {
                        policy.Amountcheckbox = model.DivorceAmountcheckbox;
                        policy.AmountDetail = model.DivorceAmountDetail;
                        policy.HouseCheckBox = model.DivorceHouseCheckBox;
                        policy.HouseDetail = model.DivorceHouseDetail;
                        policy.MiscellaneousCheckbox = model.DivorceMiscellaneousCheckbox;
                        policy.MiscellaneousDetail = model.DivorceMiscellaneousDetail;
                    }
                    if (model.dropdownOption == "Khula")
                    {
                        policy.Amountcheckbox = model.KhulaAmountcheckbox;
                        policy.AmountDetail = model.KhulaAmountDetail;
                        policy.HouseCheckBox = model.KhulaHouseCheckBox;
                        policy.HouseDetail = model.KhulaHouseDetail;
                        policy.MiscellaneousCheckbox = model.KhulaMiscellaneousCheckbox;
                        policy.MiscellaneousDetail = model.KhulaMiscellaneousDetail;
                    }
                    db.SaveChanges();
                    msg.Success = true;
                    msg.Detail = "Marriage Policy Saved Successfully!";
                }
                else
                {
                    msg.Success = false;
                    msg.Info = true;
                    msg.Detail = "Please Enter Detail First!";
                }
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                msg.Detail = "Please check your details!";
                ex.LogError("MarriagePolicyManager/Policy");
            }
            return msg;
        }
        public static Message MarriagePolicyFetchById(Int64 memberId, string option)
        {
            Message msg = new Message();
            try
            {
                var policyDetail = db.FetchMarriagePolicy(memberId, option).FirstOrDefault();
                //pDetail.LanguageTypeCode = Convert.ToString(pDetail.LanguageId);
                if (policyDetail != null)
                {
                    msg.Data = policyDetail;
                    msg.Success = true;
                    msg.Detail = "Data Fetched Successfully!";
                }
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("MarriagePolicyManager/Policy");
            }
            return msg;
        }
    }
}
