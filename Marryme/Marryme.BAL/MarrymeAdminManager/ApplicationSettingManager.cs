using Marryme.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace Marryme.BAL.MarrymeAdminManager
{
   public class ApplicationSettingManager
    {
        private static readonly MarrymeEntities db = Static.DbContext;
        public static Message SaveUpdate(ApplicationSetting model, HttpPostedFileBase file)
        {
            Message msg = new Message();
            try
            {
                if (!model.Id.IsNullOrZero())
                {
                    ApplicationSetting ExistAppsetting = db.ApplicationSettings.FirstOrDefault(s => s.Id == model.Id);
                    ExistAppsetting.ApplicationName = model.ApplicationName;
                    ExistAppsetting.Address = model.Address;
                    ExistAppsetting.Email = model.Email;
                    ExistAppsetting.Phone = model.Phone;
                    ExistAppsetting.FaceBookLink = model.FaceBookLink;
                    ExistAppsetting.GoogleLink = model.GoogleLink;
                    ExistAppsetting.TwitterLink = model.TwitterLink;
                    ExistAppsetting.SkypeLink = model.SkypeLink;
                    ExistAppsetting.NTN = model.NTN;
                    ExistAppsetting.CompanyName = model.CompanyName;
                    ExistAppsetting.MailingAddress = model.MailingAddress;
                    ExistAppsetting.IsActive = model.IsActive ?? true;
                    ExistAppsetting.UpdatedDateTime = DateTime.Now;
                    db.SaveChanges();
                    msg.Detail = "Application Settings Updated Successfully.";
                }
                else
                {
                    model.CreatedDateTime = DateTime.Now;
                    model.IsActive = true;
                    db.ApplicationSettings.Add(model);
                    db.SaveChanges();
                    msg.Detail = "Application Settings Saved Seccessfully.";
                }
                if (file != null && !string.IsNullOrEmpty(file.FileName))
                {
                    var filePath = file.UploadFile("/Images/AppSettingLogo/" + model.Id + "/", model.Logo, true, false, true);
                    db.ApplicationSettings.FirstOrDefault(s => s.Id == model.Id).Logo = filePath.Data;
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("BusinessLogic.BAL.Matrimony.Admin/ApplicationSettingManager/SaveUpdate");
            }
            return msg;
        }
        public static Message GetById()
        {
            Message msg = new Message();
            try
            {
                // msg.Data = db.ApplicationSettings.FirstOrDefault();
                var appSetting = db.ApplicationSettings.FirstOrDefault();
                appSetting.Logo = string.Concat("/Images/AppSettingLogo/" + appSetting.Id + "/" + appSetting.Logo);
                msg.Data = appSetting;
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("BusinessLogic.BAL.Matrimony.Admin/ApplicationSettingManager/GetById");
            }
            return msg;
        }
    }
}
