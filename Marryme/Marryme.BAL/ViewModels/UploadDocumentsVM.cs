using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Marryme.BAL.ViewModels
{
    public class UploadDocumentsVM
    {
        public int Id { get; set; }
        public string List { get; set; }
        public string FilePath { get; set; }
        public Nullable<int> MemberId { get; set; }
    }
}
