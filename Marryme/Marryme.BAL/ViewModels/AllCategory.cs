using Marryme.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Marryme.BAL.ViewModels
{
    public class AllCategory
    {
        public List<GetCRList_ByTypeID_Result> BodyType { get; set; }       
        public List<GetCRList_ByTypeID_Result> Others { get; set; }       
        public List<GetCRList_ByTypeID_Result> PhysicalStatus { get; set; }       
        public List<GetCRList_ByTypeID_Result> MaritalStatus { get; set; }       
        public List<GetCRList_ByTypeID_Result> EducationLevels { get; set; }       
        public List<GetCRList_ByTypeID_Result> Complexion { get; set; }       
        public List<GetCRList_ByTypeID_Result> FamilyValue { get; set; }       
        public List<GetCRList_ByTypeID_Result> FamilyType { get; set; }       
        public List<GetCRList_ByTypeID_Result> FamilyStatus { get; set; }       
        public List<GetCRList_ByTypeID_Result> Religion { get; set; }       
        public List<GetCRList_ByTypeID_Result> Employment { get; set; }       
        public List<GetCRList_ByTypeID_Result> Sect { get; set; }       
        public string SelectedCity { get; set; }       
        public string SelectedCountry { get; set; }       
        public string SelectedState { get; set; }       
    }
}
