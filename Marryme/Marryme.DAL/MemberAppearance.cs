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
    
    public partial class MemberAppearance
    {
        public long Id { get; set; }
        public long MemberId { get; set; }
        public Nullable<long> PhysicalStatus { get; set; }
        public Nullable<int> Weight { get; set; }
        public Nullable<long> BodyType { get; set; }
        public Nullable<long> Complexion { get; set; }
        public Nullable<int> Feet { get; set; }
        public string HeightUnit { get; set; }
        public Nullable<int> Inches { get; set; }
        public Nullable<int> Centimeters { get; set; }
    }
}
