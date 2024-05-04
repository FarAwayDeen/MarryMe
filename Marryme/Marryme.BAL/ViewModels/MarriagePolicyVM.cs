using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Marryme.BAL.ViewModels
{
    public class MarriagePolicyVM
    {
        public long ID { get; set; }
        public int? MemberId { get; set; }
        public string dropdownOption { get; set; }
        public string DivorceAmountcheckbox { get; set; }
        public string DivorceAmountDetail { get; set; }
        public string DivorceHouseCheckBox { get; set; }
        public string DivorceHouseDetail { get; set; }
        public string DivorceMiscellaneousCheckbox { get; set; }
        public string DivorceMiscellaneousDetail { get; set; }
        public string KhulaAmountcheckbox { get; set; }
        public string KhulaAmountDetail { get; set; }
        public string KhulaHouseCheckBox { get; set; }
        public string KhulaHouseDetail { get; set; }
        public string KhulaMiscellaneousCheckbox { get; set; }
        public string KhulaMiscellaneousDetail { get; set; }
    }
}
