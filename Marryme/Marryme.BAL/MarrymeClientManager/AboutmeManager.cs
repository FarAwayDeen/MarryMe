using Marryme.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Marryme.BAL.MarrymeClientManager
{
    public class AboutmeManager
    {
        private static readonly MarrymeEntities db = Static.DbContext;
        public static Message AboutMe(MemberRegistration model)
        {
            Message msg = new Message();
            try
            {
                //Logic for About Me in Member Registration
                MemberRegistration aboutMe = db.MemberRegistrations.FirstOrDefault(s => s.Id == model.Id);
                aboutMe.AboutMe = model.AboutMe;
                db.SaveChanges();
                msg.Detail = "About Me Saved Successfully.";
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("Client/AboutmeManager/AboutMe");
            }
            return msg;

        }
        public static Message GetById(Int64 memberId)
        {
            Message msg = new Message();
            try
            {
                msg.Data = db.MemberRegistrations.FirstOrDefault(s => s.Id == memberId).AboutMe;
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("Client/AboutmeManager/GetById");
            }
            return msg;

        }
    }
}
