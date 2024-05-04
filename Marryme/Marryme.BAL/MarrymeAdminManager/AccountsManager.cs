using Marryme.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace Marryme.BAL.MarrymeAdminManager
{
    public class AccountsManager
    {
        private static MarrymeEntities db = Static.DbContext;
        public static ValidationMessage Login(AdminProfile admin)
        {
            ValidationMessage msg = new ValidationMessage();
            try
            {
                msg.Success = db.AdminProfiles.Any(s => s.Email == admin.Email && s.Password == admin.Password);
                msg.Data = msg.Success ? db.AdminProfiles.FirstOrDefault(s => s.Email == admin.Email && s.Password == admin.Password) : null;
                msg.Warning = !msg.Success ? true : false;
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                msg.Detail = ex.Message;
                ex.LogError("Marryme.BAL.Admin/Login");
            }
            return msg;
        }
        public static ValidationMessage ForgotPassword(string email)
        {
            ValidationMessage msg = new ValidationMessage();
            try
            {
                var user = db.AdminProfiles.FirstOrDefault(s => s.Email == email);
                if (user != null)
                {
                    msg.Success = ForgotPasswordEmail(email, string.Concat(user.FirstName, " ", user.LastName), user.Password);
                }
                else
                {
                    msg.Success = false;
                    msg.Warning = !msg.Success ? true : false;
                }
                msg.returnUrl = "/Accounts/Login";
                msg.Detail = "Please Check Your Email.";
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                msg.Detail = ex.Message;
                ex.LogError("Marryme.BAL.Admin/ChangePassword");
            }
            return msg;
        }
        private static bool ForgotPasswordEmail(string email, string name, string password)
        {
            try
            {
                EmailSMSTemplate emailTemplate = Static.DbContext.EmailSMSTemplates.AsEnumerable().FirstOrDefault(x => x.Name.Equals("PasswordRequest"));
                emailTemplate.To = email;
                emailTemplate.MessageBody = emailTemplate.MessageBody
                    .Replace("{#!Name!#}", name)
                    .Replace("{#!BaseUrl!#}", Static.BaseUrl)
                    .Replace("{#!LogoUrl!#}", Static.LogoPath)
                    .Replace("{#!yearActive!#}", DateTime.Now.Year.ToString())
                    .Replace("{#!AppName!#}", Static.ApplicationSettings.ApplicationName)
                    .Replace("{#!Password!#}", password);
                emailTemplate.SendEmail();
                return true;
            }
            catch (Exception ex)
            {

            }
            return false;
        }
        public static ValidationMessage UpdateProfile(AdminProfile admin, HttpPostedFileBase files)
        {
            ValidationMessage msg = new ValidationMessage();
            try
            {
                if (!admin.Id.IsNullOrZero())
                {
                    var existingProfile = db.AdminProfiles.FirstOrDefault(s => s.Id == admin.Id);
                    existingProfile.Address = admin.Address;
                    existingProfile.FirstName = admin.FirstName;
                    existingProfile.LastName = admin.LastName;
                    //existingProfile.Password = admin.Password;
                    existingProfile.Phone = admin.Phone;
                    if (files != null)
                    {
                        if (!files.ContentLength.IsNullOrZero())
                        {
                            var data = files.UploadFile("/Content/ProfilePicture/" + admin.Id + "/");
                            existingProfile.ProfilePicture = data.Data;
                        }
                    }
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                msg.Detail = ex.Message;
                ex.LogError("Marryme.BAL.Admin/ChangePassword");
            }
            return msg;
        }
        public static ValidationMessage ChangePassword(AdminProfile admin)
        {
            ValidationMessage msg = new ValidationMessage();
            try
            {
                msg.Success = db.AdminProfiles.Any(s => s.Password == admin.OldPassword && s.Email == Static.UserProfile.Email);
                if (msg.Success)
                {
                    db.AdminProfiles.FirstOrDefault(s => s.Email == admin.Email && s.Password == admin.OldPassword).Password = admin.Password;
                    db.SaveChanges();
                }
                msg.Data = msg.Success ? db.AdminProfiles.FirstOrDefault(s => s.Email == admin.Email && s.Password == admin.Password) : null;
                msg.Warning = !msg.Success ? true : false;
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                msg.Detail = ex.Message;
                ex.LogError("Marryme.BAL.Admin/ChangePassword");
            }
            return msg;
        }
    }
}
