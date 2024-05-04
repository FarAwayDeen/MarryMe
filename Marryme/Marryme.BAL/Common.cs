using Marryme.DAL;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace Marryme.BAL
{

    public static class Static
    {
        public static MarrymeEntities DbContext { get { return new MarrymeEntities(); } }
        public static string ConnectionString { get { return DbContext.Database.Connection.ConnectionString; } }
        //public static string UserId { get { try { return HttpContext.Current.User.Identity.GetUserId(); } catch { return String.Empty; } } }
        public static AdminProfile UserProfile { get { return GetProfile(); } }
        //public static string UserRole { get { return UserId.FetchUserRole(); } }
        //public static UserViewModel UserProfileWithoutIdentity { get { return UserId.FetchUserProfileWithoutIdentity(); } }
        public static string DefaultImagePath { get { return "defaultImage.gif"; } }
        public static string DefaultImagePathStory { get { return "defaultImage.jpg"; } }
        public static string CurrencySymbol { get { return WebConfigurationManager.AppSettings["CurrencySymbol"]; } }
        public static string EmailPort { get { return WebConfigurationManager.AppSettings["Port"]; } }
        public static string FirebaseApiKey { get { return WebConfigurationManager.AppSettings["FirebaseApiKey"]; } }
        public static string SiteName { get { return WebConfigurationManager.AppSettings["SiteName"]; } }
        public static string EmailServerHost { get { return WebConfigurationManager.AppSettings["ServerHost"]; } }
        public static string Email { get { return WebConfigurationManager.AppSettings["Email"]; } }
        public static string EmailTo { get { return WebConfigurationManager.AppSettings["EmailTo"]; } }
        public static string EmailPassword { get { return WebConfigurationManager.AppSettings["Password"]; } }
        public static string EmailDisplayName { get { return WebConfigurationManager.AppSettings["DisplayName"]; } }
        public static string EmailDisplayEmail { get { return WebConfigurationManager.AppSettings["DisplayEmail"]; } }
        public static bool EnableSsl { get { return Convert.ToBoolean(WebConfigurationManager.AppSettings["EnableSsl"]); } }
        public static string ftpUsername { get { return WebConfigurationManager.AppSettings["ftpUsername"]; } }
        public static string ftpPassword { get { return WebConfigurationManager.AppSettings["ftpPassword"]; } }
        public static string ftpPath { get { return WebConfigurationManager.AppSettings["ftpPath"]; } }
        public static string ftpUrl { get { return WebConfigurationManager.AppSettings["ftpUrl"]; } }
        public static string FacebookAppKey { get { return WebConfigurationManager.AppSettings["FacebookAppKey"]; } }
        public static string FacebookAppSecret { get { return WebConfigurationManager.AppSettings["FacebookAppSecret"]; } }
        public static string TwitterConsumerKey { get { return WebConfigurationManager.AppSettings["TwitterConsumerKey"]; } }
        public static string LogoPath { get { return DbContext.ApplicationSettings.FirstOrDefault(s => s.IsActive == true).Logo; } }
        public static ApplicationSetting ApplicationSettings { get { return DbContext.ApplicationSettings.FirstOrDefault(s => s.IsActive == true); } }
        public static string TwitterConsumerSecret { get { return WebConfigurationManager.AppSettings["TwitterConsumerSecret"]; } }
        public static string InstagramClientId { get { return WebConfigurationManager.AppSettings["InstagramClientId"]; } }
        public static string InstagramSecret { get { return WebConfigurationManager.AppSettings["InstagramSecret"]; } }
        public static string AllowedExtension { get { return WebConfigurationManager.AppSettings["AllowedExtension"]; } }
        public static string BaseUrl { get { return WebConfigurationManager.AppSettings["BaseUrl"]; } }
        public static string AdminUrl { get { return WebConfigurationManager.AppSettings["AdminUrl"]; } }
        public static string LiveUrl { get { return WebConfigurationManager.AppSettings["LiveUrl"]; } }
        public static string ImageUrl { get { return WebConfigurationManager.AppSettings["ImageUrl"]; } }
        public static string WidthImageEpaper { get { return WebConfigurationManager.AppSettings["ImageWidthEpaper"]; } }
        public static string WebSiteUrl { get { return WebConfigurationManager.AppSettings["WebSiteUrl"]; } }
        public static string ClientUrl { get { return WebConfigurationManager.AppSettings["ClientUrl"]; } }
        public static string ApiUrl { get { return WebConfigurationManager.AppSettings["ApiUrl"]; } }
        public static string TimeDifference { get { return WebConfigurationManager.AppSettings["TimeDifference"]; } }
        public static int FileUploadLength { get { return Convert.ToInt32(WebConfigurationManager.AppSettings["CareerFileLength"]); } }
        public static string Ios_min_version { get { return WebConfigurationManager.AppSettings["ios_min_version"]; } }
        public static string Ios_warning_version { get { return WebConfigurationManager.AppSettings["ios_warning_version"]; } }
        public static string Android_min_version { get { return WebConfigurationManager.AppSettings["android_min_version"]; } }
        public static string Android_warning_version { get { return WebConfigurationManager.AppSettings["android_warning_version"]; } }
        public static string ClientId { get { return WebConfigurationManager.AppSettings["ClientId"]; } }
        public static string ClientSecret { get { return WebConfigurationManager.AppSettings["ClientSecret"]; } }
        public static string CompanyEmailSecurityCheck { get { return WebConfigurationManager.AppSettings["CompanyEmailSecurityCheck"]; } }
        public static int YearActive { get { return DateTime.Now.Year; } }
        #region Paypal Settings
        public static string UseSandbox { get { return WebConfigurationManager.AppSettings["UseSandbox"]; } }
        public static string BusinessEmail { get { return WebConfigurationManager.AppSettings["BusinessEmail"]; } }
        public static string CurrencyCode { get { return WebConfigurationManager.AppSettings["CurrencyCode"]; } }
        public static string PaypalAPIUsername { get { return WebConfigurationManager.AppSettings["PaypalAPIUsername"]; } }
        public static string PaypalAPIPassword { get { return WebConfigurationManager.AppSettings["PaypalAPIPassword"]; } }
        public static string PaypalAPISignature { get { return WebConfigurationManager.AppSettings["PaypalAPISignature"]; } }
        #endregion


        #region FirebaseSettings
        public static string apiKey { get { return WebConfigurationManager.AppSettings["apiKey"]; } }
        public static string authDomain { get { return WebConfigurationManager.AppSettings["authDomain"]; } }
        public static string databaseURL { get { return WebConfigurationManager.AppSettings["databaseURL"]; } }
        public static string projectId { get { return WebConfigurationManager.AppSettings["projectId"]; } }
        public static string storageBucket { get { return WebConfigurationManager.AppSettings["storageBucket"]; } }
        public static string messagingSenderId { get { return WebConfigurationManager.AppSettings["messagingSenderId"]; } }
        public static string appId { get { return WebConfigurationManager.AppSettings["appId"]; } }
        public static string measurementId { get { return WebConfigurationManager.AppSettings["measurementId"]; } }
        #endregion
        private static AdminProfile GetProfile()
        {
            var currentProfile = new AdminProfile();
            currentProfile = (AdminProfile)HttpContext.Current.Session["SessionHelper"];
            var url = string.Concat(AdminUrl, "/Content/ProfilePicture/", currentProfile.Id, "/", currentProfile.ProfilePicture);
            currentProfile.ProfilePictureUrl = "";
            currentProfile.ProfilePictureUrl = url;
            return currentProfile;
        }
    }
    public class MemoryPostedFile : HttpPostedFileBase
    {
        private readonly byte[] fileBytes;

        public MemoryPostedFile(byte[] fileBytes, string fileName = null)
        {
            this.fileBytes = fileBytes;
            this.FileName = fileName;
            this.InputStream = new MemoryStream(fileBytes);
        }

        public override int ContentLength => fileBytes.Length;

        public override string FileName { get; }

        public override Stream InputStream { get; }
    }
    public class Message
    {
        public static string ErrorMessage = "Something went wrong. Please try again";
        public bool Success = true;

        public bool Info { get; set; }
        public bool Warning { get; set; }
        public string Detail = "";
        public static string DeleteError = "009 Unable to processe this request.";
        public dynamic Data { get; set; }
        public string key { get; set; }
        public string Code { get; set; }
        public bool IsShowPackageMessage { get; set; } = false;
        public string PackageMessage { get; set; }
    }
    public class ValidationMessage
    {
        public static string ErrorMessage = "Something went wrong. Please try again";
        public bool Success = true;

        public bool Info { get; set; }
        public bool Warning { get; set; }
        public string Detail = "";
        public static string DeleteError = "009 Unable to processe this request.";
        public dynamic Data { get; set; }
        public string returnUrl { get; set; }
    }
    public class Paging
    {
        public int Draw { get; set; }
        public int DisplayStart { get; set; }
        public int DisplayLength { get; set; }
        public int SortColumn { get; set; }
        public string SortOrder { get; set; }
        public string Search { get; set; }
        public string SearchJson { get; set; }
    }

    public class MenuAccessLevel
    {
        public int Id { get; set; }
        public int ParentId { get; set; }
        public string Name { get; set; }
        public string Url { get; set; }
        public int SortOrder { get; set; }
        public string IconClass { get; set; }
        public bool IsActive { get; set; }
        public int Level { get; set; }
        public string OrderSequence { get; set; }
    }
    public class CallBackData
    {
        public Message msg = new Message();
        public dynamic ReturnData { get; set; }
        public JqueryDataTable Data = new JqueryDataTable();

    }
    public class JqueryDataTable
    {
        public int draw { get; set; }
        public int recordsTotal { get; set; }
        public int recordsFiltered { get; set; }
        public dynamic data { get; set; }
    }
    public class SelectList
    {
        public string Id { get; set; }
        public string Code { get; set; }
        public string Type { get; set; }
        public bool IsShow { get; set; }
        public int SortOrder { get; set; }
        public string Name { get; set; }
        public string ShortDescription { get; set; }
        public string ParentId { get; set; }
        public string Url { get; set; }
    }
    public class ModuleAccessLevel
    {
        public string Controller { get; set; }
        public string Action { get; set; }
    }
    public static class MultipleResultSets
    {
        public static MultipleResultSetWrapper MultipleResults(this DbContext db, string storedProcedure)
        {
            db.Configuration.ProxyCreationEnabled = false;
            return new MultipleResultSetWrapper(db, storedProcedure);
        }

        public class MultipleResultSetWrapper
        {
            private readonly DbContext _db;
            private readonly string _storedProcedure;
            public List<Func<IObjectContextAdapter, DbDataReader, IEnumerable>> _resultSets;

            public MultipleResultSetWrapper(DbContext db, string storedProcedure)
            {
                _db = db;
                _storedProcedure = storedProcedure;
                _resultSets = new List<Func<IObjectContextAdapter, DbDataReader, IEnumerable>>();
            }
            public MultipleResultSetWrapper With<TResult>()
            {
                _resultSets.Add((adapter, reader) => adapter
                    .ObjectContext
                    .Translate<TResult>(reader)
                    .ToList());

                return this;
            }

            public List<IEnumerable> Execute(DbParameter[] dbParams = null)
            {
                var results = new List<IEnumerable>();

                using (var connection = _db.Database.Connection)
                {
                    try
                    {
                        connection.Open();
                        var command = connection.CreateCommand();
                        command.CommandText = _storedProcedure;// "EXEC " + _storedProcedure;
                        command.CommandType = CommandType.StoredProcedure;
                        if (!ReferenceEquals(dbParams, null))
                        {
                            foreach (DbParameter param in dbParams)
                            {
                                var newParameter = command.CreateParameter();
                                newParameter.ParameterName = "@" + param.ParameterName;
                                newParameter.Value = param.Value;
                                command.Parameters.Add(newParameter);
                            }
                        }

                        using (var reader = command.ExecuteReader())
                        {
                            var adapter = ((IObjectContextAdapter)_db);
                            foreach (var resultSet in _resultSets)
                            {
                                results.Add(resultSet(adapter, reader));
                                reader.NextResult();
                            }
                        }
                    }
                    finally
                    {
                        if ((connection != null))
                        {
                            connection.Dispose();
                        }
                    }
                    return results;
                }
            }
        }
    }


}
