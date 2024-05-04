using Marryme.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Marryme.BAL.MarrymeClientManager
{
    public class LocationManager
    {
        private static readonly MarrymeEntities db = Static.DbContext;
        public static Message FetchProfileLocationDetail(Int64 memberId)
        {
            Message msg = new Message();
            try
            {
                //Logic for Fetch Country Name
                FetchProfileLocationDetail_Result locationDetail = db.FetchProfileLocationDetail(memberId).FirstOrDefault();
                locationDetail.CountryLivingInTypeCode = locationDetail.CountryLivingIn.EncodeQueryString();
                locationDetail.CityTypeCode = locationDetail.ResidingCity.EncodeQueryString();
                locationDetail.StateTypeCode = locationDetail.ResidingState.EncodeQueryString();
                locationDetail.CountryTypeCode = locationDetail.Citizenship.IsNullOrZero() ? string.Empty : locationDetail.Citizenship.ToString().EncodeQueryString();
                msg.Data = locationDetail;
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("Client/MemberManger/FetchProfileLocationDetail");
            }
            return msg;
        }
        public static Message LocationInfo(MemberLocationDetail model)
        {
            Message msg = new Message();
            try
            {
                //logic for Member Location
                MemberLocationDetail memberlocation = db.MemberLocationDetails.FirstOrDefault(s => s.MemberId == model.MemberId);
                if (memberlocation == null)
                {
                    memberlocation = new MemberLocationDetail
                    {
                        MemberId = model.MemberId
                    };
                }
                if (!string.IsNullOrEmpty(model.CountryLivingInTypeCode))
                {
                    memberlocation.CountryLivingIn = model.CountryLivingInTypeCode.DecodeQueryString().ToInt();
                }
                if (!string.IsNullOrEmpty(model.CountryTypeCode))
                {
                    memberlocation.Citizenship = model.CountryTypeCode.DecodeQueryString().ToInt();
                }
                if (!string.IsNullOrEmpty(model.CityTypeCode))
                {
                    memberlocation.ResidingCity = model.CityTypeCode.DecodeQueryString().ToString();
                }
                if (!string.IsNullOrEmpty(model.StateTypeCode))
                {
                    memberlocation.ResidingState = model.StateTypeCode.DecodeQueryString().ToString();
                }
                memberlocation.PlaceOfBirth = model.PlaceOfBirth;

                if (memberlocation.Id.IsNullOrZero())
                {
                    db.MemberLocationDetails.Add(memberlocation);
                }
                db.SaveChanges();
                msg.Success = true;
                msg.Detail = "Member Location Detail Saved Successfully.";

            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("Client/MemberManger/LocationInfo");
            }
            return msg;
        }
    }
}
