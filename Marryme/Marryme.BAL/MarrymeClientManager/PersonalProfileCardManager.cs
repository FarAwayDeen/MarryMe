using Marryme.BAL.ViewModels;
using Marryme.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Marryme.BAL.MarrymeClientManager
{
   public class PersonalProfileCardManager
    {
        private static readonly MarrymeEntities db = new MarrymeEntities();
        public static ChatMemberProfileModel GetChatMemberProfileInfo(Int64 memberId)
        {

            ChatMemberProfileModel model = new ChatMemberProfileModel();
            try
            {
                //Logic for get Personal Info For Personal Profile Card
                //msg.Data= db.FetchProfilePersonalInfo(memberId).FirstOrDefault();

                var prsonalInfo = db.FetchInfoForPersonalProfileCard(memberId).FirstOrDefault();
                model.Id = prsonalInfo.Id;
                model.Name = prsonalInfo.Name;
                prsonalInfo.ProfilePicPath = string.Concat("/Images/ProfilePictures/" + prsonalInfo.Id + "/" + prsonalInfo.ProfilePicPath);
                model.ProfilePic = prsonalInfo.ProfilePicPath;
            }
            catch (Exception ex)
            {
                ex.LogError("BusinessLogic.BAL.Matrimony.Client/GetPersonalInfoForProfileCard/PersonalInfoForProfileCard");
            }
            return model;
        }
    }
}
