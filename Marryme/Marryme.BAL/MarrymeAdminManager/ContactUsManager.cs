using Marryme.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Marryme.BAL.MarrymeAdminManager
{
    public class ContactUsManager
    {
        private static readonly MarrymeEntities db = Static.DbContext;
        public static CallBackData Fetch(Paging paging)
        {
            CallBackData data = new CallBackData();
            try
            {
                MarkAsRead();
                ContactU filterData = paging.SearchJson.Deserialize<ContactU>();
                List<FetchContactUs_Result> contactUsResult = db.FetchContactUs(paging.DisplayLength, paging.DisplayStart, paging.SortColumn, paging.SortOrder, filterData.Search, filterData.Active).ToList();
                contactUsResult.ForEach(s =>
                {
                    s.Code = s.Id.EncodeQueryString();
                    //s.Description = s.Description.Truncate(50);
                });
                data = contactUsResult.ToDataTable(paging);
            }
            catch (Exception ex)
            {
                data.msg.Success = false;
                data.msg.Warning = true;
                ex.LogError("BusinessLogic.BAL.Matrimony.Admin/ContactUsManager/Fetch");
            }
            return data;
        }
        public static Message GetById(int id)
        {
            Message msg = new Message();
            try
            {
                msg.Data = db.ContactUs.FirstOrDefault(s => s.Id == id);
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("BusinessLogic.BAL.Matrimony.Admin/ContactUsManager/GetById");
            }
            return msg;
        }
        public static Message Delete(int id)
        {
            Message msg = new Message();
            try
            {
                db.ContactUs.Remove(db.ContactUs.FirstOrDefault(s => s.Id == id));
                db.SaveChanges();
                msg.Detail = "ContactUs Deleted Successfully.";
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("BusinessLogic.BAL.Matrimony.Admin/ContactUsManager/Delete");
            }
            return msg;
        }
        //Method for change status IsRead=true after view Contact
        public static Message FetchByStatus()
        {
            Message msg = new Message();
            try
            {
                List<FetchContactUsNotification_Result> contactUsStatus = db.FetchContactUsNotification().ToList();
                contactUsStatus.ForEach(s =>
                {
                    s.Code = s.Id.EncodeQueryString();
                    s.IsRead = true;
                });
            }
            catch (Exception ex)
            {

            }
            return msg;
        }
        public static Message MarkAsRead()
        {
            Message msg = new Message();
            try
            {
                using (var db = new MarrymeEntities())
                {
                    db.ContactUs.Where(s => !s.IsRead).ToList().ForEach(s =>
                    {
                        s.IsRead = true;
                    });
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                msg.Success = false;
            }
            return msg;
        }
    }
}
