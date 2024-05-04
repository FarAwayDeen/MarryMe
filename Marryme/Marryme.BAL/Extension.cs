using Marryme.DAL;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Globalization;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Reflection;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;
//using System.Web.Script.Serialization;
using System.Web.UI;
using Marryme.BAL;

namespace Marryme.BAL
{
    public static class Extension
    {
        public static CLRList GetMyEnum(this string title)
        {
            CLRList st;
            Enum.TryParse(title, out st);
            return st;
        }
        //public static User FetchUserProfile(this string aspNetUser_Id)
        //{
        //    User user = new User();
        //    if (!String.IsNullOrEmpty(aspNetUser_Id))
        //    {
        //        user = Static.DbContext.Users.FirstOrDefault(x => x.AspNetUserId == aspNetUser_Id);
        //        AspNetRole role = user.AspNetUser.AspNetRoles.FirstOrDefault();
        //        user.AspNetRoleName = role.Name;
        //        user.AspNetRoleId = role.Id;
        //    }
        //    return user;
        //}
        //public static string FetchUserRole(this string aspNetUser_Id)
        //{
        //    User user = new User();
        //    if (!String.IsNullOrEmpty(aspNetUser_Id))
        //    {
        //        user = Static.DbContext.Users.FirstOrDefault(x => x.AspNetUserId == aspNetUser_Id);
        //        AspNetRole role = user.AspNetUser.AspNetRoles.FirstOrDefault();
        //        user.AspNetRoleName = role.Name;
        //        user.AspNetRoleId = role.Id;
        //    }
        //    return user.AspNetRoleName;
        //}
        //public static MemberRegistration FetchUserProfileWithoutIdentity(this string aspNetUser_Id)
        //{
        //    UserViewModel user = new UserViewModel();
        //    user.ImagePath = "";
        //    if (!String.IsNullOrEmpty(aspNetUser_Id))
        //    {
        //        var aspuser = Static.DbContext.Users.FirstOrDefault(x => x.AspNetUserId == aspNetUser_Id);
        //        AspNetRole role = aspuser.AspNetUser.AspNetRoles.FirstOrDefault();
        //        user.Address = aspuser.Address;
        //        user.City = aspuser.City;
        //        user.Email = aspuser.Email;
        //        user.FaceBookLink = aspuser.FaceBookLink;
        //        user.FirstName = aspuser.FirstName;
        //        user.ImagePath = string.Concat(Static.WebSiteUrl + "Content/ProfilePictues/" + aspuser.UserId + "/" + aspuser.ImagePath);
        //        user.LastName = aspuser.LastName;
        //        user.linkedinLink = aspuser.linkedinLink;
        //        user.Phone = aspuser.Phone;
        //        user.PostCode = aspuser.PostCode;
        //        user.State = aspuser.State;
        //        user.TwitterLink = aspuser.TwitterLink;
        //        user.UserId = aspuser.UserId;
        //        user.AspNetRoleName = role.Name;
        //        user.AspNetRoleId = role.Id;
        //        user.Biography = aspuser.Biography;
        //    }
        //    return user;
        //}
        public static void LogError(this Exception ex, string url)
        {
            try
            {
                ErrorLog errorLog = new ErrorLog();
                errorLog.CreateDate = DateTime.UtcNow;
                errorLog.Message = ReferenceEquals(ex.InnerException, null) ? ex.Message : (ReferenceEquals(ex.InnerException.InnerException, null) ? ex.Message : ex.InnerException.InnerException.Message);
                errorLog.Url = url;
                //errorLog.User_Id = (int)userProfile.Id;
                var db = Static.DbContext;
                db.ErrorLogs.Add(errorLog);
                db.SaveChanges();
            }
            catch { }
        }

        /// <summary>
        /// This will log the user activities in database
        /// </summary>
        /// <param name = "userProfile" ></ param >
        /// < param name="action"></param>
        /// <param name = "detail" ></ param >
        /// < param name="tableName"></param>
       /* public static void LogActivity(this User userProfile, string action, string detail, string tableName = "")
        {
            try
            {
                ActivityLog activityLog = new ActivityLog();
                activityLog.Action = action;
                activityLog.CreateDate = DateTime.UtcNow;
                activityLog.Detail = detail;
                activityLog.TableName = tableName;
                activityLog.CreateBy = userProfile.UserId;
                var db = Static.DbContext;
                db.ActivityLogs.Add(activityLog);
                db.SaveChanges();
            }
            catch (Exception ex)
            {
                userProfile.LogError(ex, "BLL/Extension/LogActivity");
            }

        }
        */
        public static CallBackData ToDataTable<T>(this List<T> list, Paging paging)
        {
            CallBackData callBackData = new CallBackData();
            callBackData.Data.data = list;
            callBackData.Data.draw = paging.Draw;
            callBackData.Data.recordsTotal = callBackData.Data.data.Count;
            callBackData.Data.recordsFiltered = (callBackData.Data.data.Count != 0 ? ((int)callBackData.Data.data[0].GetType().GetProperty("Total").GetValue(callBackData.Data.data[0], null)) : 0);

            return callBackData;
        }
        public static T Deserialize<T>(this string json)
        {
            return JsonConvert.DeserializeObject<T>(json);
        }
        public static string FetchEnumDisplayName<T>(this T enumType)
        {
            try
            {
                //return enumType.GetType().GetMember(enumType.ToString())
                //                              .First()
                //                              .GetCustomAttribute<DisplayAttribute>().GetName();
                string rv = string.Empty;
                FieldInfo fieldInfo = enumType.GetType().GetField(enumType.ToString());
                if (fieldInfo != null)
                {
                    object[] customAttributes = fieldInfo.GetCustomAttributes(typeof(DisplayAttribute), true);
                    if (customAttributes.Length > 0 && customAttributes[0] != null)
                    {
                        DisplayAttribute barAttribute = customAttributes[0] as DisplayAttribute;
                        if (barAttribute != null)
                        {
                            rv = barAttribute.Name;
                        }
                    }
                }

                return rv;

            }
            catch (Exception ex)
            {
                return string.Empty;
            }

        }
        public static List<SelectList> EnumToList<T>(this T customEnum, string exculdetType = "")
        {
            return
                 Enum.GetValues(typeof(T)).Cast<T>().Select(x => new SelectList
                 {
                     Name = x.FetchEnumDisplayName(),
                     Type = x.ToString(),
                     Id = Convert.ToInt32(x).ToString()
                 }).Where(x => x.Type != exculdetType).ToList();
        }
        public static Paging FetchPaging(this HttpRequestBase request)
        {
            Paging paging = new Paging();
            try
            {
                paging.Draw = Convert.ToInt32(request.QueryString["sEcho"]);
                paging.SearchJson = Convert.ToString(request.QueryString["SearchJson"]);
                paging.DisplayLength = Convert.ToInt32(request.QueryString["iDisplayLength"]);
                paging.DisplayStart = Convert.ToInt32(request.QueryString["iDisplayStart"]);
                paging.SortColumn = Convert.ToInt32(request.QueryString["iSortCol_0"]);
                paging.Search = Convert.ToString(request.QueryString["sSearch"]);
                paging.SortOrder = Convert.ToString(request.QueryString["sSortDir_0"]);
            }
            catch { }

            return paging;
        }
        public static string CheckImage(this string url)
        {
            if (String.IsNullOrEmpty(url))
            {
                return Static.ImageUrl + "User/" + Static.DefaultImagePath;
            }
            else
            {
                return url;
            }
        }
        public static string CheckImageStory(this string url)
        {
            if (String.IsNullOrEmpty(url))
            {
                return Static.DefaultImagePathStory;
            }
            else
            {
                return url;
            }
        }

        public static DateTime? DbDate(this string date, bool toUtc = false)
        {

            if (!string.IsNullOrEmpty(date))
            {
                try
                {
                    if (!string.IsNullOrEmpty(date))
                    {
                        //DateTime dt = Convert.ToDateTime(date);
                        DateTime dt = DateTime.Parse(date, CultureInfo.GetCultureInfo("en-GB"));
                        //dt = DateTimeOffset.Parse(string.Format("{0:MM/dd/yyyy HH:mm}", dt)).DateTime;
                        if (toUtc)
                            return DateTimeOffset.Parse(string.Format("{0:MM/dd/yyyy HH:mm}", dt)).DateTime;

                        else
                            return dt;// DateTime.Parse(date, CultureInfo.GetCultureInfo("en-GB"));
                    }
                    else
                        return null;

                }
                catch (Exception)
                {

                }
            }
            else
            {
                return null;
            }
            return null;
        }
        public static string DbDate(this DateTime date, bool viewTimewithDate = false)
        {
            if (date == DateTime.MinValue)
            {
                return String.Empty;
            }
            else if (!ReferenceEquals(date, null))
            {
                if (date.Hour != 0)
                {
                    date = TimeZoneInfo.ConvertTime(date, TimeZoneInfo.Utc, TimeZoneInfo.FindSystemTimeZoneById("GMT Standard Time"));
                    // date = ((DateTime)date).AddHours(Convert.ToDouble(WebConfigurationManager.AppSettings["TimeDifference"]));

                }
            }
            if (viewTimewithDate)
            {
                return string.Format("{0:MM/dd/yyyy HH:mm}", date);
            }

            return string.Format("{0:MM/dd/yyyy}", date);
        }
        public static string FormatDbDate(this string date, bool viewTimewithDate = false, string format = "MM/dd/yyyy")
        {
            if (String.IsNullOrEmpty(date))
            {
                return String.Empty;
            }
            else
            {
                return date.DbDate().Value.ViewDate(viewTimewithDate, format);
            }
        }
        public static string ViewDate(this DateTime date, bool viewTimewithDate = false, string format = "dd/MM/yyyy")
        {
            if (date == DateTime.MinValue)
            {
                return String.Empty;
            }
            else if (!ReferenceEquals(date, null))
            {
                if (date.Hour != 0)
                {
                    //date = TimeZoneInfo.ConvertTime(date, TimeZoneInfo.Utc, TimeZoneInfo.FindSystemTimeZoneById("GMT Standard Time"));
                    // date = ((DateTime)date).AddHours(Convert.ToDouble(WebConfigurationManager.AppSettings["TimeDifference"]));

                }
            }
            else
            {
                return string.Empty;
            }

            if (viewTimewithDate)
            {
                return string.Format("{0:" + format + " HH:mm}", date);
            }

            return string.Format("{0:" + format + "}", date);
        }
        public static string ViewDate(this DateTime? date, bool viewTimewithDate = false, string format = "dd/MM/yyyy")
        {
            if (!ReferenceEquals(date, null))
            {
                return Convert.ToDateTime(date).ViewDate(viewTimewithDate, format);
            }
            else
            {
                return string.Empty;
            }
            //if (date == DateTime.MinValue)
            //{
            //    return String.Empty;
            //}
            //else if (!ReferenceEquals(date, null))
            //{
            //    if (((DateTime)date).Hour != 0)
            //    {
            //        date = TimeZoneInfo.ConvertTime((DateTime)date, TimeZoneInfo.Utc, TimeZoneInfo.FindSystemTimeZoneById("GMT Standard Time"));
            //        // date = ((DateTime)date).AddHours(Convert.ToDouble(WebConfigurationManager.AppSettings["TimeDifference"]));

            //    }
            //}
            //else
            //    return string.Empty;

            //if (viewTimewithDate)
            //    return string.Format("{0:" + format + " HH:mm}", date);

            //return string.Format("{0:" + format + "}", date);
        }
        public static string ViewDate(this DateTime date, bool viewTimewithDate)
        {
            return date.ViewDate(viewTimewithDate, "dd/MM/yyyy");
            // return date.ViewDate(viewTimewithDate, Static.DisplayDate);

            // return date.ViewDate(viewTimewithDate, "MM/dd/yyyy");
        }
        /// <summary>
        /// Format the date for user to show in proper formating
        /// </summary>
        /// <param name="date"></param>
        /// <param name="viewTimewithDate"></param>
        /// <param name="addHours"></param>
        /// <returns></returns>
        public static string ViewDateFormat(this DateTime date, bool viewTimewithDate, bool addHours = false)
        {
            if (addHours)
                return date.AddHours(Convert.ToInt32(Static.TimeDifference)).ViewDate(viewTimewithDate, "hh:mm tt, dd MMM, yyyy");
            else
                return date.ViewDate(viewTimewithDate, "hh:mm tt, dd MMM, yyyy");
            // return date.ViewDate(viewTimewithDate, Static.DisplayDate);

            // return date.ViewDate(viewTimewithDate, "MM/dd/yyyy");
        }
        public static string ViewOnlyDateFormat(this DateTime date, bool viewTimewithDate)
        {
            return date.ViewDate(viewTimewithDate, " dd MMM, yyyy");
            // return date.ViewDate(viewTimewithDate, Static.DisplayDate);

            // return date.ViewDate(viewTimewithDate, "MM/dd/yyyy");
        }
        public static string ViewTime(this TimeSpan timeSpan, bool isAddUtcHours = false)
        {
            if (ReferenceEquals(timeSpan, null))
            {
                return String.Empty;
            }
            else
            {
                return String.Format("{0}:{1}:{2}", timeSpan.Hours, timeSpan.Minutes, timeSpan.Seconds);
            }
        }
        public static string ViewTime(this DateTime? datetime, bool isAddUtcHours = false)
        {
            if (ReferenceEquals(datetime, null))
            {
                return String.Empty;
            }
            else
            {
                return Convert.ToDateTime(datetime).TimeOfDay.ViewTime();
            }
        }
        public static decimal? ToDecimal(this decimal? decimalValue)
        {
            return Convert.ToDecimal(String.Format("{0:0.00}", decimalValue ?? 0));
        }
        public static double? ToDouble(this double? doubleValue)
        {
            return Convert.ToDouble(String.Format("{0:0.00}", doubleValue ?? 0));
        }
        public static TimeSpan? DbTime(this string timeSpan)
        {
            if (String.IsNullOrEmpty(timeSpan))
            {
                return null;
            }
            else
            {
                return TimeSpan.Parse(timeSpan);
            }
        }
        public static void ClearCookies(this HttpContext context, string[] cookieNames, bool isClearAll = false)
        {
            if (isClearAll)
            {
                HttpCookie aCookie;
                string cookieName;
                for (int i = 0; i < context.Request.Cookies.Count; i++)
                {
                    try
                    {
                        cookieName = context.Request.Cookies[i].Name;
                        aCookie = new HttpCookie(cookieName);
                        context.Response.Cookies.Remove(cookieName);
                        aCookie.Expires = DateTime.Now.AddDays(-10);
                        aCookie.Value = null;
                        context.Response.SetCookie(aCookie);
                    }
                    catch
                    {
                    }
                }
            }
            else
            {
                foreach (string cookieName in cookieNames)
                {
                    try
                    {
                        HttpCookie currentUserCookie = context.Request.Cookies[cookieName];
                        context.Response.Cookies.Remove(cookieName);
                        currentUserCookie.Expires = DateTime.Now.AddDays(-10);
                        currentUserCookie.Value = null;
                        context.Response.SetCookie(currentUserCookie);
                    }
                    catch
                    {
                    }

                }
            }

        }
        public static string FetchUniquePath(this string directoryPath, string name)
        {
            string extension = Path.GetExtension(name);
            string fileName = DateTime.UtcNow.ViewDate(true).Replace("/", "-").Replace(":", "-").Replace(" ", "-");
            directoryPath.CreateDirectory();

            int i = 0;
            while (File.Exists(directoryPath + "/" + fileName + i + extension))
            {
                i++;
            }

            return (fileName + DateTime.Now.Ticks + i + extension);
        }
        public static string FTPFetchUniquePath(this string directoryPath, string name)
        {
            string extension = Path.GetExtension(name);
            string fileName = DateTime.UtcNow.ViewDate(true).Replace("/", "-").Replace(":", "-");

            int i = 0;
            while (File.Exists(directoryPath + "/" + fileName + i + extension))
            {
                i++;
            }

            return (fileName + i + extension);
        }
        public static string FormatMatch(this string value)
        {
            value = String.IsNullOrEmpty(value) ? string.Empty : value;
            Regex reg = new Regex("[*'\",[ _&#$%()|~`{}+.?/<>\\;:=!^@-]");
            value = reg.Replace(value.Replace("]", ""), string.Empty);
            return value.ToLower();
        }
        public static Message FTPUploadFile(this HttpPostedFileBase file, string path, string previousfileName = "", bool deleteFromServer = true, bool addFileName = false, bool IsUniqueName = true)
        {
            Message msg = new Message();
            msg.Data = previousfileName;// String.IsNullOrEmpty(previousfileName) ? previousfileName : previousfileName.Split('/')[1];
                                        //foreach (string file in files)
                                        //{
            if (!ReferenceEquals(file, null))
            {
                try
                {
                    try
                    {
                        if (!String.IsNullOrEmpty(previousfileName) && deleteFromServer)
                        {
                            File.Delete(HttpContext.Current.Server.MapPath(path + previousfileName));
                        }
                    }
                    catch { }
                    if (IsUniqueName)
                    {
                        msg.Data = (addFileName ? Path.GetFileNameWithoutExtension(file.FileName) + "_" : string.Empty) + HttpContext.Current.Server.MapPath(path).FetchUniquePath(file.FileName);

                    }
                    else
                    {
                        //msg.Data = (addFileName ? Path.GetFileNameWithoutExtension(file.FileName) + "_" : string.Empty) + HttpContext.Current.Server.MapPath(path)+ file.FileName;
                        msg.Data = file.FileName;
                    }
                    if (!Directory.Exists(HttpContext.Current.Server.MapPath(path)))
                    {
                        Directory.CreateDirectory(HttpContext.Current.Server.MapPath(path));
                    }

                    file.SaveAs(HttpContext.Current.Server.MapPath(path) + msg.Data);

                }
                catch (Exception ex)
                {

                    msg.Success = false;
                    msg.Detail = (string)msg.Data + " can't be uploaded .. please try again";
                    msg.Data = previousfileName;
                    // Static.UserProfile.LogError(ex, "BLL/Extension/UploadFile");

                }
            }
            //   }
            return msg;
        }

        public static Message UploadFile(this HttpPostedFileBase file, string path, string previousfileName = "", bool deleteFromServer = true, bool addFileName = false, bool isUniqueFileName = true)
        {
            Message msg = new Message();
            msg.Data = previousfileName;// String.IsNullOrEmpty(previousfileName) ? previousfileName : previousfileName.Split('/')[1];
                                        //foreach (string file in files)
                                        //{
            if (!ReferenceEquals(file, null))
            {
                try
                {
                    try
                    {
                        if (!String.IsNullOrEmpty(previousfileName) && deleteFromServer)
                        {
                            File.Delete(HttpContext.Current.Server.MapPath(path + previousfileName));
                        }
                    }
                    catch (Exception ex) { ex.LogError("BLL/Extension/UploadFile"); }
                    try
                    {
                        if (!isUniqueFileName)
                        {
                            Message saveNotUnique = new Message();
                            if (!Directory.Exists(HttpContext.Current.Server.MapPath(path)))
                            {
                                Directory.CreateDirectory(HttpContext.Current.Server.MapPath(path));
                            }

                            string Finalpath = DateTime.Now.AddMilliseconds(3.4).ToString().Replace("/", "-").Replace(":", "-") + " " + file.FileName;
                            if ((Finalpath.Length > 90))
                            {
                                saveNotUnique.Data = Finalpath.Truncate(95) + Path.GetExtension(file.FileName);
                                file.SaveAs(HttpContext.Current.Server.MapPath(path) + saveNotUnique.Data);
                            }
                            else
                            {
                                file.SaveAs(HttpContext.Current.Server.MapPath(path) + saveNotUnique.Data);
                            }
                            return saveNotUnique;
                        }
                    }
                    catch (Exception ex) { ex.LogError("BLL/Extension/UploadFile"); }
                    msg.Data = (addFileName ? Path.GetFileNameWithoutExtension(file.FileName) + "_" : string.Empty) + HttpContext.Current.Server.MapPath(path).FetchUniquePath(file.FileName);
                    if (!Directory.Exists(HttpContext.Current.Server.MapPath(path)))
                    {
                        Directory.CreateDirectory(HttpContext.Current.Server.MapPath(path));
                    }

                    file.SaveAs(HttpContext.Current.Server.MapPath(path) + msg.Data);

                }
                catch (Exception ex)
                {

                    msg.Success = false;
                    msg.Detail = (string)msg.Data + " can't be uploaded .. please try again";
                    msg.Data = previousfileName;
                    ex.LogError("BLL/Extension/UploadFile");

                }
            }
            //   }
            return msg;
        }

        public static Message UploadFile(this FileStream file, string fileName, string path, string previousfileName = "", bool deleteFromServer = true, bool isUniqueFileName = true)
        {
            Message msg = new Message();
            string ftpcurrentPath = Regex.Split(path, "Content")[1].Remove(0, 1);
            if (!ReferenceEquals(file, null))
            {
                try
                {
                    //string uploadUrl = Static.ftpUrl;
                    //string uploadFileName = Path.GetFileName(FileName);
                    //Stream streamObj = file;
                    //Byte[] buffer = new Byte[file.Length];
                    //streamObj.Read(buffer, 0, buffer.Length);
                    //streamObj.Close();
                    //streamObj = null;
                    //string currentavailablePath = "";
                    //FtpWebResponse CreateForderResponses = null;
                    //string[] folder = ftpcurrentPath.Split('/');

                    //for (int i = 0; i < folder.Length - 1; i++)
                    //{
                    //    if (!DoesFtpDirectoryExist(uploadUrl + Static.ftpPath + currentavailablePath + folder[i]))
                    //    {
                    //        FtpWebRequest ftps = (FtpWebRequest)FtpWebRequest.Create(uploadUrl + Static.ftpPath + currentavailablePath + folder[i]);
                    //        ftps.Method = WebRequestMethods.Ftp.MakeDirectory;
                    //        ftps.Credentials = new NetworkCredential(Static.ftpUsername, Static.ftpPassword);
                    //        CreateForderResponses = (FtpWebResponse)ftps.GetResponse();
                    //    }
                    //    currentavailablePath = folder[i] + '/';
                    //}
                    //// }
                    //msg.Data = uploadFileName;// uploadFileNames;
                    //string ftpUrl = string.Format("{0}{1}", uploadUrl + Static.ftpPath + ftpcurrentPath, uploadFileName);
                    ////deleting all  file from folder
                    //FtpWebRequest requestObj = FtpWebRequest.Create(ftpUrl) as FtpWebRequest;
                    //requestObj.KeepAlive = true;
                    //requestObj.UseBinary = true;
                    //requestObj.Method = WebRequestMethods.Ftp.UploadFile;
                    //requestObj.Credentials = new NetworkCredential(Static.ftpUsername, Static.ftpPassword);
                    //Stream requestStream = requestObj.GetRequestStream();
                    //requestStream.Write(buffer, 0, buffer.Length);
                    //requestStream.Flush();
                    //requestStream.Close();
                    //requestObj = null;
                    ////}
                    msg.Data = FTPUpload(file, fileName, file.Length, ftpcurrentPath, isUniqueFileName);
                }
                catch (Exception ex)
                {

                    msg.Success = false;
                    msg.Detail = (string)msg.Data + " can't be uploaded .. please try again";
                    // Static.UserProfile.LogError(ex, "BLL/Extension/UploadFile");

                }
            }
            return msg;
        }

        static string FTPUpload(Stream streamObj, string fileName, long contentLength, string ftpCurrentPath, bool isUniqueFileName = true)
        {
            string uploadUrl = Static.ftpUrl;
            //string uploadFileName = fileName;


            //Stream streamObj = fileStream;
            Byte[] buffer = new Byte[contentLength];
            streamObj.Read(buffer, 0, buffer.Length);
            streamObj.Close();
            streamObj = null;
            string currentavailablePath = "";
            FtpWebResponse CreateForderResponses = null;
            //  InUpdateCaseFileDeleted(uploadUrl + Static.ftpPath + ftpcurrentPath);

            //if (!DoesFtpDirectoryExist(uploadUrl + Static.ftpPath + ftpcurrentPath))
            //{
            string[] folder = ftpCurrentPath.Split('/');

            for (int i = 0; i < folder.Length - 1; i++)
            {
                if (!DoesFtpDirectoryExist(uploadUrl + Static.ftpPath + currentavailablePath + folder[i]))
                {


                    FtpWebRequest ftps = (FtpWebRequest)FtpWebRequest.Create(uploadUrl + Static.ftpPath + currentavailablePath + folder[i]);

                    ftps.Method = WebRequestMethods.Ftp.MakeDirectory;
                    ftps.Credentials = new NetworkCredential(Static.ftpUsername, Static.ftpPassword);

                    CreateForderResponses = (FtpWebResponse)ftps.GetResponse();



                }
                currentavailablePath += folder[i] + '/';

            }
            // }
            if (isUniqueFileName)
                fileName = FTPFetchUniquePath(uploadUrl + Static.ftpPath + ftpCurrentPath, fileName);

            //msg.Data = fileName;// uploadFileNames;
            string ftpUrl = string.Format("{0}{1}", uploadUrl + Static.ftpPath + ftpCurrentPath, fileName);
            //deleting all  file from folder



            FtpWebRequest requestObj = FtpWebRequest.Create(ftpUrl) as FtpWebRequest;


            requestObj.KeepAlive = true;
            requestObj.UseBinary = true;




            requestObj.Method = WebRequestMethods.Ftp.UploadFile;
            requestObj.Credentials = new NetworkCredential(Static.ftpUsername, Static.ftpPassword);


            Stream requestStream = requestObj.GetRequestStream();
            requestStream.Write(buffer, 0, buffer.Length);
            requestStream.Flush();
            requestStream.Close();
            requestObj = null;
            //}

            return fileName;
        }
        public static void CreateDirectory(this string directoryPath)
        {
            if (!Directory.Exists(directoryPath))
            {
                Directory.CreateDirectory(directoryPath);
            }
        }
        public static string Truncate(this string str, int length)
        {
            if (String.IsNullOrEmpty(str))
            {
                return str;
            }

            return str.Length <= length ? str : str.Substring(0, length - 4) + " ...";
        }
        public static string StringReplace(this string str, int lengthToCheck, string stringToReplace)
        {
            if (String.IsNullOrEmpty(str))
            {
                return str;
            }

            return str.Length <= lengthToCheck ? str : (string.IsNullOrWhiteSpace(stringToReplace) ? str.Truncate(lengthToCheck) : stringToReplace);
        }
        public static string TruncateNoTail(this string str, int length)
        {
            if (String.IsNullOrEmpty(str))
            {
                return str;
            }

            return str.Length <= length ? str : str.Substring(0, length - 4);
        }
        public static bool IsNullOrZero(this int? value)
        {
            return (value ?? 0) == 0;
        }
        public static bool IsNullOrZero(this int value)
        {
            return value == 0;
        }
        public static bool IsNullOrZero(this long value)
        {
            return value == 0;
        }
        public static bool IsNullOrZero(this double value)
        {
            return value == 0;
        }
        public static bool IsNullOrZero(this long? value)
        {
            return value == 0;
        }
        public static bool IsNullOrZero(this Guid value)
        {
            return value == Guid.Empty;
        }
        public static int NullToZeroReplace(this int? value)
        {
            return (value != null) ? (int)value : 0;
        }
        public static double NullToZeroReplace(this object value)
        {
            //double result = String.IsNullOrEmpty(Convert.ToString(value)) ? 0 : Convert.ToDouble(value);
            //if (!Double.IsNaN(result) && !Double.IsInfinity(result))
            //    return Math.Round(Convert.ToDouble(result), 2);
            //else
            //    return 0;

            return String.IsNullOrEmpty(Convert.ToString(value)) ? 0 : Convert.ToDouble(value);
        }
        public static double NullToZeroReplace(this string value)
        {
            if (!ReferenceEquals(value, null) && value.Contains(","))
            {
                value = value.Replace(",", "");
            }

            return String.IsNullOrEmpty(Convert.ToString(value)) ? 0 : Convert.ToDouble(value);
        }
        public static string NullToEmptyReplace(this string value)
        {
            return String.IsNullOrEmpty(Convert.ToString(value)) ? string.Empty : value;
        }
        public static string ToString(this object value)
        {
            return Convert.ToString(value);
        }
        public static int? ZeroToNullReplace(this int? value)
        {
            return (value != 0) ? value : null;
        }
        public static int? ZeroToNullReplace(this int value)
        {
            if (value != 0)
            {
                return value;
            }
            else
            {
                return null;
            }
        }
        public static double? ZeroToNullReplace(this double? value)
        {
            return (value != 0) ? value : null;
        }
        public static string CurrencyRule(this object value)
        {
            double num; string result = String.Empty;
            if (String.IsNullOrEmpty(Convert.ToString(value)))
            {
                return result;
            }
            else if (double.TryParse(Convert.ToString(value), out num))
            {
                //if (num < 0)
                //    result = "(" + String.Format("{0:n}", (num * -1)) + ")";

                //else
                if (Convert.ToString(value).Contains("."))
                {
                    result = ((Convert.ToString(value) == "0") ? "" : String.Format("{0:n}", num));
                }
                else
                {
                    result = ((Convert.ToString(value) == "0") ? "" : String.Format("{0:n0}", num));
                }
            }
            return Static.CurrencySymbol + result;
        }
        public static string CompressString(this string text)
        {
            byte[] buffer = Encoding.UTF8.GetBytes(text);
            var ms = new MemoryStream();
            using (var stream = new GZipStream(ms, CompressionMode.Compress, true))
            {
                stream.Write(buffer, 0, buffer.Length);
            }

            ms.Position = 0;

            var rawData = new byte[ms.Length];
            ms.Read(rawData, 0, rawData.Length);

            var compressedData = new byte[rawData.Length + 4];
            Buffer.BlockCopy(rawData, 0, compressedData, 4, rawData.Length);
            Buffer.BlockCopy(BitConverter.GetBytes(buffer.Length), 0, compressedData, 0, 4);
            return Convert.ToBase64String(compressedData);
        }
        public static string DecompressString(this string compressedText)
        {
            byte[] compressedData = Convert.FromBase64String(compressedText);
            using (var ms = new MemoryStream())
            {
                int dataLength = BitConverter.ToInt32(compressedData, 0);
                ms.Write(compressedData, 4, compressedData.Length - 4);

                var buffer = new byte[dataLength];

                ms.Position = 0;
                using (var stream = new GZipStream(ms, CompressionMode.Decompress))
                {
                    stream.Read(buffer, 0, buffer.Length);
                }

                return Encoding.UTF8.GetString(buffer);
            }
        }
        //public static void StoreToCookie<T>(this ControllerContext context, string cookieName, T newModel) where T : class
        //{
        //    HttpCookie cookie = new HttpCookie(cookieName);
        //    T savedModel = newModel;
        //    cookie.Value = new JavaScriptSerializer().Serialize(savedModel).CompressString();
        //    if (cookieName == "Menu" || cookieName == "Module")
        //    {
        //        cookie.Expires = DateTime.Now.AddMonths(12);
        //    }
        //    context.HttpContext.Response.Cookies.Add(cookie);
        //}
        public static Message SendEmail(this EmailSMSTemplate emailTemplate)
        {
            Message msg = new Message();
            try
            {
                #region EastFlicker Server 
                MailMessage mailMessage = new MailMessage();
                SmtpClient client = new SmtpClient();
                client.Port = Convert.ToInt32(Static.EmailPort);
                client.Host = Static.EmailServerHost;
                client.EnableSsl = Static.EnableSsl;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new NetworkCredential(Static.Email.ToString(), Static.EmailPassword.ToString());
                mailMessage.From = new MailAddress(Static.EmailDisplayEmail.ToString(), Static.EmailDisplayName.ToString());
                mailMessage.To.Add(new MailAddress(emailTemplate.To));

                if (!String.IsNullOrEmpty(emailTemplate.CC))
                {
                    emailTemplate.CC.Split(',').ToList().ForEach(x =>
                    {
                        if (!String.IsNullOrWhiteSpace(x))
                            mailMessage.CC.Add(new MailAddress(x));
                    });
                }
                if (!String.IsNullOrEmpty(emailTemplate.BCC))
                {
                    emailTemplate.BCC.Split(',').ToList().ForEach(x =>
                    {
                        if (!String.IsNullOrWhiteSpace(x))
                            mailMessage.Bcc.Add(new MailAddress(x));
                    });
                }

                mailMessage.IsBodyHtml = true;
                mailMessage.Subject = emailTemplate.Subject;
                mailMessage.Body = emailTemplate.MessageBody.Replace("{#!BaseUrl!#}", Static.BaseUrl);
                client.Send(mailMessage);

                #endregion

            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Detail = Message.ErrorMessage;
                //Static.UserProfile.LogError(ex, "BLL/Extension/SendEmail");
                //  return false;
            }
            return msg;
        }
        public static Message TestEmail(this EmailSMSTemplate emailTemplate)
        {
            Message msg = new Message();
            try
            {
                #region EastFlicker Server 
                MailMessage mailMessage = new MailMessage();
                SmtpClient client = new SmtpClient();
                client.Port = 587;
                client.Host = "smtp.gmail.com";
                client.EnableSsl = true;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new NetworkCredential("hilton0324@gmail.com", "Z.AHilton");
                mailMessage.From = new MailAddress("eastflicker@gmail.com", "KBLC admin Portal");
                mailMessage.To.Add(new MailAddress("hilton0324@gmail.com"));

                mailMessage.IsBodyHtml = true;
                mailMessage.Subject = emailTemplate.Subject;
                mailMessage.Body = emailTemplate.MessageBody;
                client.Send(mailMessage);

                #endregion

            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Detail = Message.ErrorMessage;
                //Static.UserProfile.LogError(ex, "BLL/Extension/TestEmail");
                //  return false;
            }
            return msg;
        }
        public static bool HasValue(this double value)
        {
            return !Double.IsNaN(value) && !Double.IsInfinity(value);
        }

        public static string EncodeQueryString(this object queryString)
        {
            return HttpUtility.UrlEncode(Convert.ToString(queryString).CompressString());
        }
        public static string DecodeQueryString(this string queryString)
        {
            if (!queryString.Contains("%"))
                return Convert.ToString(queryString).DecompressString();
            else
                return HttpUtility.UrlDecode(Convert.ToString(queryString)).DecompressString();

        }
        public static int ToInt(this string number)
        {
            return ReferenceEquals(number, null) ? 0 : string.IsNullOrWhiteSpace(number) ? 0 : Convert.ToInt32(number);
        }
        public static int ToInt(this object number)
        {
            return ReferenceEquals(number, null) ? 0 : Convert.ToInt32(number);
        }
        public static Int64 ToInt64(this object number)
        {
            return ReferenceEquals(number, null) ? 0 : Convert.ToInt64(number);
        }
        public static string TimeAgoCount(this DateTime dateTime)
        {
            string result = string.Empty;
            var timeSpan = DateTime.UtcNow.Subtract(dateTime);

            if (timeSpan <= TimeSpan.FromSeconds(60))
            {
                result = string.Format("{0} seconds", timeSpan.Seconds);
            }
            else if (timeSpan <= TimeSpan.FromMinutes(60))
            {
                result = timeSpan.Minutes > 1 ?
                    String.Format("{0} minutes", timeSpan.Minutes) :
                    "about a minute ago";
            }
            else if (timeSpan <= TimeSpan.FromHours(24))
            {
                result = timeSpan.Hours > 1 ?
                    String.Format("{0} hours", timeSpan.Hours) :
                    "about an hour ago";
            }
            else if (timeSpan <= TimeSpan.FromDays(30))
            {
                result = timeSpan.Days > 1 ?
                    String.Format(" {0} days", timeSpan.Days) :
                    "yesterday";
            }
            else if (timeSpan <= TimeSpan.FromDays(365))
            {
                result = timeSpan.Days > 30 ?
                    String.Format("{0} months", timeSpan.Days / 30) :
                    "about a month ago";
            }
            else
            {
                result = timeSpan.Days > 365 ?
                    String.Format("about {0} years ago", timeSpan.Days / 365) :
                    "about a year ago";
            }

            return result;
        }

        public static string FileSize(this long value, int decimalPlaces = 2)
        {
            string[] SizeSuffixes = { "bytes", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB" };

            if (decimalPlaces < 0) { throw new ArgumentOutOfRangeException("decimalPlaces"); }
            if (value < 0) { return "-" + FileSize(-value); }
            if (value == 0) { return string.Format("{0:n" + decimalPlaces + "} bytes", 0); }

            // mag is 0 for bytes, 1 for KB, 2, for MB, etc.
            int mag = (int)Math.Log(value, 1024);

            // 1L << (mag * 10) == 2 ^ (10 * mag) 
            // [i.e. the number of bytes in the unit corresponding to mag]
            decimal adjustedSize = (decimal)value / (1L << (mag * 10));

            // make adjustment when the value is large enough that
            // it would round up to 1000 or more
            if (Math.Round(adjustedSize, decimalPlaces) >= 1000)
            {
                mag += 1;
                adjustedSize /= 1024;
            }

            return string.Format("{0:n" + decimalPlaces + "} {1}",
                adjustedSize,
                SizeSuffixes[mag]);
        }

        public static string Truncate(this bool isTruncate, string word)
        {
            if (!isTruncate && !String.IsNullOrEmpty(word))
                word = Convert.ToString(word.ToCharArray()[0]);

            return Convert.ToString(word);
        }

        public static bool DeleteFile(this string path, string fileName)
        {
            try
            {
                if (!String.IsNullOrEmpty(path))
                {
                    if (!File.Exists(HttpContext.Current.Server.MapPath(path) + fileName))
                    {
                        return true;
                    }

                    File.Delete(HttpContext.Current.Server.MapPath(path) + fileName);
                    return true;
                }
            }
            catch { }
            return false;
        }


        public static string RenderToString(this PartialViewResult partialView)
        {
            var httpContext = HttpContext.Current;

            if (httpContext == null)
            {
                throw new NotSupportedException("An HTTP context is required to render the partial view to a string");
            }

            var controllerName = httpContext.Request.RequestContext.RouteData.Values["controller"].ToString();

            var controller = (ControllerBase)ControllerBuilder.Current.GetControllerFactory().CreateController(httpContext.Request.RequestContext, controllerName);

            var controllerContext = new ControllerContext(httpContext.Request.RequestContext, controller);

            var view = ViewEngines.Engines.FindPartialView(controllerContext, partialView.ViewName).View;

            var sb = new StringBuilder();

            using (var sw = new StringWriter(sb))
            {
                using (var tw = new HtmlTextWriter(sw))
                {
                    view.Render(new ViewContext(controllerContext, view, partialView.ViewData, partialView.TempData, tw), tw);
                }
            }

            return sb.ToString();
        }
        public static bool IsInRole(this string role, string compareRole)
        {
            return (role.ToLower() == compareRole.ToLower()) ? true : false;
        }
        public static string FormatUrl(this string url)
        {
            if (string.IsNullOrEmpty(url))
            {
                url = string.Empty;
            }
            var webAlias = new System.Text.StringBuilder();
            var regEx = new System.Text.RegularExpressions.Regex("([a-z]|[A-Z]|[0-9])*");
            var matches = regEx.Matches(url);
            foreach (var match in matches)
            {
                var s = match.ToString();
                if (!string.IsNullOrWhiteSpace(s))
                {
                    if (webAlias.Length > 0)
                    {
                        webAlias.Append("-");
                    }
                    webAlias.Append(s.ToLowerInvariant());
                }
            }
            return System.Text.RegularExpressions.Regex.Replace(webAlias.ToString(), @";|{'"",&?%|.*:#/\\}", "").Trim();
            //return strg;
            //return
            // System.Text.RegularExpressions.Regex.Replace(Convert.ToString(url).Trim().ToLower(), @"[^a-zA-Z0-9/]", "-").Replace("/", "-").Replace('\\', '-');
        }
        public static string ViewDateChat(this DateTime date, bool viewTimewithDate = false, string format = "MM/dd/yyyy")
        {
            if (date == DateTime.MinValue)
            {
                return String.Empty;
            }
            else if (!ReferenceEquals(date, null))
            {
                if (date.Hour != 0)
                {
                    date = TimeZoneInfo.ConvertTime(date, TimeZoneInfo.Utc, TimeZoneInfo.FindSystemTimeZoneById("GMT Standard Time"));
                    // date = ((DateTime)date).AddHours(Convert.ToDouble(WebConfigurationManager.AppSettings["TimeDifference"]));

                }
            }
            else
            {
                return string.Empty;
            }

            if (viewTimewithDate)
            {
                return string.Format("{0:" + format + " HH:mm}", date);
            }

            return string.Format("{0:" + format + "}", date);
        }
        /// <summary>
        /// split category Name and Url 
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public static string SplitCategoryNUrl(this string value, bool isStoryDetailPage = false)
        {
            //value parameter value pattern =>  Name|Url,Name|Url...
            string cName;
            string cUrl;
            var strCategory = "";
            if (!string.IsNullOrEmpty(value))
            {
                var categoryAndUrl = value.Split(',');
                if (categoryAndUrl != null)
                {
                    for (var i = 0; i < categoryAndUrl.Length; i++)
                    {
                        var splitedValue = categoryAndUrl[i].Split('|');
                        cName = splitedValue[0];
                        cUrl = splitedValue[1];
                        if (isStoryDetailPage)
                            strCategory += "<li class='category-text'><a href='/" + cUrl + "' title=" + cName + ">" + cName + "</a></li>";
                        else
                            strCategory += "<li class='category'><a href='" + cUrl + "' title=" + cName + ">" + cName + "</a></li>";
                    }
                }
            }
            return strCategory;
        }
        /// <summary>
        /// split category Name  
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public static string GetCategoryName(this string value)
        {
            //value parameter value pattern =>  Name|Url
            if (!string.IsNullOrEmpty(value))
            {
                return value.Split('|')[0];
            }
            return string.Empty;
        }
        /// <summary>
        /// split category Url 
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public static string GetCategoryUrl(this string value)
        {
            //value parameter value pattern =>  Name|Url
            if (!string.IsNullOrEmpty(value))
            {
                return value.Split('|')[1];
            }
            return string.Empty;
        }
        public static string SetPostImageUrl(this string ImageName)
        {
            if (!string.IsNullOrEmpty(ImageName))
            {
                return string.Concat(Static.ImageUrl, "Story/", ImageName.CheckImageStory());
            }
            return string.Empty;
        }
        public static string SetUserImageUrl(this string ImageName)
        {
            if (!string.IsNullOrEmpty(ImageName))
            {
                return string.Concat(Static.ImageUrl, "User/", ImageName);
            }
            return string.Empty;
        }
        public static string SetPostSliderImageUrl(this string ImageName)
        {
            if (!string.IsNullOrEmpty(ImageName))
            {
                //check it
                return string.Concat(Static.ImageUrl, "Story/Slider/", ImageName.CheckImageStory());
            }
            return ImageName.CheckImage();
        }
        public static string SetNewsURL(this string NewsURL)
        {
            if (!string.IsNullOrEmpty(NewsURL))
            {
                return string.Concat("News/", NewsURL);
            }
            return string.Empty;
        }
        /// <summary>
        /// Set to redirect to detail page
        /// </summary>
        /// <param name="NewsURL"></param>
        /// <returns></returns>
        public static string SetNewsUri(this string NewsURL)
        {
            if (!string.IsNullOrEmpty(NewsURL))
            {
                return string.Concat("/News/", NewsURL);
            }
            return string.Empty;
        }
        public static bool DoesFtpDirectoryExist(string dirPath)
        {
            try
            {
                FtpWebRequest request = (FtpWebRequest)WebRequest.Create(dirPath);
                request.Method = WebRequestMethods.Ftp.MakeDirectory;
                request.Credentials = new NetworkCredential(Static.ftpUsername, Static.ftpPassword);
                request.Method = WebRequestMethods.Ftp.ListDirectory;
                FtpWebResponse response = (FtpWebResponse)request.GetResponse();
                return true;
            }
            catch (WebException)
            {
                return false;
            }
        }

        public static string CheckIsNullOrEmty(this string value)
        {
            if (!string.IsNullOrEmpty(value))
            {
                return value;
            }
            return string.Empty;
        }
        /// <summary>
        /// Adding hours to local datatime
        /// </summary>
        /// <param name="CurrentDate"></param>
        /// <returns></returns>
        public static DateTime AddLocalHours(this DateTime CurrentDate)
        {
            return CurrentDate.AddHours(Convert.ToInt32(Static.TimeDifference));
        }
        /// <summary>
        /// Encrypt Password with Rijndael Cipher
        /// </summary>
        /// <param name="TextToBeEncrypted"></param>
        /// <returns></returns>
        public static string EncryptPassword(this string TextToBeEncrypted)
        {
            RijndaelManaged RijndaelCipher = new RijndaelManaged();
            string Password = "CSC";
            byte[] PlainText = Encoding.Unicode.GetBytes(TextToBeEncrypted);
            byte[] Salt = Encoding.ASCII.GetBytes(Password.Length.ToString());
            PasswordDeriveBytes SecretKey = new PasswordDeriveBytes(Password, Salt);
            //Creates a symmetric encryptor object. 
            ICryptoTransform Encryptor = RijndaelCipher.CreateEncryptor(SecretKey.GetBytes(32), SecretKey.GetBytes(16));
            MemoryStream memoryStream = new MemoryStream();
            //Defines a stream that links data streams to cryptographic transformations
            CryptoStream cryptoStream = new CryptoStream(memoryStream, Encryptor, CryptoStreamMode.Write);
            cryptoStream.Write(PlainText, 0, PlainText.Length);
            //Writes the final state and clears the buffer
            cryptoStream.FlushFinalBlock();
            byte[] CipherBytes = memoryStream.ToArray();
            memoryStream.Close();
            cryptoStream.Close();
            string EncryptedData = Convert.ToBase64String(CipherBytes);
            return EncryptedData;
        }
        public static string DecodeBase64(this string encodedText)
        {
            try
            {
                byte[] data = Convert.FromBase64String(encodedText);
                return Encoding.UTF8.GetString(data);
            }
            catch (Exception ex)
            {

            }
            return null;
        }
        public static string HtmlToPlainText(this string html)
        {
            const string tagWhiteSpace = @"(>|$)(\W|\n|\r)+<";//matches one or more (white space or line breaks) between '>' and '<'
            const string stripFormatting = @"<[^>]*(>|$)";//match any character between '<' and '>', even when end tag is missing
            const string lineBreak = @"<(br|BR)\s{0,1}\/{0,1}>";//matches: <br>,<br/>,<br />,<BR>,<BR/>,<BR />
            var lineBreakRegex = new Regex(lineBreak, RegexOptions.Multiline);
            var stripFormattingRegex = new Regex(stripFormatting, RegexOptions.Multiline);
            var tagWhiteSpaceRegex = new Regex(tagWhiteSpace, RegexOptions.Multiline);

            var text = html;
            //Decode html specific characters
            text = System.Net.WebUtility.HtmlDecode(text);
            //Remove tag whitespace/line breaks
            text = tagWhiteSpaceRegex.Replace(text, "><");
            //Replace <br /> with line breaks
            text = lineBreakRegex.Replace(text, Environment.NewLine);
            //Strip formatting
            text = stripFormattingRegex.Replace(text, string.Empty);

            return text;
        }
        public static string GetDescription(this Enum value)
        {
            return ((DescriptionAttribute)Attribute.GetCustomAttribute(
                value.GetType().GetFields(BindingFlags.Public | BindingFlags.Static)
                    .Single(x => x.GetValue(null).Equals(value)),
                typeof(DescriptionAttribute)))?.Description ?? value.ToString();
        }
        public static Int32 GetAge(this DateTime dateOfBirth)
        {
            var today = DateTime.Today;

            var a = (today.Year * 100 + today.Month) * 100 + today.Day;
            var b = (dateOfBirth.Year * 100 + dateOfBirth.Month) * 100 + dateOfBirth.Day;

            return (a - b) / 10000;
        }
    }
}
