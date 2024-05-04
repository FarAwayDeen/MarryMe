using Marryme.DAL;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Marryme.BAL.MarrymeClientManager
{
    public class FieldPermissionManager
    {
        private static readonly MarrymeEntities db = new MarrymeEntities();
        public static Message GetActiveSections(long memberId)
        {
            Message msg = new Message();
            try
            {
                using (var contxt = new MarrymeEntities())
                {
                    var list = new ListDictionary();
                    List<FetchMemberFieldPermission_Result> lstFieldsPermission = contxt.FetchMemberFieldPermission(memberId).ToList();
                    //  db.Entry(lstFieldsPermission).Reload();
                    foreach (var item in lstFieldsPermission)
                    {
                        bool value = lstFieldsPermission.FirstOrDefault(s => s.Name == item.Name).IsVisibleForPremium ? (lstFieldsPermission.FirstOrDefault(s => s.Name == item.Name).IsPaid ? false : true) : lstFieldsPermission.FirstOrDefault(s => s.Name == item.Name).IsVisibleForPremium;
                        list.Add(item.Name, value);
                    }
                    msg.Data = list;
                }
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("FieldPermissionManager/GetActiveSections");

            }
            return msg;
        }
    }
}
