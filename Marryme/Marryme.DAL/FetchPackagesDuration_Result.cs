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
    
    public partial class FetchPackagesDuration_Result
    {
        public string Name { get; set; }
        public long Id { get; set; }
        public Nullable<int> PackageTypeId { get; set; }
        public bool CanMemberViewMobileNo { get; set; }
        public Nullable<int> NumberOfMobileNo { get; set; }
        public bool IsAstroMatches { get; set; }
        public Nullable<int> NumberOfAstroMatches { get; set; }
        public int NumberOfChatMessages { get; set; }
        public bool CanViewPhoto { get; set; }
        public bool IsVisibleHighProfile { get; set; }
        public bool CanChat { get; set; }
        public bool IsActive { get; set; }
        public Nullable<long> CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<long> UpdatedBy { get; set; }
        public Nullable<System.DateTime> UpdatedDate { get; set; }
        public long PackagePricingPlanId { get; set; }
        public long PackageId { get; set; }
        public Nullable<int> PackageDuration { get; set; }
        public Nullable<decimal> PackagePrice { get; set; }
    }
}