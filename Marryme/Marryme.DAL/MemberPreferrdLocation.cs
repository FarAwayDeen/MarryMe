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
    
    public partial class MemberPreferrdLocation
    {
        public long ID { get; set; }
        public Nullable<long> MemberId { get; set; }
        public string Countries { get; set; }
        public string States { get; set; }
        public string Cities { get; set; }
    }
}
