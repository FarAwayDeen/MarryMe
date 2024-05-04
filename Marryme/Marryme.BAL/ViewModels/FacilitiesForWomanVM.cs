using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Marryme.BAL.ViewModels
{
    public class FacilitiesForWomanVM
    {
        public int Id { get; set; }
        public int? StatusId { get; set; }
        public int MemberId { get; set; }
        public string FacilityFor { get; set; }
        public string Status { get; set; }
        public string WifeNo { get; set; }
        public string[] WifeFacilityIds{ get; set; }
    }
}
