using Marryme.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace Marryme.BAL.MarrymeClientManager
{
    public class MemberChatManager
    {
        private static readonly MarrymeEntities db = new MarrymeEntities();

        public static Message Save(Int64 memberId, string sessionId)
        {
            Message msg = new Message();
            try
            {
                //var msg2 = Delete(sessionId);
                var msg2 = DeleteByMemberId(memberId);
                ChatSession chatSession = new ChatSession
                {
                    MemberId = memberId,
                    SessionId = sessionId
                };
                db.ChatSessions.Add(chatSession);
                db.SaveChanges();
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                //ex.LogError("BusinessLogic.BAL.Matrimony.Client/MemberChatManager/Save");
            }
            return msg;
        }
        public static Message SaveMessage(Int64 fromId, Int64 ToId, string message)
        {
            Message msg = new Message();
            try
            {
                //var packageDetail = db.MemberPackageSubscriptionDetails.FirstOrDefault(s => s.MemberId == fromId && s.IsActive);
                //if (packageDetail.UsedNoOfChatMessages <= packageDetail.TotalNoOfChatMessages)
                //{
                    ChatMessage chatMessage = new ChatMessage
                    {
                        FromID = fromId,
                        ToID = ToId,
                        Message = message,
                        MessageDateTime = DateTime.Now,
                        IsRead = false
                    };
                    db.ChatMessages.Add(chatMessage);
                    //db.MemberPackageSubscriptionDetails.FirstOrDefault(s => s.MemberId == fromId && s.IsActive).UsedNoOfChatMessages += 1;
                    db.SaveChanges();
               // }
                //else
                //{
                //    msg.Detail = "You have Reached Your Messages Limit.";
                //    msg.Success = false;
                //}
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                //ex.LogError("BusinessLogic.BAL.Matrimony.Client/MemberChatManager/SaveMessage");
            }
            return msg;
        }
        public static Message Delete(string sessionId)
        {
            Message msg = new Message();
            try
            {
                ChatSession chatSession = db.ChatSessions.FirstOrDefault(s => s.SessionId == sessionId);
                if (chatSession != null)
                {
                    db.ChatSessions.Remove(chatSession);
                    db.SaveChanges();
                }

            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                //ex.LogError("BusinessLogic.BAL.Matrimony.Client/MemberChatManager/Delete");
            }
            return msg;
        }
        public static Message DeleteByMemberId(long memberId)
        {
            Message msg = new Message();
            try
            {
                var chatSessionList = db.ChatSessions.Where(s => s.MemberId == memberId).ToList();
                if (chatSessionList.Count > 0)
                {
                    db.ChatSessions.RemoveRange(chatSessionList);
                    db.SaveChanges();
                }

            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                //ex.LogError("BusinessLogic.BAL.Matrimony.Client/MemberChatManager/DeleteByMemberId");
            }
            return msg;
        }
        public static Message FetchChatMemberList(long memberId, bool isFriend, string searchKeyWord)
        {
            Message msg = new Message();
            try
            {
                if (isFriend)
                {
                    List<FetchChatFriendList_Result> chatMember = Static.DbContext.FetchChatFriendList(memberId, searchKeyWord).ToList();
                    chatMember.ForEach(s =>
                    {
                        s.ProfilePicPath = string.Concat("/Images/ProfilePictures/" + s.Id + "/" + s.ProfilePicPath);
                    });
                    msg.Data = new
                    {
                        chatMemberList = chatMember
                    };
                }
                else
                {
                    List<FetchChatMemberList_Result> chatMember = Static.DbContext.FetchChatMemberList(memberId, searchKeyWord).ToList();
                    chatMember.ForEach(s =>
                    {
                        s.Code = s.Id.EncodeQueryString();
                        s.ProfilePicPath = string.Concat("/Images/ProfilePictures/" + s.Id + "/" + s.ProfilePicPath);
                    });
                    msg.Data = new
                    {
                        chatMemberList = chatMember
                    };
                }

            }
            catch (Exception)
            {

            }
            return msg;
        }

        public static Message FetchMemberChatConversation(long currentMemberId, long selectedMemberId)
        {
            Message msg = new Message();
            try
            {
                db.ChatMessages.Where(s => s.FromID == selectedMemberId && s.ToID == currentMemberId).ToList().ForEach(s =>
                {
                    s.IsRead = true;
                });
                db.SaveChanges();
                List<FetchChatMemberConversation_Result> chatMemberConversation = db.FetchChatMemberConversation(currentMemberId, selectedMemberId).ToList();
                chatMemberConversation.ForEach(s =>
                {
                    s.CurrentMemberImage = string.Concat(Static.BaseUrl + "/Images/ProfilePictures/" + currentMemberId + "/" + s.CurrentMemberImage);
                    s.SelectedMemberImage = string.Concat(Static.BaseUrl + "/Images/ProfilePictures/" + selectedMemberId + "/" + s.SelectedMemberImage);
                    s.Message = s.Message.Contains("/Content/UserSendImages/") ? @"<a href='" + s.Message + "' class=\"venobox\" data-gall=\"gallery-item\"><img src='" + s.Message + "' style=\"width: 250px; border-radius:unset; \"/></a>" : s.Message;
                });
                msg.Data = new
                {
                    ChatMemberConversation = chatMemberConversation
                };
            }
            catch (Exception ex)
            {

            }
            return msg;
        }
        public static Message SendChatFriendRequest(Int64 fromId, long ToId)
        {
            Message msg = new Message();
            try
            {
                if (db.ChatFriendRequests.Any(s => s.FromId == fromId && s.ToId == ToId))
                {
                    msg.Detail = "Already Send";
                    return msg;
                }
                ChatFriendRequest chatRequestStatus = new ChatFriendRequest()
                {
                    FromId = fromId,
                    ToId = ToId,
                    IsBlocked = false,
                    RequestStatus = ChatRequestStatus.Pending.ToString(),
                    RequestDatetime = DateTime.Now
                };
                db.ChatFriendRequests.Add(chatRequestStatus);
                db.SaveChanges();
                msg.Detail = "Friend request sent successfully";
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("BusinessLogic.BAL.Matrimony.Client/MemberChatManager/SendChatFriendRequest");
            }
            return msg;
        }

        public static Message BlockFriend(Int64 fromId, long ToId, long friendRequestId)
        {
            Message msg = new Message();
            try
            {
                if (friendRequestId > 0)
                {
                    ChatFriendRequest chatRequestStatus = db.ChatFriendRequests.FirstOrDefault(s => s.Id == friendRequestId);
                    if (chatRequestStatus != null)
                    {
                        chatRequestStatus.IsBlocked = true;
                        chatRequestStatus.RequestStatus = ChatRequestStatus.Rejected.ToString();
                        chatRequestStatus.BlockedBy = fromId;
                    }
                }
                else
                {
                    ChatFriendRequest chatRequestStatus = new ChatFriendRequest()
                    {
                        FromId = fromId,
                        ToId = ToId,
                        IsBlocked = true,
                        RequestStatus = ChatRequestStatus.Rejected.ToString(),
                        RequestDatetime = DateTime.Now,
                        BlockedBy = fromId
                    };
                    db.ChatFriendRequests.Add(chatRequestStatus);
                }

                db.SaveChanges();
                msg.Detail = "Friend Blocked";
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("BusinessLogic.BAL.Matrimony.Client/MemberChatManager/BlockFriend");
            }
            return msg;
        }

        public static Message UnBlockOrAcceptFriend(long friendRequestId)
        {
            Message msg = new Message();
            try
            {
                if (friendRequestId > 0)
                {
                    ChatFriendRequest chatRequestStatus = db.ChatFriendRequests.FirstOrDefault(s => s.Id == friendRequestId);
                    if (chatRequestStatus != null)
                    {
                        chatRequestStatus.IsBlocked = false;
                        chatRequestStatus.RequestStatus = ChatRequestStatus.Accepted.ToString();
                    }
                }

                db.SaveChanges();
                msg.Detail = "Friend UnBlocked successfully";
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("BusinessLogic.BAL.Matrimony.Client/MemberChatManager/UnBlockFriend");
            }
            return msg;
        }

        public static Message UploadImage(HttpPostedFileBase file)
        {
            Message msg = new Message();
            try
            {
                msg.Data = "/Content/UserSendImages/" + file.UploadFile("/Content/UserSendImages/").Data;
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("BusinessLogic.BAL.Matrimony.Client/MemberChatManager/UploadImage");
            }
            return msg;
        }

        public static Message UnReadCounterByMemberId(long memberId)
        {
            Message msg = new Message();
            try
            {
                msg.Data = db.ChatMessages.Where(s => s.ToID == memberId && !s.IsRead).Count();
            }
            catch (Exception ex)
            {
            }
            return msg;
        }
        public static void MarkMessagesAsReadByMemberId(long memberId)
        {
            try
            {
                db.ChatMessages.Where(s => s.ToID == memberId).ToList().ForEach(s =>
                {
                    s.IsRead = true;
                });
                db.SaveChanges();
            }
            catch (Exception ex)
            {
            }
        }
    }
}
