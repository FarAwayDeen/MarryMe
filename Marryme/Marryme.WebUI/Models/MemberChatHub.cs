using Marryme.BAL.MarrymeClientManager;
using Microsoft.AspNet.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Marryme.WebUI.Models
{
    public class MemberChatHub : Hub
    {
        public void Hello()
        {
            Clients.All.hello("Default Message");
        }
        public void SendToMember(Int64 fromId, Int64 ToId, string message, string senderMemberConnectionId)
        {
            string timeNow = DateTime.Now.ToString();
            if (!string.IsNullOrEmpty(senderMemberConnectionId))
            {
                Clients.Client(senderMemberConnectionId).MemberReceived(message, timeNow);
            }
            if (!string.IsNullOrEmpty(message))
            {
                MemberChatManager.SaveMessage(fromId, ToId, message);
            }
        }
        public void SaveSession(Int64 memberId)
        {
            string connectionId = Context.ConnectionId;
            // save ConnectionId to database
            MemberChatManager.Save(memberId, connectionId);
        }
        //public override Task OnConnected()
        //{
        //    string connectionId = Context.ConnectionId;
        //    // save ConnectionId to database
        //    MemberChatManager.Save(33, connectionId);
        //    return null;
        //}
        public override Task OnDisconnected(bool stopCalled)
        {
            string connectionId = Context.ConnectionId;
            // delete connectionId from database
            MemberChatManager.Delete(connectionId);
            return null;
        }
        public MemberChatHub()
        {
            // Create a Long running task to do an infinite loop which will keep sending the server time
            // to the clients every 3 seconds.
            //var taskTimer = Task.Factory.StartNew(async () =>
            //{
            //    while (true)
            //    {
            //        string timeNow = DateTime.Now.ToString();
            //        //Sending the server time to all the connected clients on the client method SendServerTime()
            //        Clients.All.SendServerTime(timeNow);
            //        //Delaying by 3 seconds.
            //        await Task.Delay(3000);
            //    }
            //}, TaskCreationOptions.LongRunning
            //    );
        }
    }
}