

using System;

namespace Marryme.DAL
{
    public class CommonFilter
    {
        public string Search { get; set; }
        public string StrDateTime { get; set; }
        public string Active { get; set; }
        public string Code { get; set; }
        public string StrStartDate { get; set; }
        public string StrEndDate { get; set; }
    }
    public partial class PageContent : CommonFilter
    {
        public string To { get; set; }
    }
    public partial class MemberRegistration : CommonFilter
    {
        public string UID { get; set; }

        public byte[] Image { get; set; }
        public string ProfilePicturePostName { get; set; }
        public string ImageBase64 { get; set; }
        public long EductionLevels { get; set; }
        public long? Employment { get; set; }
        public string Religion { get; set; }
        public string Sect { get; set; }
    }
    public partial class FetchAstroMatches_Result : CommonFilter
    {
    }
    public partial class FetchMemberSubscription_Result
    {
        public long PackagePricingPlanId { get; set; }
    }
    public partial class MembersFetch_Result : CommonFilter
    {
    }
    public partial class PageContents1_Result : CommonFilter
    {
    }
    public partial class FetchPremiumMember_Result : CommonFilter
    {
    }
    public partial class AdminProfile : CommonFilter
    {
        public string ProfilePictureUrl { get; set; }
        public string OldPassword { get; set; }
        public string ConfirmPassword { get; set; }
        public bool Remember { get; set; }
    }
    public partial class Package : CommonFilter
    {
        public string PackageTypeCode { get; set; }
    }
    public partial class Packages1_Result : CommonFilter
    {
    }
    public partial class FetchPackageType_Result : CommonFilter
    {
    }
    public partial class EmailSMSTemplate : CommonFilter
    {
        public string To { get; set; }
    }
    public partial class PackagePricingPlan : CommonFilter
    {
        public string PackageTypeCode { get; set; }
    }
    public partial class FetchPackagePricingPlans_Result : CommonFilter
    {
        public string StrPackageDuration { get; set; }
    }
    public partial class FetchPackages_Result : CommonFilter
    {
    }
    public partial class MemberPackageSubscription : CommonFilter
    {
    }
    public partial class FetchPackageSubscription_Result : CommonFilter
    {
    }
    public partial class MemberRegistration : CommonFilter
    {        
        public string Country { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public int Day { get; set; }
        public int Month { get; set; }
        public int Year { get; set; }
        public string ReligionTypeCode { get; set; }
        public string CountryTypeCode { get; set; }
        public int? Height { get; set; }
        public long? PhysicalStatus { get; set; }
        public Nullable<int> Feet { get; set; }
        public string HeightUnit { get; set; }
        public Nullable<int> Inches { get; set; }
        public Nullable<int> Centimeters { get; set; }
    }
    public partial class Country : CommonFilter
    {

    }
    public partial class FetchCountries_Result : CommonFilter
    {

    }
    public partial class City : CommonFilter
    {
        public string CountryTypeCode { get; set; }
        public string CityTypeCode { get; set; }
        public string StateTypeCode { get; set; }
    }
    public partial class FetchCities_Result : CommonFilter
    {

    }
    public partial class State : CommonFilter
    {
        public string CountryTypeCode { get; set; }

    }
    public partial class FetchStates_Result : CommonFilter
    {

    }
    public partial class Religion : CommonFilter
    {

    }
    public partial class MemberAppearance : CommonFilter
    {
        public string Occupation { get; set; }
        public int LanguageId { get; set; }
        public string EatingHabit { get; set; }
        public string DrinkingHabit { get; set; }
        public string SmokingHabit { get; set; }
        public string Interests { get; set; }
        public string Hobbies { get; set; }
        public string LanguageTypeCode { get; set; }
    }
    public partial class MemberLocationDetail : CommonFilter
    {
        public string CountryLivingInTypeCode { get; set; }
        public string CountryTypeCode { get; set; }
        public string CityTypeCode { get; set; }
        public string StateTypeCode { get; set; }
    }
    public partial class MemberReligiousDetail : CommonFilter
    {
        public int Hour { get; set; }
        public int Minute { get; set; }
        public string Meridiem { get; set; }
        public string CountryTypeCode { get; set; }
        public string CityTypeCode { get; set; }
        public string StateTypeCode { get; set; }
    }
    public partial class FetchMemberList_Result : CommonFilter
    {
        public int age { get; set; }
        public string ShowName { get; set; }
    }
    public partial class FetchMyMatches_Result : CommonFilter
    {
        public int age { get; set; }
        public string ShowName { get; set; }
    }

    public partial class FetchMemberDetail_Result : CommonFilter
    {

    }
    public partial class FetchProfileLocationDetail_Result : CommonFilter
    {
        public string CountryLivingInTypeCode { get; set; }
        public string CountryTypeCode { get; set; }
        public string CityTypeCode { get; set; }
        public string StateTypeCode { get; set; }
    }
    public partial class FetchPackagesDuration_Result : CommonFilter
    {
        public bool IsCurrent { get; set; }
    }
    public partial class FetchFeedBack_Result : CommonFilter
    {

    }
    public partial class FetchLanguagesByMemberId_Result : CommonFilter
    {

    }
    public partial class Language : CommonFilter
    {

    }
    public partial class FetchPaymentOptions_Result : CommonFilter
    {

    }
    public partial class PaymentOption : CommonFilter
    {

    }
    public partial class FetchContactUs_Result : CommonFilter
    {

    }
    public partial class GetBestMatchingByCRList_Result : CommonFilter
    {

    }
    public partial class FetchPremiumBestMatches_Result : CommonFilter
    {
        public int age { get; set; }
        public string ShowName { get; set; }
    }
    public partial class ContactU : CommonFilter
    {

    }
    public partial class FetchFeedBackAdminList_Result : CommonFilter
    {

    }
    public partial class FeedBack : CommonFilter
    {

    }
    public partial class FetchMemberAdminList_Result : CommonFilter
    {

    }
    public partial class FetchCountriesAdminList_Result : CommonFilter
    {

    }
    public partial class FetchStatesAdminList_Result : CommonFilter
    {

    }
    public partial class FetchCitiesAdminList_Result : CommonFilter
    {

    }
    public partial class ApplicationSetting : CommonFilter
    {

    }
    public class ChangePassword
    {
        public string OldPassword { get; set; }
        public string NewPassword { get; set; }
        public string Email { get; set; }
    }
    public partial class FetchNewlyRegisteredMemberList_Result : CommonFilter
    {
        public int age { get; set; }
        public string ShowName { get; set; }
    }
    public partial class FetchProfilePersonalInfoDetail_Result : CommonFilter
    {
        public string LanguageTypeCode { get; set; }
    }
    public partial class FetchProfileLanguages_Result : CommonFilter
    {

    }
    public partial class FetchLanguages_Result : CommonFilter
    {
        public string LanguageTypeCode { get; set; }
    }
    public partial class MemberPackageConfirmPayment : CommonFilter
    {
        public string PaymentOptionTypeCode { get; set; }
        public byte[] Image { get; set; }
        public string PictureName { get; set; }
        public string ImageBase64 { get; set; }
    }
    public partial class FetchPaymentOptionddl_Result : CommonFilter
    {
        public string PaymentOptionTypeCode { get; set; }
    }
    public partial class FetchConfirmPaymentAdminList_Result : CommonFilter
    {

    }
    public partial class FetchConfirmPaymentClientList_Result : CommonFilter
    {

    }
    public partial class FetchFeedBackNotification_Result : CommonFilter
    {

    }
    public partial class FetchContactUsNotification_Result : CommonFilter
    {

    }
    public partial class FetchChatMemberList_Result : CommonFilter
    {

    }
}
