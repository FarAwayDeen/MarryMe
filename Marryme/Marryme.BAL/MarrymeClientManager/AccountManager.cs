using Marryme.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Marryme.BAL.MarrymeClientManager
{
   public class AccountManager
    {
        private static readonly MarrymeEntities db = new MarrymeEntities();
        public static Message VerifyDuplicateEmail(string email)
        {
            Message msg = new Message();
            try
            {
                email = email.ToLower();
                bool isDuplicate = db.MemberLoginDetails.Any(s => s.Email.ToLower().Equals(email));
                if (isDuplicate)
                {
                    msg.Detail = string.Format("{0} already Exists", email);
                    msg.Warning = true;
                }

            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("MemberManger/VerifyDuplicateEmail");
            }
            return msg;
        }
        public static Message Register(MemberRegistration model)
        {
            Message msg = new Message();
            try
            {
                msg.Code = Generic.GetRandomPassword(16);                
                //if (!string.IsNullOrEmpty(model.ReligionTypeCode))
                //{
                //    model.ReligionId = model.ReligionTypeCode.DecodeQueryString().ToInt();
                //}
                if (!string.IsNullOrEmpty(model.CountryTypeCode))
                {
                    model.CountryId = model.CountryTypeCode.DecodeQueryString().ToInt();
                }
                model.DOB = new DateTime(model.Year, model.Month, model.Day);
                db.MemberRegistrations.Add(model);
                db.SaveChanges();

                MemberLoginDetail loginDetail = new MemberLoginDetail
                {
                    MemberId = model.Id,
                    Email = model.Email,
                    Password = model.Password.EncryptPassword(),
                    ConfirmationCode = msg.Code,
                    IsFirstLoginAttempt = true
                   
                };
                db.MemberLoginDetails.Add(loginDetail);
                db.SaveChanges();
                msg.Success = true;
                msg.Detail = "Member Registered Successfully.";
                if (loginDetail.Id>0)
                {
                    AccountManager.AccountActivationEmail(loginDetail.Email, model.Name, loginDetail.ConfirmationCode);

                }
                // Send Email to Member
                //         AccountActivationEmail(model.Email, model.Name, loginDetail.ConfirmationCode);

            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("AccountManager/Register");
            }
            return msg;
        }

        public static Message VerifyUser(string email, string password)
        {
            Message msg = new Message();
            try
            {
                email = email.ToLower();
                password = password.EncryptPassword();
                var member = db.MemberLoginDetails.FirstOrDefault(s => s.Email.ToLower() == email && s.Password == password && s.IsEmailConfirmed && s.IsActive);
                if (member != null)
                {
                    // change login attempt
                    if (member.IsFirstLoginAttempt)
                    {
                        member.IsFirstLoginAttempt = false;
                        db.SaveChanges();
                        msg.Info = true;
                    }
                    msg.Data = member.MemberId;
                    db.DisableCurrentMemberPackageIfExpired(member.MemberId);
                    msg.Success = true;
                    msg.Detail = "Member Login Successfully.";
                }
                else
                {
                    msg.Success = false;
                    msg.Detail = "Member doesn't Exists or Not Activate Yet";
                }
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("AccountManager/VerifyUser");
            }
            return msg;
        }
        public static bool EmailConfirmation(string email, string code)
        {
            try
            {
                email = email.ToLower();
                var member = db.MemberLoginDetails.FirstOrDefault(s => s.Email.ToLower() == email && s.ConfirmationCode == code);
                if (member != null)
                {
                    member.IsEmailConfirmed = member.IsActive = true;
                    db.SaveChanges();
                    return true;
                }
                else
                    return false;

            }
            catch (Exception ex)
            {
                ex.LogError("Client/AccountManager/EmailConfirmation");
                return false;
            }
        }
        public static Message ChangePassword(string email, string oldPasword, string newPassword)
        {
            Message msg = new Message();
            try
            {
                email = email.ToLower();
                oldPasword = oldPasword.EncryptPassword();
                var existingMember = db.MemberLoginDetails.FirstOrDefault(s => s.Email.ToLower() == email);
                if (existingMember.Password == oldPasword)
                {
                    existingMember.Password = newPassword.EncryptPassword();
                    db.SaveChanges();
                    msg.Detail = "Password changed Successfully.";
                }
                else
                {
                    msg.Success = false;
                    msg.Detail = "Old Password doesn't match";
                }
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("AccountManager/ChangePassword");
            }
            return msg;

        }
        private static bool AccountActivationEmail(string email, string name, string confirmationCode)
        {
            try
            {
                var callbackUrl = string.Format("{0}/Account/ConfirmEmail?Email={1}&Code={2}", Static.BaseUrl, email, confirmationCode);
                EmailSMSTemplate emailTemplate = db.EmailSMSTemplates.AsEnumerable().FirstOrDefault(x => x.Name.Equals("AccountActivationRequest"));
                emailTemplate.To = email;
                emailTemplate.MessageBody = emailTemplate.MessageBody
                    .Replace("{#!Name!#}", name)
                    .Replace("{#!BaseUrl!#}", Static.BaseUrl)
                    .Replace("{#!CurrentDate!#}", DateTime.Now.Year.ToString())
                    .Replace("{#!RequestLink!#}", callbackUrl);
                emailTemplate.SendEmail();
                return true;
            }
            catch (Exception ex)
            {

            }
            return false;
        }

    }
}
