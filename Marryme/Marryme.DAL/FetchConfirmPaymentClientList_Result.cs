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
    
    public partial class FetchConfirmPaymentClientList_Result
    {
        public Nullable<long> RowNo { get; set; }
        public Nullable<int> Total { get; set; }
        public long Id { get; set; }
        public Nullable<int> PackageSubscriptionId { get; set; }
        public string PaymentType { get; set; }
        public Nullable<long> PaymentOptionId { get; set; }
        public Nullable<System.DateTime> PaymentDate { get; set; }
        public Nullable<decimal> PaymentAmount { get; set; }
        public string DepositSlip { get; set; }
        public string PackageName { get; set; }
        public string BankName { get; set; }
        public string Status { get; set; }
    }
}
