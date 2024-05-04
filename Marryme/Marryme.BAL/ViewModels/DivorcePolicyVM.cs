using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Marryme.BAL.ViewModels
{
   public class DivorcePolicyVM
    {
        public long ID { get; set; }
        public int? MemberId { get; set; }
        public string dropdownOption { get; set; }
        public string DivorceAmountcheckbox { get; set; }       
        public Nullable<int> DivorceAmountFrom { get; set; }
        public Nullable<int> DivorceAmountTo { get; set; }
        public string KIncomeCurrency { get; set; }
        public string DIncomeCurrency { get; set; }
        public string DivorceHouseCheckBox { get; set; }
        public string DivorceHouseDetail { get; set; }
        public string DivorceMiscellaneousCheckbox { get; set; }
        public string DivorceMiscellaneousDetail { get; set; }
        public string KhulaAmountcheckbox { get; set; }
        public int? KhulaAmountFrom { get; set; }
        public int? KhulaAmountTo { get; set; }
        public string KhulaHouseCheckBox { get; set; }
        public string KhulaHouseDetail { get; set; }
        public string KhulaMiscellaneousCheckbox { get; set; }
        public string KhulaMiscellaneousDetail { get; set; }
        public Boolean ThreeDivorcePolicy { get; set; }
    }
}
