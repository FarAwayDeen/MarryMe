using Marryme.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Marryme.BAL.ViewModels
{
   public class MemberRegistrationVM: CommonFilter
    {
        public long Id { get; set; }
        public string Name { get; set; }
        public string NickName { get; set; }
        public string ProfileCreatedBy { get; set; }
        public string MotherTongue { get; set; }
        public string NoOfMarriage { get; set; }
        public string LookingFor { get; set; }
        public string Gender { get; set; }
        public string MobileNo { get; set; }
        public Nullable<System.DateTime> DOB { get; set; }
        public string MaritalStatus { get; set; }
        public string NoOfChildren { get; set; }
        public string Subcast { get; set; }
        public string ProfilePicPath { get; set; }
        public Nullable<long> ReligionId { get; set; }
        public Nullable<int> CountryId { get; set; }
        public string AboutMe { get; set; }
        public Nullable<long> CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<long> UpdatedBy { get; set; }
        public Nullable<System.DateTime> UpdatedDate { get; set; }
        public Nullable<bool> IsMobilePic { get; set; }
        public Nullable<int> Feet { get; set; }
        public string HeightUnit { get; set; }
        public Nullable<int> Inches { get; set; }
        public Nullable<int> Centimeters { get; set; }
    }
}
