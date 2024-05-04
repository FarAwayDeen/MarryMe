using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Marryme.BAL.ViewModels
{
   public class AcceptanceCriteriaVM
    {
        public int? MemberId { get; set; }
        public string Brothers { get; set; }
        public string Sisters { get; set; }
        public string Sons { get; set; }
        public string Mother { get; set; }
        public string Father { get; set; }
        public string Uncles { get; set; }
        public string Aunts { get; set; }
        public string Daughters { get; set; }
    }
}
