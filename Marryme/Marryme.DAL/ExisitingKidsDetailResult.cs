//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Marryme.DAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class ExisitingKidsDetailResult
    {
        public long ID { get; set; }
        public Nullable<long> MemberId { get; set; }
        public Nullable<byte> ExistingWife { get; set; }
        public Nullable<int> KidAge { get; set; }
        public string KidGender { get; set; }
        public string KidLocation { get; set; }
        public string KidMaritalStatus { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public string UpdatedBy { get; set; }
        public Nullable<System.DateTime> UpdatedDate { get; set; }
    }
}
