using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Marryme.BAL.ViewModels
{
    public class ExsitingWifeDetailVM
    {
        public int MemberId { get; set; }
        public string HaveWife { get; set; }
        public string Religion { get; set; }
        public string MarriageYear { get; set; }
        public string Age { get; set; }
        public string Education { get; set; }
        public string Job { get; set; }
        public string Location { get; set; }
        public string Kids { get; set; }
        public Nullable<byte> ExsitingWife { get; set; }
        public Nullable<byte> EducationLevelId { get; set; }
        public string LivingStatus { get; set; }
        public List<WifeKidzDetailVM> WifeKidzDetails { get; set; }
    }
}
