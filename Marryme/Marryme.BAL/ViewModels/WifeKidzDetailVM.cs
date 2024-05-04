using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Marryme.BAL.ViewModels
{
    public class WifeKidzDetailVM
    {
        public long Id { get; set; }
        public long? MemberId { get; set; }
        public int? Age { get; set; }
        public string Gender { get; set; }
        public string Location { get; set; }
        public string Status { get; set; }
        public Nullable<byte> ExistingWife { get; set; }
    }
}
