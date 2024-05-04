using Marryme.BAL.ViewModels;
using Marryme.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Marryme.BAL.MarrymeClientManager
{
    public class DivorcePolicyManager
    {
        private static readonly MarrymeEntities db = new MarrymeEntities();
        public static Message SaveDivorcePolicy(DivorcePolicyVM model)
        {
            Message msg = new Message();
            try
            {
                DivorcePolicy policy = db.DivorcePolicies.FirstOrDefault(s => s.MemberId == model.MemberId && s.dropdownOption == model.dropdownOption);
                if (policy == null)
                {
                    if (model.dropdownOption == "Divorce")
                    {
                        policy = new DivorcePolicy
                        {
                            MemberId = model.MemberId,
                            dropdownOption = model.dropdownOption,
                            Amountcheckbox = model.DivorceAmountcheckbox,
                            AmountFrom = model.DivorceAmountFrom,
                            AmountTo = model.DivorceAmountTo,
                            IncomeCurrency = model.DIncomeCurrency,
                            HouseCheckBox = model.DivorceHouseCheckBox,
                            HouseDetail = model.DivorceHouseDetail,
                            MiscellaneousCheckbox = model.DivorceMiscellaneousCheckbox,
                            MiscellaneousDetail = model.DivorceMiscellaneousDetail,
                            ThreeDivorcePolicy = model.ThreeDivorcePolicy
                        };
                    }
                    if (model.dropdownOption == "Khula")
                    {
                        policy = new DivorcePolicy
                        {
                            MemberId = model.MemberId,
                            dropdownOption = model.dropdownOption,
                            Amountcheckbox = model.KhulaAmountcheckbox,
                            AmountFrom = model.KhulaAmountFrom,
                            AmountTo = model.KhulaAmountTo,
                            IncomeCurrency = model.KIncomeCurrency,
                            HouseCheckBox = model.KhulaHouseCheckBox,
                            HouseDetail = model.KhulaHouseDetail,
                            MiscellaneousCheckbox = model.KhulaMiscellaneousCheckbox,
                            MiscellaneousDetail = model.KhulaMiscellaneousDetail                           
                        };
                    }
                    msg.Success = true;
                    msg.Detail = "Divorce Policy Saved Successfully!";
                    db.DivorcePolicies.Add(policy);
                    db.SaveChanges();
                }
                else if (policy != null && model != null)
                {
                    if (model.dropdownOption == "Divorce")
                    {
                        policy.Amountcheckbox = model.DivorceAmountcheckbox;
                        policy.AmountFrom = model.DivorceAmountFrom;
                        policy.AmountTo = model.DivorceAmountTo;
                        policy.IncomeCurrency = model.DIncomeCurrency;
                        policy.HouseCheckBox = model.DivorceHouseCheckBox;
                        policy.HouseDetail = model.DivorceHouseDetail;
                        policy.MiscellaneousCheckbox = model.DivorceMiscellaneousCheckbox;
                        policy.MiscellaneousDetail = model.DivorceMiscellaneousDetail;
                        policy.ThreeDivorcePolicy = model.ThreeDivorcePolicy;
                    }
                    if (model.dropdownOption == "Khula")
                    {
                        policy.Amountcheckbox = model.KhulaAmountcheckbox;
                        policy.AmountFrom = model.KhulaAmountFrom;
                        policy.AmountTo = model.KhulaAmountTo;
                        policy.IncomeCurrency = model.KIncomeCurrency;
                        policy.HouseCheckBox = model.KhulaHouseCheckBox;
                        policy.HouseDetail = model.KhulaHouseDetail;
                        policy.MiscellaneousCheckbox = model.KhulaMiscellaneousCheckbox;
                        policy.MiscellaneousDetail = model.KhulaMiscellaneousDetail;
                    }
                    db.SaveChanges();
                    msg.Success = true;
                    msg.Detail = "Divorce Policy Saved Successfully!";
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
                ex.LogError("DivorcePolicyManager/Policy");
            }
            return msg;
        }
        public static Message DivorcePolicyFetchById(Int64 memberId, string option)
        {
            Message msg = new Message();
            try
            {
                var policyDetail = db.FetchDivorcePolicy(memberId, option).FirstOrDefault();
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
                ex.LogError("DivorcePolicyManager/Policy");
            }
            return msg;
        }
    }
}
