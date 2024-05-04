using Marryme.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Marryme.BAL;


namespace Marryme.BAL
{

    public static class Generic
    {
        static readonly MarrymeEntities  db = new MarrymeEntities();
        #region Fro DropDowns From CR_List 
        public static Message FetchCRListByID(long crListID,string DisplayFor)
        {
            Message msg = new Message();
            try
            {
                //Logic for Partner Catgory Checkbox Detail
                List<GetCRList_ByTypeID_Result> items = db.GetCRList_ByTypeID(crListID, DisplayFor).ToList();
                msg.Data = items;
                msg.Success = true;
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Warning = true;
                ex.LogError("Client/MemberManger/ProfileRequirement Partnercatagory");
            }
            return msg;
        }        
        #endregion
        public static AdminReporting_Result GetReporting()
        {
            using (var db = new MarrymeEntities())
            {
                return new AdminReporting_Result();
                //return db.AdminReporting().FirstOrDefault();
            }
        }
        public enum WifeDetail
        {
            ExsitingWife = 1,
            HaveWife = 2,
            Religion = 3,
            Age = 4,
            MarriageYear = 5,
            Education = 6,
            Job = 7,
            Location = 8,
            Kids = 9
        }
        public static Message ActiveStatus
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        ActiveStatusList = new ActiveStatus().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message PackageDuration
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        PackageDurationList = new PackageDurationStatus().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message Sections
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        SectionsList = new Sections().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message Religion
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        ReligionsList = new belief().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message Sect
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        SectList = new Sect().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message Hours
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        HoursList = new Hours().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message Minutes
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        MinutesList = new Minutes().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message Meridiem
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        MeridiemList = new Meridiem().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        } 
        public static Message ExsitingWife
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        ExsitingWifeList = new ExsitingWife().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message ExsitingWifeLivingStatus
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        ExsitingWifeLivingStatusList = new ExsitingWifeLivingStatus().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message TrueFalse
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        TrueFalseList = new trueFalse().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message ChartStyle
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        ChartStyleList = new ChartStyle().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message Height
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        HeightList = new Height().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message Weight
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        WeightList = new weight().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message Age
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        AgeList = new Age().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message PreBindPacakageTypes
        {
            get
            {
                Message msg = new Message();
                try
                {
                    List<FetchPackageType_Result> packageTypes = Static.DbContext.FetchPackageType().ToList();
                    packageTypes.ForEach(s => { s.Code = s.Id.EncodeQueryString(); });
                    msg.Data = new
                    {
                        PackageTypeList = packageTypes
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }

        public static Message PreBindPacakages
        {
            get
            {
                Message msg = new Message();
                try
                {
                    List<FetchPackages_Result> packageTypes = Static.DbContext.FetchPackages().ToList();
                    packageTypes.ForEach(s => { s.Code = s.PackageId.EncodeQueryString(); });
                    msg.Data = new
                    {
                        PackageTypeList = packageTypes
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message PreBindCountryLivingIn
        {
            get
            {
                Message msg = new Message();
                try
                {

                    List<FetchCountries_Result> countryLivingIn = Static.DbContext.FetchCountries().ToList();
                    countryLivingIn.ForEach(s => { s.Code = s.Id.EncodeQueryString(); });
                    msg.Data = new
                    {
                        countryLivingInList = countryLivingIn
                    };
                }
                catch (Exception ex)
                {

                }
                return msg;
            }
        }
        public static Message PreBindCountries
        {
            get
            {
                Message msg = new Message();
                try
                {

                    List<FetchCountries_Result> countries = Static.DbContext.FetchCountries().ToList();
                    countries.ForEach(s => { s.Code = s.Id.EncodeQueryString(); });
                    msg.Data = new
                    {
                        countryList = countries
                    };
                }
                catch (Exception ex)
                {

                }
                return msg;
            }
        }
        public static Message PreBindCities(string stateId)
        {
            Message msg = new Message();
            try
            {
                int StateId = 0;
                if (stateId.Contains("%"))
                    StateId = Convert.ToInt32(stateId.DecodeQueryString());
                else
                    StateId = stateId.ToInt();
                List<FetchCities_Result> cities = Static.DbContext.FetchCities(StateId).ToList();
                cities.ForEach(s => { s.Code = s.CityID.EncodeQueryString(); });
                msg.Data = new
                {
                    citiesList = cities
                };
            }
            catch (Exception ex)
            {

            }
            return msg;
        }

        public static Message PreBindStates(string CountryId)
        {
            Message msg = new Message();
            try
            {
                int countryId = 0;
                if (CountryId.Contains("%"))
                    countryId = Convert.ToInt32(CountryId.DecodeQueryString());
                else
                    countryId = CountryId.ToInt();
                List<FetchStates_Result> states = Static.DbContext.FetchStates(countryId).ToList();
                states.ForEach(s => { s.Code = s.StateID.EncodeQueryString(); });
                msg.Data = new
                {
                    statesList = states
                };
            }
            catch (Exception ex)
            {

            }
            return msg;
        }
        public static Message PreBindLanguages()
        {
            Message msg = new Message();
            try
            {
                List<FetchLanguages_Result> languages = Static.DbContext.FetchLanguages().ToList();
                languages.ForEach(s => { s.Code = s.Id.EncodeQueryString(); });
                msg.Data = new
                {
                    LanguagesList = languages
                };
            }
            catch (Exception ex)
            {

            }
            return msg;
        }
        //public static Message FetchLanguageByMemberId(int MemberId)
        //{
        //    Message msg = new Message();
        //    try
        //    {
        //        List<FetchLanguagesByMemberId_Result> languages= Static.DbContext.FetchLanguagesByMemberId(MemberId).ToList();
        //        languages.ForEach(s => { s.Code = s.Id.EncodeQueryString(); });
        //        msg.Data = new
        //        {
        //            LanguagesList = languages
        //        };
        //    }
        //    catch (Exception)
        //    {

        //    }
        //    return msg;
        //}
        public static Message PreBindReligion
        {
            get
            {
                Message msg = new Message();
                try
                {

                    List<Religion> Religion = Static.DbContext.Religions.ToList();
                    Religion.ForEach(s => { s.Code = s.ID.EncodeQueryString(); });
                    msg.Data = new
                    {
                        ReligionList = Religion
                    };
                }
                catch (Exception ex)
                {

                }
                return msg;
            }
        }
        public static Message DocDropdownList
        {
            get
            {
                Message msg = new Message();
                try
                {

                    List<DocDropdownList> doclist = Static.DbContext.DocDropdownLists.ToList();
                    msg.Data = new
                    {
                        DocumentList = doclist
                    };
                }
                catch (Exception ex)
                {

                }
                return msg;
            }
        }
        public static Message Gender
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        GenderList = new Gender().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message Gender2
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        Gender2List = new Gender2().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message RegisteredBy
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        RegisteredByList = new RegisteredBy().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message LookingFor
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        LookingForList = new LookingFor().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message MarriageNo
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        MarriageNoList = new MarriageNo().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message WifeNo
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        WifeNoList = new WifeNo().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message MaritalStatusMale
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        MaritalStatusMaleList = new MaritalStatusMale().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message EducationLevel
        {
            get
            {
                Message msg = new Message();
                try
                {
                                                  
                    msg.Data = new
                    {
                        EducationLevelList = Static.DbContext.EductionLevels.ToList()
                };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }       
        public static Message MaritalStatusFemale
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        MaritalStatusFemaleList = new MaritalStatusFemale().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message MaritalStatusMaleFemale
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        MaritalStatusMaleFemaleList = new MaritalStatusMaleFemale().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message Day
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        DaysList = new Day().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message Month
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        MonthList = new Month().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message Year
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        YearList = new Year().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message NoOfChild
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        ChildList = new NoOfChildern().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message PhysicalStatus
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        PhysicalStatusList = new PhysicalStatus().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message EmployedIn
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        EmployedInList = new EmployedIn().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message FamilyValue
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        FamilyValueList = new FamilyValue().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message FamilyType
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        FamilyTypeList = new FamilyType().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message FamilyStatus
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        FamilyStatusList = new FamilyStatus().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message Dosham
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        DoshamList = new Dosham().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message BodyType
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        BodyTypeList = new BodyType().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message Complexion
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        ComplexionList = new Complexion().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message EatingHabits
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        EatingHabitsList = new EatingHabits().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message DrinkingHabits
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        DrinkingHabitsList = new DrinkingHabits().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message SmokingHabits
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        SmokingHabitsList = new SmokingHabits().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message CurrencySimbals
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        CurrencySimbalList = new CurrencySimbals().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }
        public static Message PaymentType
        {
            get
            {
                Message msg = new Message();
                try
                {
                    msg.Data = new
                    {
                        PaymentTypeList = new PaymentType().EnumToList()
                    };
                }
                catch (Exception)
                {

                }
                return msg;
            }
        }

        //public static List<DocDropdownList> GetDropDown() { 
        
        
        
        //}
        public static Message emailTemplate(string templateName, string email, string userDisplayName, string requestLink)
        {
            Message msg = new Message();
            try
            {
                EmailSMSTemplate emailTemplate = Static.DbContext.EmailSMSTemplates.AsEnumerable().FirstOrDefault(x => x.Name.Equals(templateName));
                emailTemplate.To = email;
                emailTemplate.MessageBody = emailTemplate.MessageBody
                    .Replace("{#!Email!#}", email)
                    .Replace("{#!Name!#}", userDisplayName)
                    .Replace("{#!SiteName!#}", Static.SiteName)
                    .Replace("{#!BaseUrl!#}", Static.BaseUrl)
                    .Replace("{#!ActiveYear!#}", Static.YearActive.ToString())
                    .Replace("{#!RequestLink!#}", requestLink);
                emailTemplate.SendEmail();
                msg.Detail = "Email Send To " + userDisplayName + " SuccessFully.";
                return msg;
            }
            catch (Exception ex)
            {
                msg.Detail = ex.Message;
                msg.Success = false;
                //Static.UserProfile.LogError(ex, "BLL/emailTemplate");
            }
            return msg;
        }
        public static string GetRandomPassword(int length)
        {
            const string valid = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
            StringBuilder res = new StringBuilder();
            Random rnd = new Random();
            while (0 < length--)
            {
                res.Append(valid[rnd.Next(valid.Length)]);
            }
            return res.ToString();
        }
        public static string TimeAgo(DateTime dateTime)
        {
            const int SECOND = 1;
            const int MINUTE = 60 * SECOND;
            const int HOUR = 60 * MINUTE;
            const int DAY = 24 * HOUR;
            const int MONTH = 30 * DAY;

            var ts = new TimeSpan(DateTime.UtcNow.Ticks - dateTime.Ticks);
            double delta = Math.Abs(ts.TotalSeconds);

            if (delta < 1 * MINUTE)
                return ts.Seconds == 1 ? "one second ago" : ts.Seconds + " seconds ago";

            if (delta < 2 * MINUTE)
                return "a minute ago";

            if (delta < 45 * MINUTE)
                return ts.Minutes + " minutes ago";

            if (delta < 90 * MINUTE)
                return "an hour ago";

            if (delta < 24 * HOUR)
                return ts.Hours + " hours ago";

            if (delta < 48 * HOUR)
                return "yesterday";

            if (delta < 30 * DAY)
                return ts.Days + " days ago";

            if (delta < 12 * MONTH)
            {
                int months = Convert.ToInt32(Math.Floor((double)ts.Days / 30));
                return months <= 1 ? "one month ago" : months + " months ago";
            }
            else
            {
                int years = Convert.ToInt32(Math.Floor((double)ts.Days / 365));
                return years <= 1 ? "one year ago" : years + " years ago";
            }
        }

    }
}
