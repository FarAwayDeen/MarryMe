using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Marryme.BAL.ViewModels
{
    public class PartnerCategories
    {
        public int[] Id { get; set; }
        public bool[] Value { get; set; }
        //public List<Category> Categories { get; set; }
        public long MemberId { get; set; }  
        public string MaritalStatus { get; set; }
        public string EducationLevel { get; set; }
    }
}
