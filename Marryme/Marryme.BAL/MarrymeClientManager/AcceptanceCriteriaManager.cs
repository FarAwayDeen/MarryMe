using Marryme.BAL.ViewModels;
using Marryme.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Marryme.BAL.MarrymeClientManager
{
   public class AcceptanceCriteriaManager
    {
        private static readonly MarrymeEntities db = new MarrymeEntities();
        //Profile Requirement Main Heading list
        public static Message AcceptanceQuestionList(long memberId)
        {
            Message msg = new Message();
            try
            {
                List<FetchAcceptanceQuestionList_Result> acceptanceQuestionlist = db.FetchAcceptanceQuestionList().ToList();

                msg.Data = new
                {
                    AcceptanceQuestionList = acceptanceQuestionlist,
                    FieldPermissions = FieldPermissionManager.GetActiveSections(memberId).Data
                };
            }
            catch (Exception ex)
            {

            }
            return msg;
        }
        public static Message SaveCriteria(AcceptanceCriteriaVM model)
        {
            Message msg = new Message();
            try
            {
                AcceptanceCriteria criteria = db.AcceptanceCriterias.FirstOrDefault(s => s.MemberId == model.MemberId);
                if (criteria == null)
                {
                    criteria = new AcceptanceCriteria
                    {
                        MemberId = model.MemberId,
                        AuntsAproval = model.Aunts, 
                        BrothersAproval = model.Brothers, 
                        DaughtersAproval = model.Daughters, 
                        FathersAproval =model.Father, 
                        MotherAproval = model.Mother, 
                        SisterAproval = model.Sisters, 
                        SonsAproval = model.Sons, 
                        UnclesAproval = model.Uncles
                    };
                    
                    db.AcceptanceCriterias.Add(criteria);
                    db.SaveChanges();
                }
                else if (criteria != null)
                {
                    criteria.FathersAproval = model.Father;
                    criteria.MotherAproval = model.Mother;
                    criteria.SonsAproval = model.Sons;
                    criteria.DaughtersAproval = model.Daughters;
                    criteria.SisterAproval = model.Sisters;
                    criteria.BrothersAproval = model.Brothers;
                    criteria.UnclesAproval = model.Uncles;
                    criteria.AuntsAproval = model.Aunts;
                    db.SaveChanges();
                }
                msg.Success = true;
                msg.Detail = "Acceptance Criteria Saved Successfully!";
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("AcceptanceManager/CriteriaQuestion");
            }
            return msg;
        }

        public static Message AcceptanceCriteriaGetById(Int64 memberId)
        {
            Message msg = new Message();
            try
            {
                var criteriaDetail = db.FetchAcceptanceCriteria(memberId).FirstOrDefault();
                //pDetail.LanguageTypeCode = Convert.ToString(pDetail.LanguageId);
                msg.Data = criteriaDetail;
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
