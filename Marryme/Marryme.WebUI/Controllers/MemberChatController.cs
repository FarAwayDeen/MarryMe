using Marryme.BAL;
using Marryme.BAL.MarrymeClientManager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace Marryme.WebUI.Controllers
{
    public class MemberChatController : Controller
    {
        // GET: MemberChat
        public ActionResult LiveChat()
        {
            if (Session["MemberId"] != null)
            {
                ViewBag.MemberId = Session["MemberId"];
                Int64 memberId = Convert.ToInt64(Session["MemberId"]);
                ViewBag.Member = PersonalProfileCardManager.GetChatMemberProfileInfo(memberId);
                return View();
            }
            return RedirectToAction("Index", "Home");
        }
        public JsonResult FetchChatMembers(bool isFriend, string searchKeyWord)
        {
            long memberId = Convert.ToInt64(Session["MemberId"]);
            return Json(MemberChatManager.FetchChatMemberList(memberId, isFriend, searchKeyWord), JsonRequestBehavior.AllowGet);
        }
        public JsonResult FetchMemberChatConversation(long selectedMemberId)
        {
            long currentMemberId = Convert.ToInt64(Session["MemberId"]);
            return Json(MemberChatManager.FetchMemberChatConversation(currentMemberId, selectedMemberId), JsonRequestBehavior.AllowGet);
        }
        public JsonResult SendChatFriendRequest(long selectedMemberId)
        {
            long currentMemberId = Convert.ToInt64(Session["MemberId"]);
            return Json(MemberChatManager.SendChatFriendRequest(currentMemberId, selectedMemberId), JsonRequestBehavior.AllowGet);
        }
        public JsonResult BlockFriend(long selectedMemberId, long friendRequestId)
        {
            long currentMemberId = Convert.ToInt64(Session["MemberId"]);
            return Json(MemberChatManager.BlockFriend(currentMemberId, selectedMemberId, friendRequestId), JsonRequestBehavior.AllowGet);
        }
        public JsonResult UnBlockOrAcceptFriend(long friendRequestId)
        {
            return Json(MemberChatManager.UnBlockOrAcceptFriend(friendRequestId), JsonRequestBehavior.AllowGet);
        }
        public JsonResult UploadImage()
        {
            foreach (string file in Request.Files)
            {
                return Json(MemberChatManager.UploadImage(Request.Files[file]), JsonRequestBehavior.AllowGet);
            }
            return Json(new Message(), JsonRequestBehavior.AllowGet);
        }
        public JsonResult CheckForMessagePermission()
        {
            long fromId = Session["MemberId"].ToInt64();
            var packageDetail = Static.DbContext.MemberPackageSubscriptionDetails.FirstOrDefault(s => s.MemberId == fromId && s.IsActive);
            if (packageDetail is null)
            {
                return Json(false, JsonRequestBehavior.AllowGet);
            }
            if (packageDetail.UsedNoOfChatMessages <= packageDetail.TotalNoOfChatMessages)
            {
                return Json(true, JsonRequestBehavior.AllowGet);
            }
            return Json(false, JsonRequestBehavior.AllowGet);
        }
        public ActionResult UnReadCounterByMemberId()
        {
            return Json(MemberChatManager.UnReadCounterByMemberId(Convert.ToInt64(Session["MemberId"])), JsonRequestBehavior.AllowGet);
        }
        public ActionResult MarkMessagesAsReadByMemberId()
        {
            MemberChatManager.MarkMessagesAsReadByMemberId(Convert.ToInt64(Session["MemberId"]));
            return Json(true, JsonRequestBehavior.AllowGet);
        }

    }
}