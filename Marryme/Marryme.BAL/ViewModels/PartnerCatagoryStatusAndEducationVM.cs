using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Marryme.BAL.ViewModels
{
    public class PartnerCatagoryStatusAndEducationVM
    {
        public int Id { get; set; }
        public int MemberId { get; set; }
        public string[] MaritalStatus { get; set; }
        public string[] EducationLevel { get; set; }
        public string StatusId { get; set; }
    }
}
