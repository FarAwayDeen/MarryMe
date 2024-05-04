using System.ComponentModel.DataAnnotations;

namespace Marryme.BAL
{
    public enum Role
    {
        Admin = 1,
        User = 2
    }
    public enum ActiveStatus
    {
        Active = 1,
        InActive = 0,
    }
    public enum PackageDurationStatus
    {
        [Display(Name = "3 Month")]
        Three_Month = 3,
        [Display(Name = "6 Month")]
        Six_Month = 6,
        [Display(Name = "1 Year")]
        One_Year = 12,
    }
    public enum Sections
    {
        Registration = 1,
        Appearance = 2,
        EducationDetail = 3,
        FamilyDetail = 4,
        LifeStyle = 5,
        LocationDetail = 6,
        LoginDetail = 7,
    }
    public enum RegisteredBy
    {
        Self = 1,
        Parent = 2,
        Sibling = 3,
        Relative = 4,
        Friend = 5,
    }
    public enum LookingFor
    {
        [Display(Name = "Marriage")]
        Marriage,
        [Display(Name = "Dating")]
        Dating,
    }
    public enum UserRole:long
    {
        [Display(Name = "Member")]
        Member=10050,
        [Display(Name = "Registrar")]
        Registrar=10051,
    }
    public enum MarriageNo
    {
        [Display(Name = "1st")]
        First_Marriage=1,
        [Display(Name = "2nd")]
        Second_Marriage=2,
        [Display(Name = "3rd")]
        Third_Marriage=3,
        [Display(Name = "4th")]
        Fourth_Marriage=4,
    }
    public enum WifeNo
    {
        [Display(Name = "1st Wife")]
        First_Wife=1,
        [Display(Name = "2nd Wife")]
        Second_Wife = 2,
        [Display(Name = "3rd Wife")]
        Third_Wife = 3,
        [Display(Name = "4th Wife")]
        Fourth_Wife = 4,
    }
    public enum Gender
    {
        [Display(Name = "Male")]
        Male,
        [Display(Name = "Female")]
        Female,
    }
    public enum Gender2
    {
        [Display(Name = "All")]
        All,
        [Display(Name = "Male")]
        Male,
        [Display(Name = "Female")]
        Female,

    }
    public enum MaritalStatusMale
    {
        UnMarried = 1,
        Widower = 2,
        Divorced = 3,
        Married = 4,
        Separated=5
        //    Separated = 4,
    }
    public enum EducationLevel
    {
        [Display(Name = "Uneducated")]
        NoEducation = 1,
        [Display(Name = "Islamic Education")]
        IslamicEducation = 2,
        [Display(Name = "Primary")]
        Primary = 3,
        [Display(Name = "Middel")]
        Middel = 4,
        [Display(Name = "HighSchool-10 grades")]
        HighSchool_10grade =5,
        [Display(Name = "HighSchool-21 grades")]
        HighSchool_21grade = 6,
        [Display(Name = "Diploma")]
        Diploma = 7,
        [Display(Name = "Bachelors")]
        Bachelors = 8,
        [Display(Name = "Masters")]
        Masters = 9,
        [Display(Name = "PhD")]
        PhD = 10,
        //    Separated = 4,
    }
  
    public enum MaritalStatusFemale
    {
        UnMarried = 1,
        Widow = 2,
        Divorced = 3,
        Married = 4
        //   Separated = 4,
    }
    public enum MaritalStatusMaleFemale
    {
        UnMarried = 1,
        Widow = 2,
        Widower = 3,
        Divorced = 4,
        Married = 5
        //   Separated = 5,
    }
    public enum Day
    {
        One = 1,
        Two = 2,
        Three = 3,
        Four = 4,
        Five = 5,
        Six = 6,
        Seven = 7,
        Eight = 8,
        Nine = 9,
        Ten = 10,
        Eleven = 11,
        Twelve = 12,
        Thirteen = 13,
        Forteen = 14,
        Fifteen = 15,
        Sixteen = 16,
        Seventeen = 17,
        Eighteen = 18,
        Ninteen = 19,
        Twenty = 20,
        TwentyOne = 21,
        TwentyTwo = 22,
        TwentyThree = 23,
        TwentyFour = 24,
        TwentyFive = 25,
        TwentySix = 26,
        TwentySeven = 27,
        TwentyEight = 28,
        TwentyNine = 29,
        Thirty = 30,
        ThirtyOne = 31,
    };
    public enum Month
    {
        January = 1,
        February = 2,
        March = 3,
        April = 4,
        May = 5,
        June = 6,
        July = 7,
        August = 8,
        September = 9,
        October = 10,
        November = 11,
        December = 12,
    }
    public enum Year
    {
        NinteenThousand = 1900,
        One = 1901,
        Two = 1902,
        Three = 1903,
        Four = 1904,
        Five = 1905,
        Six = 1906,
        Seven = 1907,
        Eight = 1908,
        Nine = 1909,
        Ten = 1910,
        Eleven = 1911,
        Twelve = 1912,
        Thirteen = 1913,
        Forteen = 1914,
        Fifteen = 1915,
        Sixteen = 1916,
        Seventeen = 1917,
        Eighteen = 1918,
        Nineteen = 1919,
        Twenty = 1920,
        TwentyOne = 1921,
        TwentyTwo = 1922,
        TwentyThree = 1923,
        TwentyFour = 1924,
        TwentyFive = 1925,
        TwentySix = 1926,
        TwentySeven = 1927,
        TwentyEight = 1928,
        TwentyNine = 1929,
        Thirty = 1930,
        ThirtyOne = 1931,
        ThirtyTwo = 1932,
        ThirtyThree = 1933,
        ThirtyFour = 1934,
        ThirtyFive = 1935,
        ThirtySix = 1936,
        ThirtySeven = 1937,
        ThirtyEight = 1938,
        ThirtyNine = 1939,
        Forty = 1940,
        FortyOne = 1941,
        FortyTwo = 1942,
        FortyThree = 1943,
        FortyFour = 1944,
        FortyFive = 1945,
        FortySix = 1946,
        FortySeven = 1947,
        FortyEight = 1948,
        FortyNine = 1949,
        Fifty = 1950,
        FiftyOne = 1951,
        FiftyTwo = 1952,
        FiftyThree = 1953,
        FiftyFour = 1954,
        FiftyFive = 1955,
        FiftySix = 1956,
        FiftySeven = 1957,
        FiftyEight = 1958,
        FiftyNine = 1959,
        Sixty = 1960,
        SixtyOne = 1961,
        SixtyTwo = 1962,
        SixtyThree = 1963,
        SixtyFour = 1964,
        SixtyFive = 1965,
        SixtySix = 1966,
        SixtySeven = 1967,
        SixtyEight = 1968,
        SixtyNine = 1969,
        Seventy = 1970,
        SeventyOne = 1971,
        SeventyTwo = 1972,
        SeventyThree = 1973,
        SeventyFour = 1974,
        SeventyFive = 1975,
        SeventySix = 1976,
        SeventySeven = 1977,
        SeventyEight = 1978,
        SeventyNine = 1979,
        Eighty = 1980,
        EightyOne = 1981,
        EightyTwo = 1982,
        EightyThree = 1983,
        EightyFour = 1984,
        EightyFive = 1985,
        EightySix = 1986,
        EightySeven = 1987,
        EightyEight = 1988,
        EightyNine = 1989,
        Ninty = 1990,
        NintyOne = 1991,
        NintyTwo = 1992,
        NintyThree = 1993,
        NintyFour = 1994,
        NintyFive = 1995,
        NintySix = 1996,
        NintySeven = 1997,
        NintyEight = 1998,
        NintyNine = 1999,
        TwoThousand = 2000,
        TwoThousandOne = 2001,
        TwoThousandTwo = 2002,
        TwoThousandThree = 2003,
        TwoThousandFour = 2004,
        TwoThousandFive = 2005,
        TwoThousandSix = 2006,
        TwoThousandSeven = 2007,
        TwoThousandEight = 2008,
        TwoThousandNine = 2009,
        TwoThousandTen = 2010

    }
    public enum NoOfChildern
    {
        [Display(Name = "None")]
        None = 0,
        [Display(Name = "1")]
        One = 1,
        [Display(Name = "2")]
        Two = 2,
        [Display(Name = "3")]
        Three = 3,
        [Display(Name = "3+")]
        ThreePlus = 4,
    }
    public enum PhysicalStatus
    {
        [Display(Name = "Normal")]
        Normal = 1,
        [Display(Name = "Physicaly Challenged")]
        Physical_Challenged = 2,
        [Display(Name = "Disabled")]
        Disabled = 3,
    }

    public enum EmployedIn
    {
        [Display(Name = "Government")]
        Government,
        [Display(Name = "Defense")]
        Defense,
        [Display(Name = "Private")]
        Private,
        [Display(Name = "Business")]
        Business,
        [Display(Name = "Self Employed")]
        Self_Employed,
        [Display(Name = "Not Working")]
        Not_Working,

    }
    public enum FamilyValue
    {
        [Display(Name = "Orthodox")]
        Orthodox = 1,
        [Display(Name = "Traditional")]
        Traditional = 2,
        [Display(Name = "Moderate")]
        Moderate = 3,
        [Display(Name = "Liberal")]
        Liberal = 4,
    }
    public enum FamilyType
    {
        [Display(Name = "Joint Family")]
        JointFamily,
        [Display(Name = "Nuclear Family")]
        NuclearFamily,
    }
    public enum FamilyStatus
    {
        [Display(Name = "Middle Class")]
        Middle_Class,
        [Display(Name = "Upper Middle Class")]
        Upper_Middle_Class,
        [Display(Name = "Rich/Affluent")]
        Rich_Affluent,
    }
    public enum ExsitingWifeLivingStatus
    {
        [Display(Name = "Joint Family")]
        JointFamily=1,
        [Display(Name = "Separate Family")]
        SeparateFamily=2,        
    }
    public enum belief
    {
        Islam = 1
    }
    public enum trueFalse
    {
        Yes = 1,
        No = 0
    }
    public enum ExsitingWife
    {
        First=1,
        Second=2,
        Third=3
    }
    public enum Sect
    {
        Sunni,
        Dubandi,
        AhalHadith,
        Shia
        
    }
    public enum Dosham
    {
        [Display(Name = "Yes")]
        Yes = 1,
        [Display(Name = "No")]
        No = 2,
        [Display(Name = "Don't Know")]
        DontKnow = 3,

    }
    public enum Hours
    {
        one = 1,
        Two = 2,
        Three = 3,
        Four = 4,
        Five = 5,
        Six = 6,
        Seven = 7,
        Eight = 8,
        Nine = 9,
        Ten = 10,
        Eleven = 11,
        Twelve = 12,
    }
    public enum Minutes
    {
        Zero = 00,
        one = 1,
        Two = 2,
        Three = 3,
        Four = 4,
        Five = 5,
        Six = 6,
        Seven = 7,
        Eight = 8,
        Nine = 9,
        Ten = 10,
        Eleven = 11,
        Twelve = 12,
        Thirteen = 13,
        Forteen = 14,
        Fifteen = 15,
        Sixteen = 16,
        Seventeen = 17,
        Eighteen = 18,
        Ninteen = 19,
        Twenty = 20,
        TwentyOne = 21,
        TwentyTwo = 22,
        TwentyThree = 23,
        TwentyFour = 24,
        TwentyFive = 25,
        TwentySix = 26,
        TwentySeven = 27,
        TwentyEight = 28,
        TwentyNine = 29,
        Thirty = 30,
        ThirtyOne = 31,
        ThirtyTwo = 32,
        ThirtyThree = 33,
        ThirtyFour = 34,
        ThirtyFive = 35,
        ThirtySix = 36,
        ThirtySeven = 37,
        ThirtyEight = 38,
        ThirtyNine = 39,
        Forty = 40,
        FortyOne = 41,
        FortyTwo = 42,
        FortyThree = 43,
        FortyFour = 44,
        FortyFive = 45,
        FortySix = 46,
        FortySeven = 47,
        FortyEight = 48,
        FortyNine = 49,
        Fifty = 50,
        FiftyOne = 51,
        FiftyTwo = 52,
        FiftyThree = 53,
        FiftyFour = 54,
        FiftyFive = 55,
        FiftySix = 56,
        FiftySeven = 57,
        FiftyEight = 58,
        FiftyNine = 59,

    }
    public enum Meridiem
    {
        AM,
        PM,
    }
    public enum ChartStyle
    {
        NorthIndian,
        EastIndian,
        Kerala,

    }

    public enum BodyType
    {
        [Display(Name = "Slim")]
        Slim,
        [Display(Name = "Athletic")]
        Athletic,
        [Display(Name = "Average")]
        Average,
        [Display(Name = "Heavy")]
        Heavy,
    }
    public enum Complexion
    {
        [Display(Name = "VeryFair")]
        VeryFair,
        [Display(Name = "Fair")]
        Fair,
        [Display(Name = "Wheatish")]
        Wheatish,
        [Display(Name = "Wheatish Brown")]
        WheatishBrown,
        [Display(Name = "Dark")]
        Dark,
    }
    public enum EatingHabits
    {
        [Display(Name = "Vageterian")]
        Vageterian,
        [Display(Name = "Non Vageterian")]
        Non_Vegeterian,
        [Display(Name = "Eggetarian")]
        Eggetarian,
        [Display(Name = "Vegan")]
        Vegan,
    }
    public enum DrinkingHabits
    {
        [Display(Name = "Non Drinker")]
        Non_Drinker,
        [Display(Name = "Light/Social Drinker")]
        Light_Social_Drinker,
        [Display(Name = "Regular Drinker")]
        Regular_Drinker,
    }
    public enum SmokingHabits
    {
        [Display(Name = "Non Smoker")]
        Non_Smoker,
        [Display(Name = "Light/Social Smoker")]
        Light_Social_Smoker,
        [Display(Name = "Regular Smoker")]
        Regular_Smoker,
    }
    public enum Height
    {
        TwentyOne = 121,
        TwentyFive = 125,
        Thirty = 130,
        ThirtyFive = 135,
        Forty = 140,
        FortyFive = 145,
        Fifty = 150,
        FiftyFive = 155,
        SixtyFive = 165,
        SeventyFive = 175,
        EightyFive = 185
    }
    public enum Age
    {
        Twenty = 20,
        TwentyFive = 25,
        Thirty = 30,
        ThirtyFive = 35,
        Forty = 40,
        FortyFive = 45,
        Fifty = 50
    }
    public enum weight
    {
        FortyFive = 45,
        Fifty = 50,
        FiftyFive = 55,
        SixtyFive = 65,
        SeventyFive = 75,
        EightyFive = 85
    }
    public enum CurrencySimbals
    {
        [Display(Name = "PKR (RS)")]
        PKR = 1,
        [Display(Name = "USD ($)")]
        USD = 2,
        [Display(Name = "INR0 (₹)")]
        INR = 3,
        [Display(Name = "AED (د.إ)")]
        AED = 4,
    }
    public enum PaymentType
    {
        [Display(Name = "Bank Transfer")]
        BankTransfer,
        [Display(Name = "Paypal")]
        Paypal,
        [Display(Name = "Mobile Payment")]
        MobilePayment,
    }
    public enum PaymentStatus
    {
        [Display(Name = "Pending")]
        Pending,
        [Display(Name = "Submitted")]
        Submitted,
        [Display(Name = "Canceled")]
        Canceled,
        [Display(Name = "Approved")]
        Approved,
        [Display(Name = "Rejected")]
        Rejected,
    }
    public enum ChatRequestStatus
    {
        [Display(Name = "Pending")]
        Pending,
        [Display(Name = "Accepted")]
        Accepted,
        [Display(Name = "Rejected")]
        Rejected,
    }
    public enum CLRList:long
    {
        MaritalStatus=1,
        EducationLevels=2,
        PhysicalStatus=3,
        SocialStatus=4,
        Others=5,
        BodyType=6,
        Complexion=7,
        FamilyValue=8,
        FamilyType=9,
        FamilyStatus=10,
        Religion=11,
        Employment=13,
        Sect = 10012,
        Cast = 10014

    }
}
