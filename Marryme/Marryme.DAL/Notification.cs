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
    
    public partial class Notification
    {
        public long Id { get; set; }
        public string Message { get; set; }
        public Nullable<long> FromId { get; set; }
        public Nullable<long> ToId { get; set; }
        public bool IsActive { get; set; }
        public bool IsRead { get; set; }
    }
}