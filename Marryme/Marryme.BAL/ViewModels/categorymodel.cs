using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Marryme.BAL.ViewModels
{
   public class categorymodel
    {
        public Child[] paretntID { get; set; }
    }
    public class Child
    {
        public SubChild[] childID { get; set; }
    }
    public class SubChild
    {
        public int? categoryID { get; set; }
    }

}
