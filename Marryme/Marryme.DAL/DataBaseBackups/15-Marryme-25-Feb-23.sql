USE [Marryme]
GO
/****** Object:  Table [dbo].[AcceptanceCriteria]    Script Date: 02/25/2023 3:56:43 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcceptanceCriteria](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NULL,
	[SonsAproval] [nvarchar](50) NULL,
	[DaughtersAproval] [nvarchar](50) NULL,
	[AuntsAproval] [nvarchar](50) NULL,
	[UnclesAproval] [nvarchar](50) NULL,
	[SisterAproval] [nvarchar](50) NULL,
	[BrothersAproval] [nvarchar](50) NULL,
	[MotherAproval] [nvarchar](50) NULL,
	[FathersAproval] [nvarchar](50) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_AcceptanceCriteria] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActivityLog]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityLog](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TableName] [nvarchar](500) NULL,
	[Action] [nvarchar](3000) NULL,
	[Detail] [nvarchar](max) NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ActivityLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdminProfile]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminProfile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[Password] [nvarchar](50) NULL,
	[ProfilePicture] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NULL,
	[Address] [nvarchar](500) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationSettings]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationSettings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationName] [nvarchar](200) NULL,
	[Logo] [nvarchar](200) NULL,
	[Address] [nvarchar](500) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](200) NULL,
	[FaceBookLink] [nvarchar](300) NULL,
	[GoogleLink] [nvarchar](300) NULL,
	[TwitterLink] [nvarchar](300) NULL,
	[SkypeLink] [nvarchar](300) NULL,
	[NTN] [nvarchar](200) NULL,
	[CompanyName] [nvarchar](200) NULL,
	[MailingAddress] [nvarchar](500) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDateTime] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDateTime] [datetime] NULL,
 CONSTRAINT [PK_ApplicationSettings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attachements]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attachements](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[FilePath] [nvarchar](50) NULL,
	[FileExtension] [nvarchar](50) NULL,
	[FileType] [nvarchar](50) NULL,
	[DocumentTypeID] [int] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Attachements] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChatFriendRequest]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatFriendRequest](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FromId] [bigint] NOT NULL,
	[ToId] [bigint] NOT NULL,
	[RequestStatus] [nvarchar](20) NULL,
	[IsBlocked] [bit] NOT NULL,
	[BlockedBy] [bigint] NULL,
	[RequestDatetime] [datetime] NULL,
 CONSTRAINT [PK_ChatFriendRequest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChatHistoryDeletedMember]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatHistoryDeletedMember](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NOT NULL,
	[MessageId] [bigint] NOT NULL,
	[HistoryDeletedDatetime] [datetime] NULL,
 CONSTRAINT [PK_ChatHistoryDeletedMember] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChatMessage]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatMessage](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FromID] [bigint] NOT NULL,
	[ToID] [bigint] NOT NULL,
	[Message] [nvarchar](max) NULL,
	[MessageDateTime] [datetime] NULL,
	[IsRead] [bit] NOT NULL,
 CONSTRAINT [PK_tblUserMessage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChatSession]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatSession](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NOT NULL,
	[SessionId] [nvarchar](100) NULL,
 CONSTRAINT [PK_ChatSession] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[StateID] [int] NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactUs]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactUs](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[Subject] [nvarchar](100) NULL,
	[Message] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[IsRead] [bit] NOT NULL,
 CONSTRAINT [PK_ContactUs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[CountryID] [bigint] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](500) NULL,
	[ISO3] [nvarchar](500) NULL,
	[ISO] [nvarchar](500) NULL,
	[NameCode] [nvarchar](500) NULL,
	[PhoneCode] [nvarchar](500) NULL,
	[SortOrder] [int] NULL,
	[FlagIcon] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[CreadtedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblCountry] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CR_List]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CR_List](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ListTypeID] [bigint] NULL,
	[Name] [varchar](50) NULL,
	[DisplayFor] [varchar](15) NULL,
	[SortOrder] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_CR_List] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CR_ListType]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CR_ListType](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Title] [varchar](50) NULL,
	[Description] [varchar](500) NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_CR_ListType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Divorce]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Divorce](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NULL,
	[DivorceReason] [nvarchar](max) NULL,
	[DivorceDate] [datetime] NULL,
	[DivorceStatus] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Divorce] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DivorcePolicy]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DivorcePolicy](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NULL,
	[dropdownOption] [nvarchar](150) NULL,
	[Amountcheckbox] [nvarchar](150) NULL,
	[AmountFrom] [int] NULL,
	[AmountTo] [int] NULL,
	[IncomeCurrency] [nvarchar](50) NULL,
	[HouseCheckBox] [nvarchar](50) NULL,
	[HouseDetail] [nvarchar](max) NULL,
	[MiscellaneousCheckbox] [nvarchar](50) NULL,
	[MiscellaneousDetail] [nvarchar](max) NULL,
	[ThreeDivorcePolicy] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_DivorcePolicy] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocDropdownList]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocDropdownList](
	[DocTypeID] [bigint] IDENTITY(1,1) NOT NULL,
	[DocName] [nvarchar](max) NULL,
 CONSTRAINT [PK_DocDropdownList] PRIMARY KEY CLUSTERED 
(
	[DocTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentTypes]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DocTypeName] [nvarchar](50) NULL,
	[CtreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_DocumentTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EductionLevels]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EductionLevels](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[UserFor] [nvarchar](10) NULL,
	[CategoryId] [bigint] NULL,
 CONSTRAINT [PK_EductionLevels] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailSMSTemplate]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailSMSTemplate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](5) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[CC] [nvarchar](500) NULL,
	[BCC] [nvarchar](500) NULL,
	[Subject] [nvarchar](1500) NULL,
	[MessageBody] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_EmailSMSTemplate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL,
	[Message] [nvarchar](2000) NOT NULL,
	[Url] [nvarchar](250) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ErrorLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExisitingKidsDetail]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExisitingKidsDetail](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[KidDetail] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_ExisitingKidsDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExisitingKidsDetailResult]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExisitingKidsDetailResult](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NULL,
	[ExistingWife] [tinyint] NULL,
	[KidAge] [int] NULL,
	[KidGender] [nvarchar](50) NULL,
	[KidLocation] [nvarchar](50) NULL,
	[KidMaritalStatus] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_ExisitingKidsDetailResult] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facilities]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facilities](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FacilityName] [nvarchar](50) NULL,
	[FacilityFor] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_WomenFacilities] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacilitiesResultFemale]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacilitiesResultFemale](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NULL,
	[FacilityId] [bigint] NULL,
	[One] [bit] NULL,
	[Two] [bit] NULL,
	[Three] [bit] NULL,
	[Four] [bit] NULL,
	[FacilityFor] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_FacilitiesResultFemale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacilitiesResultMale]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacilitiesResultMale](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NULL,
	[FacilityId] [bigint] NULL,
	[FacilityFor] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_FacilitiesResult] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FamilyInvolvement]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FamilyInvolvement](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[InvolvementOptions] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_FamilyInvolvement] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FamilyInvolvementResult]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FamilyInvolvementResult](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NULL,
	[FamilyInvolvementID] [bigint] NULL,
	[FamilyInvolvementResult] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_FamilyInvolvementResult] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBack](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Email] [nvarchar](200) NULL,
	[Designation] [nvarchar](100) NULL,
	[Message] [nvarchar](max) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[IsRead] [bit] NOT NULL,
 CONSTRAINT [PK_FeedBack] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FieldsPermission]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FieldsPermission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NULL,
	[IsVisibleForPremium] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Section] [nvarchar](20) NULL,
 CONSTRAINT [PK_FieldsPermission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Languages]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaritalStatus]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaritalStatus](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[UserFor] [nvarchar](10) NULL,
	[CategoryId] [bigint] NULL,
 CONSTRAINT [PK_MaritalStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MarriageDuration]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarriageDuration](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NULL,
	[MarriageDuration] [nvarchar](50) NULL,
	[DurationFrom] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_MarriageTime] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MarriagePolicy]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarriagePolicy](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NULL,
	[dropdownOption] [nvarchar](150) NULL,
	[Amountcheckbox] [nvarchar](150) NULL,
	[AmountDetail] [nvarchar](max) NULL,
	[HouseCheckBox] [nvarchar](50) NULL,
	[HouseDetail] [nvarchar](max) NULL,
	[MiscellaneousCheckbox] [nvarchar](50) NULL,
	[MiscellaneousDetail] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_MarriagePolicy] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberAppearance]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberAppearance](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NOT NULL,
	[PhysicalStatus] [nvarchar](20) NULL,
	[Weight] [int] NULL,
	[BodyType] [nvarchar](15) NULL,
	[Complexion] [nvarchar](20) NULL,
	[Feet] [int] NULL,
	[HeightUnit] [nvarchar](10) NULL,
	[Inches] [int] NULL,
	[Centimeters] [int] NULL,
 CONSTRAINT [PK_MemberAppearance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberEducationDetail]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberEducationDetail](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NOT NULL,
	[HighestEducation] [nvarchar](200) NULL,
	[EmployeedIn] [nvarchar](50) NULL,
	[Occupation] [nvarchar](100) NULL,
	[IncomeCurrency] [nvarchar](15) NULL,
	[AnnualIncomeFrom] [decimal](18, 2) NULL,
	[AnnualIncomeTo] [nchar](10) NULL,
	[EductionLevelsId] [int] NULL,
 CONSTRAINT [PK_MemberEducationDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberFamilyDetail]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberFamilyDetail](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NOT NULL,
	[ParentContactNo] [nvarchar](20) NULL,
	[FamilyValue] [nvarchar](20) NULL,
	[FamilyType] [nvarchar](20) NULL,
	[FamilyStatus] [nvarchar](20) NULL,
	[IsMotherAlive] [bit] NOT NULL,
	[IsFatherAlive] [bit] NOT NULL,
	[FatherOccupation] [nvarchar](50) NULL,
	[NoOfBrothers] [nvarchar](5) NULL,
	[NoOfSisters] [nvarchar](5) NULL,
	[FamilyDetail] [nvarchar](500) NULL,
 CONSTRAINT [PK_MemberFamilyDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberLanguages]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberLanguages](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NOT NULL,
	[LanguageId] [int] NOT NULL,
 CONSTRAINT [PK_MemberLanguages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberLifeStyle]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberLifeStyle](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NOT NULL,
	[SmokingHabit] [nvarchar](20) NULL,
	[Interests] [nvarchar](200) NULL,
	[Hobbies] [nvarchar](500) NULL,
 CONSTRAINT [PK_MemberLifeStyle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberLikeDislike]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberLikeDislike](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IsLike] [bit] NULL,
	[MemberId] [bigint] NULL,
	[ResponseToMemberId] [bigint] NULL,
 CONSTRAINT [PK_MemberLikeDislike] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberLocationDetail]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberLocationDetail](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NOT NULL,
	[CountryLivingIn] [int] NULL,
	[PlaceOfBirth] [nvarchar](200) NULL,
	[ResidingState] [nvarchar](100) NULL,
	[ResidingCity] [nvarchar](100) NULL,
	[Citizenship] [int] NULL,
 CONSTRAINT [PK_MemberLocationDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberLoginDetail]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberLoginDetail](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NOT NULL,
	[Email] [nvarchar](100) NULL,
	[Password] [nvarchar](200) NULL,
	[IsEmailConfirmed] [bit] NOT NULL,
	[ConfirmationCode] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[IsFirstLoginAttempt] [bit] NOT NULL,
	[IsMobileUser] [bit] NOT NULL,
	[FirebaseUserId] [nvarchar](250) NULL,
 CONSTRAINT [PK_MemberLoginDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberPackageConfirmPayment]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberPackageConfirmPayment](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PackageSubscriptionId] [int] NULL,
	[PaymentType] [nvarchar](50) NULL,
	[PaymentOptionId] [bigint] NULL,
	[PaymentDate] [datetime] NULL,
	[PaymentAmount] [decimal](18, 2) NULL,
	[DepositSlip] [nvarchar](max) NULL,
	[IsMobilePic] [bit] NULL,
 CONSTRAINT [PK_MemberPackageConfirmPayment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberPackagePayment]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberPackagePayment](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberPackageSubscriptionId] [bigint] NOT NULL,
	[TransactionId] [nvarchar](200) NULL,
	[PayerId] [nvarchar](200) NULL,
	[Amount] [decimal](18, 2) NULL,
	[TransactionDate] [datetime] NULL,
	[Status] [nvarchar](15) NULL,
	[PaymentType] [nvarchar](20) NULL,
	[PaymentOptionId] [bigint] NULL,
 CONSTRAINT [PK_MemberPackagePayment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberPackageSubscription]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberPackageSubscription](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NOT NULL,
	[PackagePricingPlanId] [bigint] NOT NULL,
	[SubscriptionStartDate] [datetime] NULL,
	[SubscriptionEndDate] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[PackageAmount] [decimal](18, 2) NULL,
 CONSTRAINT [PK_MemberPackageSubscription] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberPackageSubscriptionDetail]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberPackageSubscriptionDetail](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NOT NULL,
	[PackageId] [bigint] NOT NULL,
	[TotalNoOfContactsToShow] [bigint] NOT NULL,
	[UsedNoOfContacts] [int] NOT NULL,
	[TotalNoOfChatMessages] [bigint] NOT NULL,
	[UsedNoOfChatMessages] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_MemberPackageSubscriptionDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberRegistration]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberRegistration](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[NickName] [nvarchar](50) NULL,
	[ProfileCreatedBy] [nvarchar](20) NULL,
	[MotherTongue] [nvarchar](20) NULL,
	[NoOfMarriage] [nvarchar](50) NULL,
	[LookingFor] [nvarchar](20) NULL,
	[Gender] [nvarchar](10) NULL,
	[MobileNo] [nvarchar](20) NULL,
	[DOB] [datetime] NULL,
	[MaritalStatus] [nvarchar](15) NULL,
	[NoOfChildren] [nvarchar](5) NULL,
	[Subcast] [nvarchar](15) NULL,
	[ProfilePicPath] [nvarchar](max) NULL,
	[ReligionId] [bigint] NULL,
	[CountryId] [int] NULL,
	[AboutMe] [nvarchar](max) NULL,
	[CreatedBy] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsMobilePic] [bit] NULL,
 CONSTRAINT [PK_MemberRegistration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberReligiousDetail]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberReligiousDetail](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NOT NULL,
	[Religion] [nvarchar](20) NULL,
	[Sect] [nvarchar](20) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[Updateddate] [datetime] NULL,
 CONSTRAINT [PK_MemberReligiousDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenCurrentState]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenCurrentState](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MenStateName] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_MenCurrentState] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](max) NULL,
	[FromId] [bigint] NULL,
	[ToId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[IsRead] [bit] NOT NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NumberOfMarriage]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NumberOfMarriage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MarriageNumber] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_NumberOfMarriage] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Package]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Package](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PackageTypeId] [int] NULL,
	[CanMemberViewMobileNo] [bit] NOT NULL,
	[NumberOfMobileNo] [int] NULL,
	[NumberOfChatMessages] [int] NOT NULL,
	[CanViewPhoto] [bit] NOT NULL,
	[IsVisibleHighProfile] [bit] NOT NULL,
	[CanChat] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Package] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PackagePricingPlan]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PackagePricingPlan](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PackageId] [bigint] NOT NULL,
	[PackageDuration] [int] NULL,
	[PackagePrice] [decimal](18, 2) NULL,
 CONSTRAINT [PK_PackagePricingPlan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PackageType]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PackageType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NULL,
 CONSTRAINT [PK_PackageType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PageContent]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageContent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PageName] [nvarchar](50) NULL,
	[PageUrl] [nvarchar](50) NULL,
	[PageDescription] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PageContent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerCatagoryMaritalStatus]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerCatagoryMaritalStatus](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NULL,
	[PartnerMaritalStatus] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PartnerCatagoryMaritalStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerCategory]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerCategory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PartCategoryName] [nvarchar](50) NULL,
	[ParentID] [bigint] NULL,
	[CategoryFor] [nvarchar](10) NULL,
	[SortOrder] [int] NULL,
	[Status] [bit] NULL,
	[CategoryType] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_PartnerCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerCategoryResult]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerCategoryResult](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NULL,
	[CR_ListId] [bigint] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PartnerCategoryResult] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerCatoryEducationLevel]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerCatoryEducationLevel](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NULL,
	[EducationLevelId] [int] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PartnerCatoryEducationLevel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentOptions]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentOptions](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PaymentType] [nvarchar](200) NULL,
	[BankName] [nvarchar](200) NULL,
	[AccountTitle] [nvarchar](200) NULL,
	[AccountNumber] [nvarchar](200) NULL,
	[BranchCode] [nvarchar](200) NULL,
	[BankLogo] [nvarchar](150) NULL,
	[IBAN] [nvarchar](200) NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [bigint] NULL,
	[CreatedDateTime] [datetime] NULL,
 CONSTRAINT [PK_PaymentOptions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProfileRequirement]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfileRequirement](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RequirmentName] [nvarchar](50) NULL,
	[CategoryId] [bigint] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_ProfileRequirement] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProposalQuestions]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProposalQuestions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](max) NULL,
	[QuestionType] [nvarchar](50) NULL,
	[QuestionsFor] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_ProposalQuestions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProposalQuestionsResult]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProposalQuestionsResult](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NULL,
	[ProposalQuestionsId] [bigint] NULL,
	[ProposalQuestionsResult] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_ProposalQuestionsResult] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Religion]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Religion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ReligionName] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Religion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReligionSect]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReligionSect](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SectName] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_ReligionSect] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[States]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[States](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[CountryID] [int] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_States] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UploadDocuments]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UploadDocuments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DocTypeID] [int] NULL,
	[FilePath] [nvarchar](max) NULL,
	[MemberId] [int] NULL,
 CONSTRAINT [PK_UploadDocuments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WifeDetail]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WifeDetail](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DetailQuestions] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_WifeDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WifeDetailResult]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WifeDetailResult](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NULL,
	[ExsitingWife] [tinyint] NULL,
	[WifeReligion] [nvarchar](50) NULL,
	[MarriageYear] [nvarchar](50) NULL,
	[WifeLocation] [nvarchar](200) NULL,
	[WifeKids] [nvarchar](50) NULL,
	[WifeJob] [nvarchar](50) NULL,
	[LivingStatus] [nvarchar](50) NULL,
	[EducationLevelId] [tinyint] NULL,
	[HaveWife] [nvarchar](50) NULL,
	[WifeAge] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_WifeDetailResult] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WifeNumber]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WifeNumber](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NULL,
	[WifeNo] [nvarchar](50) NULL,
	[FiledStatus] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_WifeNumber] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WomenCurrentState]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WomenCurrentState](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_WomenCurrentState] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WomenResponsibilities]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WomenResponsibilities](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ResponsibilityName] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_WomenResponsibilities] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WomenRights]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WomenRights](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WomenRights] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_WomenRights] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WomenRightsResult]    Script Date: 02/25/2023 3:56:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WomenRightsResult](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NULL,
	[WomenRightsId] [bigint] NULL,
	[WomenRightsResult] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_WomenRightsResult] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AcceptanceCriteria] ON 
GO
INSERT [dbo].[AcceptanceCriteria] ([ID], [MemberId], [SonsAproval], [DaughtersAproval], [AuntsAproval], [UnclesAproval], [SisterAproval], [BrothersAproval], [MotherAproval], [FathersAproval], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (9, 0, N'Yes', N'Yes', N'Yes', N'No', N'Yes', N'Yes', N'Yes', N'Yes', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[AcceptanceCriteria] ([ID], [MemberId], [SonsAproval], [DaughtersAproval], [AuntsAproval], [UnclesAproval], [SisterAproval], [BrothersAproval], [MotherAproval], [FathersAproval], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10, 30, N'Yes', N'No', N'Yes', N'Yes', N'Yes', N'Yes', N'No', N'Yes', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[AcceptanceCriteria] ([ID], [MemberId], [SonsAproval], [DaughtersAproval], [AuntsAproval], [UnclesAproval], [SisterAproval], [BrothersAproval], [MotherAproval], [FathersAproval], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (11, 44, NULL, NULL, NULL, N'Yes', NULL, N'No', NULL, N'Yes', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[AcceptanceCriteria] OFF
GO
SET IDENTITY_INSERT [dbo].[AdminProfile] ON 
GO
INSERT [dbo].[AdminProfile] ([Id], [FirstName], [LastName], [Email], [Password], [ProfilePicture], [Phone], [Address]) VALUES (1, N'Zeeshan', N'Ayoub', N'admin@marryme.com', N'Admin@123', NULL, N'0321654987', N'Sarfraz Colony GRW')
GO
SET IDENTITY_INSERT [dbo].[AdminProfile] OFF
GO
SET IDENTITY_INSERT [dbo].[ApplicationSettings] ON 
GO
INSERT [dbo].[ApplicationSettings] ([Id], [ApplicationName], [Logo], [Address], [Phone], [Email], [FaceBookLink], [GoogleLink], [TwitterLink], [SkypeLink], [NTN], [CompanyName], [MailingAddress], [IsActive], [CreatedBy], [CreatedDateTime], [UpdatedBy], [UpdatedDateTime]) VALUES (1, N'Marryme', N'/Images/AppSettingLogo/1//Images/AppSettingLogo/1/01-08-2022-14-296379497898475894920.png', N'Sarfraz Colony Gujranwala Punjab Pakistan', N'+923246428468', N'admin@marryme.com', N'https://www.facebook.com', N'google.com', N'twitter.com', N'skype.com', N'4535', N'East Flicker', N'St# 10 Building # 3 Sarfraz Colony Gujranwala Punjab Pakistan', 1, NULL, CAST(N'2020-07-28T16:12:36.000' AS DateTime), NULL, CAST(N'2022-08-01T19:41:56.903' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ApplicationSettings] OFF
GO
SET IDENTITY_INSERT [dbo].[ChatFriendRequest] ON 
GO
INSERT [dbo].[ChatFriendRequest] ([Id], [FromId], [ToId], [RequestStatus], [IsBlocked], [BlockedBy], [RequestDatetime]) VALUES (18, 9, 18, N'Pending', 0, NULL, CAST(N'2020-11-02T03:13:31.547' AS DateTime))
GO
INSERT [dbo].[ChatFriendRequest] ([Id], [FromId], [ToId], [RequestStatus], [IsBlocked], [BlockedBy], [RequestDatetime]) VALUES (19, 9, 12, N'Pending', 0, NULL, CAST(N'2020-11-02T03:13:45.367' AS DateTime))
GO
INSERT [dbo].[ChatFriendRequest] ([Id], [FromId], [ToId], [RequestStatus], [IsBlocked], [BlockedBy], [RequestDatetime]) VALUES (20, 22, 27, N'Pending', 0, NULL, CAST(N'2022-05-21T19:21:26.317' AS DateTime))
GO
INSERT [dbo].[ChatFriendRequest] ([Id], [FromId], [ToId], [RequestStatus], [IsBlocked], [BlockedBy], [RequestDatetime]) VALUES (21, 44, 35, N'Accepted', 0, 44, CAST(N'2022-09-17T18:19:55.523' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ChatFriendRequest] OFF
GO
SET IDENTITY_INSERT [dbo].[ChatMessage] ON 
GO
INSERT [dbo].[ChatMessage] ([Id], [FromID], [ToID], [Message], [MessageDateTime], [IsRead]) VALUES (1, 44, 35, N'hi', CAST(N'2022-09-17T18:24:50.033' AS DateTime), 1)
GO
INSERT [dbo].[ChatMessage] ([Id], [FromID], [ToID], [Message], [MessageDateTime], [IsRead]) VALUES (2, 44, 35, N'hi', CAST(N'2022-09-17T19:54:51.230' AS DateTime), 1)
GO
INSERT [dbo].[ChatMessage] ([Id], [FromID], [ToID], [Message], [MessageDateTime], [IsRead]) VALUES (3, 35, 44, N'hiu', CAST(N'2022-09-17T19:55:07.477' AS DateTime), 1)
GO
INSERT [dbo].[ChatMessage] ([Id], [FromID], [ToID], [Message], [MessageDateTime], [IsRead]) VALUES (4, 44, 35, N'too', CAST(N'2022-09-17T19:55:20.760' AS DateTime), 1)
GO
INSERT [dbo].[ChatMessage] ([Id], [FromID], [ToID], [Message], [MessageDateTime], [IsRead]) VALUES (5, 35, 44, N'hy', CAST(N'2022-09-17T20:28:07.237' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[ChatMessage] OFF
GO
SET IDENTITY_INSERT [dbo].[Cities] ON 
GO
INSERT [dbo].[Cities] ([CityID], [Name], [StateID]) VALUES (1, N'Lahore', 4)
GO
INSERT [dbo].[Cities] ([CityID], [Name], [StateID]) VALUES (2, N'Gujranwala', 4)
GO
INSERT [dbo].[Cities] ([CityID], [Name], [StateID]) VALUES (1001, N'Sialkot', 4)
GO
INSERT [dbo].[Cities] ([CityID], [Name], [StateID]) VALUES (1002, N'Gujrat', 4)
GO
SET IDENTITY_INSERT [dbo].[Cities] OFF
GO
SET IDENTITY_INSERT [dbo].[Countries] ON 
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Andorra', NULL, N'AD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'United Arab Emirates', NULL, N'AE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Afghanistan', NULL, N'AF', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'Antigua And Barbuda', NULL, N'AG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'Albania', NULL, N'AL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, N'Armenia', NULL, N'AM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, N'Angola', NULL, N'AO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, N'Antarctica', NULL, N'AQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (9, N'Argentina', NULL, N'AR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, N'American Samoa', NULL, N'AS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (11, N'Austria', NULL, N'AT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (12, N'Australia', NULL, N'AU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (13, N'Aruba', NULL, N'AW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (14, N'Aland Islands', NULL, N'AX', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (15, N'Azerbaijan', NULL, N'AZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (16, N'Bosnia And Herzegovina', NULL, N'BA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (17, N'Barbados', NULL, N'BB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (18, N'Bangladesh', NULL, N'BD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (19, N'Belgium', NULL, N'BE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (20, N'Burkina Faso', NULL, N'BF', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (21, N'Bulgaria', NULL, N'BG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (22, N'Bahrain', NULL, N'BH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (23, N'Burundi', NULL, N'BI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (24, N'Benin', NULL, N'BJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (25, N'Bermuda', NULL, N'BM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (26, N'Brunei', NULL, N'BN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (27, N'Bolivia', NULL, N'BO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (28, N'Bonaire, Saint Eustatius And Saba ', NULL, N'BQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (29, N'Brazil', NULL, N'BR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (30, N'Bahamas', NULL, N'BS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (31, N'Bhutan', NULL, N'BT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (32, N'Bouvet Island', NULL, N'BV', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (33, N'Botswana', NULL, N'BW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (34, N'Belarus', NULL, N'BY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (35, N'Belize', NULL, N'BZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (36, N'Canada', NULL, N'CA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (37, N'Democratic Republic Of The Congo', NULL, N'CD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (38, N'Central African Republic', NULL, N'CF', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (39, N'Republic Of The Congo', NULL, N'CG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (40, N'Switzerland', NULL, N'CH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (41, N'Ivory Coast', NULL, N'CI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (42, N'Chile', NULL, N'CL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (43, N'Cameroon', NULL, N'CM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (44, N'China', NULL, N'CN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (45, N'Colombia', NULL, N'CO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (46, N'Costa Rica', NULL, N'CR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (47, N'Cuba', NULL, N'CU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (48, N'Cape Verde', NULL, N'CV', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (49, N'Cyprus', NULL, N'CY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (50, N'Czech Republic', NULL, N'CZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (51, N'Germany', NULL, N'DE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (52, N'Djibouti', NULL, N'DJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (53, N'Denmark', NULL, N'DK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (54, N'Dominica', NULL, N'DM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (55, N'Dominican Republic', NULL, N'DO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (56, N'Algeria', NULL, N'DZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (57, N'Ecuador', NULL, N'EC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (58, N'Estonia', NULL, N'EE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (59, N'Egypt', NULL, N'EG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (60, N'Western Sahara', NULL, N'EH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (61, N'Eritrea', NULL, N'ER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (62, N'Spain', NULL, N'ES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (63, N'Ethiopia', NULL, N'ET', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (64, N'Finland', NULL, N'FI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (65, N'Fiji', NULL, N'FJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (66, N'Micronesia', NULL, N'FM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (67, N'Faroe Islands', NULL, N'FO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (68, N'France', NULL, N'FR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (69, N'Gabon', NULL, N'GA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (70, N'United Kingdom', NULL, N'GB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (71, N'Grenada', NULL, N'GD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (72, N'Georgia', NULL, N'GE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (73, N'French Guiana', NULL, N'GF', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (74, N'Guernsey', NULL, N'GG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (75, N'Ghana', NULL, N'GH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (76, N'Greenland', NULL, N'GL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (77, N'Gambia', NULL, N'GM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (78, N'Guinea', NULL, N'GN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (79, N'Guadeloupe', NULL, N'GP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (80, N'Equatorial Guinea', NULL, N'GQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (81, N'Greece', NULL, N'GR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (82, N'Guatemala', NULL, N'GT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (83, N'Guam', NULL, N'GU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (84, N'Guinea-Bissau', NULL, N'GW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (85, N'Guyana', NULL, N'GY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (86, N'Hong Kong', NULL, N'HK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (87, N'Honduras', NULL, N'HN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (88, N'Croatia', NULL, N'HR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (89, N'Haiti', NULL, N'HT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (90, N'Hungary', NULL, N'HU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (91, N'Indonesia', NULL, N'ID', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (92, N'Ireland', NULL, N'IE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (93, N'Israel', NULL, N'IL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (94, N'Isle Of Man', NULL, N'IM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (95, N'India', NULL, N'IN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (96, N'British Indian Ocean Territory', NULL, N'IO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (97, N'Iraq', NULL, N'IQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (98, N'Iran', NULL, N'IR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (99, N'Iceland', NULL, N'IS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (100, N'Italy', NULL, N'IT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (101, N'Jersey', NULL, N'JE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (102, N'Jamaica', NULL, N'JM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (103, N'Jordan', NULL, N'JO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (104, N'Japan', NULL, N'JP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (105, N'Kenya', NULL, N'KE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (106, N'Kyrgyzstan', NULL, N'KG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (107, N'Cambodia', NULL, N'KH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (108, N'Kiribati', NULL, N'KI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (109, N'Comoros', NULL, N'KM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (110, N'Saint Kitts And Nevis', NULL, N'KN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (111, N'North Korea', NULL, N'KP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (112, N'South Korea', NULL, N'KR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (113, N'Kuwait', NULL, N'KW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (114, N'Kazakhstan', NULL, N'KZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (115, N'Laos', NULL, N'LA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (116, N'Lebanon', NULL, N'LB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (117, N'Saint Lucia', NULL, N'LC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (118, N'Liechtenstein', NULL, N'LI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (119, N'Sri Lanka', NULL, N'LK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (120, N'Liberia', NULL, N'LR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (121, N'Lesotho', NULL, N'LS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (122, N'Lithuania', NULL, N'LT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (123, N'Luxembourg', NULL, N'LU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (124, N'Latvia', NULL, N'LV', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (125, N'Libya', NULL, N'LY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (126, N'Morocco', NULL, N'MA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (127, N'Monaco', NULL, N'MC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (128, N'Moldova', NULL, N'MD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (129, N'Montenegro', NULL, N'ME', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (130, N'Madagascar', NULL, N'MG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (131, N'Marshall Islands', NULL, N'MH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (132, N'Macedonia', NULL, N'MK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (133, N'Mali', NULL, N'ML', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (134, N'Myanmar', NULL, N'MM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (135, N'Mongolia', NULL, N'MN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (136, N'Macao', NULL, N'MO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (137, N'Northern Mariana Islands', NULL, N'MP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (138, N'Martinique', NULL, N'MQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (139, N'Mauritania', NULL, N'MR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (140, N'Montserrat', NULL, N'MS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (141, N'Mauritius', NULL, N'MU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (142, N'Maldives', NULL, N'MV', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (143, N'Malawi', NULL, N'MW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (144, N'Mexico', NULL, N'MX', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (145, N'Malaysia', NULL, N'MY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (146, N'Mozambique', NULL, N'MZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (147, N'Namibia', NULL, N'NA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (148, N'New Caledonia', NULL, N'NC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (149, N'Niger', NULL, N'NE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (150, N'Nigeria', NULL, N'NG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (151, N'Nicaragua', NULL, N'NI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (152, N'Netherlands', NULL, N'NL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (153, N'Norway', NULL, N'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (154, N'Nepal', NULL, N'NP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (155, N'Nauru', NULL, N'NR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (156, N'New Zealand', NULL, N'NZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (157, N'Oman', NULL, N'OM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (158, N'Panama', NULL, N'PA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (159, N'Peru', NULL, N'PE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (160, N'French Polynesia', NULL, N'PF', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (161, N'Papua New Guinea', NULL, N'PG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (162, N'Philippines', NULL, N'PH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (163, N'Pakistan', NULL, N'PK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (164, N'Poland', NULL, N'PL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (165, N'Saint Pierre And Miquelon', NULL, N'PM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (166, N'Puerto Rico', NULL, N'PR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (167, N'Palestinian Territory', NULL, N'PS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (168, N'Portugal', NULL, N'PT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (169, N'Palau', NULL, N'PW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (170, N'Paraguay', NULL, N'PY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (171, N'Qatar', NULL, N'QA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (172, N'Reunion', NULL, N'RE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (173, N'Romania', NULL, N'RO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (174, N'Serbia', NULL, N'RS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (175, N'Russia', NULL, N'RU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (176, N'Rwanda', NULL, N'RW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (177, N'Saudi Arabia', NULL, N'SA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (178, N'Solomon Islands', NULL, N'SB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (179, N'Seychelles', NULL, N'SC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (180, N'Sudan', NULL, N'SD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (181, N'Sweden', NULL, N'SE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (182, N'Singapore', NULL, N'SG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (183, N'Saint Helena', NULL, N'SH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (184, N'Slovenia', NULL, N'SI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (185, N'Svalbard And Jan Mayen', NULL, N'SJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (186, N'Slovakia', NULL, N'SK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (187, N'Sierra Leone', NULL, N'SL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (188, N'San Marino', NULL, N'SM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (189, N'Senegal', NULL, N'SN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (190, N'Somalia', NULL, N'SO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (191, N'Suriname', NULL, N'SR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (192, N'South Sudan', NULL, N'SS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (193, N'Sao Tome And Principe', NULL, N'ST', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (194, N'El Salvador', NULL, N'SV', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (195, N'Syria', NULL, N'SY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (196, N'Swaziland', NULL, N'SZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (197, N'Chad', NULL, N'TD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (198, N'French Southern Territories', NULL, N'TF', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (199, N'Togo', NULL, N'TG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (200, N'Thailand', NULL, N'TH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (201, N'Tajikistan', NULL, N'TJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (202, N'Tokelau', NULL, N'TK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (203, N'East Timor', NULL, N'TL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (204, N'Turkmenistan', NULL, N'TM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (205, N'Tunisia', NULL, N'TN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (206, N'Tonga', NULL, N'TO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (207, N'Turkey', NULL, N'TR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (208, N'Trinidad And Tobago', NULL, N'TT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (209, N'Tuvalu', NULL, N'TV', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (210, N'Taiwan', NULL, N'TW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (211, N'Tanzania', NULL, N'TZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (212, N'Ukraine', NULL, N'UA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (213, N'Uganda', NULL, N'UG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (214, N'United States Minor Outlying Islands', NULL, N'UM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (215, N'United States', NULL, N'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (216, N'Uruguay', NULL, N'UY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (217, N'Uzbekistan', NULL, N'UZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (218, N'Saint Vincent And The Grenadines', NULL, N'VC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (219, N'Venezuela', NULL, N'VE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (220, N'U.S. Virgin Islands', NULL, N'VI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (221, N'Vietnam', NULL, N'VN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (222, N'Vanuatu', NULL, N'VU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (223, N'Wallis And Futuna', NULL, N'WF', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (224, N'Samoa', NULL, N'WS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (225, N'Kosovo', NULL, N'XK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (226, N'Yemen', NULL, N'YE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (227, N'Mayotte', NULL, N'YT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (228, N'South Africa', NULL, N'ZA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (229, N'Zambia', NULL, N'ZM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (230, N'Zimbabwe', NULL, N'ZW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (231, N'UAE', NULL, N'UAE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName], [ISO3], [ISO], [NameCode], [PhoneCode], [SortOrder], [FlagIcon], [CreatedDate], [CreadtedBy], [UpdatedDate], [UpdatedBy]) VALUES (232, N'USA', NULL, N'USA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
SET IDENTITY_INSERT [dbo].[CR_List] ON 
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (1, 1, N'Married', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (2, 1, N'UnMarried', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (3, 1, N'Widower', N'male', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (4, 1, N'Widow', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (5, 1, N'Divorce', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (6, 2, N'Uneducated', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (7, 2, N'Islamic Education', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (8, 2, N'Primary', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (9, 2, N'Middel', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (10, 2, N'HighSchool-10 grades', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (11, 2, N'HighSchool-21 grades', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (12, 2, N'Diploma', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (13, 2, N'Bachelors', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (14, 2, N'Masters', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (15, 2, N'PhD', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (16, 3, N'Normal', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (17, 3, N'Physicaly Challenged', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (18, 3, N'Disabled', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (19, 3, N'Overweight', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (20, 3, N'Overage', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (21, 5, N'Orphan', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (22, 5, N'Poor', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (23, 5, N'Stigmatized by Society', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (24, 6, N'Slim', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (25, 6, N'Athletic', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (26, 6, N'Average', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (27, 6, N'Heavy', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (28, 6, N'Overage', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (29, 7, N'Fair', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (30, 7, N'VeryFair', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (31, 7, N'Wheatish', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (32, 7, N'Wheatish Brown', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (33, 7, N'Dark', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (34, 8, N'Orthodox', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (35, 8, N'Traditional', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (36, 8, N'Moderate', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (37, 8, N'Liberal Brown', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (38, 9, N'Joint Family', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (39, 9, N'Nuclear Family', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (40, 10, N'Middle Class', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (41, 10, N'Upper Middle Class', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (42, 10, N'Rich/Affluent', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (43, 11, N'Islam', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (44, 11, N'Christianity', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (46, 13, N'Government', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (47, 13, N'Defense', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (48, 13, N'Private', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (49, 13, N'Business', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (50, 13, N'Self Employed', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (51, 13, N'Not Working', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (10046, 10012, N'Sunni', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (10047, 10012, N'Dubandi', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (10048, 10012, N'AhalHadith', N'both', 1, 1)
GO
INSERT [dbo].[CR_List] ([ID], [ListTypeID], [Name], [DisplayFor], [SortOrder], [IsActive]) VALUES (10049, 10012, N'Shia', N'both', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[CR_List] OFF
GO
SET IDENTITY_INSERT [dbo].[CR_ListType] ON 
GO
INSERT [dbo].[CR_ListType] ([ID], [Name], [Title], [Description], [IsSystem], [IsActive]) VALUES (1, N'MaritalStatus', N'Marital Status', N'Test', 0, 1)
GO
INSERT [dbo].[CR_ListType] ([ID], [Name], [Title], [Description], [IsSystem], [IsActive]) VALUES (2, N'EducationLevels', N'Education Levels', N'test', 0, 1)
GO
INSERT [dbo].[CR_ListType] ([ID], [Name], [Title], [Description], [IsSystem], [IsActive]) VALUES (3, N'PhysicalStatus', N'Physical Status', N'test', 0, 1)
GO
INSERT [dbo].[CR_ListType] ([ID], [Name], [Title], [Description], [IsSystem], [IsActive]) VALUES (4, N'SocialStatus', N'Social Status', N'test', 0, 1)
GO
INSERT [dbo].[CR_ListType] ([ID], [Name], [Title], [Description], [IsSystem], [IsActive]) VALUES (5, N'Others', N'Others', N'test', 0, 1)
GO
INSERT [dbo].[CR_ListType] ([ID], [Name], [Title], [Description], [IsSystem], [IsActive]) VALUES (6, N'BodyType', N'Body Type', N'test', 0, 1)
GO
INSERT [dbo].[CR_ListType] ([ID], [Name], [Title], [Description], [IsSystem], [IsActive]) VALUES (7, N'Complexion', N'Complexion', N'test', 0, 1)
GO
INSERT [dbo].[CR_ListType] ([ID], [Name], [Title], [Description], [IsSystem], [IsActive]) VALUES (8, N'FamilyValue', N'Family Value', N'test', 0, 1)
GO
INSERT [dbo].[CR_ListType] ([ID], [Name], [Title], [Description], [IsSystem], [IsActive]) VALUES (9, N'FamilyType', N'Family Type', N'test', 0, 1)
GO
INSERT [dbo].[CR_ListType] ([ID], [Name], [Title], [Description], [IsSystem], [IsActive]) VALUES (10, N'FamilyStatus', N'Family Value', N'Status', 0, 1)
GO
INSERT [dbo].[CR_ListType] ([ID], [Name], [Title], [Description], [IsSystem], [IsActive]) VALUES (11, N'Religion', N'Religion', N'Status', 0, 1)
GO
INSERT [dbo].[CR_ListType] ([ID], [Name], [Title], [Description], [IsSystem], [IsActive]) VALUES (12, N'Profession', N'Profession', N'test', 0, 1)
GO
INSERT [dbo].[CR_ListType] ([ID], [Name], [Title], [Description], [IsSystem], [IsActive]) VALUES (13, N'Employment', N'Employment', N'test', 0, 1)
GO
INSERT [dbo].[CR_ListType] ([ID], [Name], [Title], [Description], [IsSystem], [IsActive]) VALUES (10012, N'Sect', N'Sect', N'test', 0, 1)
GO
SET IDENTITY_INSERT [dbo].[CR_ListType] OFF
GO
SET IDENTITY_INSERT [dbo].[Divorce] ON 
GO
INSERT [dbo].[Divorce] ([ID], [MemberId], [DivorceReason], [DivorceDate], [DivorceStatus], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, 10045, N'test', CAST(N'2022-10-10T00:00:00.000' AS DateTime), N'Yes', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Divorce] ([ID], [MemberId], [DivorceReason], [DivorceDate], [DivorceStatus], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, 44, NULL, CAST(N'2023-02-16T00:00:00.000' AS DateTime), N'Yes', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Divorce] OFF
GO
SET IDENTITY_INSERT [dbo].[DivorcePolicy] ON 
GO
INSERT [dbo].[DivorcePolicy] ([ID], [MemberId], [dropdownOption], [Amountcheckbox], [AmountFrom], [AmountTo], [IncomeCurrency], [HouseCheckBox], [HouseDetail], [MiscellaneousCheckbox], [MiscellaneousDetail], [ThreeDivorcePolicy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, 44, N'Divorce', N'true', 40000, 50000, N'PKR (RS)', N'true', N'ajwa', N'true', N'jewells and monthly expenses', 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[DivorcePolicy] ([ID], [MemberId], [dropdownOption], [Amountcheckbox], [AmountFrom], [AmountTo], [IncomeCurrency], [HouseCheckBox], [HouseDetail], [MiscellaneousCheckbox], [MiscellaneousDetail], [ThreeDivorcePolicy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, 44, N'Khula', N'true', 40000, 60000, N'USD ($)', N'true', N'Big house', N'true', N'Other things', NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[DivorcePolicy] OFF
GO
SET IDENTITY_INSERT [dbo].[DocDropdownList] ON 
GO
INSERT [dbo].[DocDropdownList] ([DocTypeID], [DocName]) VALUES (1, N'ID Card Front')
GO
INSERT [dbo].[DocDropdownList] ([DocTypeID], [DocName]) VALUES (2, N'ID Card Back')
GO
INSERT [dbo].[DocDropdownList] ([DocTypeID], [DocName]) VALUES (3, N'Motivational Letter')
GO
INSERT [dbo].[DocDropdownList] ([DocTypeID], [DocName]) VALUES (4, N'Visa')
GO
INSERT [dbo].[DocDropdownList] ([DocTypeID], [DocName]) VALUES (5, N'Misc')
GO
SET IDENTITY_INSERT [dbo].[DocDropdownList] OFF
GO
SET IDENTITY_INSERT [dbo].[EductionLevels] ON 
GO
INSERT [dbo].[EductionLevels] ([ID], [Name], [UserFor], [CategoryId]) VALUES (1, N'Uneducated', N'both', 2)
GO
INSERT [dbo].[EductionLevels] ([ID], [Name], [UserFor], [CategoryId]) VALUES (2, N'Islamic Education', N'both', 2)
GO
INSERT [dbo].[EductionLevels] ([ID], [Name], [UserFor], [CategoryId]) VALUES (3, N'Primary', N'both', 2)
GO
INSERT [dbo].[EductionLevels] ([ID], [Name], [UserFor], [CategoryId]) VALUES (4, N'Middle', N'both', 2)
GO
INSERT [dbo].[EductionLevels] ([ID], [Name], [UserFor], [CategoryId]) VALUES (5, N'High School-10 grades', N'both', 2)
GO
INSERT [dbo].[EductionLevels] ([ID], [Name], [UserFor], [CategoryId]) VALUES (6, N'High School-21 grades', N'both', 2)
GO
INSERT [dbo].[EductionLevels] ([ID], [Name], [UserFor], [CategoryId]) VALUES (7, N'Diploma', N'both', 2)
GO
INSERT [dbo].[EductionLevels] ([ID], [Name], [UserFor], [CategoryId]) VALUES (8, N'Bachelors', N'both', 2)
GO
INSERT [dbo].[EductionLevels] ([ID], [Name], [UserFor], [CategoryId]) VALUES (9, N'Masters', N'both', 2)
GO
INSERT [dbo].[EductionLevels] ([ID], [Name], [UserFor], [CategoryId]) VALUES (10, N'PhD', N'both', 2)
GO
INSERT [dbo].[EductionLevels] ([ID], [Name], [UserFor], [CategoryId]) VALUES (1004, NULL, N'both', NULL)
GO
SET IDENTITY_INSERT [dbo].[EductionLevels] OFF
GO
SET IDENTITY_INSERT [dbo].[EmailSMSTemplate] ON 
GO
INSERT [dbo].[EmailSMSTemplate] ([Id], [Type], [Name], [CC], [BCC], [Subject], [MessageBody], [IsActive], [CreatedDate], [CreatedBy], [UpdatedBy], [UpdatedDate]) VALUES (2, N'Email', N'PasswordRequest', NULL, NULL, N'LSA Password Request Manager', N'
	
		<title></title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">

		<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
	
	
		<div style="text-align: left;    background: #f5f5f5;padding: 15px 0;border-bottom: 1px solid #e8e8e8;">
				<div style="width: 90%;margin: auto;">		
					<img src="http://{#!BaseUrl!#}/Assets/img/logo.png" alt="">
				</div>	
			</div>
		<div style="width: 90%;margin: auto;">
			<div>
				<h4 style="font-family: ''Open Sans'', sans-serif;color: #626367;">Dear {#!Name!#},</h4>
				<p>
				GnNews Portal Admin has invited you to join GnNews Portal – your team’s portal that would enhance internal cooperation. Your portal address is <a href="http://{#!BaseUrl!#}">http://{#!BaseUrl!#}</a> (adding this link to your bookmarks is a good idea, you are most likely to get to use it a lot).
				</p>
				
				<p style="margin-top: 20px;margin-bottom: 0;">You can accept the invitation by following the link below.</p>
				<a href="{#!RequestLink!#}">Click Here</a> to join the portal
				<p style="margin-top: 20px;margin-bottom: 0px">Thank you!</p>
				<p style="margin-top: 2px;">Team GnNews</p>
			</div>
			<div style="text-align: center;background: #f5f5f5;padding: 15px 0;font-size: 13px;position: absolute;bottom: 0;left: 0;right: 0;margin: 0 -54px;">
				<p style="margin:0;">© 2019 GnNews Management System Inc.</p>
				<p style="margin-top: 7px;margin-bottom: 0;">103 Sherbrooke St, West, Suit 100, California, America H3A 2RH</p>
			</div>
		</div>	
	', 1, CAST(N'2020-04-12T11:50:00.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[EmailSMSTemplate] ([Id], [Type], [Name], [CC], [BCC], [Subject], [MessageBody], [IsActive], [CreatedDate], [CreatedBy], [UpdatedBy], [UpdatedDate]) VALUES (3, N'Email', N'Reset Password', NULL, NULL, N'LSA Reset Password', N'<title>Lsa Reset Password</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">

  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
 
 
  <div style="text-align: left;    background: #f5f5f5;padding: 15px 0;border-bottom: 1px solid #e8e8e8;">
    <div style="width: 90%;margin: auto;">  
     <img src="{#!BaseUrl!#}/Content/Images/LSA.png" alt="">
    </div> 
   </div>
  <div style="width: 90%;margin: auto;">
   <div>
    <h4 style="font-family: ''Open Sans'', sans-serif;color: #626367;">Dear {#!Name!#},</h4>
    <p>
    There has been a request to change your password for <a href="{#!BaseUrl!#}">{#!SiteName!#}</a>.
    </p>
    

    <p style="margin-top: 20px;margin-bottom: 0;">Please click the link below to change your password:</p>
    <a href="{#!RequestLink!#}">Change Password</a> 
    <p style="margin-top: 20px;margin-bottom: 0px">Thank you!</p>
    <p style="margin-top: 2px;">Team LSA</p>
   </div>
   <div style="text-align: center;background: #f5f5f5;padding: 15px 0;font-size: 13px;position: absolute;bottom: 0;left: 0;right: 0;margin: 0 -54px;">
    <p style="margin:0;">© {#!ActiveYear!#} LSA</p>
   </div>
  </div>', 1, CAST(N'2020-04-12T11:50:00.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[EmailSMSTemplate] ([Id], [Type], [Name], [CC], [BCC], [Subject], [MessageBody], [IsActive], [CreatedDate], [CreatedBy], [UpdatedBy], [UpdatedDate]) VALUES (4, N'Email', N'AccountActivationRequest', NULL, NULL, N'Marryme Account Activation Request', N'<title></title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">

		<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
	
	
		<div style="text-align: left;    background: #f5f5f5;padding: 15px 0;border-bottom: 1px solid #e8e8e8;">
				<div style="width: 90%;margin: auto;">		
					<img src="http:///Assets/img/logo.png" alt="">
				</div>	
			</div>
		<div style="width: 90%;margin: auto;">
			<div>
				<h4 style="font-family: ''Open Sans'', sans-serif;color: #626367;">Dear Muhammad Awais,</h4>
				<p>
					<h3>Congratulations:</h3> You have successfully created your account.
				</p>
				
				<p style="margin-top: 20px;margin-bottom: 0;">You can Activate your account by clicking the following the link below.</p>
				<a href="/Account/ConfirmEmail?Email=awais.ramzan.ar@gmail.com&Code=8BGlDG1oYOguxh2y">Click Here</a> To activate your account.
				<p style="margin-top: 20px;margin-bottom: 0px">Thank you!</p>
				<p style="margin-top: 2px;">Team Marryme</p>
			</div>
			<div style="text-align: center;background: #f5f5f5;padding: 15px 0;font-size: 13px;position: absolute;bottom: 0;left: 0;right: 0;margin: 0 -54px;">
				<p style="margin:0;">© 2022 Marryme Management System Inc.</p>
				<p style="margin-top: 7px;margin-bottom: 0;">Address here</p>
			</div>
		</div>
', 1, CAST(N'2020-07-14T11:50:00.000' AS DateTime), 1, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[EmailSMSTemplate] OFF
GO
SET IDENTITY_INSERT [dbo].[ErrorLog] ON 
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (1, 0, N'Object reference not set to an instance of an object.', N'', CAST(N'2022-05-21T14:09:48.547' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (2, 0, N'Object reference not set to an instance of an object.', N'', CAST(N'2022-05-21T14:14:31.943' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (3, 0, N'Object reference not set to an instance of an object.', N'', CAST(N'2022-05-21T14:17:58.070' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4, 0, N'Object reference not set to an instance of an object.', N'', CAST(N'2022-05-21T14:23:15.023' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (5, 0, N'Object reference not set to an instance of an object.', N'', CAST(N'2022-05-21T14:25:10.477' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (6, 0, N'Object reference not set to an instance of an object.', N'', CAST(N'2022-05-21T14:33:46.020' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (7, 0, N'Object reference not set to an instance of an object.', N'', CAST(N'2022-05-21T16:28:29.853' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8, 0, N'Object reference not set to an instance of an object.', N'', CAST(N'2022-05-22T16:52:27.300' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (1001, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-06-07T11:52:33.630' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (1002, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-06-07T12:14:34.780' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (1003, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-06-07T13:15:13.290' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (1004, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-06-07T14:40:11.343' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (1005, 0, N'Invalid length for a Base-64 char array or string.', N'Client/MemberManger/PersonalDetail', CAST(N'2022-06-07T14:41:39.023' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (1006, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-06-07T14:42:13.013' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (1007, 0, N'Invalid length for a Base-64 char array or string.', N'Client/MemberManger/PersonalDetail', CAST(N'2022-06-07T14:54:13.080' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (1008, 0, N'Invalid length for a Base-64 char array or string.', N'Client/MemberManger/PersonalDetail', CAST(N'2022-06-07T15:15:21.220' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (1009, 0, N'Invalid length for a Base-64 char array or string.', N'Client/MemberManger/PersonalDetail', CAST(N'2022-06-07T15:18:09.513' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (1010, 0, N'Invalid length for a Base-64 char array or string.', N'Client/MemberManger/PersonalDetail', CAST(N'2022-06-07T15:18:53.760' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (1011, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-06-07T16:21:03.047' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (1012, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-06-08T12:44:08.423' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (1013, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-06-08T12:47:00.020' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (1014, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-06-08T13:11:46.963' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (1015, 0, N'The ''CountryID'' property on ''FetchProfileLocationDetail_Result'' could not be set to a ''System.Int32'' value. You must set this property to a non-null value of type ''System.Int64''. ', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2022-06-08T13:21:29.513' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (1016, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-06-08T15:37:16.963' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (1017, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-06-08T15:37:58.997' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (1018, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-06-08T15:43:04.580' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (1019, 0, N'Invalid length for a Base-64 char array or string.', N'Client/MemberManger/PersonalDetail', CAST(N'2022-06-08T15:54:13.257' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (1020, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-06-08T15:54:31.633' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (1021, 0, N'Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: startIndex', N'Client/MemberManger/PersonalDetail', CAST(N'2022-06-08T16:06:31.670' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (1022, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-06-08T16:08:01.040' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (1023, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-06-08T16:10:35.973' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (1024, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-06-08T16:12:18.507' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (1025, 0, N'Invalid length for a Base-64 char array or string.', N'Client/MemberManger/PersonalDetail', CAST(N'2022-06-08T16:25:10.157' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (2001, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-06-09T13:24:40.897' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (2002, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-06-09T13:24:46.797' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (2003, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2022-06-09T13:24:40.903' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (2004, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-06-09T13:24:54.163' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (2005, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-06-09T13:25:51.677' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (2006, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2022-06-09T13:25:51.677' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (2007, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-06-09T13:25:52.827' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (2008, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-06-09T13:25:54.020' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (2009, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-06-09T13:27:26.923' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (2010, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2022-06-09T13:27:32.237' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (2011, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-06-09T13:27:37.780' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (2012, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-06-09T13:27:43.823' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (3001, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-06-11T16:52:37.850' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (3002, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-06-11T17:09:45.050' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4001, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-02T10:54:07.933' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4002, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-02T10:54:38.800' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4003, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-02T11:15:09.490' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4004, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-02T11:15:35.010' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4005, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-02T11:16:29.397' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4006, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-02T11:18:26.620' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4007, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-02T11:18:41.677' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4008, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-02T11:19:30.923' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4009, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-02T11:19:59.423' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4010, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-02T11:22:42.253' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4011, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-02T11:23:26.370' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4012, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-02T11:25:38.893' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4013, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-02T11:27:02.820' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4014, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-02T11:28:58.843' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4015, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-02T12:47:58.247' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4016, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-02T12:48:09.563' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4017, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-02T12:51:53.703' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4018, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-02T12:52:03.703' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4019, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-02T12:52:50.750' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4020, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-02T12:54:19.403' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4021, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-02T12:54:41.533' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4022, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-02T16:11:29.343' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4023, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-02T16:12:58.187' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4024, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-02T16:14:43.373' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4025, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-02T16:22:53.303' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4026, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-03T12:05:14.383' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4027, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-03T15:12:58.777' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4028, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-03T15:19:24.357' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4029, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-03T15:20:10.037' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4030, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-03T15:20:46.383' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4031, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-03T15:21:40.387' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4032, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-03T15:22:26.827' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4033, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-03T15:59:14.770' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4034, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-03T15:59:41.857' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4035, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-03T16:05:04.257' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4036, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-03T16:08:18.223' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4037, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-04T11:56:42.160' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4038, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-04T11:58:19.077' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4039, 0, N'The context cannot be used while the model is being created. This exception may be thrown if the context is used inside the OnModelCreating method or if the same context instance is accessed by multiple threads concurrently. Note that instance members of DbContext and related classes are not guaranteed to be thread safe.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-05T04:56:28.557' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4040, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-05T04:57:11.320' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4041, 0, N'The context cannot be used while the model is being created. This exception may be thrown if the context is used inside the OnModelCreating method or if the same context instance is accessed by multiple threads concurrently. Note that instance members of DbContext and related classes are not guaranteed to be thread safe.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-05T13:47:06.637' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4042, 0, N'The context cannot be used while the model is being created. This exception may be thrown if the context is used inside the OnModelCreating method or if the same context instance is accessed by multiple threads concurrently. Note that instance members of DbContext and related classes are not guaranteed to be thread safe.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-07-05T15:29:27.203' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4043, 0, N'Could not find a part of the path ''D:\Awais Related Pro Data\EastFlicker\TFS_Projects\MarryMeWeb\Marryme\Marryme.Admin\Images\AppSettingLogo\1\Images\AppSettingLogo\1\02-11-2020-05-486373987490990403250.png''.', N'BLL/Extension/UploadFile', CAST(N'2022-08-01T14:29:44.617' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4044, 0, N'Object reference not set to an instance of an object.', N'AcceptanceManager/CriteriaQuestion', CAST(N'2022-08-07T15:07:39.590' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4045, 0, N'Object reference not set to an instance of an object.', N'AcceptanceManager/CriteriaQuestion', CAST(N'2022-08-07T15:44:59.303' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4046, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-08-31T14:18:31.413' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4047, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2022-08-31T14:18:31.043' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4048, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-08-31T14:18:31.013' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4049, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-08-31T14:18:31.553' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4050, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2022-08-31T14:44:15.647' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4051, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-08-31T14:44:15.630' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4052, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-08-31T14:44:15.853' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4053, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-08-31T14:44:15.853' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4054, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-08-31T14:45:31.510' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4055, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2022-08-31T14:45:31.567' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4056, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-08-31T14:45:31.613' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4057, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-08-31T14:45:31.670' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4058, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-08-31T14:47:28.717' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4059, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2022-08-31T14:47:28.767' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4060, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-08-31T14:47:28.830' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4061, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-08-31T14:47:28.837' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4062, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-08-31T14:48:33.697' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4063, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2022-08-31T14:48:33.710' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4064, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-08-31T14:48:33.807' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4065, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-08-31T14:48:33.817' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4066, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-08-31T14:48:53.427' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4067, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2022-08-31T14:48:53.450' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4068, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-08-31T14:48:53.547' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4069, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-08-31T14:48:53.547' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4070, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-08-31T14:49:06.723' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4071, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2022-08-31T14:49:06.827' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4072, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-08-31T14:49:07.047' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4073, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-08-31T14:49:07.053' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4074, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-08-31T14:49:48.717' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4075, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2022-08-31T14:49:48.747' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4076, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-08-31T14:49:48.827' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4077, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-08-31T14:49:48.843' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4078, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-08-31T14:50:10.170' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4079, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2022-08-31T14:50:10.227' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4080, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-08-31T14:50:10.363' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4081, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-08-31T14:50:10.390' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4082, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-08-31T14:50:33.663' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4083, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2022-08-31T14:50:33.687' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4084, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-08-31T14:50:33.790' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4085, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-08-31T14:50:33.830' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4086, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-08-31T14:55:35.057' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4087, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2022-08-31T14:55:35.073' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4088, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-08-31T14:55:35.170' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4089, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-08-31T14:55:35.187' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4090, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-08-31T14:57:43.967' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4091, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2022-08-31T14:57:43.967' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4092, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-08-31T14:57:44.063' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4093, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-08-31T14:57:44.063' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4094, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-08-31T14:59:40.350' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4095, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2022-08-31T14:59:40.470' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4096, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-08-31T14:59:40.627' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4097, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-08-31T14:59:40.617' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4098, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-08-31T15:00:52.610' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4099, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2022-08-31T15:00:52.627' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4100, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-08-31T15:00:52.707' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4101, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-08-31T15:00:52.723' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4102, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-08-31T15:02:03.960' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4103, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2022-08-31T15:02:03.970' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4104, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-08-31T15:02:04.057' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4105, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-08-31T15:02:04.057' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4106, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-08-31T15:05:26.200' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4107, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2022-08-31T15:05:26.207' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4108, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-08-31T15:05:26.323' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4109, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-08-31T15:05:26.430' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4110, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-08-31T15:10:32.210' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4111, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2022-08-31T15:10:32.217' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4112, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-08-31T15:10:32.303' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4113, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-08-31T15:10:32.310' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4114, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-08-31T15:16:10.623' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4115, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2022-08-31T15:16:10.653' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4116, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-08-31T15:16:10.750' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4117, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-08-31T15:16:10.750' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4118, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-08-31T15:16:21.463' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4119, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2022-08-31T15:16:21.480' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4120, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-08-31T15:16:21.567' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4121, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-08-31T15:16:21.577' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4122, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-08-31T15:16:46.887' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4123, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2022-08-31T15:16:46.903' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4124, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-08-31T15:16:46.973' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4125, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-08-31T15:16:46.990' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4126, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-08-31T15:17:56.313' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4127, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2022-08-31T15:17:56.420' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4128, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-08-31T15:17:56.530' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4129, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-08-31T15:17:56.547' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4130, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-08-31T15:23:54.997' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4131, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2022-08-31T15:23:55.003' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4132, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-08-31T15:23:55.083' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4133, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-08-31T15:23:55.100' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4134, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-08-31T15:25:53.250' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4135, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-08-31T15:25:53.260' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4136, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2022-08-31T15:25:53.250' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4137, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-08-31T15:25:54.190' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4138, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-08-31T15:26:00.847' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4139, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2022-08-31T15:26:00.873' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4140, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-08-31T15:26:00.960' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4141, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-08-31T15:26:00.977' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4142, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-08-31T15:27:31.877' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4143, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2022-08-31T15:27:31.893' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4144, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-08-31T15:27:32.020' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4145, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-08-31T15:27:32.020' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4146, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-08-31T15:29:43.443' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4147, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2022-08-31T15:29:43.457' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4148, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-08-31T15:29:43.553' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4149, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-08-31T15:29:43.583' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4150, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-08-31T15:30:12.160' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4151, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-08-31T15:30:12.233' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4152, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-08-31T15:30:12.250' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4153, 0, N'The context cannot be used while the model is being created. This exception may be thrown if the context is used inside the OnModelCreating method or if the same context instance is accessed by multiple threads concurrently. Note that instance members of DbContext and related classes are not guaranteed to be thread safe.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-08-31T15:56:23.940' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4154, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-08-31T16:11:13.980' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4155, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2022-08-31T16:11:13.977' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4156, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-08-31T16:11:14.833' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4157, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-08-31T16:11:14.963' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4158, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-08-31T16:11:25.043' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4159, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2022-08-31T16:11:25.067' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4160, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-08-31T16:11:25.153' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4161, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-08-31T16:11:25.177' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4162, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2022-09-04T13:13:49.290' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4163, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-09-04T13:14:04.870' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4164, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-09-04T13:14:12.397' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4165, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-09-04T13:14:33.887' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4166, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2022-09-04T13:14:51.937' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4167, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-09-04T13:14:54.887' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4168, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-09-04T13:14:59.083' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4169, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-09-04T13:15:09.517' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4170, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-09-04T16:08:45.787' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4171, 0, N'Object reference not set to an instance of an object.', N'Client/AccountManager/EmailConfirmation', CAST(N'2022-09-05T17:50:47.363' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4172, 0, N'Object reference not set to an instance of an object.', N'Client/AccountManager/EmailConfirmation', CAST(N'2022-09-05T17:52:19.363' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4173, 0, N'Object reference not set to an instance of an object.', N'Client/AccountManager/EmailConfirmation', CAST(N'2022-09-05T17:55:00.330' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4174, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-09-06T13:49:36.427' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4175, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-09-07T16:31:02.870' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4176, 0, N'LINQ to Entities does not recognize the method ''Int32 ToInt32(System.String)'' method, and this method cannot be translated into a store expression.', N'Client/MemberManger/DocumentUpload', CAST(N'2022-09-13T17:08:29.443' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (4177, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/DocumentUpload', CAST(N'2022-09-13T17:11:42.477' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (5176, 0, N'Value cannot be null.
Parameter name: entity', N'MarriagePolicyManager/Policy', CAST(N'2022-09-18T16:43:11.383' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (6176, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-10-02T15:29:58.000' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (6177, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2022-10-02T15:30:00.673' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (6178, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-10-02T15:30:04.197' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (6179, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-10-02T15:30:06.650' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (6180, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-10-02T15:48:25.903' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (6181, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2022-10-02T15:48:26.867' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (6182, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-10-02T15:48:28.230' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (6183, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-10-02T15:48:30.420' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (6184, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2022-10-04T13:59:58.483' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (6185, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-10-04T14:00:00.070' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (6186, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-10-04T14:00:03.253' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (6187, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2022-10-04T16:28:25.853' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (6188, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2022-10-04T16:28:27.390' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (6189, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-10-04T16:28:29.557' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (7176, 0, N'Object reference not set to an instance of an object.', N'ProfileRequirementManager/Facilities', CAST(N'2022-10-06T16:58:43.423' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (7177, 0, N'An item with the same key has already been added.', N'ProfileRequirementManager/Facilities', CAST(N'2022-10-06T16:52:44.620' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (7178, 0, N'Object reference not set to an instance of an object.', N'ProfileRequirementManager/Facilities', CAST(N'2022-10-06T17:01:54.867' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (7179, 0, N'Object reference not set to an instance of an object.', N'ProfileRequirementManager/Facilities', CAST(N'2022-10-06T17:06:36.093' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (7180, 0, N'Object reference not set to an instance of an object.', N'ProfileRequirementManager/Facilities', CAST(N'2022-10-06T17:21:21.347' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (7181, 0, N'The context cannot be used while the model is being created. This exception may be thrown if the context is used inside the OnModelCreating method or if the same context instance is accessed by multiple threads concurrently. Note that instance members of DbContext and related classes are not guaranteed to be thread safe.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-10-07T17:46:20.440' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (7182, 0, N'Object reference not set to an instance of an object.', N'ProfileRequirementManager/Facilities', CAST(N'2022-10-08T13:43:41.697' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (7183, 0, N'Object reference not set to an instance of an object.', N'ProfileRequirementManager/Facilities', CAST(N'2022-10-08T14:44:11.457' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (7184, 0, N'Object reference not set to an instance of an object.', N'ProfileRequirementManager/Facilities', CAST(N'2022-10-08T14:59:16.190' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (7185, 0, N'Object reference not set to an instance of an object.', N'ProfileRequirementManager/Facilities', CAST(N'2022-10-08T15:20:47.790' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (7186, 0, N'Object reference not set to an instance of an object.', N'ProfileRequirementManager/Facilities', CAST(N'2022-10-08T15:49:15.150' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (7187, 0, N'Index was outside the bounds of the array.', N'ProfileRequirementManager/Facilities', CAST(N'2022-10-08T16:44:05.720' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8181, 0, N'The context cannot be used while the model is being created. This exception may be thrown if the context is used inside the OnModelCreating method or if the same context instance is accessed by multiple threads concurrently. Note that instance members of DbContext and related classes are not guaranteed to be thread safe.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-10-10T13:33:10.460' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8182, 0, N'The context cannot be used while the model is being created. This exception may be thrown if the context is used inside the OnModelCreating method or if the same context instance is accessed by multiple threads concurrently. Note that instance members of DbContext and related classes are not guaranteed to be thread safe.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-10-10T14:44:55.507' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8183, 0, N'The underlying provider failed on Open.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-10-10T16:11:56.903' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8184, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/Facilities', CAST(N'2022-10-10T16:59:39.293' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8185, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/Facilities', CAST(N'2022-10-10T17:01:27.220' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8186, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/Facilities', CAST(N'2022-10-10T17:03:42.407' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8187, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/Facilities', CAST(N'2022-10-10T17:04:49.087' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8188, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/Facilities', CAST(N'2022-10-10T17:05:02.763' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8189, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/Facilities', CAST(N'2022-10-10T17:07:11.783' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8190, 0, N'The context cannot be used while the model is being created. This exception may be thrown if the context is used inside the OnModelCreating method or if the same context instance is accessed by multiple threads concurrently. Note that instance members of DbContext and related classes are not guaranteed to be thread safe.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2022-10-11T12:59:52.603' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8191, 0, N'Could not find a part of the path ''D:\Awais Related Pro Data\EastFlicker\TFS_Projects\MarryMeWeb_New\Marryme\Marryme.WebUI\Images\ProfilePictures\44\Images\ProfilePictures\44\''.', N'BLL/Extension/UploadFile', CAST(N'2022-10-11T13:35:45.773' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8192, 0, N'String was not recognized as a valid DateTime.', N'Client/MemberManger/ProfileRequirement Partnercatagory', CAST(N'2022-10-12T14:28:59.183' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8193, 0, N'String was not recognized as a valid DateTime.', N'Client/MemberManger/ProfileRequirement Partnercatagory', CAST(N'2022-10-12T14:29:41.567' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8194, 0, N'String was not recognized as a valid DateTime.', N'Client/MemberManger/ProfileRequirement Partnercatagory', CAST(N'2022-10-12T14:32:30.493' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8195, 0, N'String was not recognized as a valid DateTime.', N'Client/MemberManger/ProfileRequirement Partnercatagory', CAST(N'2022-10-12T14:42:05.550' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8196, 0, N'String was not recognized as a valid DateTime.', N'Client/MemberManger/ProfileRequirement Partnercatagory', CAST(N'2022-10-12T14:42:25.370' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8197, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-04T15:03:37.623' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8198, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-04T15:03:37.477' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8199, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-04T15:18:47.137' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8200, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-04T15:18:47.367' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8201, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-04T15:19:21.837' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8202, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-04T15:20:59.027' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8203, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-04T15:21:30.637' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8204, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-04T15:21:41.070' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8205, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-04T15:56:37.760' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8206, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-04T15:56:38.237' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8207, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-04T16:02:47.443' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8208, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-04T16:19:46.153' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8209, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-04T16:19:47.010' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8210, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-04T16:36:02.817' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8211, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-04T16:51:40.520' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8212, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-04T16:51:42.000' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8213, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-04T17:05:36.833' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8214, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-04T17:05:36.980' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8215, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-04T17:06:10.043' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8216, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-04T17:06:11.597' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8217, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-04T17:06:41.020' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8218, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-04T17:06:43.107' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8219, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-06T08:11:39.867' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8220, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-06T08:11:42.063' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8221, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-06T08:22:01.357' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8222, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2023-02-06T09:03:56.730' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8223, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2023-02-06T09:04:05.157' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8224, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-06T09:04:09.090' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8225, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2023-02-06T09:04:28.690' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8226, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-06T09:04:37.353' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8227, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2023-02-06T09:29:53.080' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8228, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2023-02-06T09:29:54.373' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8229, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-06T09:30:00.933' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8230, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2023-02-06T09:30:04.997' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (8231, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-06T09:30:10.317' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9223, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-06T09:57:47.000' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9224, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-06T09:57:50.360' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9225, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-06T09:58:06.340' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9226, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2023-02-06T10:24:40.453' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9227, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2023-02-06T10:24:40.473' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9228, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-06T10:24:51.253' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9229, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2023-02-06T10:24:53.253' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9230, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-06T10:25:43.740' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9231, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-06T11:05:38.033' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9232, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-06T11:05:39.620' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9233, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-06T11:12:12.550' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9234, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2023-02-06T11:48:04.037' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9235, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2023-02-06T11:48:05.927' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9236, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-06T11:48:07.890' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9237, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-06T11:48:12.937' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9238, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-06T12:12:39.913' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9239, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-06T12:12:41.023' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9240, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-06T12:15:04.837' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9241, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-06T12:15:08.813' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9242, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-06T12:15:22.650' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9243, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-06T12:15:24.087' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9244, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-06T12:15:39.190' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9245, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2023-02-06T13:07:32.917' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9246, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2023-02-06T13:07:34.213' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9247, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2023-02-06T13:07:41.273' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9248, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2023-02-06T13:08:17.777' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9249, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-06T13:09:38.397' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9250, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2023-02-06T13:09:48.580' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9251, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-06T13:09:52.040' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9252, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2023-02-06T13:09:58.303' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9253, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-06T13:21:28.067' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9254, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2023-02-06T13:22:00.120' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9255, 0, N'Object reference not set to an instance of an object.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-06T13:22:07.877' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9256, 0, N'Object reference not set to an instance of an object.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2023-02-06T13:22:08.923' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9257, 0, N'Object reference not set to an instance of an object.', N'Client/AboutmeManager/GetById', CAST(N'2023-02-06T13:22:10.150' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9258, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-06T13:23:25.270' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9259, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-06T13:24:28.597' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9260, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-06T14:18:47.957' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9261, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-06T14:47:10.187' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9262, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-06T14:47:13.713' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9263, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-06T15:11:11.437' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9264, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-06T16:01:02.947' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9265, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-06T16:32:55.510' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9266, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-06T17:12:49.737' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9267, 0, N'The ''Height'' property on ''FetchProfilePersonalInfo_Result'' could not be set to a ''System.String'' value. You must set this property to a non-null value of type ''System.Int32''. ', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2023-02-06T17:25:36.363' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9268, 0, N'The ''Height'' property on ''FetchProfilePersonalInfo_Result'' could not be set to a ''System.String'' value. You must set this property to a non-null value of type ''System.Int32''. ', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2023-02-06T17:28:49.430' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9269, 0, N'The ''Height'' property on ''FetchProfilePersonalInfo_Result'' could not be set to a ''System.String'' value. You must set this property to a non-null value of type ''System.Int32''. ', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2023-02-06T17:29:58.407' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9270, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-06T17:31:20.723' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9271, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-06T17:31:40.243' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9272, 0, N'The ''Height'' property on ''FetchProfilePersonalInfo_Result'' could not be set to a ''System.String'' value. You must set this property to a non-null value of type ''System.Int32''. ', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2023-02-06T17:31:56.783' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9273, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T08:29:34.977' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9274, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T08:30:19.607' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9275, 0, N'The type ''Edm.Int32'' of the member ''Height'' in the conceptual side type ''MarrymeModel.FetchProfilePersonalInfo_Result'' does not match with the type ''System.String'' of the member ''Height'' on the object side type ''Marryme.DAL.FetchProfilePersonalInfo_Result''.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2023-02-07T08:33:42.013' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9276, 0, N'The type ''Edm.Int32'' of the member ''Height'' in the conceptual side type ''MarrymeModel.FetchProfilePersonalInfo_Result'' does not match with the type ''System.String'' of the member ''Height'' on the object side type ''Marryme.DAL.FetchProfilePersonalInfo_Result''.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2023-02-07T08:34:40.010' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9277, 0, N'The type ''Edm.Int32'' of the member ''Height'' in the conceptual side type ''MarrymeModel.FetchProfilePersonalInfo_Result'' does not match with the type ''System.String'' of the member ''Height'' on the object side type ''Marryme.DAL.FetchProfilePersonalInfo_Result''.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2023-02-07T08:35:17.450' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9278, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T09:40:08.073' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9279, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T09:40:25.777' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9280, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T09:44:18.477' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9281, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T09:56:03.650' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9282, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T10:01:53.907' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9283, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T10:03:25.313' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9284, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T10:04:48.133' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9285, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T10:05:41.007' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9286, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T10:06:15.063' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9287, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T10:10:21.960' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9288, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T10:10:30.613' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9289, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T10:18:43.543' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9290, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T10:18:48.377' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9291, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T10:22:53.063' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9292, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T10:22:59.633' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9293, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T10:31:00.513' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9294, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T10:31:10.650' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9295, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T10:38:39.743' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9296, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T10:38:55.193' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9297, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T10:52:56.307' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9298, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T10:52:59.290' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9299, 0, N'Could not find a part of the path ''D:\TFS\MarryMeWeb_New\Marryme\Marryme.WebUI\Images\ProfilePictures\44\Images\ProfilePictures\44\11-10-2022-13-356380111014579451130.jpg''.', N'BLL/Extension/UploadFile', CAST(N'2023-02-07T11:29:50.503' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9300, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T11:57:58.117' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9301, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T13:16:57.397' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9302, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T13:26:36.623' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9303, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T13:30:34.747' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9304, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T13:30:41.380' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9305, 0, N'Could not find a part of the path ''D:\TFS\MarryMeWeb_New\Marryme\Marryme.WebUI\Images\ProfilePictures\44\Images\ProfilePictures\44\07-02-2023-11-296381138419051718920.png''.', N'BLL/Extension/UploadFile', CAST(N'2023-02-07T14:07:17.790' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9306, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T14:26:50.893' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9307, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T14:40:05.617' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9308, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T14:40:11.693' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9309, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T15:08:37.340' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9310, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T15:12:57.343' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9311, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T15:21:27.157' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9312, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T15:21:35.287' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9313, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T16:02:33.263' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9314, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T16:02:34.797' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9315, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T16:15:12.020' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9316, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T16:20:31.960' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9317, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T16:40:54.677' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9318, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T16:40:57.017' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9319, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T16:41:01.183' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9320, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T16:41:47.580' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9321, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T16:41:53.093' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9322, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T16:41:56.743' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9323, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T16:42:06.640' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9324, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T16:42:07.150' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9325, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T16:42:09.840' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9326, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T16:42:53.150' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9327, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T16:42:56.417' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9328, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T16:42:58.793' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9329, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T16:44:36.070' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9330, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T16:55:04.943' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9331, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T16:55:05.860' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9332, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T16:57:20.120' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9333, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T16:57:23.323' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9334, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T16:57:25.870' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9335, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T17:15:48.090' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9336, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T17:15:48.473' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9337, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T17:17:29.270' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9338, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T17:17:29.793' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9339, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T17:18:14.437' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9340, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T17:18:19.550' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9341, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T17:18:34.560' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9342, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T17:18:35.147' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9343, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T17:18:51.137' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9344, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-07T17:18:51.367' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9345, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T10:28:32.920' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9346, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T10:28:51.267' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9347, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T10:34:50.500' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9348, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T10:34:53.567' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9349, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T10:35:14.037' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9350, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T10:35:15.547' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9351, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T10:37:32.070' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9352, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T10:39:42.917' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9353, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T10:39:50.093' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9354, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T10:39:50.800' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9355, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T10:40:27.737' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9356, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T10:40:28.963' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9357, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T10:47:29.877' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (9358, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T10:47:35.077' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10223, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T10:57:21.800' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10224, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T11:40:13.810' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10225, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T11:40:26.933' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10226, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T11:40:27.380' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10227, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T11:42:31.443' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10228, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T11:42:32.653' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10229, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T11:44:36.907' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10230, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T11:44:37.090' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10231, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T11:46:03.067' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10232, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T11:46:06.190' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10233, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T11:46:41.417' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10234, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T11:46:42.900' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10235, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T11:47:58.570' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10236, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T11:47:58.877' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10237, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T11:48:04.803' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10238, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T11:48:07.353' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10239, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T11:50:56.067' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10240, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T11:50:56.440' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10241, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T12:01:21.423' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10242, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T12:01:21.887' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10243, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T12:07:51.453' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10244, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T12:07:53.887' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10245, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T12:11:56.060' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10246, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T12:16:44.137' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10247, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T12:16:55.437' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10248, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T12:17:46.590' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10249, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T12:27:56.347' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10250, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T12:27:57.217' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10251, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T12:29:06.360' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10252, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T12:29:08.263' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10253, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T12:42:50.977' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10254, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T13:18:12.113' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10255, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T13:53:54.883' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10256, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T14:55:25.173' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10257, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T14:57:22.557' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10258, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T16:00:17.397' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10259, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T16:35:12.890' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10260, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T16:35:13.723' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10261, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T17:06:53.937' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10262, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-08T17:06:57.087' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10263, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-11T07:58:33.503' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10264, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-11T08:00:32.033' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10265, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-11T08:01:37.080' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10266, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-11T08:52:27.467' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10267, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-11T08:52:32.883' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10268, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-11T08:52:45.827' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10269, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-11T08:52:46.297' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10270, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-11T08:52:54.110' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10271, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-11T08:52:57.187' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10272, 0, N'The ''ExsitingWife'' property on ''FetchWifeDetailByMemberId_Result'' could not be set to a ''System.Byte'' value. You must set this property to a non-null value of type ''System.String''. ', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-11T08:58:34.873' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10273, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-11T09:10:24.073' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10274, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-11T09:10:26.723' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10275, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-11T09:17:20.770' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10276, 0, N'The ''ExsitingWife'' property on ''FetchWifeDetailByMemberId_Result'' could not be set to a ''System.Byte'' value. You must set this property to a non-null value of type ''System.String''. ', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-11T09:17:27.603' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10277, 0, N'The ''ExsitingWife'' property on ''FetchWifeDetailByMemberId_Result'' could not be set to a ''System.Byte'' value. You must set this property to a non-null value of type ''System.String''. ', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-11T09:20:10.393' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (10278, 0, N'The ''ExsitingWife'' property on ''FetchWifeDetailByMemberId_Result'' could not be set to a ''System.Byte'' value. You must set this property to a non-null value of type ''System.String''. ', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-11T09:33:05.547' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11266, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-11T10:57:21.760' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11267, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-11T10:59:50.890' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11268, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-11T11:00:11.307' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11269, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-11T11:33:36.680' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11270, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-11T11:36:04.343' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11271, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-11T11:43:39.680' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11272, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-11T12:07:13.160' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11273, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-11T12:08:02.723' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11274, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-11T12:09:18.663' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11275, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-11T12:10:13.287' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11276, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-11T12:16:15.163' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11277, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-11T12:16:18.677' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11278, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-11T13:37:10.070' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11279, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-11T14:57:57.003' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11280, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-11T15:00:18.980' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11281, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-11T15:20:17.057' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11282, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-11T15:21:11.613' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11283, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-11T16:28:42.033' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11284, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-11T16:30:35.647' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11285, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-11T16:30:43.473' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11286, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-11T16:35:24.503' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11287, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-11T16:36:19.160' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11288, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-11T17:00:35.073' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11289, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-11T17:01:24.227' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11290, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-11T17:03:37.547' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11291, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-11T17:03:52.773' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11292, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-11T17:06:03.030' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11293, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-11T17:06:05.517' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11294, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T09:27:30.367' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11295, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T09:36:33.243' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11296, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T09:36:36.530' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11297, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T10:18:22.783' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11298, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T10:20:20.803' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11299, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T10:34:54.347' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11300, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T10:34:58.633' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11301, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T11:00:33.570' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11302, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T11:05:53.173' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11303, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T11:06:03.467' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11304, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T11:07:55.300' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11305, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T11:07:58.110' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11306, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T11:26:06.703' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11307, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T11:26:11.130' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11308, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T11:47:46.857' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11309, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T12:02:40.010' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11310, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T12:03:04.017' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11311, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T12:05:18.287' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11312, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T12:05:26.873' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11313, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T12:06:51.543' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11314, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T12:07:09.950' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11315, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T13:30:00.947' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11316, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T13:30:04.433' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11317, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T13:35:11.623' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11318, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T13:35:48.987' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11319, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T13:47:59.017' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11320, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T13:48:01.817' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11321, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T13:59:46.887' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11322, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T13:59:50.283' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11323, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T14:11:32.817' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11324, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T14:11:37.487' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11325, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T14:11:53.897' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11326, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T14:38:39.140' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11327, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T14:39:57.043' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11328, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T14:40:03.193' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11329, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T14:42:57.610' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11330, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T14:43:01.127' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11331, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T14:45:46.410' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11332, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T14:45:50.617' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11333, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T14:48:02.120' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11334, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T14:48:46.057' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11335, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T14:50:34.577' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11336, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T14:50:35.967' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11337, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T14:51:34.950' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11338, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T14:51:37.757' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11339, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T16:00:27.673' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11340, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T16:00:31.067' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11341, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T16:06:58.013' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11342, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T16:07:00.147' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11343, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T16:54:56.817' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11344, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T16:54:58.610' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11345, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T16:56:59.270' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11346, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-12T16:57:00.630' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11347, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-13T08:56:44.887' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11348, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-13T10:07:06.983' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11349, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-13T10:09:37.773' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11350, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-13T10:09:42.393' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11351, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-13T10:26:16.070' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11352, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-13T10:26:35.577' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11353, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-13T10:33:50.383' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11354, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-13T10:56:48.093' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11355, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-13T11:24:13.913' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11356, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-13T11:52:04.940' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11357, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-13T12:01:09.553' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11358, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-13T12:01:16.087' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11359, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-13T13:27:26.093' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11360, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-13T13:44:44.333' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11361, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-13T14:28:51.877' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11362, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-13T14:28:54.820' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11363, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-13T15:05:46.007' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11364, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-13T15:05:50.650' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11365, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-13T16:11:50.970' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11366, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-13T16:52:05.833' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11367, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-13T16:52:07.570' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11368, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-13T17:00:54.623' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11369, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-13T17:00:55.060' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11370, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-13T17:04:54.467' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11371, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-13T17:04:55.817' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11372, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-13T17:19:04.930' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11373, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-13T17:19:06.843' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11374, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-13T17:23:05.680' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11375, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-13T17:23:06.743' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11376, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-13T17:24:37.110' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11377, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-13T17:24:50.690' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11378, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-13T17:25:50.923' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11379, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-13T17:25:53.283' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11380, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T09:03:16.793' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11381, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T09:10:09.510' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11382, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T09:18:37.280' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11383, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T09:18:40.900' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11384, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T09:25:13.127' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11385, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T09:25:18.240' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11386, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T09:25:54.483' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11387, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T09:25:55.447' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11388, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T09:30:45.103' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11389, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T09:30:45.287' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11390, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T09:55:42.363' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11391, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T09:56:03.643' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11392, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T09:56:04.057' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11393, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T09:57:05.693' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11394, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T09:57:06.130' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11395, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T09:57:39.690' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11396, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T09:57:41.653' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11397, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T09:58:49.277' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11398, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T09:58:49.637' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11399, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T10:06:51.487' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11400, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T10:09:06.313' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11401, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T10:09:06.653' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11402, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T10:20:21.040' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11403, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T10:20:26.157' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11404, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T10:23:40.547' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11405, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T10:23:41.170' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11406, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T10:29:40.357' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11407, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T10:29:40.817' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11408, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T10:30:26.070' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11409, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T10:30:31.157' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11410, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T10:31:06.160' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11411, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T10:31:07.180' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11412, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T10:32:54.720' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11413, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T10:32:56.780' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11414, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T10:34:21.470' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11415, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T10:34:22.393' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11416, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T10:35:53.173' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11417, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T10:35:55.113' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11418, 0, N'The string was not recognized as a valid DateTime. There is an unknown word starting at index 0.', N'Client/MemberManger/ProfileRequirement Partnercatagory', CAST(N'2023-02-14T10:38:30.287' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11419, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T10:56:52.840' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11420, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T10:56:55.390' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11421, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T11:10:38.237' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11422, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T11:10:38.893' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11423, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T13:40:36.597' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11424, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T13:40:58.310' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11425, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T13:41:00.453' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11426, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T14:02:59.370' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11427, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T14:03:10.443' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11428, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T14:03:13.897' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11429, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T14:03:21.780' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11430, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T14:03:24.030' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11431, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T14:04:11.490' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11432, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T14:04:13.097' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11433, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:05:56.237' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11434, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:05:56.737' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11435, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:05:57.717' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11436, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:00.940' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11437, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:02.600' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11438, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:05.697' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11439, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:05.897' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11440, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:06.080' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11441, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:06.270' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11442, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:06.453' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11443, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:06.650' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11444, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:06.853' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11445, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:11.357' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11446, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:11.500' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11447, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:13.313' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11448, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:13.530' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11449, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:13.767' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11450, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:13.933' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11451, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:14.370' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11452, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:14.517' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11453, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:14.800' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11454, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:14.930' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11455, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:15.260' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11456, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:15.433' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11457, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:15.723' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11458, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:16.310' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11459, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:16.553' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11460, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:16.770' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11461, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:17.037' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11462, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:17.260' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11463, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:17.417' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11464, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:17.570' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11465, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:17.653' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11466, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:17.950' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11467, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:19.030' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11468, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:19.193' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11469, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:19.487' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11470, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:19.870' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11471, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:20.380' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11472, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:20.527' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11473, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:20.610' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11474, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:20.717' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11475, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:20.877' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11476, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:21.033' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11477, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:21.690' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11478, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:21.970' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11479, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:22.187' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11480, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:22.283' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11481, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:22.380' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11482, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:22.490' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11483, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:22.617' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11484, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:23.530' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11485, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:23.670' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11486, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:23.947' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11487, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:24.170' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11488, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:24.733' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11489, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:24.810' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11490, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:24.990' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11491, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:25.137' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11492, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:25.427' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11493, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:25.520' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11494, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:25.647' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11495, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:25.750' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11496, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:25.950' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11497, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:26.153' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11498, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:26.447' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11499, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:26.557' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11500, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:26.703' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11501, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:26.823' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11502, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:27.037' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11503, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:27.133' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11504, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:27.723' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11505, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:27.917' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11506, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:28.170' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11507, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:28.283' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11508, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:28.363' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11509, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:28.587' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11510, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:29.090' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11511, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:29.250' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11512, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:29.400' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11513, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:29.470' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11514, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:29.533' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11515, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:29.750' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11516, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:30.317' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11517, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:30.867' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11518, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:31.360' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11519, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:31.903' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11520, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:06:32.373' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11521, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:17:33.767' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11522, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:17:33.977' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11523, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:17:34.193' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11524, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:17:34.443' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11525, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:17:34.627' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11526, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:17:34.790' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11527, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:17:35.000' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11528, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T14:17:35.243' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11529, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T14:19:07.827' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11530, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T14:19:08.777' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11531, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T14:25:19.477' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11532, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T14:25:21.550' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11533, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T14:26:08.147' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11534, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T14:26:09.030' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11535, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T14:26:23.043' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11536, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T14:27:24.487' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11537, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T14:27:24.790' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11538, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T14:50:49.577' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11539, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T14:50:51.660' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11540, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T14:59:35.430' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11541, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T14:59:36.103' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11542, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T15:01:17.093' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11543, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T15:01:17.247' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11544, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T15:03:06.210' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11545, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T15:03:06.710' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11546, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T15:04:33.940' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11547, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T15:04:35.993' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11548, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T15:06:26.370' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11549, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T15:06:33.037' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11550, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T15:07:44.723' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11551, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T15:07:45.167' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11552, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T15:11:19.730' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11553, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T15:12:06.693' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11554, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T15:12:55.570' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11555, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T15:12:56.443' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11556, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T15:15:54.690' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11557, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T15:16:03.467' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11558, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T15:17:32.223' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11559, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T15:17:37.680' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11560, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T15:20:33.483' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11561, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T15:20:35.233' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11562, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T15:21:31.173' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11563, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T15:21:31.467' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11564, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T15:22:09.667' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11565, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T15:22:14.340' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11566, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T15:22:30.770' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11567, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T15:22:34.787' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11568, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T15:23:02.113' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11569, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T15:23:04.160' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11570, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T15:25:10.533' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11571, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T16:14:36.397' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11572, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T16:14:50.407' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11573, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-14T16:14:52.440' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11574, 0, N'Invalid column name ''PartnerCategoryID''.
Invalid column name ''PartnerCategoryStatus''.', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T16:17:28.313' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11575, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T16:29:01.350' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11576, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-14T16:29:03.513' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11577, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T16:35:17.960' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11578, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-14T16:35:21.077' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11579, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T16:37:11.557' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11580, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-14T16:37:11.897' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11581, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T16:51:50.923' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11582, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-14T16:51:52.190' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11583, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T16:57:37.507' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11584, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-14T16:57:38.463' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11585, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T17:03:12.410' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11586, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-14T17:03:16.560' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11587, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T17:03:18.633' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11588, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T17:04:06.513' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11589, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-14T17:04:27.197' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11590, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T17:04:27.853' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11591, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T17:05:13.927' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11592, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T17:10:11.863' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11593, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T17:10:15.310' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11594, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T17:10:29.627' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11595, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-14T17:10:30.573' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11596, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T17:14:03.963' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11597, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T17:14:06.967' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11598, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T17:14:20.880' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11599, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-14T17:14:23.300' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11600, 0, N'The type ''Edm.String'' of the member ''CategoryId'' in the conceptual side type ''MarrymeModel.PartnerCategoryResult'' does not match with the type ''System.Int32'' of the member ''CategoryId'' on the object side type ''Marryme.DAL.PartnerCategoryResult''.', N'AccountManager/VerifyUser', CAST(N'2023-02-14T17:46:48.537' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11601, 0, N'The type ''Edm.String'' of the member ''CategoryId'' in the conceptual side type ''MarrymeModel.PartnerCategoryResult'' does not match with the type ''System.Int32'' of the member ''CategoryId'' on the object side type ''Marryme.DAL.PartnerCategoryResult''.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-14T17:47:09.827' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11602, 0, N'The type ''Edm.String'' of the member ''CategoryId'' in the conceptual side type ''MarrymeModel.PartnerCategoryResult'' does not match with the type ''System.Int32'' of the member ''CategoryId'' on the object side type ''Marryme.DAL.PartnerCategoryResult''.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2023-02-14T17:47:22.247' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11603, 0, N'The type ''Edm.String'' of the member ''CategoryId'' in the conceptual side type ''MarrymeModel.PartnerCategoryResult'' does not match with the type ''System.Int32'' of the member ''CategoryId'' on the object side type ''Marryme.DAL.PartnerCategoryResult''.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2023-02-14T17:47:24.430' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11604, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-14T17:47:32.817' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11605, 0, N'The type ''Edm.String'' of the member ''CategoryId'' in the conceptual side type ''MarrymeModel.PartnerCategoryResult'' does not match with the type ''System.Int32'' of the member ''CategoryId'' on the object side type ''Marryme.DAL.PartnerCategoryResult''.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-14T17:47:35.363' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11606, 0, N'The type ''Edm.String'' of the member ''CategoryId'' in the conceptual side type ''MarrymeModel.PartnerCategoryResult'' does not match with the type ''System.Int32'' of the member ''CategoryId'' on the object side type ''Marryme.DAL.PartnerCategoryResult''.', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-14T17:48:03.963' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11607, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T09:12:42.760' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11608, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T09:12:45.657' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11609, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T09:13:15.447' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11610, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T09:13:18.467' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11611, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T09:17:41.053' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11612, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T09:17:43.747' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11613, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T09:17:56.167' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11614, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T09:17:59.127' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11615, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T09:55:44.567' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11616, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T09:57:49.663' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11617, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T09:58:07.333' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11618, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T09:58:08.167' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11619, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T10:14:09.417' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11620, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T10:14:13.450' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11621, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T10:20:59.833' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11622, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T10:21:02.357' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11623, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T10:21:53.120' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11624, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T10:21:55.253' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11625, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T10:29:42.140' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11626, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T10:29:42.860' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11627, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T10:32:22.013' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11628, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T10:32:22.093' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11629, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T10:35:14.037' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11630, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T10:35:15.897' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11631, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T10:35:47.513' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11632, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T10:35:48.810' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11633, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T10:38:11.423' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11634, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T10:38:12.023' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11635, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T10:41:45.350' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11636, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T10:41:46.447' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11637, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T11:22:14.917' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11638, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T11:22:17.867' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11639, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T11:22:30.277' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11640, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T11:22:32.750' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11641, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T11:23:58.900' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11642, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T11:24:58.543' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11643, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T11:25:32.817' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11644, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T11:25:36.963' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11645, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T11:40:19.707' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11646, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T11:40:24.583' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11647, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T11:40:37.700' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11648, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T11:40:45.070' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11649, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T11:42:59.643' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11650, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T11:43:34.157' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11651, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T11:43:37.317' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11652, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T11:43:47.150' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11653, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T11:43:49.540' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11654, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T11:45:58.987' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11655, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T11:45:59.443' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11656, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T11:47:00.493' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11657, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T11:47:01.650' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11658, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T11:47:27.980' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11659, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T11:47:33.600' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11660, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T11:55:12.577' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11661, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T11:55:15.053' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11662, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T11:56:08.767' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11663, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T11:56:11.187' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11664, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T11:56:23.060' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11665, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T11:56:23.513' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11666, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T11:57:09.423' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11667, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T11:57:10.177' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11668, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T11:58:06.303' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11669, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T11:58:06.883' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11670, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T11:58:58.843' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11671, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T11:59:00.297' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11672, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T12:07:11.163' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11673, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T12:07:16.503' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11674, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T12:08:01.793' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11675, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T12:08:03.470' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11676, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T12:09:58.527' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11677, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T12:10:03.340' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11678, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T12:10:20.320' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11679, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T12:10:23.367' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11680, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T12:13:58.693' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11681, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T12:14:05.167' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11682, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T12:14:17.337' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11683, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T12:14:18.340' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11684, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T13:34:05.287' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11685, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T13:34:14.330' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11686, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T13:34:15.823' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11687, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T13:35:48.000' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11688, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T13:36:14.410' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11689, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T13:41:16.040' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11690, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T13:41:17.523' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11691, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T13:49:35.207' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11692, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T13:49:38.867' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11693, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T13:51:42.767' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11694, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T13:51:45.690' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11695, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T13:52:57.720' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11696, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T13:52:59.333' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11697, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T13:55:04.757' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11698, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T13:55:08.427' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11699, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T13:56:28.670' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11700, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T13:56:30.273' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11701, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T14:05:09.697' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11702, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T14:05:11.187' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11703, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T14:06:49.850' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11704, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T14:06:50.423' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11705, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T14:08:35.940' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11706, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T14:08:39.333' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11707, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T14:11:47.640' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11708, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T14:11:48.170' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11709, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T14:12:05.673' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11710, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T14:12:07.353' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11711, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T14:13:48.203' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11712, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T14:13:51.637' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11713, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T14:14:59.433' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11714, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T14:15:00.053' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11715, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T14:16:35.263' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11716, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T14:16:37.273' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11717, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T14:21:36.070' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11718, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T14:21:36.733' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11719, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T14:22:38.123' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11720, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T14:22:39.090' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11721, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T14:28:00.743' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11722, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T14:28:03.393' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11723, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T14:29:41.163' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11724, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T14:29:41.633' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11725, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T14:31:50.820' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11726, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T14:31:51.147' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11727, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T14:49:22.960' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11728, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T14:49:24.587' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11729, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T14:50:32.043' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11730, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T14:50:33.790' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11731, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-15T15:17:50.837' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11732, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T15:22:22.287' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11733, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T15:22:22.803' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11734, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T15:27:33.937' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11735, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T15:27:35.990' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11736, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T15:28:08.053' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11737, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T15:28:14.647' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11738, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T15:34:38.180' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11739, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T15:34:40.160' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11740, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T15:46:56.600' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11741, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T15:47:00.203' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11742, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T15:48:11.550' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11743, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T15:48:12.063' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11744, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T15:54:01.113' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11745, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T15:54:01.593' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11746, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T15:54:33.977' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11747, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T15:54:37.453' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11748, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T16:02:01.220' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11749, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T16:02:33.850' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11750, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T16:02:41.757' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11751, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T16:06:38.737' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11752, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T16:06:39.143' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11753, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T16:07:46.673' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11754, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T16:07:49.050' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11755, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T16:08:52.387' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11756, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T16:08:52.563' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11757, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T16:10:17.873' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11758, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T16:10:19.420' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11759, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T16:11:02.853' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11760, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T16:11:03.843' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11761, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T16:11:27.547' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11762, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T16:11:30.623' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11763, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T16:14:22.933' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11764, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T16:14:24.493' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11765, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T16:18:57.307' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11766, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T16:18:57.587' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11767, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T16:22:08.060' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11768, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T16:22:11.627' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11769, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T16:24:08.660' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11770, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T16:24:10.017' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11771, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T16:26:04.160' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11772, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T16:26:04.477' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11773, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T16:47:39.330' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11774, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T16:47:49.630' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11775, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T16:47:50.253' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11776, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T17:05:18.283' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11777, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T17:05:21.703' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11778, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T17:05:45.437' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11779, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T17:05:47.000' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11780, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T17:20:27.237' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11781, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T17:20:29.370' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11782, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T17:22:44.243' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11783, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T17:22:45.560' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11784, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T17:23:57.133' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11785, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T17:23:57.207' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11786, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-15T17:24:31.800' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11787, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-15T17:24:33.390' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11788, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T10:22:36.507' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11789, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T10:23:09.160' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11790, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T10:23:48.113' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11791, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-17T10:23:49.280' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11792, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T10:42:34.230' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11793, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-17T10:42:36.407' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11794, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T12:51:56.670' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11795, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T14:09:02.600' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11796, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T14:09:11.793' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11797, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T14:12:35.440' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11798, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T14:12:42.907' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11799, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T14:18:19.783' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11800, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T14:18:26.653' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11801, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T14:43:23.523' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11802, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T14:43:29.757' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11803, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T14:46:36.003' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11804, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T14:49:30.473' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11805, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T14:50:03.033' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11806, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T14:51:29.207' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11807, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T14:51:55.150' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11808, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T14:55:16.050' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11809, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T14:56:13.193' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11810, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T15:00:45.007' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11811, 0, N'The string was not recognized as a valid DateTime. There is an unknown word starting at index 0.', N'Client/MemberManger/ProfileRequirement Partnercatagory', CAST(N'2023-02-17T15:01:06.707' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11812, 0, N'The string was not recognized as a valid DateTime. There is an unknown word starting at index 0.', N'Client/MemberManger/ProfileRequirement Partnercatagory', CAST(N'2023-02-17T15:01:07.160' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11813, 0, N'The string was not recognized as a valid DateTime. There is an unknown word starting at index 0.', N'Client/MemberManger/ProfileRequirement Partnercatagory', CAST(N'2023-02-17T15:01:07.347' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11814, 0, N'The string was not recognized as a valid DateTime. There is an unknown word starting at index 0.', N'Client/MemberManger/ProfileRequirement Partnercatagory', CAST(N'2023-02-17T15:01:07.563' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11815, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-17T15:12:55.333' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11816, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-17T15:13:23.860' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11817, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T15:13:51.843' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11818, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T15:14:29.017' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11819, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T15:15:24.253' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11820, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T15:15:41.187' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11821, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T15:23:11.517' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11822, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T15:38:19.930' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11823, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T15:39:41.960' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11824, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T15:40:37.063' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11825, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T15:44:51.760' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11826, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T15:45:56.787' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11827, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T15:51:36.660' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11828, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T15:52:10.477' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11829, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T16:16:18.030' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11830, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T16:16:28.080' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11831, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T16:17:35.093' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11832, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T16:21:33.130' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11833, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T16:23:10.643' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11834, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T16:23:21.443' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11835, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T16:25:14.800' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11836, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-17T16:37:21.500' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11837, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T16:37:25.453' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11838, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-17T16:37:43.070' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11839, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T16:38:08.483' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11840, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-17T16:38:20.880' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11841, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-17T16:43:26.760' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11842, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-17T16:55:24.177' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11843, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T17:41:52.390' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11844, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T17:43:32.490' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11845, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T17:44:12.107' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11846, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-17T17:45:17.530' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11847, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-17T17:46:38.590' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11848, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-18T10:09:00.567' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11849, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-18T10:09:37.740' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11850, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-18T10:09:40.417' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11851, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-18T10:10:00.527' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11852, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-18T10:10:36.557' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11853, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-18T10:17:28.523' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11854, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-18T10:19:16.010' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11855, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-18T10:23:10.953' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11856, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-18T10:23:14.597' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11857, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-18T10:30:24.140' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11858, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-18T10:30:48.863' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11859, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-18T11:35:03.887' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11860, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-18T13:24:21.837' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11861, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-18T13:52:47.780' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11862, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-18T13:56:32.387' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11863, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-18T14:08:55.907' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11864, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-18T14:09:05.507' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11865, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-18T14:10:07.113' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11866, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-18T14:12:32.207' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11867, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-18T14:12:34.723' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11868, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-18T14:12:35.543' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11869, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-18T14:12:44.953' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11870, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-18T15:06:54.430' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11871, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-18T15:33:48.713' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11872, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-18T16:18:21.197' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11873, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-18T16:25:21.077' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11874, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-18T17:24:08.723' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11875, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-18T17:33:09.090' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11876, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-18T17:34:52.710' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11877, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T08:44:55.733' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11878, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T08:49:55.800' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11879, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T08:49:59.640' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11880, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T09:20:33.090' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11881, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T09:20:49.253' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11882, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T09:51:41.723' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11883, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T09:51:48.227' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11884, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T09:57:42.307' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11885, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T10:07:57.723' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11886, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T10:08:00.830' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11887, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T10:11:42.850' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11888, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T10:12:51.120' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11889, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T10:35:47.050' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11890, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T10:49:57.127' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11891, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T10:50:03.640' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11892, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T10:55:01.913' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11893, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T10:56:23.070' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11894, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T11:03:02.990' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11895, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T11:03:05.653' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11896, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T11:05:01.470' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11897, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T11:05:12.250' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11898, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T11:12:43.100' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11899, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T11:12:49.067' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11900, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T11:18:24.860' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11901, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T11:19:20.420' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11902, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T11:22:28.587' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11903, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T11:22:35.033' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11904, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T11:24:01.617' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11905, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T11:27:40.117' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11906, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T11:27:44.440' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11907, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T11:29:42.173' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11908, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T11:29:45.753' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11909, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T11:36:36.530' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11910, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T11:36:51.173' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11911, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T12:05:17.763' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11912, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T12:05:40.333' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11913, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T12:07:52.637' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11914, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T12:07:55.110' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11915, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T12:28:41.943' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11916, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T12:29:10.833' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11917, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T14:22:53.363' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11918, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T15:35:11.607' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11919, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T15:51:03.630' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11920, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T16:06:25.220' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11921, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T16:06:28.970' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11922, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T16:31:16.390' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11923, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T16:31:25.740' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11924, 0, N'The type ''Edm.Int32'' of the member ''CR_ListId'' in the conceptual side type ''MarrymeModel.PartnerCategoryResult'' does not match with the type ''System.Int64'' of the member ''CR_ListId'' on the object side type ''Marryme.DAL.PartnerCategoryResult''.', N'AccountManager/VerifyUser', CAST(N'2023-02-19T17:00:06.043' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11925, 0, N'The type ''Edm.Int32'' of the member ''CR_ListId'' in the conceptual side type ''MarrymeModel.PartnerCategoryResult'' does not match with the type ''System.Int64'' of the member ''CR_ListId'' on the object side type ''Marryme.DAL.PartnerCategoryResult''.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T17:00:24.527' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11926, 0, N'The type ''Edm.Int32'' of the member ''CR_ListId'' in the conceptual side type ''MarrymeModel.PartnerCategoryResult'' does not match with the type ''System.Int64'' of the member ''CR_ListId'' on the object side type ''Marryme.DAL.PartnerCategoryResult''.', N'Client/MemberManger/FetchProfileLocationDetail', CAST(N'2023-02-19T17:00:32.250' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11927, 0, N'The type ''Edm.Int32'' of the member ''CR_ListId'' in the conceptual side type ''MarrymeModel.PartnerCategoryResult'' does not match with the type ''System.Int64'' of the member ''CR_ListId'' on the object side type ''Marryme.DAL.PartnerCategoryResult''.', N'Client/MemberManger/PersonalInfoGetById', CAST(N'2023-02-19T17:00:33.093' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11928, 0, N'The type ''Edm.Int32'' of the member ''CR_ListId'' in the conceptual side type ''MarrymeModel.PartnerCategoryResult'' does not match with the type ''System.Int64'' of the member ''CR_ListId'' on the object side type ''Marryme.DAL.PartnerCategoryResult''.', N'Client/MemberManger/ProfileRequirement Partnercatagory', CAST(N'2023-02-19T17:00:36.573' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11929, 0, N'The type ''Edm.Int32'' of the member ''CR_ListId'' in the conceptual side type ''MarrymeModel.PartnerCategoryResult'' does not match with the type ''System.Int64'' of the member ''CR_ListId'' on the object side type ''Marryme.DAL.PartnerCategoryResult''.', N'Client/PersonalDetailManager/PersonalInfoDetailGetById', CAST(N'2023-02-19T17:00:38.587' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11930, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T17:08:44.557' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11931, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T17:08:47.463' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11932, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T17:11:32.473' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11933, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T17:11:35.607' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11934, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T17:15:19.743' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11935, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-19T17:15:21.973' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11936, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-20T11:54:42.580' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11937, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-20T12:03:02.073' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11938, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-20T13:25:24.633' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11939, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-20T13:25:28.470' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11940, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-20T13:25:59.853' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11941, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-20T13:42:57.073' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11942, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-20T14:00:53.533' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11943, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-20T14:19:18.600' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11944, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-20T14:19:21.593' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11945, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-20T14:23:09.783' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11946, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-20T14:23:14.843' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11947, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-20T15:44:54.827' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11948, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-20T15:44:57.667' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11949, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-20T16:11:35.043' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11950, 0, N'Value cannot be null.
Parameter name: source', N'ProfileRequirementManager/PartnerCatagories', CAST(N'2023-02-20T16:29:20.487' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11951, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-20T16:32:44.867' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11952, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-20T16:32:50.197' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11953, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-20T16:50:00.750' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11954, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-20T16:50:31.757' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11955, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-20T16:53:53.897' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11956, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-20T16:53:57.003' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11957, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-20T17:06:19.497' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11958, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-20T17:06:22.997' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11959, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T08:30:21.770' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11960, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T08:30:22.947' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11961, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T08:41:27.450' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11962, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T08:42:40.270' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11963, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T08:50:35.107' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11964, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T08:53:11.960' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11965, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T08:58:38.110' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11966, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T08:59:16.663' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11967, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T09:59:31.893' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11968, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T10:11:25.293' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11969, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T10:11:38.627' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11970, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T10:33:48.917' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11971, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T10:37:06.513' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11972, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T10:39:04.330' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11973, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T10:41:15.683' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11974, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T10:41:34.270' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11975, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T10:43:27.270' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11976, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T10:54:38.387' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11977, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T10:56:51.043' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11978, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T11:08:53.617' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11979, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T11:09:03.127' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11980, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T11:09:19.913' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11981, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T11:14:57.660' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11982, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T11:43:04.403' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11983, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T11:59:27.620' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11984, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T11:59:31.303' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11985, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T13:38:35.433' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11986, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T14:12:50.010' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11987, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T15:28:28.343' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11988, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T15:29:05.767' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11989, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T15:42:00.780' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11990, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T15:42:03.660' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11991, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T15:43:47.723' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11992, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T15:43:50.653' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11993, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T15:44:36.010' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11994, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T15:44:40.543' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11995, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T15:55:04.973' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11996, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T15:55:49.853' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11997, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T15:57:49.120' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11998, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T15:58:29.210' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (11999, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T16:03:42.127' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12000, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T16:03:50.947' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12001, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T16:05:26.513' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12002, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T16:09:03.163' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12003, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T16:09:06.017' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12004, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T16:12:56.923' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12005, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T16:13:17.817' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12006, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T16:29:36.463' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12007, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T16:29:46.133' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12008, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-21T17:13:43.750' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12009, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T08:15:42.597' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12010, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T09:56:53.413' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12011, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T09:57:55.847' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12012, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T10:03:22.260' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12013, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T10:17:49.140' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12014, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T11:02:41.303' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12015, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T11:03:29.420' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12016, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T11:23:48.957' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12017, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T11:25:10.367' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12018, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T11:56:46.050' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12019, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T12:03:28.123' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12020, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T12:04:17.850' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12021, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T12:09:16.197' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12022, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T12:09:20.320' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12023, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T13:19:06.693' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12024, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T13:19:17.490' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12025, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T13:40:41.380' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12026, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T13:40:47.300' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12027, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T13:43:05.227' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12028, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T13:43:08.393' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12029, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T14:11:38.857' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12030, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T14:11:41.797' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12031, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T14:39:19.267' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12032, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T14:41:01.637' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12033, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T14:48:24.617' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12034, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T14:48:27.973' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12035, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T15:25:16.350' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12036, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T15:30:51.717' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12037, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T16:00:50.363' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12038, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T16:50:07.123' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12039, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T16:55:12.393' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12040, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T16:55:15.143' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12041, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T17:06:32.283' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12042, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T17:06:35.407' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12043, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T17:20:49.460' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12044, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T17:20:54.477' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12045, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T17:21:18.747' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12046, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-22T17:21:22.463' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12047, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-24T09:19:12.257' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12048, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-24T09:49:29.763' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12049, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-24T09:56:03.447' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12050, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-24T09:56:06.990' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12051, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-24T10:05:59.953' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12052, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-24T10:06:03.597' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12053, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-24T11:08:12.153' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12054, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-24T11:08:46.087' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12055, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-24T11:15:18.080' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12056, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-24T11:15:20.777' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12057, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-24T11:17:47.687' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (12058, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-24T11:17:51.073' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (13051, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-24T11:56:00.057' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (13052, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-24T11:56:08.993' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (13053, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-24T12:23:11.437' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (13054, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-24T14:26:08.153' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (13055, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-24T14:44:10.457' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (13056, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-24T14:59:34.117' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (13057, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-24T14:59:37.483' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (13058, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-24T16:02:16.940' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (13059, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-24T16:02:22.700' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (13060, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-24T16:52:52.563' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (13061, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-24T16:52:59.097' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (13062, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-24T16:58:48.070' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (13063, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-24T16:59:16.393' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (13064, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-24T17:42:26.347' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (13065, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-24T17:42:29.237' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (13066, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-24T17:46:24.797' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (13067, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-24T17:49:58.577' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (13068, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-25T08:08:07.920' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (13069, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-25T08:09:02.170' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (13070, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-25T08:14:24.793' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (13071, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-25T08:14:27.620' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (13072, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-25T08:14:31.840' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (13073, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-25T08:18:32.073' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (13074, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-25T08:50:01.497' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (13075, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-25T09:38:38.983' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (13076, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-25T09:41:04.110' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (13077, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-25T09:48:26.690' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (13078, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-25T10:39:08.430' AS DateTime))
GO
INSERT [dbo].[ErrorLog] ([Id], [User_Id], [Message], [Url], [CreateDate]) VALUES (13079, 0, N'An error occurred while executing the command definition. See the inner exception for details.', N'FieldPermissionManager/GetActiveSections', CAST(N'2023-02-25T10:47:21.203' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ErrorLog] OFF
GO
SET IDENTITY_INSERT [dbo].[ExisitingKidsDetail] ON 
GO
INSERT [dbo].[ExisitingKidsDetail] ([ID], [KidDetail], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Age', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ExisitingKidsDetail] ([ID], [KidDetail], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Boy', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ExisitingKidsDetail] ([ID], [KidDetail], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Girl', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ExisitingKidsDetail] ([ID], [KidDetail], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (4, N'Location', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ExisitingKidsDetail] ([ID], [KidDetail], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (5, N'Marital Status', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[ExisitingKidsDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[ExisitingKidsDetailResult] ON 
GO
INSERT [dbo].[ExisitingKidsDetailResult] ([ID], [MemberId], [ExistingWife], [KidAge], [KidGender], [KidLocation], [KidMaritalStatus], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10054, 44, 3, 30, N'Female', N'abc', N'Married', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ExisitingKidsDetailResult] ([ID], [MemberId], [ExistingWife], [KidAge], [KidGender], [KidLocation], [KidMaritalStatus], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10055, 44, 1, 20, N'Male', N'ajwa', N'Married', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ExisitingKidsDetailResult] ([ID], [MemberId], [ExistingWife], [KidAge], [KidGender], [KidLocation], [KidMaritalStatus], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10056, 44, 1, 15, N'Female', N'ajwa', N'UnMarried', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[ExisitingKidsDetailResult] OFF
GO
SET IDENTITY_INSERT [dbo].[Facilities] ON 
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Food', N'female', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Clothes', N'female', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Medical', N'female', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'Basic Needs', N'female', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'Her Own House', N'female', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, N'Own Apartment', N'female', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, N'Her Kids Support', N'female', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, N'To have more Kids', N'female', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (9, N'Education for Kids', N'female', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, N'Expense for Kids', N'female', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (11, N'Respect Other Wives', N'male', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (12, N'Respect Other Kids', N'male', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (13, N'Respect all Family', N'male', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (14, N'Not Jealously', N'male', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (15, N'Not Fighting', N'male', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (16, N'Not Shouting', N'male', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (17, N'Share Responsibilities', N'male', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (18, N'Not be Selfish', N'male', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (19, N'Do not lie', N'male', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (20, N'No bad names', N'male', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (21, N'Protect Family Respect', N'male', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (22, N'No Manipulation', N'male', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (23, N'Keep Family Intact', N'male', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (24, N'God Fearing', N'male', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (25, N'Do Justice', N'male', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (26, N'Be Loving', N'male', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (27, N'Be Caring', N'male', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (28, N'Be Soft Spoken', N'male', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (29, N'Obey Husband', N'male', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (30, N'Do not do Complaints', N'male', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (31, N'No finger Pointing', N'male', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (32, N'Support equal rights', N'male', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (33, N'Do household work', N'male', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (34, N'Take care of Kids', N'male', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (35, N'Take care of Husband', N'male', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (36, N'Relocate If needed', N'male', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (38, N'Do you want more marriages', N'male', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (39, N'Wants To become wife as', N'female', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (40, N'Does she can work', N'male', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (41, N'I want to Work ', N'female', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (42, N'Consider Other Kids', N'female', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Facilities] OFF
GO
SET IDENTITY_INSERT [dbo].[FacilitiesResultFemale] ON 
GO
INSERT [dbo].[FacilitiesResultFemale] ([ID], [MemberId], [FacilityId], [One], [Two], [Three], [Four], [FacilityFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (19, 44, 1, 0, 0, 0, 1, NULL, NULL, CAST(N'2023-02-24T14:55:39.990' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FacilitiesResultFemale] ([ID], [MemberId], [FacilityId], [One], [Two], [Three], [Four], [FacilityFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (20, 44, 2, 1, 1, 0, 0, NULL, NULL, CAST(N'2023-02-24T14:55:39.990' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FacilitiesResultFemale] ([ID], [MemberId], [FacilityId], [One], [Two], [Three], [Four], [FacilityFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (21, 44, 5, 1, 1, 0, 0, NULL, NULL, CAST(N'2023-02-24T14:55:39.990' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FacilitiesResultFemale] ([ID], [MemberId], [FacilityId], [One], [Two], [Three], [Four], [FacilityFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (22, 44, 6, 1, 1, 0, 0, NULL, NULL, CAST(N'2023-02-24T14:55:39.990' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FacilitiesResultFemale] ([ID], [MemberId], [FacilityId], [One], [Two], [Three], [Four], [FacilityFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (23, 44, 7, 1, 1, 1, 0, NULL, NULL, CAST(N'2023-02-24T14:55:39.990' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FacilitiesResultFemale] ([ID], [MemberId], [FacilityId], [One], [Two], [Three], [Four], [FacilityFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (24, 44, 8, 0, 0, 0, 1, NULL, NULL, CAST(N'2023-02-24T14:55:39.990' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FacilitiesResultFemale] ([ID], [MemberId], [FacilityId], [One], [Two], [Three], [Four], [FacilityFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (25, 44, 9, 0, 0, 0, 1, NULL, NULL, CAST(N'2023-02-24T14:55:39.990' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FacilitiesResultFemale] ([ID], [MemberId], [FacilityId], [One], [Two], [Three], [Four], [FacilityFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (26, 44, 10, 1, 1, 0, 1, NULL, NULL, CAST(N'2023-02-24T14:55:39.990' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[FacilitiesResultFemale] OFF
GO
SET IDENTITY_INSERT [dbo].[FacilitiesResultMale] ON 
GO
INSERT [dbo].[FacilitiesResultMale] ([ID], [MemberId], [FacilityId], [FacilityFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (19, 30, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[FacilitiesResultMale] ([ID], [MemberId], [FacilityId], [FacilityFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (20, 30, 15, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[FacilitiesResultMale] ([ID], [MemberId], [FacilityId], [FacilityFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (21, 30, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[FacilitiesResultMale] ([ID], [MemberId], [FacilityId], [FacilityFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (22, 30, 4, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[FacilitiesResultMale] ([ID], [MemberId], [FacilityId], [FacilityFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (23, 30, 7, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[FacilitiesResultMale] ([ID], [MemberId], [FacilityId], [FacilityFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10032, 0, 34, N'W', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[FacilitiesResultMale] ([ID], [MemberId], [FacilityId], [FacilityFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10033, 0, 11, N'W', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[FacilitiesResultMale] ([ID], [MemberId], [FacilityId], [FacilityFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10034, 0, 8, N'W', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[FacilitiesResultMale] ([ID], [MemberId], [FacilityId], [FacilityFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10035, 0, 12, N'M', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[FacilitiesResultMale] ([ID], [MemberId], [FacilityId], [FacilityFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (20059, 44, 12, NULL, NULL, CAST(N'2023-02-24T15:37:31.340' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FacilitiesResultMale] ([ID], [MemberId], [FacilityId], [FacilityFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (20060, 44, 14, NULL, NULL, CAST(N'2023-02-24T15:37:31.340' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FacilitiesResultMale] ([ID], [MemberId], [FacilityId], [FacilityFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (20061, 44, 16, NULL, NULL, CAST(N'2023-02-24T15:37:31.340' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FacilitiesResultMale] ([ID], [MemberId], [FacilityId], [FacilityFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (20062, 44, 17, NULL, NULL, CAST(N'2023-02-24T15:37:31.340' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FacilitiesResultMale] ([ID], [MemberId], [FacilityId], [FacilityFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (20063, 44, 18, NULL, NULL, CAST(N'2023-02-24T15:37:31.340' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FacilitiesResultMale] ([ID], [MemberId], [FacilityId], [FacilityFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (20064, 44, 21, NULL, NULL, CAST(N'2023-02-24T15:37:31.340' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FacilitiesResultMale] ([ID], [MemberId], [FacilityId], [FacilityFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (20065, 44, 22, NULL, NULL, CAST(N'2023-02-24T15:37:31.340' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FacilitiesResultMale] ([ID], [MemberId], [FacilityId], [FacilityFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (20066, 44, 24, NULL, NULL, CAST(N'2023-02-24T15:37:31.340' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FacilitiesResultMale] ([ID], [MemberId], [FacilityId], [FacilityFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (20067, 44, 27, NULL, NULL, CAST(N'2023-02-24T15:37:31.340' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FacilitiesResultMale] ([ID], [MemberId], [FacilityId], [FacilityFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (20068, 44, 32, NULL, NULL, CAST(N'2023-02-24T15:37:31.340' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FacilitiesResultMale] ([ID], [MemberId], [FacilityId], [FacilityFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (20069, 44, 33, NULL, NULL, CAST(N'2023-02-24T15:37:31.340' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[FacilitiesResultMale] ([ID], [MemberId], [FacilityId], [FacilityFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (20070, 44, 36, NULL, NULL, CAST(N'2023-02-24T15:37:31.340' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[FacilitiesResultMale] OFF
GO
SET IDENTITY_INSERT [dbo].[FamilyInvolvement] ON 
GO
INSERT [dbo].[FamilyInvolvement] ([ID], [InvolvementOptions], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'Are your brother agree with this marriage?', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[FamilyInvolvement] ([ID], [InvolvementOptions], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'Is your mother is agree with this marriage?', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[FamilyInvolvement] ([ID], [InvolvementOptions], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, N'Is your father agree with this marriage?', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[FamilyInvolvement] ([ID], [InvolvementOptions], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (4, N'Are your sons agree with this marriage?', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[FamilyInvolvement] ([ID], [InvolvementOptions], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (5, N'Are your daughters agree with this marriage?', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[FamilyInvolvement] ([ID], [InvolvementOptions], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (6, N'Are your uncle agree with this marriage?', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[FamilyInvolvement] ([ID], [InvolvementOptions], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (7, N'Are your Aunts agree with this marriage?', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[FamilyInvolvement] OFF
GO
SET IDENTITY_INSERT [dbo].[FeedBack] ON 
GO
INSERT [dbo].[FeedBack] ([Id], [Name], [Email], [Designation], [Message], [IsApproved], [IsActive], [CreatedDate], [IsRead]) VALUES (1, N'EastFlicker', N'eastflicker@gmail.com', N'CEO', N'This is test.', 1, 0, CAST(N'2020-07-26T12:07:00.980' AS DateTime), 1)
GO
INSERT [dbo].[FeedBack] ([Id], [Name], [Email], [Designation], [Message], [IsApproved], [IsActive], [CreatedDate], [IsRead]) VALUES (2, N'AbuBakar', N'abubakarsittar97@gmail.com', N'Software Engineer', N'This is test message for showing on home page.', 0, 0, CAST(N'2020-07-26T12:10:50.933' AS DateTime), 1)
GO
INSERT [dbo].[FeedBack] ([Id], [Name], [Email], [Designation], [Message], [IsApproved], [IsActive], [CreatedDate], [IsRead]) VALUES (3, N'Subhan Zafar', N'subhanzafar531@gmail.com', N'user', N'Hy i am visit your website. its really awesome.', 0, 0, CAST(N'2020-08-25T18:37:48.077' AS DateTime), 1)
GO
INSERT [dbo].[FeedBack] ([Id], [Name], [Email], [Designation], [Message], [IsApproved], [IsActive], [CreatedDate], [IsRead]) VALUES (4, N'Subhan Zafar', N'subhanzafar531@gmail.com', N'user', N'Hy  i am visit your site its really awesome', 1, 0, CAST(N'2020-08-25T18:40:04.627' AS DateTime), 1)
GO
INSERT [dbo].[FeedBack] ([Id], [Name], [Email], [Designation], [Message], [IsApproved], [IsActive], [CreatedDate], [IsRead]) VALUES (5, N'Subhan Zafar', N'subhanzafar531@gmail.com', N'user', N'This is decriptiion.', 0, 0, CAST(N'2020-08-25T18:46:16.047' AS DateTime), 1)
GO
INSERT [dbo].[FeedBack] ([Id], [Name], [Email], [Designation], [Message], [IsApproved], [IsActive], [CreatedDate], [IsRead]) VALUES (6, N'Hassnain Ali', N'hassnain.ali.13100@gmail.com', N'', N'', 0, 0, CAST(N'2020-09-22T16:21:35.393' AS DateTime), 1)
GO
INSERT [dbo].[FeedBack] ([Id], [Name], [Email], [Designation], [Message], [IsApproved], [IsActive], [CreatedDate], [IsRead]) VALUES (7, N'Muhammad Awais', N'awais.ramzan.ar@gmail.com', N'teacher & developer', N'it is test feed back message', 0, 0, CAST(N'2020-09-24T22:44:51.650' AS DateTime), 1)
GO
INSERT [dbo].[FeedBack] ([Id], [Name], [Email], [Designation], [Message], [IsApproved], [IsActive], [CreatedDate], [IsRead]) VALUES (8, N'', N'', N'', N'', 0, 0, CAST(N'2020-09-26T14:00:43.723' AS DateTime), 1)
GO
INSERT [dbo].[FeedBack] ([Id], [Name], [Email], [Designation], [Message], [IsApproved], [IsActive], [CreatedDate], [IsRead]) VALUES (9, N'', N'', N'', N'', 0, 0, CAST(N'2020-09-26T14:00:45.407' AS DateTime), 1)
GO
INSERT [dbo].[FeedBack] ([Id], [Name], [Email], [Designation], [Message], [IsApproved], [IsActive], [CreatedDate], [IsRead]) VALUES (11, N'Muhammad Awais', N'awais.ramzan.ar@gmail.com', N'Developer', N'This web is amazing . I love its design', 0, 0, CAST(N'2020-09-26T21:06:37.387' AS DateTime), 1)
GO
INSERT [dbo].[FeedBack] ([Id], [Name], [Email], [Designation], [Message], [IsApproved], [IsActive], [CreatedDate], [IsRead]) VALUES (12, N'Muhammad Awais', N'awais.ramzan.ar@gmail.com', N'Developer', N'This web is amazing . I love its design', 1, 0, CAST(N'2020-09-26T21:34:07.327' AS DateTime), 1)
GO
INSERT [dbo].[FeedBack] ([Id], [Name], [Email], [Designation], [Message], [IsApproved], [IsActive], [CreatedDate], [IsRead]) VALUES (13, N'Azeem', N'azeemurrehman1996@gmail.com', N'India', N'Cooool', 0, 0, CAST(N'2020-10-08T08:50:40.947' AS DateTime), 1)
GO
INSERT [dbo].[FeedBack] ([Id], [Name], [Email], [Designation], [Message], [IsApproved], [IsActive], [CreatedDate], [IsRead]) VALUES (14, N'Azeem', N'azeemurrehman1996@gmail.com', N'India', N'Cooool', 0, 0, CAST(N'2020-10-08T08:50:41.890' AS DateTime), 1)
GO
INSERT [dbo].[FeedBack] ([Id], [Name], [Email], [Designation], [Message], [IsApproved], [IsActive], [CreatedDate], [IsRead]) VALUES (15, N'Muhammad Awais', N'awais.ramzan.ar@gmail.com', N'Teacher', N'This is test msg for feed back', 0, 0, CAST(N'2020-10-08T11:12:57.013' AS DateTime), 1)
GO
INSERT [dbo].[FeedBack] ([Id], [Name], [Email], [Designation], [Message], [IsApproved], [IsActive], [CreatedDate], [IsRead]) VALUES (16, N'Muzammil', N'muju999@gmail.com', N'Admin', N'This site is nice for matchmaking.', 1, 0, CAST(N'2020-10-10T11:22:12.643' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[FeedBack] OFF
GO
SET IDENTITY_INSERT [dbo].[FieldsPermission] ON 
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (1, N'MotherTongue', 1, 1, N'Registration')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (2, N'Gender', 1, 1, N'Registration')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (3, N'MobileNo', 1, 1, N'Registration')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (4, N'DOB', 1, 1, N'Registration')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (5, N'MaritalStatus', 0, 1, N'Registration')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (6, N'NoOfChildren', 1, 1, N'Registration')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (7, N'Subcast', 0, 1, N'Registration')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (8, N'ProfilePicPath', 0, 1, N'Registration')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (9, N'AboutMe', 0, 1, N'Registration')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (10, N'Height', 1, 1, N'Appearance')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (11, N'PhysicalStatus', 0, 1, N'Appearance')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (12, N'Weight', 0, 1, N'Appearance')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (13, N'BodyType', 0, 1, N'Appearance')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (14, N'Complexion', 0, 1, N'Appearance')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (27, N'HighestEducation', 0, 1, N'EducationDetail')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (28, N'EmployeedIn', 0, 1, N'EducationDetail')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (29, N'Occupation', 0, 1, N'EducationDetail')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (30, N'IncomeCurrency', 1, 1, N'EducationDetail')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (31, N'AnnualIncome', 0, 1, N'EducationDetail')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (53, N'ParentContactNo', 1, 1, N'FamilyDetail')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (54, N'FamilyValue', 1, 1, N'FamilyDetail')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (55, N'FamilyType', 0, 1, N'FamilyDetail')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (56, N'FamilyStatus', 0, 1, N'FamilyDetail')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (57, N'IsMotherAlive', 0, 1, N'FamilyDetail')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (58, N'IsFatherAlive', 0, 1, N'FamilyDetail')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (59, N'FatherOccupation', 0, 1, N'FamilyDetail')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (60, N'NoOfBrothers', 0, 1, N'FamilyDetail')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (61, N'NoOfSisters', 0, 1, N'FamilyDetail')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (62, N'FamilyDetail', 0, 1, N'FamilyDetail')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (63, N'EatingHabit', 1, 1, N'LifeStyle')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (64, N'DrinkingHabit', 1, 1, N'LifeStyle')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (65, N'SmokingHabit', 1, 1, N'LifeStyle')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (66, N'Interests', 1, 1, N'LifeStyle')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (67, N'Hobbies', 0, 1, N'LifeStyle')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (68, N'CountryLivingIn', 0, 1, N'LocationDetail')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (69, N'PlaceOfBirth', 0, 1, N'LocationDetail')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (70, N'ResidingState', 1, 1, N'LocationDetail')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (71, N'ResidingCity', 0, 1, N'LocationDetail')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (72, N'Citizenship', 0, 1, N'LocationDetail')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (73, N'Email', 1, 1, N'LoginDetail')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (74, N'LookingFor', 0, 1, N'Registration')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (75, N'Religion', 0, 1, N'FamilyDetail')
GO
INSERT [dbo].[FieldsPermission] ([Id], [Name], [IsVisibleForPremium], [IsActive], [Section]) VALUES (76, N'Language', 1, 1, N'FamilyDetail')
GO
SET IDENTITY_INSERT [dbo].[FieldsPermission] OFF
GO
SET IDENTITY_INSERT [dbo].[Languages] ON 
GO
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (1, N'Urdu')
GO
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (1001, N'English')
GO
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (1002, N'Arabic')
GO
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (1003, N'Chinese')
GO
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (1004, N'French')
GO
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (1005, N'German')
GO
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (1006, N'Japnese')
GO
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (1007, N'Turkish')
GO
SET IDENTITY_INSERT [dbo].[Languages] OFF
GO
SET IDENTITY_INSERT [dbo].[MaritalStatus] ON 
GO
INSERT [dbo].[MaritalStatus] ([ID], [Name], [UserFor], [CategoryId]) VALUES (1, N'Married', N'both', 1)
GO
INSERT [dbo].[MaritalStatus] ([ID], [Name], [UserFor], [CategoryId]) VALUES (2, N'UnMarried', N'both', 1)
GO
INSERT [dbo].[MaritalStatus] ([ID], [Name], [UserFor], [CategoryId]) VALUES (3, N'Widow', N'male', 1)
GO
INSERT [dbo].[MaritalStatus] ([ID], [Name], [UserFor], [CategoryId]) VALUES (4, N'Widower', N'female', 1)
GO
SET IDENTITY_INSERT [dbo].[MaritalStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[MarriageDuration] ON 
GO
INSERT [dbo].[MarriageDuration] ([ID], [MemberId], [MarriageDuration], [DurationFrom], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, 10045, N'3 Month', N'W', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MarriageDuration] ([ID], [MemberId], [MarriageDuration], [DurationFrom], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, 44, N'1 Month', N'M', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MarriageDuration] ([ID], [MemberId], [MarriageDuration], [DurationFrom], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, 44, N'6 Month', N'W', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[MarriageDuration] OFF
GO
SET IDENTITY_INSERT [dbo].[MarriagePolicy] ON 
GO
INSERT [dbo].[MarriagePolicy] ([ID], [MemberId], [dropdownOption], [Amountcheckbox], [AmountDetail], [HouseCheckBox], [HouseDetail], [MiscellaneousCheckbox], [MiscellaneousDetail], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, 44, N'Divorce', N'true', N'40000', N'false', N'in a wapda town', N'true', N'jewells and monthly expenses', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MarriagePolicy] ([ID], [MemberId], [dropdownOption], [Amountcheckbox], [AmountDetail], [HouseCheckBox], [HouseDetail], [MiscellaneousCheckbox], [MiscellaneousDetail], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, 44, N'Khula', N'true', N'40000', N'true', N'Big house', N'true', N'Other things', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[MarriagePolicy] OFF
GO
SET IDENTITY_INSERT [dbo].[MemberAppearance] ON 
GO
INSERT [dbo].[MemberAppearance] ([Id], [MemberId], [PhysicalStatus], [Weight], [BodyType], [Complexion], [Feet], [HeightUnit], [Inches], [Centimeters]) VALUES (15, 10, N'Normal', 40, N'Slim', N'Fair', 180, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberAppearance] ([Id], [MemberId], [PhysicalStatus], [Weight], [BodyType], [Complexion], [Feet], [HeightUnit], [Inches], [Centimeters]) VALUES (16, 11, N'Normal', 78, N'Average', NULL, 175, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberAppearance] ([Id], [MemberId], [PhysicalStatus], [Weight], [BodyType], [Complexion], [Feet], [HeightUnit], [Inches], [Centimeters]) VALUES (17, 9, N'Normal', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberAppearance] ([Id], [MemberId], [PhysicalStatus], [Weight], [BodyType], [Complexion], [Feet], [HeightUnit], [Inches], [Centimeters]) VALUES (18, 13, N'Normal', NULL, NULL, NULL, 150, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberAppearance] ([Id], [MemberId], [PhysicalStatus], [Weight], [BodyType], [Complexion], [Feet], [HeightUnit], [Inches], [Centimeters]) VALUES (19, 15, N'Normal', NULL, N'Average', N'Fair', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberAppearance] ([Id], [MemberId], [PhysicalStatus], [Weight], [BodyType], [Complexion], [Feet], [HeightUnit], [Inches], [Centimeters]) VALUES (20, 17, N'Normal', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberAppearance] ([Id], [MemberId], [PhysicalStatus], [Weight], [BodyType], [Complexion], [Feet], [HeightUnit], [Inches], [Centimeters]) VALUES (21, 18, N'Normal', 42, N'Slim', N'Wheatish Brown', 180, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberAppearance] ([Id], [MemberId], [PhysicalStatus], [Weight], [BodyType], [Complexion], [Feet], [HeightUnit], [Inches], [Centimeters]) VALUES (22, 19, N'Normal', 80, N'Average', N'Fair', 170, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberAppearance] ([Id], [MemberId], [PhysicalStatus], [Weight], [BodyType], [Complexion], [Feet], [HeightUnit], [Inches], [Centimeters]) VALUES (23, 21, N'Normal', NULL, N'Average', NULL, 179, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberAppearance] ([Id], [MemberId], [PhysicalStatus], [Weight], [BodyType], [Complexion], [Feet], [HeightUnit], [Inches], [Centimeters]) VALUES (24, 22, N'Normal', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberAppearance] ([Id], [MemberId], [PhysicalStatus], [Weight], [BodyType], [Complexion], [Feet], [HeightUnit], [Inches], [Centimeters]) VALUES (25, 23, N'Normal', 100, N'Slim', N'Wheatish Brown', 52, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberAppearance] ([Id], [MemberId], [PhysicalStatus], [Weight], [BodyType], [Complexion], [Feet], [HeightUnit], [Inches], [Centimeters]) VALUES (26, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberAppearance] ([Id], [MemberId], [PhysicalStatus], [Weight], [BodyType], [Complexion], [Feet], [HeightUnit], [Inches], [Centimeters]) VALUES (27, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberAppearance] ([Id], [MemberId], [PhysicalStatus], [Weight], [BodyType], [Complexion], [Feet], [HeightUnit], [Inches], [Centimeters]) VALUES (10015, 29, N'Normal', 67, N'Slim', N'Fair', 175, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberAppearance] ([Id], [MemberId], [PhysicalStatus], [Weight], [BodyType], [Complexion], [Feet], [HeightUnit], [Inches], [Centimeters]) VALUES (10016, 0, NULL, 167, N'Slim', N'Fair', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberAppearance] ([Id], [MemberId], [PhysicalStatus], [Weight], [BodyType], [Complexion], [Feet], [HeightUnit], [Inches], [Centimeters]) VALUES (20015, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberAppearance] ([Id], [MemberId], [PhysicalStatus], [Weight], [BodyType], [Complexion], [Feet], [HeightUnit], [Inches], [Centimeters]) VALUES (30015, 36, N'Normal', 70, N'Slim', N'Wheatish Brown', 175, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberAppearance] ([Id], [MemberId], [PhysicalStatus], [Weight], [BodyType], [Complexion], [Feet], [HeightUnit], [Inches], [Centimeters]) VALUES (30016, 44, N'Disabled', 65, N'Slim', N'Wheatish Brown', 5, N'cm', 5, 127)
GO
SET IDENTITY_INSERT [dbo].[MemberAppearance] OFF
GO
SET IDENTITY_INSERT [dbo].[MemberEducationDetail] ON 
GO
INSERT [dbo].[MemberEducationDetail] ([Id], [MemberId], [HighestEducation], [EmployeedIn], [Occupation], [IncomeCurrency], [AnnualIncomeFrom], [AnnualIncomeTo], [EductionLevelsId]) VALUES (11, 10, N'Graduate', N'Private', N'fg', N'USD ($)', CAST(2000.00 AS Decimal(18, 2)), NULL, NULL)
GO
INSERT [dbo].[MemberEducationDetail] ([Id], [MemberId], [HighestEducation], [EmployeedIn], [Occupation], [IncomeCurrency], [AnnualIncomeFrom], [AnnualIncomeTo], [EductionLevelsId]) VALUES (12, 11, N'BCA', N'Private', NULL, N'INR0 (₹)', CAST(300000.00 AS Decimal(18, 2)), NULL, NULL)
GO
INSERT [dbo].[MemberEducationDetail] ([Id], [MemberId], [HighestEducation], [EmployeedIn], [Occupation], [IncomeCurrency], [AnnualIncomeFrom], [AnnualIncomeTo], [EductionLevelsId]) VALUES (13, 13, N'M.I.T', N'Private', NULL, N'PKR (RS)', CAST(30000.00 AS Decimal(18, 2)), NULL, NULL)
GO
INSERT [dbo].[MemberEducationDetail] ([Id], [MemberId], [HighestEducation], [EmployeedIn], [Occupation], [IncomeCurrency], [AnnualIncomeFrom], [AnnualIncomeTo], [EductionLevelsId]) VALUES (14, 15, N'BS IT', N'Government', NULL, N'PKR(RS)', CAST(25500.00 AS Decimal(18, 2)), NULL, NULL)
GO
INSERT [dbo].[MemberEducationDetail] ([Id], [MemberId], [HighestEducation], [EmployeedIn], [Occupation], [IncomeCurrency], [AnnualIncomeFrom], [AnnualIncomeTo], [EductionLevelsId]) VALUES (15, 18, N'BS(IT)', N'Government', N'IT', N'PKR(RS)', CAST(75750.00 AS Decimal(18, 2)), NULL, NULL)
GO
INSERT [dbo].[MemberEducationDetail] ([Id], [MemberId], [HighestEducation], [EmployeedIn], [Occupation], [IncomeCurrency], [AnnualIncomeFrom], [AnnualIncomeTo], [EductionLevelsId]) VALUES (16, 19, N'BCA', N'Private', N'Administrator', N'Not Available', NULL, NULL, NULL)
GO
INSERT [dbo].[MemberEducationDetail] ([Id], [MemberId], [HighestEducation], [EmployeedIn], [Occupation], [IncomeCurrency], [AnnualIncomeFrom], [AnnualIncomeTo], [EductionLevelsId]) VALUES (17, 21, N'MSC', N'Private', N'Not Available', N'Not Available', NULL, NULL, NULL)
GO
INSERT [dbo].[MemberEducationDetail] ([Id], [MemberId], [HighestEducation], [EmployeedIn], [Occupation], [IncomeCurrency], [AnnualIncomeFrom], [AnnualIncomeTo], [EductionLevelsId]) VALUES (18, 23, N'bsit', N'Government', N'software eng', N'PKR(RS)', CAST(25000.00 AS Decimal(18, 2)), NULL, NULL)
GO
INSERT [dbo].[MemberEducationDetail] ([Id], [MemberId], [HighestEducation], [EmployeedIn], [Occupation], [IncomeCurrency], [AnnualIncomeFrom], [AnnualIncomeTo], [EductionLevelsId]) VALUES (10011, 29, N'M.I.T', N'Private', N'Web Developer', N'PKR (RS)', CAST(30000.00 AS Decimal(18, 2)), NULL, NULL)
GO
INSERT [dbo].[MemberEducationDetail] ([Id], [MemberId], [HighestEducation], [EmployeedIn], [Occupation], [IncomeCurrency], [AnnualIncomeFrom], [AnnualIncomeTo], [EductionLevelsId]) VALUES (10012, 0, NULL, NULL, N'Web Developer', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberEducationDetail] ([Id], [MemberId], [HighestEducation], [EmployeedIn], [Occupation], [IncomeCurrency], [AnnualIncomeFrom], [AnnualIncomeTo], [EductionLevelsId]) VALUES (20011, 36, N'M.I.T', N'Private', N'teacher', N'PKR (RS)', CAST(30000.00 AS Decimal(18, 2)), NULL, NULL)
GO
INSERT [dbo].[MemberEducationDetail] ([Id], [MemberId], [HighestEducation], [EmployeedIn], [Occupation], [IncomeCurrency], [AnnualIncomeFrom], [AnnualIncomeTo], [EductionLevelsId]) VALUES (20012, 44, N'2', N'Private', N'Teacher', N'PKR (RS)', CAST(40000.00 AS Decimal(18, 2)), N'50000     ', 1)
GO
SET IDENTITY_INSERT [dbo].[MemberEducationDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[MemberFamilyDetail] ON 
GO
INSERT [dbo].[MemberFamilyDetail] ([Id], [MemberId], [ParentContactNo], [FamilyValue], [FamilyType], [FamilyStatus], [IsMotherAlive], [IsFatherAlive], [FatherOccupation], [NoOfBrothers], [NoOfSisters], [FamilyDetail]) VALUES (10, 10, N'03024387169', N'Traditional', N'Joint Family', N'Middle Class', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberFamilyDetail] ([Id], [MemberId], [ParentContactNo], [FamilyValue], [FamilyType], [FamilyStatus], [IsMotherAlive], [IsFatherAlive], [FatherOccupation], [NoOfBrothers], [NoOfSisters], [FamilyDetail]) VALUES (11, 11, N'', N'Moderate', N'JointFamily', N'Middle Class', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberFamilyDetail] ([Id], [MemberId], [ParentContactNo], [FamilyValue], [FamilyType], [FamilyStatus], [IsMotherAlive], [IsFatherAlive], [FatherOccupation], [NoOfBrothers], [NoOfSisters], [FamilyDetail]) VALUES (12, 13, N'03016444241', N'Traditional', N'Joint Family', N'Middle Class', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberFamilyDetail] ([Id], [MemberId], [ParentContactNo], [FamilyValue], [FamilyType], [FamilyStatus], [IsMotherAlive], [IsFatherAlive], [FatherOccupation], [NoOfBrothers], [NoOfSisters], [FamilyDetail]) VALUES (13, 18, N'03024387169', N'Traditional', N'Joint Family', N'Upper Middle Class', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberFamilyDetail] ([Id], [MemberId], [ParentContactNo], [FamilyValue], [FamilyType], [FamilyStatus], [IsMotherAlive], [IsFatherAlive], [FatherOccupation], [NoOfBrothers], [NoOfSisters], [FamilyDetail]) VALUES (14, 19, N'', N'Moderate', N'Nuclear Family', N'Middle Class', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberFamilyDetail] ([Id], [MemberId], [ParentContactNo], [FamilyValue], [FamilyType], [FamilyStatus], [IsMotherAlive], [IsFatherAlive], [FatherOccupation], [NoOfBrothers], [NoOfSisters], [FamilyDetail]) VALUES (15, 15, N'03421194337', N'Orthodox', N'Joint Family', N'Middle Class', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberFamilyDetail] ([Id], [MemberId], [ParentContactNo], [FamilyValue], [FamilyType], [FamilyStatus], [IsMotherAlive], [IsFatherAlive], [FatherOccupation], [NoOfBrothers], [NoOfSisters], [FamilyDetail]) VALUES (16, 21, N'', N'Moderate', N'Joint Family', N'Upper Middle Class', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberFamilyDetail] ([Id], [MemberId], [ParentContactNo], [FamilyValue], [FamilyType], [FamilyStatus], [IsMotherAlive], [IsFatherAlive], [FatherOccupation], [NoOfBrothers], [NoOfSisters], [FamilyDetail]) VALUES (17, 23, N'03316718260', N'Orthodox', N'Joint Family', N'MiddleClass', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberFamilyDetail] ([Id], [MemberId], [ParentContactNo], [FamilyValue], [FamilyType], [FamilyStatus], [IsMotherAlive], [IsFatherAlive], [FatherOccupation], [NoOfBrothers], [NoOfSisters], [FamilyDetail]) VALUES (18, 0, N'03214569875', N'Traditional', N'Joint Family', N'Middle Class', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberFamilyDetail] ([Id], [MemberId], [ParentContactNo], [FamilyValue], [FamilyType], [FamilyStatus], [IsMotherAlive], [IsFatherAlive], [FatherOccupation], [NoOfBrothers], [NoOfSisters], [FamilyDetail]) VALUES (19, 29, N'03216549875', N'Traditional', N'Joint Family', N'Middle Class', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberFamilyDetail] ([Id], [MemberId], [ParentContactNo], [FamilyValue], [FamilyType], [FamilyStatus], [IsMotherAlive], [IsFatherAlive], [FatherOccupation], [NoOfBrothers], [NoOfSisters], [FamilyDetail]) VALUES (10018, 30, N'03216549875', N'Traditional', N'Joint Family', N'Upper Middle Class', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberFamilyDetail] ([Id], [MemberId], [ParentContactNo], [FamilyValue], [FamilyType], [FamilyStatus], [IsMotherAlive], [IsFatherAlive], [FatherOccupation], [NoOfBrothers], [NoOfSisters], [FamilyDetail]) VALUES (10019, 36, N'03216549875', N'Traditional', N'Joint Family', N'Middle Class', 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberFamilyDetail] ([Id], [MemberId], [ParentContactNo], [FamilyValue], [FamilyType], [FamilyStatus], [IsMotherAlive], [IsFatherAlive], [FatherOccupation], [NoOfBrothers], [NoOfSisters], [FamilyDetail]) VALUES (10020, 44, N'030164654987', N'Traditional', N'Joint Family', N'Middle Class', 0, 0, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[MemberFamilyDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[MemberLanguages] ON 
GO
INSERT [dbo].[MemberLanguages] ([Id], [MemberId], [LanguageId]) VALUES (10, 10, 1)
GO
INSERT [dbo].[MemberLanguages] ([Id], [MemberId], [LanguageId]) VALUES (11, 11, 0)
GO
INSERT [dbo].[MemberLanguages] ([Id], [MemberId], [LanguageId]) VALUES (12, 18, 0)
GO
INSERT [dbo].[MemberLanguages] ([Id], [MemberId], [LanguageId]) VALUES (13, 19, 0)
GO
INSERT [dbo].[MemberLanguages] ([Id], [MemberId], [LanguageId]) VALUES (14, 15, 0)
GO
INSERT [dbo].[MemberLanguages] ([Id], [MemberId], [LanguageId]) VALUES (15, 21, 0)
GO
INSERT [dbo].[MemberLanguages] ([Id], [MemberId], [LanguageId]) VALUES (16, 23, 0)
GO
INSERT [dbo].[MemberLanguages] ([Id], [MemberId], [LanguageId]) VALUES (10010, 0, 1)
GO
INSERT [dbo].[MemberLanguages] ([Id], [MemberId], [LanguageId]) VALUES (10011, 29, 1)
GO
INSERT [dbo].[MemberLanguages] ([Id], [MemberId], [LanguageId]) VALUES (20010, 36, 1001)
GO
INSERT [dbo].[MemberLanguages] ([Id], [MemberId], [LanguageId]) VALUES (20011, 44, 1)
GO
SET IDENTITY_INSERT [dbo].[MemberLanguages] OFF
GO
SET IDENTITY_INSERT [dbo].[MemberLifeStyle] ON 
GO
INSERT [dbo].[MemberLifeStyle] ([Id], [MemberId], [SmokingHabit], [Interests], [Hobbies]) VALUES (9, 10, N'Non Smoker', N'Cricket,Snooker', N'Cricket,Snooker')
GO
INSERT [dbo].[MemberLifeStyle] ([Id], [MemberId], [SmokingHabit], [Interests], [Hobbies]) VALUES (10, 11, N'Non Smoker', NULL, NULL)
GO
INSERT [dbo].[MemberLifeStyle] ([Id], [MemberId], [SmokingHabit], [Interests], [Hobbies]) VALUES (11, 18, N'Non Smoker', N'Cricket ', N'Snooker')
GO
INSERT [dbo].[MemberLifeStyle] ([Id], [MemberId], [SmokingHabit], [Interests], [Hobbies]) VALUES (12, 19, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberLifeStyle] ([Id], [MemberId], [SmokingHabit], [Interests], [Hobbies]) VALUES (13, 15, N'Light/Social Smoker', NULL, NULL)
GO
INSERT [dbo].[MemberLifeStyle] ([Id], [MemberId], [SmokingHabit], [Interests], [Hobbies]) VALUES (14, 21, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberLifeStyle] ([Id], [MemberId], [SmokingHabit], [Interests], [Hobbies]) VALUES (15, 23, N'Non Smoker', N'it', N'hockey')
GO
INSERT [dbo].[MemberLifeStyle] ([Id], [MemberId], [SmokingHabit], [Interests], [Hobbies]) VALUES (10009, 0, N'Non Smoker', N'Watching movies', N'Playing games')
GO
INSERT [dbo].[MemberLifeStyle] ([Id], [MemberId], [SmokingHabit], [Interests], [Hobbies]) VALUES (10010, 29, N'Non Smoker', N'', N'')
GO
INSERT [dbo].[MemberLifeStyle] ([Id], [MemberId], [SmokingHabit], [Interests], [Hobbies]) VALUES (20009, 36, N'Non Smoker', N'Test Intrest', N'Test Hobies')
GO
INSERT [dbo].[MemberLifeStyle] ([Id], [MemberId], [SmokingHabit], [Interests], [Hobbies]) VALUES (20010, 44, N'Non Smoker', N'Test intrest', N'Test Hobies')
GO
SET IDENTITY_INSERT [dbo].[MemberLifeStyle] OFF
GO
SET IDENTITY_INSERT [dbo].[MemberLikeDislike] ON 
GO
INSERT [dbo].[MemberLikeDislike] ([Id], [IsLike], [MemberId], [ResponseToMemberId]) VALUES (1, 1, 15, 20)
GO
INSERT [dbo].[MemberLikeDislike] ([Id], [IsLike], [MemberId], [ResponseToMemberId]) VALUES (2, 0, 15, 19)
GO
INSERT [dbo].[MemberLikeDislike] ([Id], [IsLike], [MemberId], [ResponseToMemberId]) VALUES (3, 1, 15, 18)
GO
INSERT [dbo].[MemberLikeDislike] ([Id], [IsLike], [MemberId], [ResponseToMemberId]) VALUES (4, 1, 23, 12)
GO
INSERT [dbo].[MemberLikeDislike] ([Id], [IsLike], [MemberId], [ResponseToMemberId]) VALUES (5, 1, 23, 22)
GO
INSERT [dbo].[MemberLikeDislike] ([Id], [IsLike], [MemberId], [ResponseToMemberId]) VALUES (6, 0, 19, 14)
GO
INSERT [dbo].[MemberLikeDislike] ([Id], [IsLike], [MemberId], [ResponseToMemberId]) VALUES (7, 1, 27, 12)
GO
SET IDENTITY_INSERT [dbo].[MemberLikeDislike] OFF
GO
SET IDENTITY_INSERT [dbo].[MemberLocationDetail] ON 
GO
INSERT [dbo].[MemberLocationDetail] ([Id], [MemberId], [CountryLivingIn], [PlaceOfBirth], [ResidingState], [ResidingCity], [Citizenship]) VALUES (9, 10, 2, N'Menhais', N'4', N'', 2)
GO
INSERT [dbo].[MemberLocationDetail] ([Id], [MemberId], [CountryLivingIn], [PlaceOfBirth], [ResidingState], [ResidingCity], [Citizenship]) VALUES (10, 11, 2, N'23-07', N'20', N'6', 2)
GO
INSERT [dbo].[MemberLocationDetail] ([Id], [MemberId], [CountryLivingIn], [PlaceOfBirth], [ResidingState], [ResidingCity], [Citizenship]) VALUES (11, 9, 2, N'Pakistan', N'20', N'6', 2)
GO
INSERT [dbo].[MemberLocationDetail] ([Id], [MemberId], [CountryLivingIn], [PlaceOfBirth], [ResidingState], [ResidingCity], [Citizenship]) VALUES (12, 13, 2, N'GRW', N'20', N'6', 2)
GO
INSERT [dbo].[MemberLocationDetail] ([Id], [MemberId], [CountryLivingIn], [PlaceOfBirth], [ResidingState], [ResidingCity], [Citizenship]) VALUES (13, 15, 4, N'Gujranwala', N'37', N'8', NULL)
GO
INSERT [dbo].[MemberLocationDetail] ([Id], [MemberId], [CountryLivingIn], [PlaceOfBirth], [ResidingState], [ResidingCity], [Citizenship]) VALUES (14, 18, 2, N'Punjab', N'20', N'6', 2)
GO
INSERT [dbo].[MemberLocationDetail] ([Id], [MemberId], [CountryLivingIn], [PlaceOfBirth], [ResidingState], [ResidingCity], [Citizenship]) VALUES (15, 19, 2, N'1/1/1985', N'20', N'6', NULL)
GO
INSERT [dbo].[MemberLocationDetail] ([Id], [MemberId], [CountryLivingIn], [PlaceOfBirth], [ResidingState], [ResidingCity], [Citizenship]) VALUES (16, 21, 4, N'Mhasla', NULL, NULL, NULL)
GO
INSERT [dbo].[MemberLocationDetail] ([Id], [MemberId], [CountryLivingIn], [PlaceOfBirth], [ResidingState], [ResidingCity], [Citizenship]) VALUES (17, 23, 4, N'gujranwala', N'37', N'8', NULL)
GO
INSERT [dbo].[MemberLocationDetail] ([Id], [MemberId], [CountryLivingIn], [PlaceOfBirth], [ResidingState], [ResidingCity], [Citizenship]) VALUES (18, 29, 163, N'Mukhtar colony', N'', N'', 163)
GO
INSERT [dbo].[MemberLocationDetail] ([Id], [MemberId], [CountryLivingIn], [PlaceOfBirth], [ResidingState], [ResidingCity], [Citizenship]) VALUES (10018, 36, 163, N'Gujranwala', N'4', N'2', 163)
GO
INSERT [dbo].[MemberLocationDetail] ([Id], [MemberId], [CountryLivingIn], [PlaceOfBirth], [ResidingState], [ResidingCity], [Citizenship]) VALUES (10019, 44, 163, N'Gujranwala', N'4', N'2', 163)
GO
SET IDENTITY_INSERT [dbo].[MemberLocationDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[MemberLoginDetail] ON 
GO
INSERT [dbo].[MemberLoginDetail] ([Id], [MemberId], [Email], [Password], [IsEmailConfirmed], [ConfirmationCode], [IsActive], [IsFirstLoginAttempt], [IsMobileUser], [FirebaseUserId]) VALUES (10049, 9, N'eastflicker@gmail.com', N'k3kKYF2WehZZqrW6WOm9SFf+Yh4IDmQP2AcY+hdyLRs=', 1, N'rrhx6g7DsrnOYU9s', 1, 0, 0, N'I607oX8r91evXT070k3NaCF5g7y2')
GO
INSERT [dbo].[MemberLoginDetail] ([Id], [MemberId], [Email], [Password], [IsEmailConfirmed], [ConfirmationCode], [IsActive], [IsFirstLoginAttempt], [IsMobileUser], [FirebaseUserId]) VALUES (10051, 11, N'muju999@gmail.com', N'LsfObGDwuAfuH8QAXuEZnXklvwfhs5C0OmUS8ZWux4c=', 1, N'9QrF9ulz2nY8FY3F', 1, 0, 0, N'ClmC3xbqxaY1X5Fs43W2VCyJ5wz2')
GO
INSERT [dbo].[MemberLoginDetail] ([Id], [MemberId], [Email], [Password], [IsEmailConfirmed], [ConfirmationCode], [IsActive], [IsFirstLoginAttempt], [IsMobileUser], [FirebaseUserId]) VALUES (10052, 12, N'madihagharade8@gmail.com', N'JzdOivjK3CHOcDeVzMNApflZuRLWxgsWVmJICSoMWOY=', 1, N'TLeMt6r6BkS9t9vQ', 1, 1, 0, N'gBtTXJ4HRoSJAUZ4UYFpo9YRHDF3')
GO
INSERT [dbo].[MemberLoginDetail] ([Id], [MemberId], [Email], [Password], [IsEmailConfirmed], [ConfirmationCode], [IsActive], [IsFirstLoginAttempt], [IsMobileUser], [FirebaseUserId]) VALUES (10054, 14, N'apexbiz45@gmail.com', N'cC6FQ8fGAL+fWNDmETUGtw==', 1, N'0vMZveDljW1YkRR9', 1, 1, 0, N'1DYFKFJmrhSGpvMdK3KZ4DyspdE3')
GO
INSERT [dbo].[MemberLoginDetail] ([Id], [MemberId], [Email], [Password], [IsEmailConfirmed], [ConfirmationCode], [IsActive], [IsFirstLoginAttempt], [IsMobileUser], [FirebaseUserId]) VALUES (10055, 15, N'hassnain.ali.13100@gmail.com', N'cC6FQ8fGAL+fWNDmETUGtw==', 1, N'Fj1Lqkkfdzj5FpND', 1, 0, 1, N'pU0KwU1ccshIql0vGXCLdQk90wH2')
GO
INSERT [dbo].[MemberLoginDetail] ([Id], [MemberId], [Email], [Password], [IsEmailConfirmed], [ConfirmationCode], [IsActive], [IsFirstLoginAttempt], [IsMobileUser], [FirebaseUserId]) VALUES (10057, 17, N'zainasghar000@hotmail.com', N'X+kzVnGRT0ERwafAjtFJVsUcSDCSFrame/GK31bXunM=', 1, N'MNL2RNb7JmkoBTqr', 1, 0, 1, N'9EUkDNRWQId7PP2paQ482ijYyiP2')
GO
INSERT [dbo].[MemberLoginDetail] ([Id], [MemberId], [Email], [Password], [IsEmailConfirmed], [ConfirmationCode], [IsActive], [IsFirstLoginAttempt], [IsMobileUser], [FirebaseUserId]) VALUES (10058, 18, N'azeemurrehman1996@gmail.com', N'OkU2iLsmFBnPLoCfQCmmXw/OMlif1u9/w/LE599NlCdQs01o96zuc3g6U379ObrCDwXnT59h+IWcuperkRxutQ==', 1, N'4GK8Q2aouHShiEFE', 1, 0, 0, N'V2rykhVS5zQCzzkKeIOFrl6KW9p2')
GO
INSERT [dbo].[MemberLoginDetail] ([Id], [MemberId], [Email], [Password], [IsEmailConfirmed], [ConfirmationCode], [IsActive], [IsFirstLoginAttempt], [IsMobileUser], [FirebaseUserId]) VALUES (10059, 19, N'gharjode2010@gmail.com', N'MsuolsFz3uBUbcx02Idclpwhmw1uZHwqlIO2UsJ12Bw=', 1, N'fDj6nu1LgcXuogow', 1, 0, 1, N'y1eZukGqGzPiCADrASxuPLZaUsm1')
GO
INSERT [dbo].[MemberLoginDetail] ([Id], [MemberId], [Email], [Password], [IsEmailConfirmed], [ConfirmationCode], [IsActive], [IsFirstLoginAttempt], [IsMobileUser], [FirebaseUserId]) VALUES (10060, 20, N'ronaldoskills@gmail.com', N'FWwyFhHare/cZFMdJvgberRId+aiN4xRm67ZKsH2HCY=', 0, N'ykbi649GQg9k1Xbw', 0, 1, 1, N'biPxlOFauHOOmW9Y8NkteV7s14u1')
GO
INSERT [dbo].[MemberLoginDetail] ([Id], [MemberId], [Email], [Password], [IsEmailConfirmed], [ConfirmationCode], [IsActive], [IsFirstLoginAttempt], [IsMobileUser], [FirebaseUserId]) VALUES (10061, 21, N'keyinfo.edu@gmail.com', N'MsuolsFz3uBUbcx02Idclpwhmw1uZHwqlIO2UsJ12Bw=', 1, N'5NIWg5jP5KA9oooY', 1, 0, 1, N'ltIc0RKAmmXIh6A8y12G8WFZc863')
GO
INSERT [dbo].[MemberLoginDetail] ([Id], [MemberId], [Email], [Password], [IsEmailConfirmed], [ConfirmationCode], [IsActive], [IsFirstLoginAttempt], [IsMobileUser], [FirebaseUserId]) VALUES (10063, 23, N'abrar.ahmad0331@gmail.com', N'Msym8Cf2YTkD+zFLrbTkHCsRT6rjw8SlL/LFM/SKPyQ=', 1, N'D2qqgzKADfiOuHG9', 1, 0, 1, N'Z8a7Cfb5X5P3GavDnTAGFymgihJ2')
GO
INSERT [dbo].[MemberLoginDetail] ([Id], [MemberId], [Email], [Password], [IsEmailConfirmed], [ConfirmationCode], [IsActive], [IsFirstLoginAttempt], [IsMobileUser], [FirebaseUserId]) VALUES (10064, 24, N'zainasghar000@gmail.com', N'X+kzVnGRT0ERwafAjtFJVsUcSDCSFrame/GK31bXunM=', 1, N'0AWVGpbSO7gbMDPH', 1, 0, 1, N'xdm3M9G1kpXw2eNwGtazWrgem8h1')
GO
INSERT [dbo].[MemberLoginDetail] ([Id], [MemberId], [Email], [Password], [IsEmailConfirmed], [ConfirmationCode], [IsActive], [IsFirstLoginAttempt], [IsMobileUser], [FirebaseUserId]) VALUES (10065, 25, N'mughalraza28@gmail.com', N'7dkt+1ZgvZaCNlYx8hewQQ==', 0, N'0yD8ozsJEtCwqlkG', 0, 1, 1, N'6HhhbVrQ0PbavrRlPxRMjFYfnpi2')
GO
INSERT [dbo].[MemberLoginDetail] ([Id], [MemberId], [Email], [Password], [IsEmailConfirmed], [ConfirmationCode], [IsActive], [IsFirstLoginAttempt], [IsMobileUser], [FirebaseUserId]) VALUES (10066, 26, N'aye.attitude@gmail.com', N'EgnJzrEKJ6C9jwL6j4VhglzPV+0/6MeQYXhfvuPr8Wk=', 0, N'mtH3LfVhkRsLBy2U', 0, 1, 1, N'ZZjV5mrKePMXfARIoVDpluWcynF3')
GO
INSERT [dbo].[MemberLoginDetail] ([Id], [MemberId], [Email], [Password], [IsEmailConfirmed], [ConfirmationCode], [IsActive], [IsFirstLoginAttempt], [IsMobileUser], [FirebaseUserId]) VALUES (10067, 27, N'subhanzafar531@gmail.com', N'V6JIA/4Xxgc07ELxvF5Siw==', 1, N'fh4ZvUbDyeyYr4iT', 1, 0, 1, N'm7swwjxKfWcpwqpMSz0zy7BXxJ03')
GO
INSERT [dbo].[MemberLoginDetail] ([Id], [MemberId], [Email], [Password], [IsEmailConfirmed], [ConfirmationCode], [IsActive], [IsFirstLoginAttempt], [IsMobileUser], [FirebaseUserId]) VALUES (10068, 28, N'gharademadiha@gmail.com', N'JzdOivjK3CHOcDeVzMNApQShAcLH6ojl22+uUB6Mq0A=', 0, N'pawxyaqpPXI56eTl', 0, 1, 1, N'ubY4o7fUQ1XAEvEMRqf4NeUqKVF2')
GO
INSERT [dbo].[MemberLoginDetail] ([Id], [MemberId], [Email], [Password], [IsEmailConfirmed], [ConfirmationCode], [IsActive], [IsFirstLoginAttempt], [IsMobileUser], [FirebaseUserId]) VALUES (20070, 31, N'ahmadramzan@gmail.com', N'Z6VRscgsMeacItvJJmD6kSGkNTny4n9woEfCkSb9L9Y=', 0, N'RlAqGppi6vc2wQ56', 1, 1, 0, NULL)
GO
INSERT [dbo].[MemberLoginDetail] ([Id], [MemberId], [Email], [Password], [IsEmailConfirmed], [ConfirmationCode], [IsActive], [IsFirstLoginAttempt], [IsMobileUser], [FirebaseUserId]) VALUES (20073, 34, N'awaisramzan@gmail.com', N'2N5ttI+EjtfqD0POKKr/+d3n/kxyf3O/yK3AwNQtshQ=', 0, N'NhbYwZbCMUduNQUa', 0, 1, 0, NULL)
GO
INSERT [dbo].[MemberLoginDetail] ([Id], [MemberId], [Email], [Password], [IsEmailConfirmed], [ConfirmationCode], [IsActive], [IsFirstLoginAttempt], [IsMobileUser], [FirebaseUserId]) VALUES (20074, 35, N'awais.ramzan@gmail.com', N'2N5ttI+EjtfqD0POKKr/+d3n/kxyf3O/yK3AwNQtshQ=', 1, N'bu5V0x5mtKGNUKE9', 1, 0, 0, NULL)
GO
INSERT [dbo].[MemberLoginDetail] ([Id], [MemberId], [Email], [Password], [IsEmailConfirmed], [ConfirmationCode], [IsActive], [IsFirstLoginAttempt], [IsMobileUser], [FirebaseUserId]) VALUES (20075, 36, N'mubeenraza123@gmail.com', N'2N5ttI+EjtfqD0POKKr/+d3n/kxyf3O/yK3AwNQtshQ=', 1, N'ArxhipfpL4ACT3JU', 1, 0, 0, NULL)
GO
INSERT [dbo].[MemberLoginDetail] ([Id], [MemberId], [Email], [Password], [IsEmailConfirmed], [ConfirmationCode], [IsActive], [IsFirstLoginAttempt], [IsMobileUser], [FirebaseUserId]) VALUES (20083, 44, N'awais.ramzan.ar@gmail.com', N'2N5ttI+EjtfqD0POKKr/+XxWF4Z+ClLfwobx7qlFarA=', 1, N'PBoH7wLZZHjqlDJE', 1, 0, 0, NULL)
GO
INSERT [dbo].[MemberLoginDetail] ([Id], [MemberId], [Email], [Password], [IsEmailConfirmed], [ConfirmationCode], [IsActive], [IsFirstLoginAttempt], [IsMobileUser], [FirebaseUserId]) VALUES (20084, 45, N'adeel.rehman@gmail.com', N'2N5ttI+EjtfqD0POKKr/+d3n/kxyf3O/yK3AwNQtshQ=', 0, N'kEICH9U3iQGyCjPb', 0, 1, 0, NULL)
GO
INSERT [dbo].[MemberLoginDetail] ([Id], [MemberId], [Email], [Password], [IsEmailConfirmed], [ConfirmationCode], [IsActive], [IsFirstLoginAttempt], [IsMobileUser], [FirebaseUserId]) VALUES (30084, 10045, N'awais.ar@gmail.com', N'2N5ttI+EjtfqD0POKKr/+d3n/kxyf3O/yK3AwNQtshQ=', 1, N'piEd7L0qgjIcRvfK', 1, 0, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[MemberLoginDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[MemberPackageConfirmPayment] ON 
GO
INSERT [dbo].[MemberPackageConfirmPayment] ([Id], [PackageSubscriptionId], [PaymentType], [PaymentOptionId], [PaymentDate], [PaymentAmount], [DepositSlip], [IsMobilePic]) VALUES (21, NULL, N'Mobile Payment', 4, CAST(N'2020-10-05T00:00:00.000' AS DateTime), CAST(1200.00 AS Decimal(18, 2)), NULL, NULL)
GO
INSERT [dbo].[MemberPackageConfirmPayment] ([Id], [PackageSubscriptionId], [PaymentType], [PaymentOptionId], [PaymentDate], [PaymentAmount], [DepositSlip], [IsMobilePic]) VALUES (22, 42, N'Bank Transfer', 5, CAST(N'2020-11-03T00:00:00.000' AS DateTime), CAST(300.00 AS Decimal(18, 2)), N'03-11-2020-06-236373996343466646450.txt', NULL)
GO
INSERT [dbo].[MemberPackageConfirmPayment] ([Id], [PackageSubscriptionId], [PaymentType], [PaymentOptionId], [PaymentDate], [PaymentAmount], [DepositSlip], [IsMobilePic]) VALUES (23, 48, N'Bank Transfer', 5, CAST(N'2020-11-07T00:00:00.000' AS DateTime), CAST(100.00 AS Decimal(18, 2)), N'07-11-2020-11-246374032704866765730.jpeg', NULL)
GO
INSERT [dbo].[MemberPackageConfirmPayment] ([Id], [PackageSubscriptionId], [PaymentType], [PaymentOptionId], [PaymentDate], [PaymentAmount], [DepositSlip], [IsMobilePic]) VALUES (24, 49, N'Bank Transfer', 5, CAST(N'2020-11-07T00:00:00.000' AS DateTime), CAST(1500.00 AS Decimal(18, 2)), N'07-11-2020-13-556374033612313104760.jpg', NULL)
GO
INSERT [dbo].[MemberPackageConfirmPayment] ([Id], [PackageSubscriptionId], [PaymentType], [PaymentOptionId], [PaymentDate], [PaymentAmount], [DepositSlip], [IsMobilePic]) VALUES (25, 53, N'Bank Transfer', 5, CAST(N'2020-11-15T00:00:00.000' AS DateTime), CAST(1500.00 AS Decimal(18, 2)), N'15-11-2020-08-376374100822111902710.jpg', NULL)
GO
INSERT [dbo].[MemberPackageConfirmPayment] ([Id], [PackageSubscriptionId], [PaymentType], [PaymentOptionId], [PaymentDate], [PaymentAmount], [DepositSlip], [IsMobilePic]) VALUES (26, 56, NULL, 5, NULL, CAST(5.00 AS Decimal(18, 2)), N'', 1)
GO
INSERT [dbo].[MemberPackageConfirmPayment] ([Id], [PackageSubscriptionId], [PaymentType], [PaymentOptionId], [PaymentDate], [PaymentAmount], [DepositSlip], [IsMobilePic]) VALUES (27, 57, N'Bank Transfer', 5, CAST(N'2020-11-20T00:00:00.000' AS DateTime), CAST(18.00 AS Decimal(18, 2)), N'21-11-2020-06-576374152065657302360.jpg', 0)
GO
SET IDENTITY_INSERT [dbo].[MemberPackageConfirmPayment] OFF
GO
SET IDENTITY_INSERT [dbo].[MemberPackagePayment] ON 
GO
INSERT [dbo].[MemberPackagePayment] ([Id], [MemberPackageSubscriptionId], [TransactionId], [PayerId], [Amount], [TransactionDate], [Status], [PaymentType], [PaymentOptionId]) VALUES (27, 35, NULL, NULL, CAST(1200.00 AS Decimal(18, 2)), NULL, N'Canceled', N'Paypal', NULL)
GO
INSERT [dbo].[MemberPackagePayment] ([Id], [MemberPackageSubscriptionId], [TransactionId], [PayerId], [Amount], [TransactionDate], [Status], [PaymentType], [PaymentOptionId]) VALUES (28, 36, NULL, NULL, CAST(3000.00 AS Decimal(18, 2)), NULL, N'Pending', N'Bank Transfer', NULL)
GO
INSERT [dbo].[MemberPackagePayment] ([Id], [MemberPackageSubscriptionId], [TransactionId], [PayerId], [Amount], [TransactionDate], [Status], [PaymentType], [PaymentOptionId]) VALUES (29, 37, NULL, NULL, CAST(1200.00 AS Decimal(18, 2)), NULL, N'Pending', N'Bank Transfer', NULL)
GO
INSERT [dbo].[MemberPackagePayment] ([Id], [MemberPackageSubscriptionId], [TransactionId], [PayerId], [Amount], [TransactionDate], [Status], [PaymentType], [PaymentOptionId]) VALUES (30, 38, NULL, NULL, CAST(1.00 AS Decimal(18, 2)), NULL, N'Pending', N'Paypal', NULL)
GO
INSERT [dbo].[MemberPackagePayment] ([Id], [MemberPackageSubscriptionId], [TransactionId], [PayerId], [Amount], [TransactionDate], [Status], [PaymentType], [PaymentOptionId]) VALUES (31, 39, NULL, NULL, CAST(1500.00 AS Decimal(18, 2)), NULL, N'Pending', N'Bank Transfer', NULL)
GO
INSERT [dbo].[MemberPackagePayment] ([Id], [MemberPackageSubscriptionId], [TransactionId], [PayerId], [Amount], [TransactionDate], [Status], [PaymentType], [PaymentOptionId]) VALUES (32, 40, NULL, NULL, CAST(1.00 AS Decimal(18, 2)), NULL, N'Pending', N'Bank Transfer', NULL)
GO
INSERT [dbo].[MemberPackagePayment] ([Id], [MemberPackageSubscriptionId], [TransactionId], [PayerId], [Amount], [TransactionDate], [Status], [PaymentType], [PaymentOptionId]) VALUES (33, 41, NULL, NULL, CAST(1.00 AS Decimal(18, 2)), NULL, N'Pending', N'Bank Transfer', NULL)
GO
INSERT [dbo].[MemberPackagePayment] ([Id], [MemberPackageSubscriptionId], [TransactionId], [PayerId], [Amount], [TransactionDate], [Status], [PaymentType], [PaymentOptionId]) VALUES (34, 42, NULL, NULL, CAST(1.00 AS Decimal(18, 2)), NULL, N'Pending', N'Bank Transfer', NULL)
GO
INSERT [dbo].[MemberPackagePayment] ([Id], [MemberPackageSubscriptionId], [TransactionId], [PayerId], [Amount], [TransactionDate], [Status], [PaymentType], [PaymentOptionId]) VALUES (35, 43, NULL, NULL, CAST(1.00 AS Decimal(18, 2)), NULL, N'Pending', N'Bank Transfer', NULL)
GO
INSERT [dbo].[MemberPackagePayment] ([Id], [MemberPackageSubscriptionId], [TransactionId], [PayerId], [Amount], [TransactionDate], [Status], [PaymentType], [PaymentOptionId]) VALUES (36, 44, NULL, NULL, CAST(1.00 AS Decimal(18, 2)), NULL, N'Pending', N'Bank Transfer', NULL)
GO
INSERT [dbo].[MemberPackagePayment] ([Id], [MemberPackageSubscriptionId], [TransactionId], [PayerId], [Amount], [TransactionDate], [Status], [PaymentType], [PaymentOptionId]) VALUES (37, 45, NULL, NULL, CAST(1.00 AS Decimal(18, 2)), NULL, N'Pending', N'Bank Transfer', NULL)
GO
INSERT [dbo].[MemberPackagePayment] ([Id], [MemberPackageSubscriptionId], [TransactionId], [PayerId], [Amount], [TransactionDate], [Status], [PaymentType], [PaymentOptionId]) VALUES (38, 46, NULL, NULL, CAST(1.00 AS Decimal(18, 2)), NULL, N'Pending', N'Bank Transfer', NULL)
GO
INSERT [dbo].[MemberPackagePayment] ([Id], [MemberPackageSubscriptionId], [TransactionId], [PayerId], [Amount], [TransactionDate], [Status], [PaymentType], [PaymentOptionId]) VALUES (39, 47, NULL, NULL, CAST(1.00 AS Decimal(18, 2)), NULL, N'Pending', N'Bank Transfer', NULL)
GO
INSERT [dbo].[MemberPackagePayment] ([Id], [MemberPackageSubscriptionId], [TransactionId], [PayerId], [Amount], [TransactionDate], [Status], [PaymentType], [PaymentOptionId]) VALUES (40, 48, NULL, NULL, CAST(1.00 AS Decimal(18, 2)), NULL, N'Pending', N'Bank Transfer', NULL)
GO
INSERT [dbo].[MemberPackagePayment] ([Id], [MemberPackageSubscriptionId], [TransactionId], [PayerId], [Amount], [TransactionDate], [Status], [PaymentType], [PaymentOptionId]) VALUES (41, 49, NULL, NULL, CAST(1500.00 AS Decimal(18, 2)), NULL, N'Pending', N'Bank Transfer', NULL)
GO
INSERT [dbo].[MemberPackagePayment] ([Id], [MemberPackageSubscriptionId], [TransactionId], [PayerId], [Amount], [TransactionDate], [Status], [PaymentType], [PaymentOptionId]) VALUES (42, 50, NULL, NULL, CAST(1500.00 AS Decimal(18, 2)), NULL, N'Pending', N'Bank Transfer', NULL)
GO
INSERT [dbo].[MemberPackagePayment] ([Id], [MemberPackageSubscriptionId], [TransactionId], [PayerId], [Amount], [TransactionDate], [Status], [PaymentType], [PaymentOptionId]) VALUES (43, 51, NULL, NULL, CAST(1.00 AS Decimal(18, 2)), NULL, N'Pending', N'Paypal', NULL)
GO
INSERT [dbo].[MemberPackagePayment] ([Id], [MemberPackageSubscriptionId], [TransactionId], [PayerId], [Amount], [TransactionDate], [Status], [PaymentType], [PaymentOptionId]) VALUES (44, 52, NULL, NULL, CAST(1500.00 AS Decimal(18, 2)), NULL, N'Pending', N'Paypal', NULL)
GO
INSERT [dbo].[MemberPackagePayment] ([Id], [MemberPackageSubscriptionId], [TransactionId], [PayerId], [Amount], [TransactionDate], [Status], [PaymentType], [PaymentOptionId]) VALUES (45, 53, NULL, NULL, CAST(1500.00 AS Decimal(18, 2)), NULL, N'Pending', N'Bank Transfer', NULL)
GO
INSERT [dbo].[MemberPackagePayment] ([Id], [MemberPackageSubscriptionId], [TransactionId], [PayerId], [Amount], [TransactionDate], [Status], [PaymentType], [PaymentOptionId]) VALUES (46, 54, NULL, NULL, CAST(1.00 AS Decimal(18, 2)), NULL, N'Pending', N'Paypal', NULL)
GO
INSERT [dbo].[MemberPackagePayment] ([Id], [MemberPackageSubscriptionId], [TransactionId], [PayerId], [Amount], [TransactionDate], [Status], [PaymentType], [PaymentOptionId]) VALUES (47, 55, NULL, NULL, CAST(1.00 AS Decimal(18, 2)), NULL, N'Canceled', N'Paypal', NULL)
GO
INSERT [dbo].[MemberPackagePayment] ([Id], [MemberPackageSubscriptionId], [TransactionId], [PayerId], [Amount], [TransactionDate], [Status], [PaymentType], [PaymentOptionId]) VALUES (48, 56, NULL, NULL, CAST(5.00 AS Decimal(18, 2)), NULL, N'Pending', N'Bank Transfer', NULL)
GO
INSERT [dbo].[MemberPackagePayment] ([Id], [MemberPackageSubscriptionId], [TransactionId], [PayerId], [Amount], [TransactionDate], [Status], [PaymentType], [PaymentOptionId]) VALUES (49, 57, NULL, NULL, CAST(18.00 AS Decimal(18, 2)), NULL, N'Pending', N'Bank Transfer', NULL)
GO
SET IDENTITY_INSERT [dbo].[MemberPackagePayment] OFF
GO
SET IDENTITY_INSERT [dbo].[MemberPackageSubscription] ON 
GO
INSERT [dbo].[MemberPackageSubscription] ([Id], [MemberId], [PackagePricingPlanId], [SubscriptionStartDate], [SubscriptionEndDate], [IsActive], [PackageAmount]) VALUES (35, 9, 10021, CAST(N'2020-10-06T15:11:28.220' AS DateTime), CAST(N'2021-01-06T15:11:28.220' AS DateTime), 0, CAST(1200.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[MemberPackageSubscription] ([Id], [MemberId], [PackagePricingPlanId], [SubscriptionStartDate], [SubscriptionEndDate], [IsActive], [PackageAmount]) VALUES (36, 10, 10023, CAST(N'2020-10-08T17:52:07.013' AS DateTime), CAST(N'2021-10-08T17:52:07.013' AS DateTime), 0, CAST(3000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[MemberPackageSubscription] ([Id], [MemberId], [PackagePricingPlanId], [SubscriptionStartDate], [SubscriptionEndDate], [IsActive], [PackageAmount]) VALUES (37, 13, 10021, CAST(N'2020-10-08T20:35:13.597' AS DateTime), CAST(N'2021-01-08T20:35:13.597' AS DateTime), 0, CAST(1200.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[MemberPackageSubscription] ([Id], [MemberId], [PackagePricingPlanId], [SubscriptionStartDate], [SubscriptionEndDate], [IsActive], [PackageAmount]) VALUES (38, 11, 10021, CAST(N'2020-10-10T19:45:49.720' AS DateTime), CAST(N'2021-01-10T19:45:49.720' AS DateTime), 0, CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[MemberPackageSubscription] ([Id], [MemberId], [PackagePricingPlanId], [SubscriptionStartDate], [SubscriptionEndDate], [IsActive], [PackageAmount]) VALUES (39, 11, 10024, CAST(N'2020-10-10T19:50:29.033' AS DateTime), CAST(N'2021-01-10T19:50:29.033' AS DateTime), 0, CAST(1500.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[MemberPackageSubscription] ([Id], [MemberId], [PackagePricingPlanId], [SubscriptionStartDate], [SubscriptionEndDate], [IsActive], [PackageAmount]) VALUES (40, 17, 10021, CAST(N'2020-10-31T06:51:27.267' AS DateTime), CAST(N'2021-01-31T06:51:27.267' AS DateTime), 0, CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[MemberPackageSubscription] ([Id], [MemberId], [PackagePricingPlanId], [SubscriptionStartDate], [SubscriptionEndDate], [IsActive], [PackageAmount]) VALUES (41, 21, 10021, CAST(N'2020-11-03T05:58:27.470' AS DateTime), CAST(N'2021-02-03T05:58:27.470' AS DateTime), 0, CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[MemberPackageSubscription] ([Id], [MemberId], [PackagePricingPlanId], [SubscriptionStartDate], [SubscriptionEndDate], [IsActive], [PackageAmount]) VALUES (42, 11, 10021, CAST(N'2020-11-03T11:22:59.243' AS DateTime), CAST(N'2021-02-03T11:22:59.243' AS DateTime), 0, CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[MemberPackageSubscription] ([Id], [MemberId], [PackagePricingPlanId], [SubscriptionStartDate], [SubscriptionEndDate], [IsActive], [PackageAmount]) VALUES (43, 22, 10021, CAST(N'2020-11-04T15:21:19.317' AS DateTime), CAST(N'2021-02-04T15:21:19.317' AS DateTime), 0, CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[MemberPackageSubscription] ([Id], [MemberId], [PackagePricingPlanId], [SubscriptionStartDate], [SubscriptionEndDate], [IsActive], [PackageAmount]) VALUES (44, 15, 10021, CAST(N'2020-11-04T15:21:37.133' AS DateTime), CAST(N'2021-02-04T15:21:37.133' AS DateTime), 0, CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[MemberPackageSubscription] ([Id], [MemberId], [PackagePricingPlanId], [SubscriptionStartDate], [SubscriptionEndDate], [IsActive], [PackageAmount]) VALUES (45, 22, 10021, CAST(N'2020-11-04T15:22:55.680' AS DateTime), CAST(N'2021-02-04T15:22:55.680' AS DateTime), 0, CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[MemberPackageSubscription] ([Id], [MemberId], [PackagePricingPlanId], [SubscriptionStartDate], [SubscriptionEndDate], [IsActive], [PackageAmount]) VALUES (46, 19, 10021, CAST(N'2020-11-07T06:43:59.450' AS DateTime), CAST(N'2021-02-07T06:43:59.450' AS DateTime), 0, CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[MemberPackageSubscription] ([Id], [MemberId], [PackagePricingPlanId], [SubscriptionStartDate], [SubscriptionEndDate], [IsActive], [PackageAmount]) VALUES (47, 18, 10021, CAST(N'2020-11-07T08:36:13.947' AS DateTime), CAST(N'2021-02-07T08:36:13.947' AS DateTime), 0, CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[MemberPackageSubscription] ([Id], [MemberId], [PackagePricingPlanId], [SubscriptionStartDate], [SubscriptionEndDate], [IsActive], [PackageAmount]) VALUES (48, 19, 10021, CAST(N'2020-11-07T16:22:58.440' AS DateTime), CAST(N'2021-02-07T16:22:58.440' AS DateTime), 0, CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[MemberPackageSubscription] ([Id], [MemberId], [PackagePricingPlanId], [SubscriptionStartDate], [SubscriptionEndDate], [IsActive], [PackageAmount]) VALUES (49, 19, 10024, CAST(N'2020-11-07T18:53:06.337' AS DateTime), CAST(N'2021-02-07T18:53:06.337' AS DateTime), 0, CAST(1500.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[MemberPackageSubscription] ([Id], [MemberId], [PackagePricingPlanId], [SubscriptionStartDate], [SubscriptionEndDate], [IsActive], [PackageAmount]) VALUES (50, 9, 10024, CAST(N'2020-11-12T14:59:30.810' AS DateTime), CAST(N'2021-02-12T14:59:30.810' AS DateTime), 0, CAST(1500.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[MemberPackageSubscription] ([Id], [MemberId], [PackagePricingPlanId], [SubscriptionStartDate], [SubscriptionEndDate], [IsActive], [PackageAmount]) VALUES (51, 9, 10021, CAST(N'2020-11-12T15:30:14.857' AS DateTime), CAST(N'2021-02-12T15:30:14.857' AS DateTime), 0, CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[MemberPackageSubscription] ([Id], [MemberId], [PackagePricingPlanId], [SubscriptionStartDate], [SubscriptionEndDate], [IsActive], [PackageAmount]) VALUES (52, 19, 10024, CAST(N'2020-11-15T13:35:29.923' AS DateTime), CAST(N'2021-02-15T13:35:29.923' AS DateTime), 0, CAST(1500.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[MemberPackageSubscription] ([Id], [MemberId], [PackagePricingPlanId], [SubscriptionStartDate], [SubscriptionEndDate], [IsActive], [PackageAmount]) VALUES (53, 19, 10024, CAST(N'2020-11-15T13:35:47.727' AS DateTime), CAST(N'2021-02-15T13:35:47.727' AS DateTime), 0, CAST(1500.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[MemberPackageSubscription] ([Id], [MemberId], [PackagePricingPlanId], [SubscriptionStartDate], [SubscriptionEndDate], [IsActive], [PackageAmount]) VALUES (54, 9, 10021, CAST(N'2020-11-16T12:02:01.117' AS DateTime), CAST(N'2021-02-16T12:02:01.117' AS DateTime), 0, CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[MemberPackageSubscription] ([Id], [MemberId], [PackagePricingPlanId], [SubscriptionStartDate], [SubscriptionEndDate], [IsActive], [PackageAmount]) VALUES (55, 9, 10021, CAST(N'2020-11-16T12:04:46.240' AS DateTime), CAST(N'2021-02-16T12:04:46.240' AS DateTime), 0, CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[MemberPackageSubscription] ([Id], [MemberId], [PackagePricingPlanId], [SubscriptionStartDate], [SubscriptionEndDate], [IsActive], [PackageAmount]) VALUES (56, 15, 10027, CAST(N'2020-11-19T16:08:29.563' AS DateTime), CAST(N'2021-02-19T16:08:29.563' AS DateTime), 0, CAST(5.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[MemberPackageSubscription] ([Id], [MemberId], [PackagePricingPlanId], [SubscriptionStartDate], [SubscriptionEndDate], [IsActive], [PackageAmount]) VALUES (57, 19, 10031, CAST(N'2020-11-21T11:55:42.800' AS DateTime), CAST(N'2021-05-21T11:55:42.800' AS DateTime), 1, CAST(18.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[MemberPackageSubscription] OFF
GO
SET IDENTITY_INSERT [dbo].[MemberPackageSubscriptionDetail] ON 
GO
INSERT [dbo].[MemberPackageSubscriptionDetail] ([Id], [MemberId], [PackageId], [TotalNoOfContactsToShow], [UsedNoOfContacts], [TotalNoOfChatMessages], [UsedNoOfChatMessages], [IsActive]) VALUES (19, 9, 25, 5, 0, 1000, 0, 1)
GO
INSERT [dbo].[MemberPackageSubscriptionDetail] ([Id], [MemberId], [PackageId], [TotalNoOfContactsToShow], [UsedNoOfContacts], [TotalNoOfChatMessages], [UsedNoOfChatMessages], [IsActive]) VALUES (20, 10, 25, 5, 0, 1000, 0, 0)
GO
INSERT [dbo].[MemberPackageSubscriptionDetail] ([Id], [MemberId], [PackageId], [TotalNoOfContactsToShow], [UsedNoOfContacts], [TotalNoOfChatMessages], [UsedNoOfChatMessages], [IsActive]) VALUES (21, 13, 25, 5, 0, 1000, 0, 0)
GO
INSERT [dbo].[MemberPackageSubscriptionDetail] ([Id], [MemberId], [PackageId], [TotalNoOfContactsToShow], [UsedNoOfContacts], [TotalNoOfChatMessages], [UsedNoOfChatMessages], [IsActive]) VALUES (22, 11, 25, 5, 0, 1000, 0, 0)
GO
INSERT [dbo].[MemberPackageSubscriptionDetail] ([Id], [MemberId], [PackageId], [TotalNoOfContactsToShow], [UsedNoOfContacts], [TotalNoOfChatMessages], [UsedNoOfChatMessages], [IsActive]) VALUES (23, 11, 24, 10, 0, 1000, 0, 0)
GO
INSERT [dbo].[MemberPackageSubscriptionDetail] ([Id], [MemberId], [PackageId], [TotalNoOfContactsToShow], [UsedNoOfContacts], [TotalNoOfChatMessages], [UsedNoOfChatMessages], [IsActive]) VALUES (24, 17, 25, 5, 0, 1000, 0, 0)
GO
INSERT [dbo].[MemberPackageSubscriptionDetail] ([Id], [MemberId], [PackageId], [TotalNoOfContactsToShow], [UsedNoOfContacts], [TotalNoOfChatMessages], [UsedNoOfChatMessages], [IsActive]) VALUES (25, 21, 25, 5, 0, 1000, 0, 0)
GO
INSERT [dbo].[MemberPackageSubscriptionDetail] ([Id], [MemberId], [PackageId], [TotalNoOfContactsToShow], [UsedNoOfContacts], [TotalNoOfChatMessages], [UsedNoOfChatMessages], [IsActive]) VALUES (26, 11, 25, 5, 0, 1000, 0, 0)
GO
INSERT [dbo].[MemberPackageSubscriptionDetail] ([Id], [MemberId], [PackageId], [TotalNoOfContactsToShow], [UsedNoOfContacts], [TotalNoOfChatMessages], [UsedNoOfChatMessages], [IsActive]) VALUES (27, 22, 25, 5, 0, 1000, 0, 0)
GO
INSERT [dbo].[MemberPackageSubscriptionDetail] ([Id], [MemberId], [PackageId], [TotalNoOfContactsToShow], [UsedNoOfContacts], [TotalNoOfChatMessages], [UsedNoOfChatMessages], [IsActive]) VALUES (28, 15, 25, 5, 0, 1000, 0, 0)
GO
INSERT [dbo].[MemberPackageSubscriptionDetail] ([Id], [MemberId], [PackageId], [TotalNoOfContactsToShow], [UsedNoOfContacts], [TotalNoOfChatMessages], [UsedNoOfChatMessages], [IsActive]) VALUES (29, 22, 25, 5, 0, 1000, 0, 0)
GO
INSERT [dbo].[MemberPackageSubscriptionDetail] ([Id], [MemberId], [PackageId], [TotalNoOfContactsToShow], [UsedNoOfContacts], [TotalNoOfChatMessages], [UsedNoOfChatMessages], [IsActive]) VALUES (30, 19, 25, 5, 0, 1000, 0, 0)
GO
INSERT [dbo].[MemberPackageSubscriptionDetail] ([Id], [MemberId], [PackageId], [TotalNoOfContactsToShow], [UsedNoOfContacts], [TotalNoOfChatMessages], [UsedNoOfChatMessages], [IsActive]) VALUES (31, 18, 25, 5, 0, 1000, 0, 0)
GO
INSERT [dbo].[MemberPackageSubscriptionDetail] ([Id], [MemberId], [PackageId], [TotalNoOfContactsToShow], [UsedNoOfContacts], [TotalNoOfChatMessages], [UsedNoOfChatMessages], [IsActive]) VALUES (32, 19, 25, 5, 0, 1000, 0, 0)
GO
INSERT [dbo].[MemberPackageSubscriptionDetail] ([Id], [MemberId], [PackageId], [TotalNoOfContactsToShow], [UsedNoOfContacts], [TotalNoOfChatMessages], [UsedNoOfChatMessages], [IsActive]) VALUES (33, 19, 24, 10, 0, 1000, 0, 1)
GO
INSERT [dbo].[MemberPackageSubscriptionDetail] ([Id], [MemberId], [PackageId], [TotalNoOfContactsToShow], [UsedNoOfContacts], [TotalNoOfChatMessages], [UsedNoOfChatMessages], [IsActive]) VALUES (34, 9, 24, 10, 0, 1000, 0, 0)
GO
INSERT [dbo].[MemberPackageSubscriptionDetail] ([Id], [MemberId], [PackageId], [TotalNoOfContactsToShow], [UsedNoOfContacts], [TotalNoOfChatMessages], [UsedNoOfChatMessages], [IsActive]) VALUES (35, 9, 25, 5, 0, 1000, 0, 0)
GO
INSERT [dbo].[MemberPackageSubscriptionDetail] ([Id], [MemberId], [PackageId], [TotalNoOfContactsToShow], [UsedNoOfContacts], [TotalNoOfChatMessages], [UsedNoOfChatMessages], [IsActive]) VALUES (36, 19, 24, 10, 0, 1000, 0, 0)
GO
INSERT [dbo].[MemberPackageSubscriptionDetail] ([Id], [MemberId], [PackageId], [TotalNoOfContactsToShow], [UsedNoOfContacts], [TotalNoOfChatMessages], [UsedNoOfChatMessages], [IsActive]) VALUES (37, 19, 24, 10, 0, 1000, 0, 0)
GO
INSERT [dbo].[MemberPackageSubscriptionDetail] ([Id], [MemberId], [PackageId], [TotalNoOfContactsToShow], [UsedNoOfContacts], [TotalNoOfChatMessages], [UsedNoOfChatMessages], [IsActive]) VALUES (38, 9, 25, 5, 0, 1000, 0, 0)
GO
INSERT [dbo].[MemberPackageSubscriptionDetail] ([Id], [MemberId], [PackageId], [TotalNoOfContactsToShow], [UsedNoOfContacts], [TotalNoOfChatMessages], [UsedNoOfChatMessages], [IsActive]) VALUES (39, 9, 25, 5, 0, 1000, 0, 0)
GO
INSERT [dbo].[MemberPackageSubscriptionDetail] ([Id], [MemberId], [PackageId], [TotalNoOfContactsToShow], [UsedNoOfContacts], [TotalNoOfChatMessages], [UsedNoOfChatMessages], [IsActive]) VALUES (40, 15, 25, 5, 0, 1000, 0, 0)
GO
INSERT [dbo].[MemberPackageSubscriptionDetail] ([Id], [MemberId], [PackageId], [TotalNoOfContactsToShow], [UsedNoOfContacts], [TotalNoOfChatMessages], [UsedNoOfChatMessages], [IsActive]) VALUES (41, 19, 24, 10, 0, 5000, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[MemberPackageSubscriptionDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[MemberRegistration] ON 
GO
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (9, N'EastFlicker', N'EastFlicker', N'Self', NULL, NULL, N'Marriage', N'Male', N'03246428468', CAST(N'1991-04-06T00:00:00.000' AS DateTime), N'Separated', N'1', N'Mughal', N'08-10-2020-11-546373774046870283660.jpg', 171, 1, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (11, N'muzammil', N'Muzamil', N'Self', NULL, NULL, N'Marriage', N'Male', N'74496272', CAST(N'1985-01-23T00:00:00.000' AS DateTime), N'Separated', N'None', N'muslim', N'06-10-2020-11-396373756676978653530.jpg', 171, 2, N'Friendly', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (12, N'Ziya', N'Zee', N'Self', NULL, NULL, N'Marriage', N'Female', N'9175504427', CAST(N'1999-04-07T00:00:00.000' AS DateTime), N'UnMarried', NULL, NULL, NULL, 171, 2, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (14, N'Hassnain Ali', N'Ali', N'Self', NULL, NULL, N'Marriage', N'Male', N'03421194337', CAST(N'1978-01-13T00:00:00.000' AS DateTime), N'UnMarried', NULL, NULL, NULL, 171, 2, NULL, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (15, N'Hassnain Ali', N'Husnain', N'Self', NULL, NULL, N'Marriage', N'Male', N'03421194337', CAST(N'1965-01-31T00:00:00.000' AS DateTime), N'UnMarried', N'None', NULL, N'', NULL, 2, NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (17, N'Zain Asghar', N'Zain', N'Self', NULL, NULL, N'Marriage', N'Male', N'03056511744', CAST(N'1997-11-07T00:00:00.000' AS DateTime), N'UnMarried', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (18, N'M.Azeem Ur Rehman', N'Azeem', N'Self', NULL, NULL, N'Marriage', N'Male', N'03024387169', CAST(N'1996-10-06T00:00:00.000' AS DateTime), N'UnMarried', N'None', N'Mughal', NULL, 171, 2, NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (19, N'mujju', N'Mujh', N'Self', NULL, NULL, N'Marriage', N'Male', N'74496272', CAST(N'1983-01-01T00:00:00.000' AS DateTime), N'Married', N'2', N'muslim', N'data:image/jpg;base64,/9j/4QNIRXhpZgAATU0AKgAAAAgADQEBAAQAAAABAAAFXQEPAAIAAAAgAAAAqgESAAMAAAABAAEAAAEyAAIAAAAUAAAAygEbAAUAAAABAAAA3gEaAAUAAAABAAAA5gEAAAQAAAABAAAC6wEQAAIAAAAgAAAA7gExAAIAAAAgAAABDgEOAAIAAAAgAAABLgITAAMAAAABAAIAAIdpAAQAAAABAAABTgEoAAMAAAABAAIAAAAAAu5YaWFvbWkAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADIwMjA6MDk6MjYgMDc6NTU6MjUAAAAASAAAAAEAAABIAAAAAU0yMDA2QzNNRwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAATWVkaWFUZWsgQ2FtZXJhIEFwcGxpY2F0aW9uAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAakAAABwAAAAQwMjIwkgQACgAAAAEAAAKMiCIAAwAAAAEAAAAAoAEAAwAAAAEAAQAAoAMAAwAAAAECrgAAkAMAAgAAABQAAAKUoAAABwAAAAQwMTAwkpEAAgAAAAM2NwAApAMAAwAAAAEAAAAAoAUABAAAAAEAAALcpAIAAwAAAAEAAAAAgpoABQAAAAEAAAKokgkAAwAAAAEAAAAAkpAAAgAAAAM2NwAAgp0ABQAAAAEAAAKwiCcAAwAAAAEECwAAoAIAAwAAAAEBdQAAkQEABwAAAAQBAgMApAUAAwAAAAEAAAAAkpIAAgAAAAM2NwAApAQABQAAAAEAAAK4kAQAAgAAABQAAALAkgoABQAAAAEAAALUkgcAAwAAAAEAAgAApAYAAwAAAAEAAAAAkggAAwAAAAEA/wAAAAAAAAAAAAAAAAAKMjAyMDowOToyNiAwNzo1NToyNQAAATiBAA9CQAAACJgAAAPoAAAAZAAAAGQyMDIwOjA5OjI2IDA3OjU1OjI1AAAACLYAAAPoAAEAAQACAAAABFI5OAAAAAAAAAUBGwAFAAAAAQAAAzABAwADAAAAAQAGAAABGgAFAAAAAQAAAzgCEwADAAAAAQACAAABKAADAAAAAQACAAAAAAAAAAAASAAAAAEAAABIAAAAAf/gABBKRklGAAEBAAABAAEAAP/iAihJQ0NfUFJPRklMRQABAQAAAhgAAAAAAhAAAG1udHJSR0IgWFlaIAAAAAAAAAAAAAAAAGFjc3AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAAD21gABAAAAANMtAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACWRlc2MAAADwAAAAdHJYWVoAAAFkAAAAFGdYWVoAAAF4AAAAFGJYWVoAAAGMAAAAFHJUUkMAAAGgAAAAKGdUUkMAAAGgAAAAKGJUUkMAAAGgAAAAKHd0cHQAAAHIAAAAFGNwcnQAAAHcAAAAPG1sdWMAAAAAAAAAAQAAAAxlblVTAAAAWAAAABwAcwBSAEcAQgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAWFlaIAAAAAAAAG+iAAA49QAAA5BYWVogAAAAAAAAYpkAALeFAAAY2lhZWiAAAAAAAAAkoAAAD4QAALbPcGFyYQAAAAAABAAAAAJmZgAA8qcAAA1ZAAAT0AAAClsAAAAAAAAAAFhZWiAAAAAAAAD21gABAAAAANMtbWx1YwAAAAAAAAABAAAADGVuVVMAAAAgAAAAHABHAG8AbwBnAGwAZQAgAEkAbgBjAC4AIAAyADAAMQA2/9sAQwAUDg8SDw0UEhASFxUUGB4yIR4cHB49LC4kMklATEtHQEZFUFpzYlBVbVZFRmSIZW13e4GCgU5gjZeMfZZzfoF8/9sAQwEVFxceGh47ISE7fFNGU3x8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8/8AAEQgCrgF1AwEiAAIRAQMRAf/EABsAAAIDAQEBAAAAAAAAAAAAAAADAQIEBQYH/8QANRAAAgIBAwMEAQMEAQMFAQEAAAECAxEEITEFEkETIlFhcQYUMiNCgZEzUmKhFSQ0Q7Fygv/EABkBAQEBAQEBAAAAAAAAAAAAAAABAgMEBf/EAB8RAQEBAQADAQEBAQEAAAAAAAABEQISITEDE0FRBP/aAAwDAQACEQMRAD8A8cAAAAAAAAAAAAAAAAAAAAAAAEEgBAEgAAAAAEEgAAAAQSAAQBIEEgAAQBIAQSAAQSAABBIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQSAAAAAAAAAEEkABIAAEEgAAAAAAAEEgAEASQBIEEgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEEgAAAAAAAAAAAAAAAAAAAAAAAEEgAAAAAAAAQSAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFkiVECgDY1Z52Lqh77Z/AGcDR+2njPaStLN/2sDMBoekt8RyLlW4ZUlhgLAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACQwwIBIZCqUjXXCquPull/AGKMHJ4SGOhxjlsfO+K/hFC++VnIFY1NrKQ6GnnLiLHUJKK23NKtlH2y5LiayrSyx7oy+jRClwSws/LNSnJQy3sQ7IpcpsqaVGHdJJ7j1R4T2Jrce3MsIIJSy3N4+MhER0uZe7dfRS7psJ7oepSjL4RPeu7nIHE1mi9LLT2MB6t0+pB9yyn4ZyuoaCuC7qvb8ojUrkgS44IIoAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAnAJZY6NeP5AWqp7ll8GqMKq4/wAFJ/YiPdF84QOeOWUWunHbCSX0Z28vYic8kwTbWAJVb8mmqjKTykVgsLLGVe57vkIdBQqi3JrPgrCbtn5F3xw+1bjqM+k+1boqNDu7a2vCEUds5vP5KVxdjw3sP7YwWEgikbO+WM7ZNKlDtwpJNGZRWGooh1y7srgDc5epXzuKjKEJ5k+PBnxbGPcnuVhVKcG28vO4V1oTU1mDK3aeV9bUsZ/BioucJKMDpqUpVZT3IPN67T2VSxKO3ykYj0WsqlbVLLzI4NtcoPdEahQEkAAAAAAAAAAAAAAAAAAASQAAAAAAAAAAAABIUEEgEQAAAEoEsjIxwAQWORjy2sFcFlLC+wLtvhCZ5XIxtLkVPfyURFJvccltsJXgvloBqWI8l4SwhMW5Pdg5YeEwh9eZSbyNrtdbkZnPEdirn97BD1Y47os7Jvdy/wAGfvzsi0crko01zaln5Gxtbhxkx97SwW9V9qXCA2qS8v8AwDsjDZLYwytba8IvCzKxjLA6VXpyx2x3Nsoez4OXTa60t9zTHV2N+5bEF7K32vfc4+ops7pKSO56sbVthMwa2Mv5J8eQRxLIdrwLNWozJ5ZmawRpAEkAAAAAAAAAAAAAAEgQSBAAAUAGAAkAAIAAAAgkAAEBKQFootkM4WxUC+SVJLkrkNvIESkVbJIfIBHkYouW5RLBbu2AstkRnCy+SO7Yo25Mot3ZLxjlbhCCisyJ7wi0UkyJTxsikp/BXkC6luWUsi4oYlhAWwWreHsVSfwXqkovdII26eePOw+bfhZ+zKpqWOGjVDCjtsBaqSf0wnFT2ZGe55RMvalLwBz9Tpuye2+TFbU0+Dv2VK2HctzFdRLOEFlcZog0aip1y3WMiCKgCQCoJIAAAkAiAJIACSCQAAAKgCQAAAAgAAAAIJAC0Sq5GJYiBVsCPJKQFkiUkWjjBSfOwFXlMOWQ3klbASyCMgBL+gTxwQSgGLL5YYIzgtFlFWkSnEt2t+CYw+giE14LOS8ovHTtllp5fBNXCu/f25Ji8sfGhx3cMlJxUXlLH0NTDINx4NlTfbnGTnQsxLL2fyjdTe8e5pr5KjRWk1mOzLyxKGMbiu5ZysYLwmgIqUoZ+CjzKTwaIrtT3yKltLK8gcrW90uVsYGdfWJPJyprDDUVAAIoAAAgkAAAAAgAAAAAAIAAAkAAKAAAgAAAmKyy0n4CK8siQEInJALkBscMJJJfYQ3YWbbAK8lmthlFTnJGqemcmsIm4uMGCVFs6ENDl7mlaBduxPKL41xe1l4Vyk+Dp/8Ap0nI3afQQhjKyPI8XJq0Up85wbK+mNnYrojHhDlFLwZ8lxy49Mio/ZC0CUuDrdpHYsjVxhhpYpboutHF+DbGvc0QqCOXLRJLgzW6GL5R6FUp8i79JlZSKmvJajSdu6MuJx4yz0Gr0/bnKOfOnzHZm4zSKZzcXsQrJQbTNSpbS8MVfVJR7u3jloIdTbmOH5HwxwzLSk618j4PuWHyAW0Rsy8ZODqYdlrR6FOSWDh9Qji9v5KRkAAI0AAAAAACCQAAAAAAAAAAAAAAAAAAAAAC2dgJS2IACCzwQlkC8XhBGLnIj6Nekq92WiW4Sa1aejEVlbmuEEisEOjg4W67SLRghiiRB5LxAvGCwNjHBWERiiVEpEoAyVASiOSyQDIIfWJgsDq3g1Ga0Rh5LTWYkQY6KyaYcTXQynsce2KeV5PWajSqyLwjg6vQzjJ7F0c+L23YPOMrDXwNcHWsTjkTOON4P/BUVxFfRaKy9uSj8Bl+HuQPi8y3OV1Vwdmyakufs6dUsySZzur1dlqa8oo5gAAaAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAWi8ElUSBOCeNipK3AZVHukjp0pRSRj08PJsjwcuq6cw+I2AmG5ohHJzbNjjAyJWEDRCoqJgXZaMME9pUUTLxjkqlhl1JIBigsbllFIVK/BSWqS8lRoLRkkc23XRj5M0+o/DLEr0ddkfLNVTg1szx6182+TZp+pTjjfY0xj1OE0KnTGXKMOk6gp47mdGM4zWUwMN/Tq7U1g4mv6ZOh90VlHqlyRbVG2Di1kQeFaw90LnjhHY1+j9O1rGEznWVeMGkLqWOeTH1ealKKXKRtXt2ZzepS77UscIDARgloCqgAAAAAAAAAAAAAAAAAAAAAAAAAAAAALR5JkUL8gVLQ5KsvXyQbqtojoJti6I9xsrjFcnGusWqgbILAjvSJ9eMVuzLTbDk0ROVHWR8MfVq1LbJUdFSWCvcZo3pvkupoIvKWDLdqe0bY20c3UdzbyUXs1uI7mC3Wyk9mFkG+RPpJbmoiJXTk+WxtNdk2RWkvBrqurr/k0ka1nDKtNhLO5uo0yeDJ/6hQsYyOq18XvHuQG5aacN4mrTXzg8M5q6nOEl/fFmyrUV37pYZkdqi31EPOXp5uMtjpQllZNRmsfUNOra28bo83fDtlwewku6LTOJqdPFanGNmyxHFhUrppM6D02j09XdfVGbfhofZpY0al4jhPdGPqEZzmm17EZ6uN8zXK6v02mVX7rRx7Yr+UPg4J7DS43qnvGSwzzPUdM9Lq7K8bJ7fgvHW+l65xlIJINsACSAAkAAgkAAgkCAAAAAAAAAAAAAAALJlSQJe42mOWJyaNOSrGqNnpw+yHqmhMk2yY05MNpeqm3syjulLyM9AutNNraJfTJCskPqvknuKlCcfARe+6JVdam7Pk11zyciptYOhRPg51uOgo5iKsoT5RoqknELFsVHMtpXwY7KXk6diFWw7obLcowVUu2XbHZfIvWaSdUs5bR0O1wSUY9uC7mpRxPc1Ga5FUMcxcmzuaKEK9OoSS7mJj2R/460PrUpPgtqY3Q0FM6c4xIbRpYx4K0ZUcZNVSwZDqq8GyvaJmhyao8FRYwa+riyPK3Nwu6PdW0NRi1/vrqsXlCZVK3TNNb4DU2dujj/wBssFdNd3rHyTprn45aj2yz8M5f6jhm2uz5judm2OLWvs4/6ilvVH4ROfrfXxwgADs5AAAAAAAgCQAAAAIAAAAAAAAAAAAACSCQBDqH7xI2j+ZL8WNnbgmG7+iX/ETKXbsjm20O6NfjJH72WMLCG1VQspx5ZmemnGfBqJTKY2aibSLquMZuu1YfhmjSVqiOc+5k3RU93uyUjPCHa8ZNFbwykY4RdbHOtx09LLODo1VKccYOTpHudvRvgRKx36Np7GZ6WXhHopUxa3FSpj8HTGPJ5+VD8op6P0dq+pJ8CPTj8EVz4U/RorqSH+msllHAVEFg0wyKikMjJIiNVZpi9jArMMbC1vyXUxryUlwyIyygm8ImmMN2n9bTXQju85RzdJL07e2eU098nY0tsVdNNiepS00mm8d/yjWbElxkvofrKaWYvyeX/ULzre34R7PSTUo+m33LweV/VWllVrfUx7ZrYcz2tuvPASQdGQAAAAAAAAAAAABAEgBAEkABJBIAAAAAQSBaEe6WDRXX2zQip4mjVHZ7mK1D+3MRUob8GmCzEvGpN5ZjWyq+6K2GpSlyNjXjguoYJq4rGOFuWx3FsFklgmmEvkCJ/wAghvIK2aflHZ0ssYOTQsYOlR4JCuzW1KKCUBel/iOsfasnafHC/WPUNJbmPKyatSvUi8Lc5UpyhJpma3GxYZODLC3cd6hFNRdRTERnuNjJBE9peDwQ8kL7A0wmgtl7WJhsWnXZZFqKZBiUklbZndbCIR/dPtXJq1Olen0nufuk98C9FH0pJpHS/GIbpKpUalQ+jJ+rrKP2EYyw7HL2nTqTlq5TfiJwP1Wl6FeeciDyTKkvkDYgCSAAAAAAAAAAAAAAAIJAAAAACCQAAAAJi8NHQwpRUjnG3S2rscJP8GOmuW2o0Rw0ZqnsOiznXQ5FkUiy6ZFSo5LOOEWiyz4IMNq9xFaxIdal3Ck8SyUdHTrODqVdkYrPJx6bljk0q7bkRK7NFyjLnY1u2tx3aweeje1wzJquqTjL06d35fwblrF5elepqi8bHL18YSn3Q8nIqnqZSTlNts6MIzxmYWTCE3F7j4WZ5KWQzwWo011j9kGyYump5HQY+jpc9nZJL6NtWiqr8Zf2a8axeoy1VykuGzRHS552NSilwkiTXiz5Ew08I/Y3gkiRZGaw9W/+Mn9itHWp0pvkd1b/AOG8fJztHrHT7ZcMVY6kIYUn54PN/q5pU1rO+TvajVxpoUm0snh+u9Ret1GE/ZHgkWOUyAA0IAkgCQAgAAAAAJIAAJACAAAAAAAAAAAAAJG0LumkKH6X/lRKrsXab0FBp7SSZVGzUxctNW/+1MxI5WOkq6Y2LEpl0ZaPgy8pbCYss1KXCb/wE1nusUZ7mWy9t4ia7tHdbxXJ/wCCkelalv20yZuRLYz1aiUZe7g31XqS2ZWHQtZN+6MYL7Z0tD+nJd2b7dviJrxYvcZpWrsxHlk6TRztnlVyb/B6bT9L0tCXbWm/l7myMIxWIpL8FxnycjT9LkknJKJrXT4f3Ns2gXIm1nhpKYcQT/I9JJbLBJGSs6kCMhkGpJIyAUAAAZ9dX6ulmkt0snnJ7Sil5Z6vlYOLqtKoapLHtzlAcT9VaiUPRqi8Lt3PLM736plnXRXxE4LDUQAAAAAABBIAAAAAQSAEAAAAAAAAAAAAAAABBI7TP+ohI7T/APLED2Wm08dRpam9sRwEul05zuiOn6jEIUvGMbHRccxLJLGL1ZWGHTaPsdHp+nj/AGZHRwmPjKOC5DypEdNVHitf6LquK4gv9Du6JPevgYmldr/6SYKWeC7n8IFZvwVFlDPLLKHb5KPL4eCPyyprXXNPbI0xwaTW5qjLKM2NSrAGQZGkMrkGmVw0ajlaHLHJDnkiW5XBrHO2rJtbobGWULiGe17Es1eesOBkRllA+DDvuxDlgRqq/UipLlFplXP24N45eft4X9TPOvf0jiHd/U9M4a5uaxlbfZwjDvPgIJICgAAAAAAAAAAAAgAAAIAAAkgCSiAJAgAAAAtCXbJPyipKCvQwvaorug/4vJ6bTXx1FEZxXKPE9PuzGVMns1ses6Fl6KKfjY1y5dmWrtk2TXZFrkffD3brZmC2qUHmPB1nLhf0sbFYkMViObGx+TRXPOxfBP6Vp78kd+4vDRGWXxjPnWhSz5DOWLhwXjHyMTaZFmmD2MsdmaoPbYzWpVm2uC0Z/JUkw6S2L5TIaK8FkyNy6q4lXHA0MDUvEpKzku45ROMFXZGK3aLqeMn0rudb3HxmpLKMlurrl7YpyZSpW+HhM347PblP08bk9tVko/O4icsSQ1VdqzyzNY/eIW3drH+otAtboPUgs2V7/lHgpwcZNNH0uF0f4PdPZniOv6KOk1slBrslujHUej8+tcgCSDDqgAJIIACQqAJDAEEgAQAAAQQSAUAAAAAAAAABIIESgGVScJprwe26BdGWl/zk8PFHqP05bmEofBeb7Y7np6K+UZQ2ZmT7luTbwxEZYZ6Y8PSbKFyhag0+TQ5dy2KqPyVEws2wyXJNFe3DDyA2pbDE8IirjAzsyRVO40UzFemy0YuLM1qNaeURkopLG7J70YxvViyYqViSMtl828RLObS9zlulZCCzKSRmt6hXHaCcmZHVZZ/JsbXpUuTU45n1zv7dX5FXrbbcqMe0iFM7HmTZtrprj4Q5RiuB5yfIT8+uvfVZq9NGG+B2MIuZ7Ld2omNvTfjOItO1KH2YnGU5cbDkm3hhKa7sIW+LXM81Vp4pfZ5T9RaCdVvqrMoy+fB7KPBn1ulhqapQmspnHyt+vTJJ8fNWiDqdU6XZo7G0sw8M5jWCtIDBIARgCQwAJAyUXUMomrhZA2VbSF4GpiAJwBRUAAAAAAAAAAkAAktFEJDILclakXhW2dzoMnXc4vZNHO0sMyweo6V0uMsWtrY5eedY6XiePtoslsYHalJ52OnrKJ1RzGLlH6OXPtk8NNP7Pdz1K+b1+dlPr1Ffll3qal5My02VlEPSyNa55Gr93V8lHq6+UZZaaafAv0JZ4CY6MNZFtYNcNR3YONGmSHQVkeGB2otyWzJ7H5Zzqb7Ico2Q1CkvsmLp3poHiKKK5fJeOJb8kCnGU38IZGqKL8EjUxVJFsEZBPcijJPd27tlLLY1/kyTsna8LgsmpuNErpT2gy9cMLL5KU1+msszazXqDVdT9zJcjXMvS2pv7JPHkVVNvczaib7kmxlDPP1de3jnI6dUsovLdCKmP5RlWLU6eF8XCcU0zx/VekWaWxygnKt8fR7eawxNtcbE4ySaZYr5y4tBg9Vreg1zbnV7X8HIu6e6niUWi6rmYJwdzRdJq1LUZNxb+Bt/6alRNKV8UpPEW1yNHDrq7mb9Nopz/tygeks0mpdNq9yZ6volOndHdJx7/jJw/Tq7kduZJNcG3pNn7eVna8YOLKiSfGD6fZ6Man39vZjfJ5Tqq0Tk3p44RZvE91JZ3/jy7jh7gabYru2A6Ss+LngSQbcwBIABBIACJQYJSIqUMjyUReJK1GuiXa8nb0XVLdOsRlhfB5+DHxng49c/67S+sr1F/Ur/AEIWxntLZ/TORfr7bGu5ptecE0Xd+knXL5yjnWvEmjPG6tkx2qNc4YUvcjoU6uqxc4Z5OvUOt/KNtOohZxLD+D3cd7Pb5v6/ll9PUKEZboTZTh5OXTrbauJZRsq6pCW1kcHXXCym4SZZwT4KSsqnvCSIcsr2srKHlMtFsplrktnJQxSY2q1rzgQoSZKrxzJII3x1C8lnNS3izAu1cZkXbkvpE8TWt2KKzJiLNS5bR4M7bk+RtVWXuXxkTURhKb33NUK41xyw9lUct4OJ1Tqrk3XS9vLM9dOnHFtaOpdUUc10vL+TmaexzvTk8tsxdzbNOm2mmebrrXt54nMdK9f1R1TK3Ryoz+UFbwYbjdVI0xllGGuRphIIZJZM8+R8pZQiaKiuTDrIQnVLKRplLGTn3Tc32olahvQtPKV+f7Yne1emhqK4xnjEZKWfwK6Vp1Rpk2vdLdlNVqXKxwi9kX5Gb7rg9aou1GtnOqp9qSSYnRKypNTbg88HT1WpVVb33OLZqHKWW9xPznf1v+l5mOvfqJXaZ1+pvjk49lEu7DllEfuG/JdWbG+f/PzGb+1Ieki3u2A/uSA6/wAuXP8Ap084AAcXQAwBBQSBKRAE4BAFWRaJRFkRYYmXUhaZOTDetmmtw2vkrf8AKEVyxJGifurf0TPa2+mVsr3NeQZVm4xWivWWV8vK+zVV1CEniawczJGTc6sc+vz5r0Vc4yinF/6GRslHhs89TqJ1SzF7fB1NNra7dpe2R257lefv87HTjc5czaJcpp+2RnxlZTBOS4Z1cLGh2zXLYR1DRnc5Mq2wmN8da4vwMWtrntJ4OXuCfy8IamO7X6U0nGRN2pq08G3NHnrNaq9oSyzJO6djzJ5MdfpI6cfhevbdrup2XNxi2oHPzl7gy9deWebrq9fXt54nMyL1QcmbK4dqK1wUUMTMa26Gnatq7HyuCF7XhmamxwkmjfiN8e6O0/K+QnwQkOjIyrMXhrDGwkVGpMpZLCKd2ELsm2sIqEXWbNE6TTOd0FJfbH06VRXr6jaMd0matFiTlbjngmG41am1UUPHOMI407e2Lk3uO6jd32dudlycHqWswuyDLm3CeppOs1TtseHsjI7M/kX3fILc9UmTHG3T4PyxikxMZLAd5pkxzAQ5bgUc0kgk8j0gAAgCQQBUokgkARYqTkipTLZKgRV4vDNdLy3F+UYh1c+1xa+SKpYsTaFmnVxxNSXEtzMVByVZLDBUQCeGAAbadVao7T4NC108brJzIS7ZGhfJrzsZ/nzfsaZa+xcRRX97dLfCESWS1FffMf06P5cf8a65aiziWP8AAu71U8Tkzr6PT4hwJ6lp9u5Lgze+qk45n+OUlkuiiTbGwhlmW0wj3M1QiooiEUkXRNVdMnJTPwW4IGxeB9c3F5TMyY2MijfHUQmsWx/yhihXL+Fq/wAnPTLKWC6zjoqmP91scfRWeq02m/j75nNnY0uTPKTk8LkamNs9Tbrboxk/bnhHYWKNP+EcrpVOZuTXBo6xqVRp8Z5NRm/8crX6tQU5Z9zOBZNzfdJ7svqb3bNvOwjOWduecZ6qy3YzgqsErg6xhKkR3eCoP5KiXuBXIAZADAHkegAwJChABIAAAQSAAFSAABIxPYUi8WRWuC/caVx/vhujENotdNqkuPI7VUp/1qv4S5+mVGNgBKWWBCQYY+FecGqGnjKO4HNH1Sz7WVuqcJv4KReHlBY0NG3QV5eTHF952OnVbJkV1tNDEExWuh3Vs1QXbEzal+1hhwezEnkbFYRayOJZwQZaW4JW6KL7LpkVZE8Fck5AspDExOdy3cEPUg79hSZKWQBtz4Lxh2/kmKwNqj32xiVHU0Nfp0J/J5v9Q6v1NU64vaOx6e6ap00n/wBKPBam13Xzm+ZPJ34jjaXnctFEJFkdmUhkhgVB5CTDgXJkEtgU3AaEgSQeZ3SgDwAUEkEgAAAEgCAgMAABUkx5IJQEy2kO0+odT7ZLMHyhFhRArbbplJepp33R8pcozRW++QrsnB90ZOLRqjqI2f8ALBZ+UETUjdXFOIiuMHjtl/s119q5YGS+nulwYbqnHOFhHYs3eyM9tfc91sRWPTrheT0HT47I5NNP9TKR29FBxSyFb+I4MWpexrk9jFe8sMsk1kRKLT+jS+SkoZM1ojhk5KS9rZHcZU3JORXcWTAvklMqWQF0xi4FLkumVDE8G3pkO+xzfg5U7l3KC5Z3unV+npl8s1zGOqzfqDUeloXFPeex47lnd/U13ddCpP8Aiss4R6efjlVluWKrYk2ykjIFWwIkynIN5YEUAAAKDAAzzu4AZXBS5eB8On3WUu2EW4olsiyWshIeTXoqaLcu61QS+RbhJrIC3L3RhG2Srl3QT2ZNElCalKPcvgCjTXKwBv12qhqYwjXRGtLz5Mar+yS6WYZHSXSqdkYNxXkQalbZ6fp+pLt+BTSXEciaXC8PHBRtofu/GClkUaQruci8U8lFyNSWQiewsk0WXBeMdyKbSzfXuuDHVDc2V7LBBaSI7SXuWxsBFEPedehYic7TwzI6kFiIET2Mti3NU3lCJRygMuNwa2GSjhlWiKyWwzuZ2zdOOTLZXvlGbFUTLoolgvEimLgtwVQSmorLYF18mbUapVppPcz6nW/2wMLm5Sy9zrzx/tc706nS4y1GqTlvuevilCtL4R539P05l3M72rsVennL4iaYrx/V7vW11jzsngwlrpudkpfLKI7RlfJKZTIZKi2SjYZwQAAyeEQRUARkAKotZPvwlFJL4GKif/SW/bTfjBwdmfgctVd6brVkux+Ml/2r8tIFpYR3c0MNwlQ7vJZVpeR/bTHmYOdEd8gK7F4QJMu9TSltFso9S3/CCAnt+yG0vIJ2T5g8fgiUFHnkAdkUivrEdrltGDf4QyOk1E17aZ/6GBcrX4FuTfJsj0zVS5hj8s00dDtm/fZCP5Y+J9chcmivwdl/p+mFblLVxz4SRmlpKqVhzyTdXMZYxyOjDGMgml/FF4EDIj4cCYodEirobFZTFLkfDgqGaeO5ui9jFQ8M2Z2AJclWshnLJAXKAqUDU0LkgMsomedZtlEVOOxMXWCcMPYqpY5NFuEc3VOe/bwJzaeWHWauMFzlmG7VTsz8CW2+SDrzxI53q0Zyy1azJL5ZU0aSHdakarMer6LV2UZxyHXL/T0M15lsatFDs08V9HF/Ulv8K1+TMV598kZBkZOrKchkgjIEkkABJHkMkAD3YEABaept7mu4iV9jX8mdCXSW5tysil/svHplKXunJ/g5Y3rkOc3zJlvdKO+Tsx0Gnj/Y3+WNhp6o/wAa1/ovia4EYTlwmzTDRXzj/wAbX5O3GvH8Ypf4LqpsvimuNDpNr/lOMf8Ayaa+lwivdbJ/hHUVLZdacvia58dBRF5xKX5Y6NEPFa/0blp/oZHT/KwXImsUa2ltFIuoS8s1SdFf87YL/Jns6loav/s7n9DIm0ek2W9FmSz9QaeH/FS5P7Mtv6hvlFqEI1p/C3HpfZ+v1UNP7FvN/wDg5PqSsllvOTNOyVs3Kcm298sbWc+muT4j6xMVwOgc3RogsjUhUB0dyAS3HQFrkvHZlF4vEjVCexk8joMB/ksuBcWMQRLKyLlZALa2FOOR+CrRUYrKtzJdQn4OrKIiyvJqJXm763CTFeTsavTqWdjkTi4yaZuMIOj0mvuvj+TnHd6JUnYmvBOvhHo4e2tHk+uW+prZLxE9TdLtqb+EeN1MlbbdJ85ymOSspBPgg2gAAQEoAAoGQAMCGAAB1Ja1qfaoNmyDcoqTi0RS4xl7orPzg6lUY2RWMYMxqsVcYz4aHxp+hfUa6NPDv9Tsn4SMC67ZCPbXXF/9zLrLsw0zfgs4V1r+pOMV9s85d1TWX7OxxT+DI5Sm82WSf+SeS49PZ1DQ0829z+ImS3r9MXimhyfyzhJwT2TZbueNkkPIx0bOu6yxNVxjBGO3WaqzPqXtfRnnY91kRNvPJNDLJt8zcv8AIvuXwLySt2RTE8kN7kvZFSgTNVPBlXJppZm/FjVFbDYIVH6Gx4OTodF4GwluIXBeLwBoiXQpSLplDPyMgKW6LxAfEbFmeD3HRYDlwVaBMl7hFWiMZLYDBUUaKSiOaIaKjDdVlHH1mm5aPRWQ2MN9Sa4LKledUfek/k9L0SrEHL5ZxdTp3Cakvk9D0ldmmTZah/VLPS0cn9HipSbb35PUfqHURemUYvk8sa5SgAINIkCMEsCSADIAAABAAAHZ098btnszo6S3059suGeZr1DhJNHcosV9SlHkxK3YZ17Sysp9WG+DzkZY2Paadq+hwnzjB5PqOkek1UoYwnvH8FrMJ7vsXKeCHFsq4sipdj+Svc/lkAQX7mDeUVwWiBQvBeQcSVsigZBPkCoEPqeGIXI6slWNkWsIYhENkPjvg411MT2LoXF7jF8gXTGJi1yXyUXi9x0WZ0MiwHxHRZnhIdFgOTLZFpk5CLolFUyyKJDBJIQuSM9kDW0LnHYqOVqKO5PYdo9TCqpRk1FofZBbnL1uncovBRn6xqY2zUYvODllrE4SwyuTpPTCSAAqAkhAFBIEBEhjIEeQAAACk/a8G7pep9K3tb2ZiuXuKwk4yTRzbew08/TtT8Mjrmj/AHOm9WC98N/yZen3q/Tr5R2NLP1KnCW/g3Ga8XFeHyTOvEc7G3qmlel1jwvbLdC5aOU61OKyjOVdctrclF7odk2mtyqWWQSga3GKCSFS5AMkkJP4JKIJIJKgReLKosgNNcjRHwY65GqD2ONdYcuBiExY2LIpiLIqiwF0WTKRLgMTGwlgzpjEwNMZFsiIyLqRQ5MumJixiYQ1MlFIsumVB4KtbFyrATOJlvrzFm5rYTOGSjzWv07Uu5IwHo9XQpJnDvq7JvbCOkrFhABwBUAAQBIABRJAAEABgAFzl3PJUMEpNvCRhp0Ok6n0ru18SPS0T7LFJcM8cozplFyi0em0Nyv08ZZ3LErb1nRrVaTuivdHdHn9Lc4J1yeEeq0s1ZX2yPNda0b0uplKK9knlG5c9s2b6c3UVud0u3cRhwe41yaeUys5Ob3RitRVybKsviXhYDtfyARk+GVLqDKNYAgAJAETkgEwGRe5rg9uTHFj65cGOm+WuLGxexnrY6LMNnosxaZfJBaPJdC09xiCpLxYvJZZAai4lMumEOjIumJTLqRQ+LLxYiMi8ZFQ/JBVSLJgQ1krJbFyrCMl0M5OVrNOpZO3YjFfXnJqVK81ZW4PD4FnW1Gn7s7HOsqcPBuVksER5J4KgAPAFABBIRDAGAEbyfGcmnTae6U8wizTGdcXtFHS0Vsc+DKuPr7u6MYSjiceTR0W/E3W3yI6ul+7bXlC+ny7dTH8kV63TScZ5LdW0y1Wil2LMksoRXJrybtPYpR7WaZeEti4S3LRlGKOx1rp3ZdKcV7Zf/pw3CUXhkU1yytyNsFVGRaFVk3iMWwBNLyKlya4aDUSWVVL/Rlsi4ScZLDT4KKEgBBALkGQBfI+HBmTHQfBmtxqgx8XkywlvlD4y2MNNEZbF0Ii9sjVLYyq6ayMTE9xdSyFMLIpkEyBmSyYsnIDUy6YlSGJlQ2LwXUhGSyZRoUi6kIUtiykvkIfnIFFL7LJ7FESRntjk0sVOOxUc+yvdmS2lPwdOcBEob4wXUcO/TOO6M0srZnesqz4OfqtKs5ijcrNjABaUHHZlfP0aZBJBIEZAMAA5SNOmvcWYEzRBVRWZWSb+EjLSeoS77U/oroV/wC4j+Rs7KXHatt/LZGi92pTwQehTwkNru7Xkz52DJUbbJwvj2zWUZH0zTylnDJiXU2i6iYaDSx/+tN/ZprqqgsRhFf4Exs+RkZJ8Moc2u14WDxvVFjWT/J6/Lx8nletRxrJbcikc0CQMqggkgAReLxsUJRKsaYPHkfXLPkxwZorljkxW9aVLwMi8eREWXizLRyf2XjIQpDIyIpyeSU9xaZdPcgYmHduVBYAtkZBikTFgPySpCs7FlIobksnuKTLKQQ+LLqRnUi8ZFD85IaKxkXzngqFTiJlE0yQuSKjO45EW0p+DY4lJQKONqdNlPYwWVuDeT0VleTFqNOpfg1KxY46AbbS4PbIp5NsoyAAB1IaWL/tQ6Gkr+ENiNRFKWkq8xRNWkrrn3RW45MlAT5JIAgvFl/BRF0BKJTIRIF1NnA64s3J/J3TjdcjvFgcYABgQyCSAAEAyip3WKK/y/gipri5NKKy34SNkdNKKzY4wX29zdRpJdmKV6cfNj/lIctHVDdrvl8y3ZlXPjCG3vz94Leln+M1I3uK+NisqYy3wZa1h3js1hlk99xtlbit/dH/AMoQ12brdGWjlL/JdMRGW5dPAU/IeRakXAtklMon8k5IG5Aon/onJQxPcnItfJOQHxeSyYiMi6kVGiL25GKWxnTGKRUOyVaCMiWAtrPghou0RgqFSjkTOvO2DS0VaKObfp1KL2OZfT6beEz0ModyMeo0/cuDUrNjgNfYG23S4lsmBrWXSiMTFRGRILlkVRZFEk4IKueGQXllLPgIyZoV+nemcJwk5vhmWKMy6tmGpsYiiQyJpFkjldbh/Si/s7MUc7rcP/aZ+GB5h8gD5ACA8AAAdvpmkUYJzXulu/wcvR0evfGL/jy/wekpjGEO/GM7/wCCDS4Yic7U3J29ka7Zyi/7Vhf7H6bqC1OqlTBe2K5+Sl9Tv1EouUlGKzhPGSLFFKarc7YdmPGchXqK7ViEln4ZCTWllFtvtyss4fe1LKfBMad9xyjLdX2pvHtf/grodZ6v9Oz+Xh/JrnHKaZnF1zHmEsMupcFr4bNY3juvwIjPwTF1piy6kzPGWS6lsRTu4lSFdwJhT1LYsmJUsFlIBvcCkUzkM7gMTGJiU8IupBDoywMUjOmMiyjRGQxMzxkMjIqGlXyCYNlEEYyWIa2Ap2lJxytxrIayVGKdO4GpxywLqY56ZdFYoukVlW1yUPaMqealnkEgWxRZvApvLLSZRchDYDYopFDEBdF0ULoBkTJ1dZ0UjVFmfqe+jn+APJPkCZbSZHgKCAYBHT6RW3KUuMtRR0+rT9HSSxtlYRl6JFOH/wDoOvzeIRXkDF0jUw0+sTseIyWM/B37Laa36krIrK5yeQeQTfGSK72t6jQqpRql3SfwcTOeQnXZBJzjKKfDa5KEU2E3Bprk72ju/cUKT5WzPOpnR6Tf2X9je0v/ANJRv1EcLu+DnXR7LHjjlHatrymcjVRfp9y5g+1kUuM1jfkZGWeDKnjkupZ8kxrWlSJ7sCFPGxZTJhpyluNU9jMpIspYZFaIywye4Qp5ZZSA0Jls7iISGZyA3IyMthCZdMB8WMUjOnwMjIo0KWwZFqRZMqLp7k5yKySmAzIYIyTkorsgLbAEcpMvGW4mLGI3GTk0DZRElREggssgZFJcBF0WKk5AumMTFIvF7ANixPUN9JP8DMitY86Wf4IPJz/kyqLT/kypVAIkgDvdCw4fabFdcTs1EIRTb+EW6FL3tfY/WXQo6rTO19sEnvjIZc23pN1ekd83jCz2NbidDorNZaowSwt5N+D1ELqeoaefpPui8rdC+l6N6SmSkvc5f+AusnV9LnQ4isuC2PNHubYqUGmso8bra1VqrIpYSfBFIyO083C2El4YkmLwwPXfyrT+UczVV+66PzHuOlpfdo6pfMUZdXHF8HjaScWTDXB7iyltsUl7ZyT8MFLBlo5P4J7txSZKbYU1TLd/2Jz9k5Ia0qXwWU9zN3P5Lxl5Ji60RluOjLLMfd8MZXZkitcWXyIhIYmA1SLqWGJTLp43AepFkxEZF1IodknIpN4JyVDMlkxXcWUkA7IC+5gUcqL3Gx4FLkZFmmDEWKJlslRHkuipZ7JlCNVq1RH7OXZ1K+UvbLtRXW2udjyZSDbX1PUR5l3fk3afrEG0rV2v5OKQuQPYV3QtinCSaKap/wBCf4ODpL50tdr2+DrW3uzSSeMPAR52f8mVLS/kypVHgECADq9FklqMeR36gg1OuXhmLpknHUxaOn16HdRCXlMqf6wdJ6j+ytcZrNc3u/KPSUaujUp+jYp45weMxudvR6d6K6ld3dK2L7vgDdLqUP3v7bt34bPP9Wg/31m3Jpv36wsc5TNd0YT1btlHMktiDkQ6fY4KVso1RfHdy/8ABsq6ZSq1OUr7FnGIQx/+m+3uhUp+pKvbLcEm/wDbFUXV36dv1dTtNLuclkGunp4Rjp4JKSWNlLkx61f1Kf8A+jpRWIJZb25Zh12f3FC8dxB5i5/1p/llEy17/rT/ACxWSY0Z3FsvItPKJyMF2yU9imfgnLIL5LJ7ci8skKZGTxyXjNr8CUWzhGVa65/Y6EvsxVt4yPhJkWNanuWTM8JDVIimqWC8ZCU8l0yhvduTncVnglSy8BDlIlMUmW7ihikBRSYAf//Z', NULL, 2, NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (20, N'shahrukh', N'Sharukh', N'Self', NULL, NULL, N'Marriage', N'Male', N'8623811658', CAST(N'1965-01-01T00:00:00.000' AS DateTime), N'UnMarried', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (21, N'Raiyan', N'Raiyan', N'Self', NULL, NULL, N'Marriage', N'Male', N'74496272', CAST(N'1985-01-01T00:00:00.000' AS DateTime), N'UnMarried', N'None', N'Muslim', NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (22, N'Awais', N'Awais', N'Self', NULL, NULL, N'Marriage', N'Male', N'03012345678', CAST(N'1980-01-17T00:00:00.000' AS DateTime), N'Married', N'1', NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (23, N'abrar ahmad', N'Abrar', N'Self', NULL, NULL, N'Marriage', N'Male', N'03316718260', CAST(N'1993-05-20T00:00:00.000' AS DateTime), N'UnMarried', N'None', N'rana', N'', NULL, 5, N'', NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (24, N'Zain Asghar', N'Zain', N'Self', NULL, NULL, N'Marriage', N'Male', N'03056511744', CAST(N'1997-11-07T00:00:00.000' AS DateTime), N'UnMarried', NULL, NULL, N'', NULL, 4, NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (25, N'silent', N'Silent', N'Self', NULL, NULL, N'Marriage', N'Male', N'03025671009', CAST(N'1965-01-13T00:00:00.000' AS DateTime), N'UnMarried', NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (26, N'M. Usman', N'Usman', N'Self', NULL, NULL, N'Marriage', N'Male', N'03025671009', CAST(N'1965-01-14T00:00:00.000' AS DateTime), N'UnMarried', NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (27, N'Subhan', N'Subhan', N'Self', NULL, NULL, N'Marriage', N'Male', N'090078601', CAST(N'1994-01-20T00:00:00.000' AS DateTime), N'UnMarried', NULL, NULL, N'', NULL, 4, NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (28, N'zoya', N'Zoya', N'Self', NULL, NULL, N'Marriage', N'Female', N'8983324689', CAST(N'1965-01-01T00:00:00.000' AS DateTime), N'UnMarried', NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (29, N'awaisa', N'awais', N'Self', NULL, N'1st', N'Marriage', N'Male', N'03216549875', CAST(N'1965-01-01T00:00:00.000' AS DateTime), N'UnMarried', N'None', N'Rehmani', NULL, 1, 1, N'This time there is nothing about me to write', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (30, N'Awais', N'Ramzan', N'Self', NULL, N'1st', N'Marriage', N'Male', N'03216549875', CAST(N'1965-01-01T00:00:00.000' AS DateTime), N'UnMarried', NULL, NULL, NULL, 1, 163, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (31, N'Ahmad Ramzan', N'Ahmad', N'Self', NULL, NULL, N'Marriage', N'Male', N'03216549875', CAST(N'1965-01-01T00:00:00.000' AS DateTime), N'UnMarried', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (34, N'Awais Ramzan', N'Prince', N'Self', NULL, NULL, N'Marriage', N'Male', N'03214569875', CAST(N'1901-01-01T00:00:00.000' AS DateTime), N'Married', NULL, NULL, NULL, 1, 163, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (35, N'Zohaib Ahmad', N'Zohaib', N'Self', NULL, NULL, N'Marriage', N'Male', N'03216548795', CAST(N'1902-02-02T00:00:00.000' AS DateTime), N'Married', NULL, NULL, NULL, 1, 163, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (36, N'mubeen Raza', N'Mubeen', N'Self', NULL, N'1st', N'Marriage', N'Male', N'03216549875', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'UnMarried', N'None', N'Mughal', NULL, 1, 163, N'This is test about me', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (37, N'Muhammad Awais', N'Awais', N'Self', NULL, NULL, N'Marriage', N'Male', N'0326549875', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Married', NULL, NULL, NULL, 1, 163, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (38, N'Muhammad Awais', N'Awais', N'Self', NULL, NULL, N'Marriage', N'Male', N'03216549875', CAST(N'1900-01-03T00:00:00.000' AS DateTime), N'Divorced', NULL, NULL, NULL, 1, 163, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (39, N'Muhammad Awais', N'Awais', N'Self', NULL, NULL, N'Marriage', N'Male', N'03216549875', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'UnMarried', NULL, NULL, NULL, 1, 163, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (40, N'Muhammad Awais', N'Awais', N'Self', NULL, NULL, N'Marriage', N'Male', N'0321654875', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'UnMarried', NULL, NULL, NULL, 1, 163, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (41, N'Muhammad Awais', N'Awais', N'Self', NULL, NULL, N'Marriage', N'Male', N'03216549875', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'UnMarried', NULL, NULL, NULL, 1, 163, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (42, N'Muhammad Awais', N'Awais', N'Self', NULL, NULL, N'Marriage', N'Male', N'03216549875', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'UnMarried', NULL, NULL, NULL, 1, 163, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (43, N'Mubeen', N'Raza', N'Self', NULL, NULL, N'Marriage', N'Male', N'0321654987', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'UnMarried', NULL, NULL, NULL, 1, 163, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (44, N'Mubeen', N'raza', N'Self', NULL, N'1st', N'Marriage', N'Male', N'0321654987', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'UnMarried', N'19', N'Mughal', N'07-02-2023-14-076381139363779944430.png', 1, 163, N'Test About me', NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (45, N'adeel', N'Ad', N'Self', NULL, NULL, N'Marriage', N'Male', N'03216549875', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'UnMarried', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (10045, N'Fiza', N'Fiza', N'Self', NULL, NULL, N'Marriage', N'Female', N'03216549875', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'UnMarried', NULL, NULL, NULL, 1, 163, NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[MemberRegistration] OFF
GO
SET IDENTITY_INSERT [dbo].[MemberReligiousDetail] ON 
GO
INSERT [dbo].[MemberReligiousDetail] ([Id], [MemberId], [Religion], [Sect], [CreatedBy], [CreatedDate], [UpdatedBy], [Updateddate]) VALUES (1, 0, N'Islam', N'Sunni', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberReligiousDetail] ([Id], [MemberId], [Religion], [Sect], [CreatedBy], [CreatedDate], [UpdatedBy], [Updateddate]) VALUES (2, 29, N'Islam', N'Sunni', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberReligiousDetail] ([Id], [MemberId], [Religion], [Sect], [CreatedBy], [CreatedDate], [UpdatedBy], [Updateddate]) VALUES (10002, 36, N'Islam', N'Sunni', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberReligiousDetail] ([Id], [MemberId], [Religion], [Sect], [CreatedBy], [CreatedDate], [UpdatedBy], [Updateddate]) VALUES (10004, 44, N'Islam', N'Sunni', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[MemberReligiousDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Notification] ON 
GO
INSERT [dbo].[Notification] ([Id], [Message], [FromId], [ToId], [IsActive], [IsRead]) VALUES (1, N'Package has been subscribed on 11/12/2020', NULL, 1, 1, 1)
GO
INSERT [dbo].[Notification] ([Id], [Message], [FromId], [ToId], [IsActive], [IsRead]) VALUES (2, N'Package has been subscribed on 11/12/2020', NULL, 1, 1, 1)
GO
INSERT [dbo].[Notification] ([Id], [Message], [FromId], [ToId], [IsActive], [IsRead]) VALUES (3, N'Package has been subscribed on 11/15/2020', NULL, 1, 1, 1)
GO
INSERT [dbo].[Notification] ([Id], [Message], [FromId], [ToId], [IsActive], [IsRead]) VALUES (4, N'Package has been subscribed on 11/15/2020', NULL, 1, 1, 1)
GO
INSERT [dbo].[Notification] ([Id], [Message], [FromId], [ToId], [IsActive], [IsRead]) VALUES (5, N'New Package Payment has been submitted on 11/15/2020', NULL, 1, 1, 1)
GO
INSERT [dbo].[Notification] ([Id], [Message], [FromId], [ToId], [IsActive], [IsRead]) VALUES (6, N'Package has been subscribed on 11/16/2020', NULL, 1, 1, 1)
GO
INSERT [dbo].[Notification] ([Id], [Message], [FromId], [ToId], [IsActive], [IsRead]) VALUES (7, N'Package has been subscribed on 11/16/2020', NULL, 1, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Notification] OFF
GO
SET IDENTITY_INSERT [dbo].[Package] ON 
GO
INSERT [dbo].[Package] ([Id], [PackageTypeId], [CanMemberViewMobileNo], [NumberOfMobileNo], [NumberOfChatMessages], [CanViewPhoto], [IsVisibleHighProfile], [CanChat], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (24, 2, 1, 10, 5000, 1, 1, 1, 1, NULL, CAST(N'2020-07-22T16:21:43.353' AS DateTime), NULL, CAST(N'2020-11-17T04:53:59.123' AS DateTime))
GO
INSERT [dbo].[Package] ([Id], [PackageTypeId], [CanMemberViewMobileNo], [NumberOfMobileNo], [NumberOfChatMessages], [CanViewPhoto], [IsVisibleHighProfile], [CanChat], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (25, 3, 0, 5, 1000, 1, 0, 1, 1, NULL, CAST(N'2020-10-06T05:22:45.340' AS DateTime), NULL, CAST(N'2020-11-17T04:53:28.247' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Package] OFF
GO
SET IDENTITY_INSERT [dbo].[PackagePricingPlan] ON 
GO
INSERT [dbo].[PackagePricingPlan] ([Id], [PackageId], [PackageDuration], [PackagePrice]) VALUES (10010, 22, 3, CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PackagePricingPlan] ([Id], [PackageId], [PackageDuration], [PackagePrice]) VALUES (10011, 23, 3, CAST(5.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PackagePricingPlan] ([Id], [PackageId], [PackageDuration], [PackagePrice]) VALUES (10013, 22, 6, CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PackagePricingPlan] ([Id], [PackageId], [PackageDuration], [PackagePrice]) VALUES (10014, 23, 6, CAST(15.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PackagePricingPlan] ([Id], [PackageId], [PackageDuration], [PackagePrice]) VALUES (10016, 22, 12, CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PackagePricingPlan] ([Id], [PackageId], [PackageDuration], [PackagePrice]) VALUES (10017, 23, 12, CAST(30.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PackagePricingPlan] ([Id], [PackageId], [PackageDuration], [PackagePrice]) VALUES (10019, 22, 3, CAST(500.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PackagePricingPlan] ([Id], [PackageId], [PackageDuration], [PackagePrice]) VALUES (10027, 25, 3, CAST(5.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PackagePricingPlan] ([Id], [PackageId], [PackageDuration], [PackagePrice]) VALUES (10028, 25, 6, CAST(9.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PackagePricingPlan] ([Id], [PackageId], [PackageDuration], [PackagePrice]) VALUES (10029, 25, 12, CAST(12.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PackagePricingPlan] ([Id], [PackageId], [PackageDuration], [PackagePrice]) VALUES (10030, 24, 3, CAST(10.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PackagePricingPlan] ([Id], [PackageId], [PackageDuration], [PackagePrice]) VALUES (10031, 24, 6, CAST(18.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PackagePricingPlan] ([Id], [PackageId], [PackageDuration], [PackagePrice]) VALUES (10032, 24, 12, CAST(25.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[PackagePricingPlan] OFF
GO
SET IDENTITY_INSERT [dbo].[PackageType] ON 
GO
INSERT [dbo].[PackageType] ([Id], [Name]) VALUES (1, N'Classic')
GO
INSERT [dbo].[PackageType] ([Id], [Name]) VALUES (2, N'Classic Premium')
GO
INSERT [dbo].[PackageType] ([Id], [Name]) VALUES (3, N'Standard')
GO
SET IDENTITY_INSERT [dbo].[PackageType] OFF
GO
SET IDENTITY_INSERT [dbo].[PageContent] ON 
GO
INSERT [dbo].[PageContent] ([Id], [PageName], [PageUrl], [PageDescription], [IsActive], [CreatedDate], [UpdatedDate]) VALUES (6, N'Privacy Policy', N'Privacy-Policy', N'<table width="98%" align="center" cellpadding="0" cellspacing="0" style="background-color: rgb(243, 243, 243); width: 1140px; margin-bottom: 15px; border: 0px; font-family: Raleway, sans-serif; font-size: 13px;"><tbody><tr><td width="728" style="padding: 10px; border-right: 1px solid rgb(226, 226, 226); border-bottom: 1px solid rgb(226, 226, 226);"><span style="font-weight: 700;">Our Commitment to Privacy</span></td></tr><tr style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><td style="padding: 10px; border-right: 1px solid rgb(226, 226, 226); border-bottom: 1px solid rgb(226, 226, 226);">Our Privacy Policy was developed as an extension of our commitment to combine the highest-quality products and services with the highest level of integrity in dealing with our clients and partners. The Policy is designed to assist you in understanding how we collect, use and safeguard the personal information you provide to us and to assist you in making informed decisions when using. our site and our products and services. This statement will be continuously assessed against new technologies, business practices and our customers'' needs.</td></tr><tr><td valign="middle" style="padding: 10px; border-right: 1px solid rgb(226, 226, 226); border-bottom: 1px solid rgb(226, 226, 226);">&nbsp;</td></tr><tr style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><td valign="middle" style="padding: 10px; border-right: 1px solid rgb(226, 226, 226); border-bottom: 1px solid rgb(226, 226, 226);"><span style="font-weight: 700;">What Information Do We Collect?</span></td></tr><tr><td style="padding: 10px; border-right: 1px solid rgb(226, 226, 226); border-bottom: 1px solid rgb(226, 226, 226);">When you visit our Web site you may provide us with two types of information:<br><br>1) Personal information you knowingly choose to disclose that is collected on an individual basis.<br>2) Web site use information collected on an aggregate basis as you and others browse our Web site</td></tr><tr style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><td height="12" valign="middle" style="padding: 10px; border-right: 1px solid rgb(226, 226, 226); border-bottom: 1px solid rgb(226, 226, 226);">&nbsp;</td></tr><tr><td height="12" valign="middle" style="padding: 10px; border-right: 1px solid rgb(226, 226, 226); border-bottom: 1px solid rgb(226, 226, 226);"><span style="font-weight: 700;">1. Personal Information You Choose to Provide Credit Card Information</span></td></tr><tr style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><td style="padding: 10px; border-right: 1px solid rgb(226, 226, 226); border-bottom: 1px solid rgb(226, 226, 226);">If you choose to purchase products or services from us or our partners, you may need to give personal information and authorization to obtain information from various credit services. For example, you may need to provide the following information:<br>· Name<br>· Mailing address<br>· Email address<br>· Credit card number<br>· Home and business phone number<br>· Other personal information (i.e. mother’s maiden name)</td></tr></tbody></table>', 1, CAST(N'2020-08-11T17:04:02.820' AS DateTime), NULL)
GO
INSERT [dbo].[PageContent] ([Id], [PageName], [PageUrl], [PageDescription], [IsActive], [CreatedDate], [UpdatedDate]) VALUES (7, N'About Us', N'About-Us', N'<p style="margin-bottom: 20px; font-family: Raleway, sans-serif; font-size: 22px; color: rgb(119, 117, 118); font-weight: bold;">Founded in 2020 in India County. A leading niche online matrimonial network, interconnecting singles globally. Matrimony.com is a registered and trademarked corporation. Designed for long term relationship goal.</p><p style="margin-bottom: 20px; font-family: Raleway, sans-serif;">For over 10 years, we have helped millions of people who look for their significant other. We are leaders in our chosen niche covering North America, Canada, United Kingdom, Europe, Australia, Far East, India, Pakistan, Middle East and New Zealand. Our Matrimonial services are tailored to suit different religions, cultures and ethnicity. Many professionals live busy work life and find it hard to find time to meet like minded singles. Matrimony.com was created to make the process relatively easy and convenient.</p><h3 style="font-family: Raleway, sans-serif; font-weight: 600; line-height: 1.5; color: rgb(170, 0, 0); margin-top: 0px; margin-right: 0px; margin-left: 0px; font-size: 22px;">Our Intention</h3><p style="margin-bottom: 20px; font-family: Raleway, sans-serif;">From the early stages it has been our goal to help you connect with someone of your choice. For a long lasting relationship of your dreams. Our process is a fusion of old matchmaking principles with integration of modern technology.</p><h3 style="font-family: Raleway, sans-serif; font-weight: 600; line-height: 1.5; color: rgb(170, 0, 0); margin-top: 0px; margin-right: 0px; margin-left: 0px; font-size: 22px;">Our Vision</h3><p style="margin-bottom: 20px; font-family: Raleway, sans-serif;">To be the No.1 in our niche and introduce new features beneficial to members. To continue to grow with a loyal and increasing customer network across the globe.</p><h3 style="font-family: Raleway, sans-serif; font-weight: 600; line-height: 1.5; color: rgb(170, 0, 0); margin-top: 0px; margin-right: 0px; margin-left: 0px; font-size: 22px;">Our Mission</h3><p style="margin-bottom: 20px; font-family: Raleway, sans-serif;">To help you move closer to the desired outcome with convenience. To provide a safe progressive matchmaking platform. Offer new matchmaking features to meet member expectations. Continued growth in our membership base around the world.</p><h3 style="font-family: Raleway, sans-serif; font-weight: 600; line-height: 1.5; color: rgb(170, 0, 0); margin-top: 0px; margin-right: 0px; margin-left: 0px; font-size: 22px;">What keeps us going?</h3><p style="margin-bottom: 20px; font-family: Raleway, sans-serif;">Your continued support and happy success stories!</p>', 1, CAST(N'2020-08-11T17:05:33.403' AS DateTime), CAST(N'2020-10-07T02:44:23.913' AS DateTime))
GO
INSERT [dbo].[PageContent] ([Id], [PageName], [PageUrl], [PageDescription], [IsActive], [CreatedDate], [UpdatedDate]) VALUES (8, N'Terms of Services', N'Terms-of-Services', N'<p style="margin-bottom: 20px; font-family: Raleway, sans-serif; font-size: 13px; background-color: rgb(243, 243, 243);"><span style="font-weight: 700;">THIS AGREEMENT WAS LAST UPDATED ON March 23, 2003</span></p><p style="margin-bottom: 20px; font-family: Raleway, sans-serif; font-size: 13px; background-color: rgb(243, 243, 243);">Please read the following User Agreement. When you sign up for any service within Matrimony<span style="position: relative; font-size: 12px; line-height: 0; vertical-align: baseline; top: -0.5em;">®</span>.com, all of which are hereinafter referred to collectively as the "Website", you agree to all of the terms and conditions of this Agreement. Please read the following terms and conditions carefully, as they form the agreement between us. IF YOU DO NOT AGREE TO THESE TERMS AND CONDITIONS, YOU MAY NOT USE THE WEBSITE, AND SHOULD NOT PROCEED TO REGISTER. BY USING THE WEBSITE YOU ARE AGREEING TO BE BOUND BY THIS USER AGREEMENT, INCLUDING ALL AMENDMENTS MADE TO DATE.</p><p style="margin-bottom: 20px; font-family: Raleway, sans-serif; font-size: 13px; background-color: rgb(243, 243, 243);"><br><span style="font-weight: 700;">TERMS AND CONDITIONS OF THE WEBSITE</span></p><p style="margin-bottom: 20px; font-family: Raleway, sans-serif; font-size: 13px; background-color: rgb(243, 243, 243);"><span style="font-weight: 700;">User Agreement</span></p><p style="margin-bottom: 20px; font-family: Raleway, sans-serif; font-size: 13px; background-color: rgb(243, 243, 243);">This Agreement constitutes your agreement with Matrimony<span style="position: relative; font-size: 12px; line-height: 0; vertical-align: baseline; top: -0.5em;">®</span>.com("Matrimony<span style="position: relative; font-size: 12px; line-height: 0; vertical-align: baseline; top: -0.5em;">®</span>.com") with respect to your use of the Website. You must agree to abide by all of the terms and conditions contained in this Agreement in order to become or remain an authorized user of the Website. As used in this Agreement, "we" and "us" means Matrimony<span style="position: relative; font-size: 12px; line-height: 0; vertical-align: baseline; top: -0.5em;">®</span>.com, or any successor or assignee of Matrimony<span style="position: relative; font-size: 12px; line-height: 0; vertical-align: baseline; top: -0.5em;">®</span>.com .</p><p style="margin-bottom: 20px; font-family: Raleway, sans-serif; font-size: 13px; background-color: rgb(243, 243, 243);"><span style="font-weight: 700;">Website Agreement</span></p><p style="margin-bottom: 20px; font-family: Raleway, sans-serif; font-size: 13px; background-color: rgb(243, 243, 243);"><span style="font-weight: 700;">Right to Use.</span></p><p style="margin-bottom: 20px; font-family: Raleway, sans-serif; font-size: 13px; background-color: rgb(243, 243, 243);">You represent, warrant and covenant that you are at least 18 years old. This Website is addressed to adults only. By using the Website you agree that you are 18 years of age and older. Failure to comply with this Agreement may result in legal actions.</p><p style="margin-bottom: 20px; font-family: Raleway, sans-serif; font-size: 13px; background-color: rgb(243, 243, 243);"><span style="font-weight: 700;">Adult</span></p><p style="margin-bottom: 20px; font-family: Raleway, sans-serif; font-size: 13px; background-color: rgb(243, 243, 243);">You represent, warrant and covenant that you are at least 18 years old. This Website is addressed to adults only. By using the Website you agree that you are 18 years of age and older. Failure to comply with this Agreement may result in legal actions.</p><p style="margin-bottom: 20px; font-family: Raleway, sans-serif; font-size: 13px; background-color: rgb(243, 243, 243);"><span style="font-weight: 700;">Code of Conduct</span>.</p><p style="margin-bottom: 20px; font-family: Raleway, sans-serif; font-size: 13px; background-color: rgb(243, 243, 243);"><span style="font-weight: 700;">You agree to use the Website in accordance with the following Code of Conduct:</span><br>1) You are solely responsible for any information that you display when using the Website or to other members. You will keep all information provided to you through the Website as private and confidential and will not give such information to anyone without the permission of the person who provided it to you;<br><br>2) You will not use the Website to engage in any form of harassment or offensive behavior, including but not limited to the posting of communications, pictures or recordings, which contain libelous, slanderous, abusive or defamatory statements, or racist, pornographic, obscene,&nbsp;or offensive language;<br><br>3) You will not forward chain letters through the Website;<br><br>4) You will not use the Website to infringe the privacy rights, property rights, or other civil rights of any person;<br><br>5) You will not post messages, pictures or recordings or use the Website in any way which violates, plagiarizes or infringes upon the rights of any third party, including but not limited to any copyright or trademark law, privacy or other personal or proprietary rights, or is fraudulent or otherwise unlawful or violates any law.<br>&nbsp;Your use of the Website is for your own personal use. You may not authorize others to use the Website and you may not transfer your accounts with other users.<br><br>6) You will not use the Website to distribute, promote or otherwise publish any material containing any solicitation for funds, advertising or solicitation for goods or websites.<br><br>7) You are aware that the Website may contain explicit adult oriented materials provided by consenting users.</p><p style="margin-bottom: 20px; font-family: Raleway, sans-serif; font-size: 13px; background-color: rgb(243, 243, 243);"><span style="font-weight: 700;">Privacy and Use of Information</span></p><p style="margin-bottom: 20px; font-family: Raleway, sans-serif; font-size: 13px; background-color: rgb(243, 243, 243);"><span style="font-weight: 700;">You acknowledge that</span><br><br>(1) We cannot ensure the security or privacy of information you provide through the Internet and your email messages, and you release us from any and all liability in connection with the use of such information by other parties;<br><br>(2) We are not responsible for, and cannot control, the use by others of any information which you provide to them and you should use caution in selecting the personal information you provide to others through the Website.<br><br>(3) We cannot assume any responsibility for the content of messages sent by other users of the Website, and you release us from any and all liability &nbsp;in connection with the contents of any communications you may receive from other users.<br><br>(d) You acknowledge that you can not sue Matrimony<span style="position: relative; font-size: 12px; line-height: 0; vertical-align: baseline; top: -0.5em;">®</span>.com or any of its employees for any damages done to you through the site.<br>We cannot guarantee, and assume no responsibility for verifying, the accuracy of the information provided by other users of the Website. You may not use the Website for any unlawful purpose.</p><p style="margin-bottom: 20px; font-family: Raleway, sans-serif; font-size: 13px; background-color: rgb(243, 243, 243);"><span style="font-weight: 700;">Monitoring of Information.</span></p><p style="margin-bottom: 20px; font-family: Raleway, sans-serif; font-size: 13px; background-color: rgb(243, 243, 243);">We reserve the right to monitor all advertisements, public postings and messages to ensure that they conform to the content guidelines, which may be applicable from time to time. We also reserve the right to monitor all messages and chats that take place through the site. We are not responsible for any offensive or obscene materials that may be transmitted or posted by other users (including unauthorized users as well as the possibility of "hackers"). We are also not responsible for the use of any personal information that the user may choose to post on the Website.</p><p style="margin-bottom: 20px; font-family: Raleway, sans-serif; font-size: 13px; background-color: rgb(243, 243, 243);"><span style="font-weight: 700;">Removal of Information.</span></p><p style="margin-bottom: 20px; font-family: Raleway, sans-serif; font-size: 13px; background-color: rgb(243, 243, 243);">While we do not and cannot review every message or other material posted or sent by users of the Website, and are not responsible for any content of these messages or materials, we reserve the right, but are not obligated, to delete, move, or edit messages or materials, that we, in our sole discretion, deem to violate the Code of Conduct set out above or any applicable content guidelines, or to be otherwise unacceptable. You shall remain solely responsible for the content of advertisements, public postings, messages and other materials you may upload to the Website or users of the Website.</p>', 1, CAST(N'2020-08-11T17:07:35.917' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[PageContent] OFF
GO
SET IDENTITY_INSERT [dbo].[PartnerCatagoryMaritalStatus] ON 
GO
INSERT [dbo].[PartnerCatagoryMaritalStatus] ([Id], [MemberId], [PartnerMaritalStatus], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, 10045, N'Married', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCatagoryMaritalStatus] ([Id], [MemberId], [PartnerMaritalStatus], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, 10045, N'Widower', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[PartnerCatagoryMaritalStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[PartnerCategory] ON 
GO
INSERT [dbo].[PartnerCategory] ([Id], [PartCategoryName], [ParentID], [CategoryFor], [SortOrder], [Status], [CategoryType], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Marital status', NULL, NULL, NULL, NULL, N'dropdown', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategory] ([Id], [PartCategoryName], [ParentID], [CategoryFor], [SortOrder], [Status], [CategoryType], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Education Level', NULL, NULL, NULL, NULL, N'dropdown', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategory] ([Id], [PartCategoryName], [ParentID], [CategoryFor], [SortOrder], [Status], [CategoryType], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Orphan', 14, N'both', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategory] ([Id], [PartCategoryName], [ParentID], [CategoryFor], [SortOrder], [Status], [CategoryType], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'Disable', 14, N'both', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategory] ([Id], [PartCategoryName], [ParentID], [CategoryFor], [SortOrder], [Status], [CategoryType], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'Poor', 14, N'both', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategory] ([Id], [PartCategoryName], [ParentID], [CategoryFor], [SortOrder], [Status], [CategoryType], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, N'Overage', 14, N'both', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategory] ([Id], [PartCategoryName], [ParentID], [CategoryFor], [SortOrder], [Status], [CategoryType], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, N'Overweight', 14, N'both', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategory] ([Id], [PartCategoryName], [ParentID], [CategoryFor], [SortOrder], [Status], [CategoryType], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, N'Stigmatized by Society', 14, N'both', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategory] ([Id], [PartCategoryName], [ParentID], [CategoryFor], [SortOrder], [Status], [CategoryType], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (9, N'UnMarried', 1, N'both', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategory] ([Id], [PartCategoryName], [ParentID], [CategoryFor], [SortOrder], [Status], [CategoryType], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, N'Widow', 1, N'female', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategory] ([Id], [PartCategoryName], [ParentID], [CategoryFor], [SortOrder], [Status], [CategoryType], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (11, N'Divorced', 1, N'female', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategory] ([Id], [PartCategoryName], [ParentID], [CategoryFor], [SortOrder], [Status], [CategoryType], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (12, N'Married', 1, N'both', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategory] ([Id], [PartCategoryName], [ParentID], [CategoryFor], [SortOrder], [Status], [CategoryType], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (13, N'Widower', 1, N'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategory] ([Id], [PartCategoryName], [ParentID], [CategoryFor], [SortOrder], [Status], [CategoryType], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (14, N'Others', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategory] ([Id], [PartCategoryName], [ParentID], [CategoryFor], [SortOrder], [Status], [CategoryType], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (15, N'Uneducated', 2, N'both', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategory] ([Id], [PartCategoryName], [ParentID], [CategoryFor], [SortOrder], [Status], [CategoryType], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (16, N'Primary', 2, N'both', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategory] ([Id], [PartCategoryName], [ParentID], [CategoryFor], [SortOrder], [Status], [CategoryType], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (17, N'Middel', 2, N'both', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategory] ([Id], [PartCategoryName], [ParentID], [CategoryFor], [SortOrder], [Status], [CategoryType], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (18, N'HighSchool-10 grades', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategory] ([Id], [PartCategoryName], [ParentID], [CategoryFor], [SortOrder], [Status], [CategoryType], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (19, N'HighSchool-21 grades', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategory] ([Id], [PartCategoryName], [ParentID], [CategoryFor], [SortOrder], [Status], [CategoryType], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (20, N'Diploma', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategory] ([Id], [PartCategoryName], [ParentID], [CategoryFor], [SortOrder], [Status], [CategoryType], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (21, N'Bachelors', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategory] ([Id], [PartCategoryName], [ParentID], [CategoryFor], [SortOrder], [Status], [CategoryType], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (22, N'Masters', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategory] ([Id], [PartCategoryName], [ParentID], [CategoryFor], [SortOrder], [Status], [CategoryType], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (23, N'PhD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[PartnerCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[PartnerCategoryResult] ON 
GO
INSERT [dbo].[PartnerCategoryResult] ([ID], [MemberId], [CR_ListId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10119, 44, 7, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategoryResult] ([ID], [MemberId], [CR_ListId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10120, 44, 14, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategoryResult] ([ID], [MemberId], [CR_ListId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10121, 44, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategoryResult] ([ID], [MemberId], [CR_ListId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10122, 44, 16, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategoryResult] ([ID], [MemberId], [CR_ListId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10123, 44, 24, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategoryResult] ([ID], [MemberId], [CR_ListId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10124, 44, 26, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategoryResult] ([ID], [MemberId], [CR_ListId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10125, 44, 29, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategoryResult] ([ID], [MemberId], [CR_ListId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10126, 44, 32, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategoryResult] ([ID], [MemberId], [CR_ListId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10127, 44, 34, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategoryResult] ([ID], [MemberId], [CR_ListId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10128, 44, 38, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategoryResult] ([ID], [MemberId], [CR_ListId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10129, 44, 40, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategoryResult] ([ID], [MemberId], [CR_ListId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10130, 44, 43, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategoryResult] ([ID], [MemberId], [CR_ListId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10131, 44, 44, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategoryResult] ([ID], [MemberId], [CR_ListId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10132, 44, 21, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategoryResult] ([ID], [MemberId], [CR_ListId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10133, 44, 46, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategoryResult] ([ID], [MemberId], [CR_ListId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10134, 44, 47, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategoryResult] ([ID], [MemberId], [CR_ListId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10135, 44, 10047, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategoryResult] ([ID], [MemberId], [CR_ListId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10136, 44, 10048, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[PartnerCategoryResult] OFF
GO
SET IDENTITY_INSERT [dbo].[PartnerCatoryEducationLevel] ON 
GO
INSERT [dbo].[PartnerCatoryEducationLevel] ([Id], [MemberId], [EducationLevelId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, 44, 4, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[PartnerCatoryEducationLevel] OFF
GO
SET IDENTITY_INSERT [dbo].[PaymentOptions] ON 
GO
INSERT [dbo].[PaymentOptions] ([Id], [PaymentType], [BankName], [AccountTitle], [AccountNumber], [BranchCode], [BankLogo], [IBAN], [Description], [IsActive], [CreatedBy], [CreatedDateTime]) VALUES (5, N'Bank Transfer', N'State bank of India', N'Saving', N'11370618693', N'SBIN0001049', N'20-10-2020-07-556373876293734723720.jpg', N'-', N'<p><br></p>', 1, NULL, CAST(N'2020-10-20T03:55:37.020' AS DateTime))
GO
INSERT [dbo].[PaymentOptions] ([Id], [PaymentType], [BankName], [AccountTitle], [AccountNumber], [BranchCode], [BankLogo], [IBAN], [Description], [IsActive], [CreatedBy], [CreatedDateTime]) VALUES (6, N'Paypal', N'PayPal', N'PayPal', N'-', N'-', NULL, N'-', N'<p>Send Money by PayPal&nbsp;</p><p>muju999@gmail.com</p>', 1, NULL, CAST(N'2020-11-09T06:05:03.077' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[PaymentOptions] OFF
GO
SET IDENTITY_INSERT [dbo].[ProfileRequirement] ON 
GO
INSERT [dbo].[ProfileRequirement] ([Id], [RequirmentName], [CategoryId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'Partner categories', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ProfileRequirement] ([Id], [RequirmentName], [CategoryId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'Facilities for woman', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ProfileRequirement] ([Id], [RequirmentName], [CategoryId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, N'Rights for woman', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ProfileRequirement] ([Id], [RequirmentName], [CategoryId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (4, N'Proposal Questions for Woman', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ProfileRequirement] ([Id], [RequirmentName], [CategoryId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (5, N'Facilities for man', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ProfileRequirement] ([Id], [RequirmentName], [CategoryId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (6, N'Proposal Questions for Man', NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[ProfileRequirement] OFF
GO
SET IDENTITY_INSERT [dbo].[ProposalQuestions] ON 
GO
INSERT [dbo].[ProposalQuestions] ([ID], [Question], [QuestionType], [QuestionsFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'Are you divorced?', N'text', N'M', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ProposalQuestions] ([ID], [Question], [QuestionType], [QuestionsFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'Does you family agree with this?', NULL, N'M', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ProposalQuestions] ([ID], [Question], [QuestionType], [QuestionsFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, N'Are you a tolerant man?', NULL, N'M', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ProposalQuestions] ([ID], [Question], [QuestionType], [QuestionsFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (4, N'Why do you want to get married another woman?', N'text', N'M', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ProposalQuestions] ([ID], [Question], [QuestionType], [QuestionsFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (5, N'Will you consider other kids from other?', NULL, N'M', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ProposalQuestions] ([ID], [Question], [QuestionType], [QuestionsFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (6, N'Does your existing wife accept your new marriage?', NULL, N'M', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ProposalQuestions] ([ID], [Question], [QuestionType], [QuestionsFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (7, N'I want to get Married in (Duration).', N'text', N'M', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ProposalQuestions] ([ID], [Question], [QuestionType], [QuestionsFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (8, N'Are you divorced?', N'text', N'W', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ProposalQuestions] ([ID], [Question], [QuestionType], [QuestionsFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (9, N'Will you consider other kids from other wivies?', NULL, N'W', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ProposalQuestions] ([ID], [Question], [QuestionType], [QuestionsFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10, N'Are you a tolerant woman?', NULL, N'W', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ProposalQuestions] ([ID], [Question], [QuestionType], [QuestionsFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (11, N'Why do you get married as ', N'text', N'W', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ProposalQuestions] ([ID], [Question], [QuestionType], [QuestionsFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (12, N'Will you happily accept other existing sister wives', NULL, N'W', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ProposalQuestions] ([ID], [Question], [QuestionType], [QuestionsFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (13, N'Does your family agree with this?', NULL, N'W', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ProposalQuestions] ([ID], [Question], [QuestionType], [QuestionsFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (14, N'I want to get Married in (Duration).', N'text', N'W', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ProposalQuestions] ([ID], [Question], [QuestionType], [QuestionsFor], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (15, N'Where will the wife stay', NULL, N'M', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[ProposalQuestions] OFF
GO
SET IDENTITY_INSERT [dbo].[ProposalQuestionsResult] ON 
GO
INSERT [dbo].[ProposalQuestionsResult] ([ID], [MemberId], [ProposalQuestionsId], [ProposalQuestionsResult], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (11, 30, 6, N'No', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ProposalQuestionsResult] ([ID], [MemberId], [ProposalQuestionsId], [ProposalQuestionsResult], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (12, 30, 5, N'No', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ProposalQuestionsResult] ([ID], [MemberId], [ProposalQuestionsId], [ProposalQuestionsResult], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (13, 30, 3, N'Yes', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ProposalQuestionsResult] ([ID], [MemberId], [ProposalQuestionsId], [ProposalQuestionsResult], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (14, 30, 12, N'Yes', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ProposalQuestionsResult] ([ID], [MemberId], [ProposalQuestionsId], [ProposalQuestionsResult], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (15, 44, 2, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ProposalQuestionsResult] ([ID], [MemberId], [ProposalQuestionsId], [ProposalQuestionsResult], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10015, 44, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ProposalQuestionsResult] ([ID], [MemberId], [ProposalQuestionsId], [ProposalQuestionsResult], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10016, 44, 9, N'Yes', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ProposalQuestionsResult] ([ID], [MemberId], [ProposalQuestionsId], [ProposalQuestionsResult], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10017, 44, 13, N'Yes', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ProposalQuestionsResult] ([ID], [MemberId], [ProposalQuestionsId], [ProposalQuestionsResult], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10018, 44, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ProposalQuestionsResult] ([ID], [MemberId], [ProposalQuestionsId], [ProposalQuestionsResult], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10019, 44, 10, N'Yes', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ProposalQuestionsResult] ([ID], [MemberId], [ProposalQuestionsId], [ProposalQuestionsResult], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10020, 44, 12, N'Yes', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[ProposalQuestionsResult] OFF
GO
SET IDENTITY_INSERT [dbo].[Religion] ON 
GO
INSERT [dbo].[Religion] ([ID], [ReligionName], [CreatedDate], [CreatedBy], [UpdatedBy], [UpdatedDate]) VALUES (1, N'Islam', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Religion] OFF
GO
SET IDENTITY_INSERT [dbo].[ReligionSect] ON 
GO
INSERT [dbo].[ReligionSect] ([ID], [SectName], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Sunni', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ReligionSect] ([ID], [SectName], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Ahl-Hadith', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ReligionSect] ([ID], [SectName], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Deobandi', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ReligionSect] ([ID], [SectName], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (4, N'Shia', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[ReligionSect] OFF
GO
SET IDENTITY_INSERT [dbo].[States] ON 
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Sindh', 163, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (3, N'KPK', 163, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (4, N'Punjab', 163, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (15, N'Jammu and Kashmir', 163, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (38, N'Gilgit Bultistan', 163, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1002, N'Alabama', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1003, N'Alaska', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1004, N'Arizona', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1005, N'Arkansas', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1006, N'California', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1007, N'Colorado', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1008, N'Connecticut', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1009, N'Delaware', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1010, N'Florida', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1011, N'Georgia', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1012, N'Hawaii', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1013, N'Idaho', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1014, N'Illinois', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1015, N'Indiana', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1016, N'Iowa', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1017, N'Kansas', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1018, N'Kentucky', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1019, N'Louisiana', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1020, N'Maine', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1021, N'Maryland', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1022, N'Massachusetts', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1023, N'Michigan', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1024, N'Minnesota', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1025, N'Mississippi', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1026, N'Missouri', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1027, N'Montana', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1028, N'Nebraska', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1029, N'Nevada', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1030, N'New Hampshire', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1031, N'New Jersey', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1032, N'New Mexico', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1033, N'New York', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1034, N'North Carolina', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1035, N'North Dakota', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1036, N'Ohio', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1037, N'Oklahoma', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1038, N'Oregon', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1039, N'Pennsylvania', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1040, N'Rhode Island', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1041, N'South Carolina', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1042, N'South Dakota', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1043, N'Tennessee', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1044, N'Texas', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1045, N'Utah', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1046, N'Vermont', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1047, N'Virginia', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1048, N'Washington', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1049, N'West Virginia', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1050, N'Wisconsin', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1051, N'Wyoming', 232, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[States] ([StateID], [Name], [CountryID], [CreatedBy], [CreatedDate], [UpdatedDate], [UpdatedBy]) VALUES (1052, NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[States] OFF
GO
SET IDENTITY_INSERT [dbo].[UploadDocuments] ON 
GO
INSERT [dbo].[UploadDocuments] ([Id], [DocTypeID], [FilePath], [MemberId]) VALUES (2, 2, N'14-09-2022-15-186379878353596864910.png', 44)
GO
INSERT [dbo].[UploadDocuments] ([Id], [DocTypeID], [FilePath], [MemberId]) VALUES (3, 1, NULL, 44)
GO
SET IDENTITY_INSERT [dbo].[UploadDocuments] OFF
GO
SET IDENTITY_INSERT [dbo].[WifeDetail] ON 
GO
INSERT [dbo].[WifeDetail] ([ID], [DetailQuestions], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'Does your existing wife agree with your next marriage?', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WifeDetail] ([ID], [DetailQuestions], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'How many Exisiting wivies you have?', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WifeDetail] ([ID], [DetailQuestions], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, N'Wife''s Religion', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WifeDetail] ([ID], [DetailQuestions], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (4, N'Wife''s Age', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WifeDetail] ([ID], [DetailQuestions], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (5, N'Year of marriage', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WifeDetail] ([ID], [DetailQuestions], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (6, N'Wife''s Education', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WifeDetail] ([ID], [DetailQuestions], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (7, N'Wife''s Job', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WifeDetail] ([ID], [DetailQuestions], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (8, N'Wife''s Location', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WifeDetail] ([ID], [DetailQuestions], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (9, N'No. kids', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[WifeDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[WifeDetailResult] ON 
GO
INSERT [dbo].[WifeDetailResult] ([ID], [MemberId], [ExsitingWife], [WifeReligion], [MarriageYear], [WifeLocation], [WifeKids], [WifeJob], [LivingStatus], [EducationLevelId], [HaveWife], [WifeAge], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10, 30, 1, N'Islam', N'1969', N'sdf', N'2', N'asdf', NULL, 1, N'0', N'34', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WifeDetailResult] ([ID], [MemberId], [ExsitingWife], [WifeReligion], [MarriageYear], [WifeLocation], [WifeKids], [WifeJob], [LivingStatus], [EducationLevelId], [HaveWife], [WifeAge], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (12, 0, 1, N'Islam', N'2005', N'Home', N'2', N'xyz', NULL, 4, N'1', N'20', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WifeDetailResult] ([ID], [MemberId], [ExsitingWife], [WifeReligion], [MarriageYear], [WifeLocation], [WifeKids], [WifeJob], [LivingStatus], [EducationLevelId], [HaveWife], [WifeAge], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (16, 44, 1, N'Islam', N'2007', N'xyz', N'2', N'non', N'JointFamily', 4, N'0', N'20', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WifeDetailResult] ([ID], [MemberId], [ExsitingWife], [WifeReligion], [MarriageYear], [WifeLocation], [WifeKids], [WifeJob], [LivingStatus], [EducationLevelId], [HaveWife], [WifeAge], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (17, 44, 3, N'Islam', N'1903', N'xyz', N'1', N'xyz', N'JointFamily', 3, NULL, N'20', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[WifeDetailResult] OFF
GO
SET IDENTITY_INSERT [dbo].[WomenRights] ON 
GO
INSERT [dbo].[WomenRights] ([ID], [WomenRights], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'Do equal Justice', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WomenRights] ([ID], [WomenRights], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'No bad names', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WomenRights] ([ID], [WomenRights], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, N'Do not fight', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WomenRights] ([ID], [WomenRights], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (4, N'Respect her', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WomenRights] ([ID], [WomenRights], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (5, N'Provide equal time', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WomenRights] ([ID], [WomenRights], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (6, N'Do not lie', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WomenRights] ([ID], [WomenRights], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (7, N'Respect her family', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WomenRights] ([ID], [WomenRights], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (8, N'Give her meher', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WomenRights] ([ID], [WomenRights], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (9, N'Monthly Rupees', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WomenRights] ([ID], [WomenRights], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10, N'Do not Shout', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[WomenRights] OFF
GO
SET IDENTITY_INSERT [dbo].[WomenRightsResult] ON 
GO
INSERT [dbo].[WomenRightsResult] ([ID], [MemberId], [WomenRightsId], [WomenRightsResult], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, 44, 4, N'true', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WomenRightsResult] ([ID], [MemberId], [WomenRightsId], [WomenRightsResult], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, 44, 1, N'true', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[WomenRightsResult] OFF
GO
ALTER TABLE [dbo].[ChatFriendRequest] ADD  CONSTRAINT [DF_ChatFriendRequest_IsBlocked]  DEFAULT ((0)) FOR [IsBlocked]
GO
ALTER TABLE [dbo].[ChatMessage] ADD  CONSTRAINT [DF_ChatMessage_IsRead]  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [dbo].[ContactUs] ADD  CONSTRAINT [DF_ContactUs_IsRead]  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [dbo].[EmailSMSTemplate] ADD  CONSTRAINT [DF_EmailSMSTemplate_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[FeedBack] ADD  CONSTRAINT [DF_FeedBack_IsApproved]  DEFAULT ((0)) FOR [IsApproved]
GO
ALTER TABLE [dbo].[FeedBack] ADD  CONSTRAINT [DF_FeedBack_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[FeedBack] ADD  CONSTRAINT [DF_FeedBack_IsRead]  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [dbo].[FieldsPermission] ADD  CONSTRAINT [DF_FieldsPermission_IsVisibleForPremium]  DEFAULT ((0)) FOR [IsVisibleForPremium]
GO
ALTER TABLE [dbo].[FieldsPermission] ADD  CONSTRAINT [DF_FieldsPermission_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[MemberFamilyDetail] ADD  CONSTRAINT [DF_MemberFamilyDetail_IsMotherAlive]  DEFAULT ((0)) FOR [IsMotherAlive]
GO
ALTER TABLE [dbo].[MemberFamilyDetail] ADD  CONSTRAINT [DF_MemberFamilyDetail_IsFatherAlive]  DEFAULT ((0)) FOR [IsFatherAlive]
GO
ALTER TABLE [dbo].[MemberLoginDetail] ADD  CONSTRAINT [DF_MemberLoginDetail_IsEmailConfirmed]  DEFAULT ((0)) FOR [IsEmailConfirmed]
GO
ALTER TABLE [dbo].[MemberLoginDetail] ADD  CONSTRAINT [DF_MemberLoginDetail_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[MemberLoginDetail] ADD  CONSTRAINT [DF_MemberLoginDetail_IsFirstLoginAttempt]  DEFAULT ((1)) FOR [IsFirstLoginAttempt]
GO
ALTER TABLE [dbo].[MemberLoginDetail] ADD  CONSTRAINT [DF_MemberLoginDetail_IsMobileUser]  DEFAULT ((0)) FOR [IsMobileUser]
GO
ALTER TABLE [dbo].[MemberPackageConfirmPayment] ADD  CONSTRAINT [DF_MemberPackageConfirmPayment_IsMobilePic]  DEFAULT ((0)) FOR [IsMobilePic]
GO
ALTER TABLE [dbo].[MemberPackageSubscription] ADD  CONSTRAINT [DF_MemberPackageSubscription_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[MemberPackageSubscriptionDetail] ADD  CONSTRAINT [DF_MemberPackageSubscriptionDetail_TotalNoOfContactsToShow]  DEFAULT ((0)) FOR [TotalNoOfContactsToShow]
GO
ALTER TABLE [dbo].[MemberPackageSubscriptionDetail] ADD  CONSTRAINT [DF_MemberPackageSubscriptionDetail_UsedNoOfContacts]  DEFAULT ((0)) FOR [UsedNoOfContacts]
GO
ALTER TABLE [dbo].[MemberPackageSubscriptionDetail] ADD  CONSTRAINT [DF_MemberPackageSubscriptionDetail_TotalNoOfChatMessages]  DEFAULT ((0)) FOR [TotalNoOfChatMessages]
GO
ALTER TABLE [dbo].[MemberPackageSubscriptionDetail] ADD  CONSTRAINT [DF_MemberPackageSubscriptionDetail_UsedNoOfChatMessages]  DEFAULT ((0)) FOR [UsedNoOfChatMessages]
GO
ALTER TABLE [dbo].[MemberPackageSubscriptionDetail] ADD  CONSTRAINT [DF_MemberPackageSubscriptionDetail_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[MemberRegistration] ADD  CONSTRAINT [DF_memberRegistration_IsMobilePic]  DEFAULT ((0)) FOR [IsMobilePic]
GO
ALTER TABLE [dbo].[Notification] ADD  CONSTRAINT [DF_Notification_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Notification] ADD  CONSTRAINT [DF_Notification_IsRead]  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [dbo].[Package] ADD  CONSTRAINT [DF_Package_CanMemberViewMobileNo]  DEFAULT ((0)) FOR [CanMemberViewMobileNo]
GO
ALTER TABLE [dbo].[Package] ADD  CONSTRAINT [DF_Package_IsProfileHighlighter]  DEFAULT ((0)) FOR [NumberOfChatMessages]
GO
ALTER TABLE [dbo].[Package] ADD  CONSTRAINT [DF_Package_CanViewPhoto]  DEFAULT ((0)) FOR [CanViewPhoto]
GO
ALTER TABLE [dbo].[Package] ADD  CONSTRAINT [DF_Package_IsVisibleHighProfile]  DEFAULT ((0)) FOR [IsVisibleHighProfile]
GO
ALTER TABLE [dbo].[Package] ADD  CONSTRAINT [DF_Package_CanChat]  DEFAULT ((0)) FOR [CanChat]
GO
ALTER TABLE [dbo].[Package] ADD  CONSTRAINT [DF_Package_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[PageContent] ADD  CONSTRAINT [DF_PageContent_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[CR_List]  WITH CHECK ADD  CONSTRAINT [FK_CR_List_CR_ListType] FOREIGN KEY([ListTypeID])
REFERENCES [dbo].[CR_ListType] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CR_List] CHECK CONSTRAINT [FK_CR_List_CR_ListType]
GO
/****** Object:  StoredProcedure [dbo].[AdminReporting]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[AdminReporting]
AS
BEGIN
declare @FreeCount int
declare @PaidCount int
declare @TotalFeedBack int
declare @ActivePackages int
declare @TotalPayment int
declare @PendingPayment int
set @FreeCount = (select count(*) from MemberRegistration mr left outer join MemberPackageSubscriptionDetail mpsd on mpsd.MemberId <> mr.id)
 set @PaidCount = (select count(*) from MemberRegistration mr join MemberPackageSubscriptionDetail mpsd on mpsd.MemberId = mr.id)
 set @TotalFeedBack =(select count(*) from FeedBack)
 set @ActivePackages = (select count(*) from Package)
 set @TotalPayment = (select SUM(Amount) from MemberPackagePayment where Status ='Approved')
 set @PendingPayment = (select SUM(Amount) from MemberPackagePayment where Status ='Pending')
 select @FreeCount as FreeMembers,@PaidCount as PaidMembers,@TotalFeedBack as TotalFeedBack,@ActivePackages as ActivePackages,@TotalPayment as TotalPayments,@PendingPayment as PendingPayments
END
GO
/****** Object:  StoredProcedure [dbo].[DisableCurrentMemberPackageIfExpired]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[DisableCurrentMemberPackageIfExpired]
@MemberId bigint
AS
BEGIN
Update MemberPackageSubscription
Set IsActive=0
Where memberId=@MemberId
AND (GetDate() Not between SubscriptionStartDate And SubscriptionEndDate)
END
GO
/****** Object:  StoredProcedure [dbo].[FetchAcceptanceCriteria]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Muhammad Awais>
-- Create date: <August-08-2022,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FetchAcceptanceCriteria]
@MemberId bigint
AS
BEGIN

SELECT ac.AuntsAproval, ac.BrothersAproval, ac.DaughtersAproval, ac.FathersAproval, ac.MotherAproval, ac.SisterAproval, ac.SonsAproval, ac.UnclesAproval
FROM [dbo].[AcceptanceCriteria] ac


Where ac.MemberId=@MemberId

END




GO
/****** Object:  StoredProcedure [dbo].[FetchChatFriendList]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Muhammad Zeshan>
-- Create date: <01-Sep-2020>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FetchChatFriendList]
@MemberId bigint,
@Search nvarchar(50)
AS
BEGIN

SELECT Top (15) r.Id,r.Name,r.ProfilePicPath,
(Case when cs.MemberId is null Then 'offline' else 'online' End) as UserStatus,cs.SessionId,
(Select top 1 Message from ChatMessage cm where cm.ToId=r.Id order by Id desc) as Message,
(select count(*) from ChatMessage where IsRead='0' and ToID=@MemberId and FromId=r.Id) as UnReadMessages,
cfr.Id as FriendRequestId,cfr.FromId,cfr.ToId,cfr.RequestStatus,cfr.IsBlocked,cfr.BlockedBy,1 as IsFriend
FROM [dbo].[MemberRegistration] r
LEFT JOIN ChatSession cs ON cs.MemberId=r.Id
Inner JOIN ChatFriendRequest cfr on (cfr.FromId=r.Id AND  cfr.ToId=@MemberId) OR (cfr.FromId=@MemberId AND  cfr.ToId=r.Id)
Where r.Id<>@MemberId 
AND (@Search='' OR  r.Name like '%' +@Search+ '%')
Group By r.Id,r.Name,r.ProfilePicPath,cs.MemberId,cs.SessionId,
cfr.Id,cfr.FromId,cfr.ToId,cfr.RequestStatus,cfr.IsBlocked,cfr.BlockedBy
Order by r.Id

END


GO
/****** Object:  StoredProcedure [dbo].[FetchChatMemberConversation]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FetchChatMemberConversation]
 @CurrentMemberId bigint,
 @SelectedMemberId bigint
AS
BEGIN

SELECT cm.Id,cm.FromID,mr1.Name as FromName,mr1.ProfilePicPath as SelectedMemberImage,mr2.ProfilePicPath as CurrentMemberImage,
mr2.Name as ToName,cm.Message
from [dbo].[ChatMessage] cm
inner join [dbo].[MemberRegistration] mr1 on cm.FromID=mr1.Id
inner join [dbo].[MemberRegistration] mr2 on cm.ToID=mr2.Id
where (cm.FromID=@CurrentMemberId and cm.ToID=@SelectedMemberId) OR 
	  (cm.FromID=@SelectedMemberId and cm.ToID=@CurrentMemberId)

END


GO
/****** Object:  StoredProcedure [dbo].[FetchChatMemberList]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FetchChatMemberList]
@MemberId bigint,
@Search nvarchar(50)
AS
BEGIN

SELECT Top(50) r.Id,r.Name,r.ProfilePicPath, 

(select count(*) from ChatMessage where IsRead='0' and ToID=@MemberId and FromId=r.Id) as UnReadMessages,
(Case when cs.MemberId is null Then 'offline' else 'online' End) as UserStatus,cs.SessionId,
(Select top 1 Message from ChatMessage cm where cm.ToId=r.Id order by Id desc) as Message,0 as IsFriend

FROM [dbo].[MemberRegistration] r
--LEFT JOIN [dbo].[ChatMessage] cm ON r.Id=cm.ToID
LEFT JOIN ChatSession cs ON cs.MemberId=r.Id

Where r.Id<>@MemberId and r.Id not in 
(select r.Id from [dbo].[MemberRegistration] r
left join ChatSession cs ON cs.MemberId=r.Id
Inner join ChatFriendRequest cfr on (cfr.FromId=r.Id AND  cfr.ToId=@MemberId) OR (cfr.FromId=@MemberId AND  cfr.ToId=r.Id)
Where r.Id<>@MemberId
Group By r.Id)
AND (@Search='' OR  r.Name like '%' +@Search+ '%') --and cm.IsRead='0'
Group By r.Id,r.Name,r.ProfilePicPath,cs.MemberId,cs.SessionId
Order by r.Id

END


GO
/****** Object:  StoredProcedure [dbo].[FetchCities]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[FetchCities]
@StateId int
AS
BEGIN
SELECT c.CityID,c.Name
FROM [dbo].[Cities] c
Where c.StateID=@StateId

END






GO
/****** Object:  StoredProcedure [dbo].[FetchConfirmPaymentAdminList]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<MUHAMMAD ZESHAN>
-- Create date: <August-17-2020>
-- Description:	<Fetch the FetchConfirmPaymentAdminList>
-- =============================================
CREATE PROCEDURE [dbo].[FetchConfirmPaymentAdminList]
@DisplayLength int = 10,
@DisplayStart int = 0,
@SortCol bigint = 0,
@SortOrder nvarchar(5) = null,
@Search nvarchar(50) = '',
@Active nvarchar(1) = '' 
--@Status nvarchar(10)='',
--@CreatedBy int=0
AS
BEGIN

;With OutputResult as 
(
select ROW_NUMBER() over(order by 
case when NULLIF(@SortOrder,'') IS NULL then mpcp.Id end desc,
case when (@SortCol = 0 and @SortOrder = 'asc') then mpcp.PaymentType end asc,	
case when (@SortCol = 0 and @SortOrder = 'desc') then mpcp.PaymentType end desc

) as RowNo, Count(mpcp.Id) over() Total,
 mpcp.Id,mpcp.IsMobilePic,mpcp.PackageSubscriptionId,mpcp.PaymentType,mpcp.PaymentOptionId,mpcp.PaymentDate,mpcp.PaymentAmount,mpcp.DepositSlip,
 pt.Name as PackageName,po.BankName,
 (select top 1 Name from MemberRegistration mr where mr.Id=mpc.MemberId) as MemberName ,
  (select top 1 Email from MemberLoginDetail mr where mr.MemberId=mpc.MemberId) as MemberEmail ,
 mpp.Status
FROM [dbo].[MemberPackageConfirmPayment] mpcp
Inner Join MemberPackageSubscription mpc on mpcp.PackageSubscriptionId=mpc.Id
Inner join PackagePricingPlan ppp on ppp.Id=mpc.PackagePricingPlanId
Inner join Package p on p.id=ppp.PackageId
Inner join PackageType pt on p.PackageTypeId=pt.Id
Inner Join PaymentOptions po on po.id=mpcp.PaymentOptionId
Inner Join MemberPackagePayment mpp on mpp.MemberPackageSubscriptionId=mpcp.PackageSubscriptionId
Where --mpc.IsActive=1
1=1
And 
(NULLIF(@Search, '') is NULL or mpcp.PaymentType like '%'+@Search+'%')
--AND (NULLIF(@Active, '') IS NULL or mr.IsActive = @Active)
--AND (NULLIF(@Status, '') IS NULL or c.Status = @Status)
--AND (NULLIF(@CreatedBy, '') IS NULL or c.CreatedBy = @CreatedBy)
)
select TOP (case @DisplayLength when -1 then (Select Count(*) from OutputResult) else @DisplayLength end) * from OutputResult where RowNo > @DisplayStart

END
GO
/****** Object:  StoredProcedure [dbo].[FetchConfirmPaymentClientList]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<MUHAMMAD ZESHAN>
-- Create date: <August-17-2020>
-- Description:	<Fetch the Cities>
-- =============================================
CREATE PROCEDURE [dbo].[FetchConfirmPaymentClientList]
@DisplayLength int = 10,
@DisplayStart int = 0,
@SortCol bigint = 0,
@SortOrder nvarchar(5) = null,
@Search nvarchar(50) = '',
@Active nvarchar(1) = '' ,
--@Status nvarchar(10)='',
--@CreatedBy int=0

@MemberId bigint
AS
BEGIN

;With OutputResult as 
(
select ROW_NUMBER() over(order by 
case when NULLIF(@SortOrder,'') IS NULL then mpcp.Id end desc,
case when (@SortCol = 0 and @SortOrder = 'asc') then mpcp.PaymentType end asc,	
case when (@SortCol = 0 and @SortOrder = 'desc') then mpcp.PaymentType end desc

) as RowNo, Count(mpcp.Id) over() Total,
 mpcp.Id,mpcp.PackageSubscriptionId,mpcp.PaymentType,mpcp.PaymentOptionId,mpcp.PaymentDate,mpcp.PaymentAmount,mpcp.DepositSlip,
 pt.Name as PackageName,po.BankName,mpp.Status
FROM [dbo].[MemberPackageConfirmPayment] mpcp
Inner Join MemberPackageSubscription mpc on mpcp.PackageSubscriptionId=mpc.Id
Inner join PackagePricingPlan ppp on ppp.Id=mpc.PackagePricingPlanId
Inner join Package p on p.id=ppp.PackageId
Inner join PackageType pt on p.PackageTypeId=pt.Id
Inner Join PaymentOptions po on po.id=mpcp.PaymentOptionId
Inner Join MemberPackagePayment mpp on mpp.MemberPackageSubscriptionId=mpcp.PackageSubscriptionId
Where mpc.IsActive=1 AND mpc.MemberId=@MemberId

And 
(NULLIF(@Search, '') is NULL or mpcp.PaymentType like '%'+@Search+'%')
--AND (NULLIF(@Active, '') IS NULL or mr.IsActive = @Active)
--AND (NULLIF(@Status, '') IS NULL or c.Status = @Status)
--AND (NULLIF(@CreatedBy, '') IS NULL or c.CreatedBy = @CreatedBy)
)
select TOP (case @DisplayLength when -1 then (Select Count(*) from OutputResult) else @DisplayLength end) * from OutputResult where RowNo > @DisplayStart

END



GO
/****** Object:  StoredProcedure [dbo].[FetchContactUs]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<MUHAMMAD ZESHAN>
-- Create date: <July-27-2020>
-- Description:	<Fetch the Contacts>
-- =============================================
CREATE PROCEDURE [dbo].[FetchContactUs]
@DisplayLength int = 10,
@DisplayStart int = 0,
@SortCol bigint = 0,
@SortOrder nvarchar(5) = null,
@Search nvarchar(50) = '',
@Active nvarchar(1) = '' 
--@Status nvarchar(10)='',
--@CreatedBy int=0
AS
BEGIN

;With OutputResult as 
(
select ROW_NUMBER() over(order by 
case when NULLIF(@SortOrder,'') IS NULL then c.Id end desc,
case when (@SortCol = 0 and @SortOrder = 'asc') then c.Name end asc,	
case when (@SortCol = 0 and @SortOrder = 'desc') then c.Name end desc

) as RowNo, Count(c.Id) over() Total,
c.Id,c.Name ,c.Email,c.Subject,c.Message
from [dbo].[ContactUs] c

where
(NULLIF(@Search, '') is NULL or c.Name like '%'+@Search+'%'  )
--AND (NULLIF(@Active, '') IS NULL or c.IsActive = @Active)
--AND (NULLIF(@Status, '') IS NULL or c.Status = @Status)
--AND (NULLIF(@CreatedBy, '') IS NULL or c.CreatedBy = @CreatedBy)
)
select TOP (case @DisplayLength when -1 then (Select Count(*) from OutputResult) else @DisplayLength end) * from OutputResult where RowNo > @DisplayStart

END




GO
/****** Object:  StoredProcedure [dbo].[FetchContactUsNotification]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[FetchContactUsNotification]
AS
BEGIN
SELECT * FROM ContactUs

END



GO
/****** Object:  StoredProcedure [dbo].[FetchCountries]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[FetchCountries]
AS
BEGIN
SELECT c.CountryID as Id,c.CountryName as Name
FROM [dbo].[Countries] c

END






GO
/****** Object:  StoredProcedure [dbo].[FetchDivorcePolicy]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Muhammad Awais>
-- Create date: <August-08-2022,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FetchDivorcePolicy]
@MemberId bigint,
@option varchar(50)
AS
BEGIN

SELECT mp.Amountcheckbox, mp.AmountFrom,mp.AmountTo,mp.IncomeCurrency, mp.dropdownOption, mp.HouseCheckBox, mp.HouseDetail,
mp.ID, mp.MiscellaneousCheckbox, mp.MiscellaneousDetail,mp.ThreeDivorcePolicy
FROM [dbo].[DivorcePolicy] mp


Where mp.MemberId=@MemberId and mp.dropdownOption = @option 

END




GO
/****** Object:  StoredProcedure [dbo].[FetchDocuments]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Muhammad Zeshan>
-- Create date: <July-15-2020,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FetchDocuments]

AS
BEGIN
SELECT dc.FilePath,dd.DocName,dc.DocTypeID, mr.Name, mr.Id
FROM 
MemberRegistration mr 
inner join UploadDocuments dc on dc.MemberId = mr.Id 
inner join DocDropdownList dd on dd.DocTypeID=dc.DocTypeID


END

GO
/****** Object:  StoredProcedure [dbo].[FetchDucomentLisById]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Muhammad Zeshan>
-- Create date: <July-15-2020,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FetchDucomentLisById]
@MemberId bigint
AS
BEGIN
SELECT dc.FilePath,dd.DocName,dc.DocTypeID
FROM 
MemberRegistration mr 
inner join UploadDocuments dc on dc.MemberId = mr.Id 
inner join DocDropdownList dd on dd.DocTypeID=dc.DocTypeID
Where mr.Id=@MemberId

END

GO
/****** Object:  StoredProcedure [dbo].[FetchFacilities]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FetchFacilities]
@facilityFor nvarchar(20)
AS
begin
if(@facilityFor = 'male')
begin
SELECT f.Id,f.FacilityName, 'false' as Status FROM [dbo].[Facilities] f 
where f.FacilityFor = @facilityFor
end else
begin 
SELECT Id,FacilityName, 'false' as One, 'false' as Two, 'false' as Three, 'false' as Four
FROM [dbo].[Facilities] 
where  FacilityFor = @facilityFor
end
END

--FLOOR((CAST (GetDate() AS INTEGER) - CAST(mr.DOB AS INTEGER)) / 365.25) AS Age
GO
/****** Object:  StoredProcedure [dbo].[FetchFacilitiesByMemberId]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Muhammad Awais>
-- Create date: <July-04-2022,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[FetchFacilitiesByMemberId]
@MemberId bigint
AS
BEGIN

SELECT fr.FacilityId, fr.FacilityResult
FROM [dbo].[MemberRegistration] mr
LEFT JOIN [dbo].[FacilitiesResult] fr ON fr.MemberId=mr.Id

Where mr.Id=@MemberId
END
GO
/****** Object:  StoredProcedure [dbo].[FetchFeedBack]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[FetchFeedBack]
AS
BEGIN
SELECT Top(15) f.Id,f.Name,f.Designation,f.Message
FROM [dbo].[FeedBack] f
WHERE f.IsApproved=1
ORDER BY f.Id DESC
END





GO
/****** Object:  StoredProcedure [dbo].[FetchFeedBackAdminList]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<MUHAMMAD ZESHAN>
-- Create date: <July-28-2020>
-- Description:	<Fetch FeedBack Admin List>
-- =============================================
CREATE PROCEDURE [dbo].[FetchFeedBackAdminList]
@DisplayLength int = 10,
@DisplayStart int = 0,
@SortCol bigint = 0,
@SortOrder nvarchar(5) = null,
@Search nvarchar(50) = '',
@Active nvarchar(1) = '' 
--@Status nvarchar(10)='',
--@CreatedBy int=0
AS
BEGIN

;With OutputResult as 
(
select ROW_NUMBER() over(order by 
case when NULLIF(@SortOrder,'') IS NULL then f.Id end desc,
case when (@SortCol = 0 and @SortOrder = 'asc') then f.Name end asc,	
case when (@SortCol = 0 and @SortOrder = 'desc') then f.Name end desc

) as RowNo, Count(f.Id) over() Total,
f.Id,f.Name,f.Email,f.Designation,f.Message,f.IsActive,f.IsApproved
from [dbo].[FeedBack] f

where
(NULLIF(@Search, '') is NULL or f.Name like '%'+@Search+'%'  )
AND (NULLIF(@Active, '') IS NULL or f.IsActive = @Active)
--AND (NULLIF(@Status, '') IS NULL or c.Status = @Status)
--AND (NULLIF(@CreatedBy, '') IS NULL or c.CreatedBy = @CreatedBy)
)
select TOP (case @DisplayLength when -1 then (Select Count(*) from OutputResult) else @DisplayLength end) * from OutputResult where RowNo > @DisplayStart

END




GO
/****** Object:  StoredProcedure [dbo].[FetchFeedBackNotification]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create PROCEDURE [dbo].[FetchFeedBackNotification]
AS
BEGIN
SELECT * FROM FeedBack

END


GO
/****** Object:  StoredProcedure [dbo].[FetchInfoForPersonalProfileCard]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Muhammad Zeshan>
-- Create date: <July-15-2020,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FetchInfoForPersonalProfileCard]
@MemberId bigint
AS
BEGIN
SELECT mld.Email,mr.Id,mr.Name,mr.MaritalStatus,mr.MobileNo,mr.DOB,mr.ProfilePicPath,med.HighestEducation,med.Occupation,r.ReligionName as Religion
FROM 
MemberRegistration mr 
INNER JOIN MemberLoginDetail mld ON mld.MemberId=mr.Id
LEFT JOIN MemberEducationDetail med ON med.MemberId=mr.Id
LEFT JOIN Religion r ON mr.ReligionId=r.Id
Where mr.Id=@MemberId

END




GO
/****** Object:  StoredProcedure [dbo].[FetchLanguages]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[FetchLanguages]
AS
BEGIN
SELECT l.Id,l.Name
FROM [dbo].[Languages] l

END



GO
/****** Object:  StoredProcedure [dbo].[FetchMarriagePolicy]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Muhammad Awais>
-- Create date: <August-08-2022,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FetchMarriagePolicy]
@MemberId bigint,
@option varchar(50)
AS
BEGIN

SELECT mp.Amountcheckbox, mp.AmountDetail, mp.dropdownOption, mp.HouseCheckBox, mp.HouseDetail, mp.ID, mp.MiscellaneousCheckbox, mp.MiscellaneousDetail
FROM [dbo].[MarriagePolicy] mp


Where mp.MemberId=@MemberId and mp.dropdownOption = @option 

END




GO
/****** Object:  StoredProcedure [dbo].[FetchMemberDetail]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[FetchMemberDetail]
@MemberId bigint
AS
BEGIN
SELECT mr.Id,mr.Name,mr.IsMobilePic,mr.ProfileCreatedBy,mr.DOB,mr.MaritalStatus,mr.NoOfMarriage,mr.MobileNo,mr.Subcast,mr.AboutMe,mr.ProfilePicPath,c.CountryName as Country,s.Name as State,ci.Name as City,r.ReligionName as Religion,mrd.Sect,
me.HighestEducation,me.Occupation,me.EmployeedIn,CONCAT (me.IncomeCurrency,' ',me.AnnualIncome) as AnualIncome,l.Name as Language,ls.SmokingHabit,
ls.Hobbies,ls.Interests,ma.Height,ma.Weight,ma.PhysicalStatus,ma.BodyType,ma.Complexion,mf.ParentContactNo,mf.FamilyValue,mf.FamilyType,
mf.FamilyStatus,mf.FamilyDetail,mf.FatherOccupation,mf.IsMotherAlive,mf.IsFatherAlive,mf.NoOfBrothers,mf.NoOfSisters,ld.Citizenship,
ld.CountryLivingIn,ld.PlaceOfBirth,ld.ResidingCity,ld.ResidingState
FROM [dbo].[MemberRegistration] mr
LEFT JOIN [dbo].[MemberEducationDetail] me ON mr.Id=me.MemberId
LEFT JOIN [dbo].[Countries] c ON mr.CountryId=c.CountryID
LEFT JOIN [dbo].[States] s ON s.StateID=c.CountryID
LEFT JOIN [dbo].[Cities]ci ON ci.CityID=s.StateID
LEFT JOIN [dbo].[Religion] r ON mr.ReligionId = r.Id
LEFT JOIN [dbo].[MemberReligiousDetail] mrd ON mrd.MemberId = mr.Id
LEFT JOIN [dbo].[MemberLanguages] ml ON mr.Id=ml.MemberId
LEFT JOIN [dbo].[Languages] l ON ml.LanguageId=l.Id
LEFT JOIN [dbo].[MemberLifeStyle] ls ON mr.Id=ls.MemberId
LEFT JOIN [dbo].[MemberAppearance] ma ON mr.Id=ma.MemberId
LEFT JOIN [dbo].[MemberFamilyDetail] mf ON mr.Id=mf.MemberId
LEFT JOIN [dbo].[MemberLocationDetail] ld ON mr.Id=ld.MemberId



where mr.Id=@MemberId

END
GO
/****** Object:  StoredProcedure [dbo].[FetchMemberFieldPermission]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Hassnain Ali>
-- Create date: <Sep-10-2020>
-- Description:	<Fetch Fields Permission For Members>
-- =============================================
CREATE procedure [dbo].[FetchMemberFieldPermission]
@MemberId bigint=0
as
begin

SELECT * ,
	  ISNULL((select top 1 IsActive from [dbo].[MemberPackageSubscription] where MemberId=@MemberId and IsActive=1),0) as IsPaid
  FROM [Matrimony].[dbo].[FieldsPermission]


end

GO
/****** Object:  StoredProcedure [dbo].[FetchMemberList]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[FetchMemberList]
@Pageindex int ,
@Pagesize int,
@search nvarchar(50),
@gender nvarchar(50),
@country int,
@relegion int,
@maritalStatus nvarchar(50),

@MemberId bigint
AS
BEGIN
SELECT Count(mr.Id) over() totalcount, mr.Id,mr.Name,mr.DOB,mr.Gender,mr.MaritalStatus,mr.ProfilePicPath,mr.IsMobilePic,e.HighestEducation,r.ReligionName as Religion,c.CountryName as Country,mr.NickName
FROM [dbo].[MemberRegistration] mr 
left join [dbo].[MemberEducationDetail] e on mr.Id=e.MemberId
left join [dbo].[Religion] r on mr.ReligionId=r.Id
left join [dbo].[Countries] c on mr.CountryId=c.CountryID
where mr.Id!=@MemberId And 

(NULLIF(@search, '') is NULL or mr.Name like '%'+@search+'%' or e.HighestEducation like '%'+@search+'%'  )
AND (NULLIF(@gender, '') IS NULL or mr.Gender= @gender)
AND (NULLIF(@country, '') IS NULL or mr.CountryId= @country)
AND (NULLIF(@relegion, '') IS NULL or mr.ReligionId= @relegion)
AND (NULLIF(@maritalStatus, '') IS NULL or mr.MaritalStatus= @maritalStatus)
order by mr.Id desc Offset @Pagesize*(@Pageindex-1) Rows Fetch next @Pagesize rows only
END
GO
/****** Object:  StoredProcedure [dbo].[FetchMemberSubscription]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Muhammad Zeshan>
-- Create date: <August-10-2020>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FetchMemberSubscription] 
@MemberId bigint
AS
BEGIN

Select TOP(1) 
mps.Id,
mps.SubscriptionStartDate,mps.SubscriptionEndDate,mps.IsActive,mps.PackageAmount,
 pt.Name, ppp.PackageDuration,mpp.Status
FROM [dbo].[MemberPackageSubscription] mps 
Inner Join PackagePricingPlan ppp on ppp.Id=mps.PackagePricingPlanId
Inner Join Package p on p.Id=ppp.PackageId
Inner Join PackageType pt on pt.Id=p.PackageTypeId
Inner Join [dbo].[MemberPackagePayment] mpp on mps.Id=mpp.MemberPackageSubscriptionId
where mps.MemberId=@MemberId
Order by mps.Id DESC

END



GO
/****** Object:  StoredProcedure [dbo].[FetchMyMatches]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[FetchMyMatches]
@Pageindex int ,
@Pagesize int,
@search nvarchar(50),
@gender nvarchar(50),
@country int,
@relegionSect nvarchar(50),
@maritalStatus nvarchar(50),
@age int,
@language int,
@kidz nvarchar(50),
@income int,
@height nvarchar(50),
@weight nvarchar(50),
@complexion nvarchar(50),


@MemberId bigint
AS
BEGIN
SELECT Count(mr.Id) over() totalcount, mr.Id,mr.Name,mr.DOB,mr.Gender,mr.ProfilePicPath,mr.IsMobilePic,mr.Subcast,mr.MaritalStatus,e.HighestEducation,r.ReligionName as Religion,rd.Sect as ReligionSect,c.CountryName as Country,mr.NickName
, FLOOR((CAST (GetDate() AS INTEGER) - CAST(mr.DOB AS INTEGER)) / 365.25) AS Age
FROM [dbo].[MemberRegistration] mr 
left join [dbo].[MemberEducationDetail] e on mr.Id=e.MemberId
left join [dbo].[Religion] r on mr.ReligionId=r.Id
left join [dbo].[MemberReligiousDetail] rd on mr.Id=rd.MemberId
left join [dbo].[Countries] c on mr.CountryId=c.CountryID
left join [dbo].[MemberLanguages] ml on mr.Id = ml.MemberId
left join [dbo].[MemberAppearance] ma on mr.Id = ma.MemberId
where mr.Id!=@MemberId And 

(NULLIF(@search, '') is NULL or mr.NickName like '%'+@search+'%' or e.HighestEducation like '%'+@search+'%' or mr.Subcast like '%'+@search+'%'  )
AND (NULLIF(@gender, '') IS NULL or mr.Gender= @gender)
AND (NULLIF(@country, '') IS NULL or mr.CountryId= @country)
AND (NULLIF(@relegionSect, '') IS NULL or rd.Sect= @relegionSect)
AND (NULLIF(@maritalStatus, '') IS NULL or mr.MaritalStatus= @maritalStatus)
AND (NULLIF(@age, '') IS NULL or  (FLOOR((CAST (GetDate() AS INTEGER) - CAST(mr.DOB AS INTEGER)) / 365.25)) < @age)
AND (NULLIF(@language, '') IS NULL or ml.LanguageId= @language)
AND (NULLIF(@kidz, '') IS NULL or mr.NoOfChildren = @kidz)
AND (NULLIF(@income, '') IS NULL or e.AnnualIncome < @income)
AND (NULLIF(@height, '') IS NULL or ma.Height < @height)
AND (NULLIF(@weight, '') IS NULL or ma.Weight < @weight)
AND (NULLIF(@complexion, '') IS NULL or ma.Complexion= @complexion)
order by mr.Id desc Offset @Pagesize*(@Pageindex-1) Rows Fetch next @Pagesize rows only
END
GO
/****** Object:  StoredProcedure [dbo].[FetchNewlyRegisteredMemberList]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FetchNewlyRegisteredMemberList]
AS
BEGIN
SELECT TOP(5) mr.Id,mr.Name,mr.DOB,mr.Gender,mr.ProfilePicPath,mr.IsMobilePic,e.HighestEducation,r.ReligionName as Religion,c.CountryName as Country,mr.NickName
FROM [dbo].[MemberRegistration] mr 
left join [dbo].[MemberEducationDetail] e on mr.Id=e.MemberId
left join [dbo].[Religion] r on mr.ReligionId=r.Id
left join [dbo].[Countries] c on mr.CountryId=c.CountryID


END


GO
/****** Object:  StoredProcedure [dbo].[FetchOrderSummary]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Muhammad Zeshan>
-- Create date: <August-06-2020>
-- Description:	<Fetch package pricing plan Detail for order summary>
-- =============================================
CREATE PROCEDURE [dbo].[FetchOrderSummary]
@PackagePricingPlanId bigint
AS
BEGIN
SELECT pt.Name, ppp.[Id] as PackagePricingPlanId,[PackageId],[PackageDuration],[PackagePrice]
  FROM [PackagePricingPlan] ppp
  INNER JOIN [dbo].[Package] p ON p.Id=ppp.PackageId
  INNER JOIN PackageType pt ON p.PackageTypeId=pt.Id
  where ppp.Id=@PackagePricingPlanId

END



GO
/****** Object:  StoredProcedure [dbo].[FetchPackagePricingPlans]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[FetchPackagePricingPlans]
@DisplayLength int = 10,
@DisplayStart int = 0,
@SortCol bigint = 0,
@SortOrder nvarchar(5) = null,
@Search nvarchar(50) = '',
@Active nvarchar(1) = '' 
--@Status nvarchar(10)='',
--@CreatedBy int=0
AS
BEGIN

;With OutputResult as 
(
select ROW_NUMBER() over(order by 
case when NULLIF(@SortOrder,'') IS NULL then ppp.Id end desc,
case when (@SortCol = 0 and @SortOrder = 'asc') then pt.Name end asc,	
case when (@SortCol = 0 and @SortOrder = 'desc') then pt.Name end desc

) as RowNo, Count(p.Id) over() Total,
ppp.Id, pt.Name ,ppp.PackageDuration,ppp.PackagePrice
from [dbo].[PackagePricingPlan] ppp
inner join Package p on p.Id=ppp.PackageId
inner join PackageType pt on pt.Id=p.PackageTypeId

where
(NULLIF(@Search, '') is NULL or ppp.PackageDuration like '%'+@Search+'%')
--AND (NULLIF(@Active, '') IS NULL or pc.IsActive = @Active)
--AND (NULLIF(@Status, '') IS NULL or c.Status = @Status)
--AND (NULLIF(@CreatedBy, '') IS NULL or c.CreatedBy = @CreatedBy)
)
select TOP (case @DisplayLength when -1 then (Select Count(*) from OutputResult) else @DisplayLength end) * from OutputResult where RowNo > @DisplayStart

END






GO
/****** Object:  StoredProcedure [dbo].[FetchPackages]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[FetchPackages]
AS
BEGIN
SELECT p.Id as PackageId ,pt.Name as PackageName
FROM [dbo].[Package] p
inner join PackageType pt on p.PackageTypeId=pt.Id

END






GO
/****** Object:  StoredProcedure [dbo].[FetchPackagesDuration]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FetchPackagesDuration]
@PackageDuration int 
AS
BEGIN
SELECT pt.Name, p.*, ppp.[Id] as PackagePricingPlanId,[PackageId],[PackageDuration],[PackagePrice]
  FROM [PackagePricingPlan] ppp
  INNER JOIN [dbo].[Package] p ON p.Id=ppp.PackageId
  INNER JOIN PackageType pt ON p.PackageTypeId=pt.Id
  where ppp.PackageDuration=@PackageDuration

END



GO
/****** Object:  StoredProcedure [dbo].[FetchPackageSubscription]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[FetchPackageSubscription]
@DisplayLength int = 10,
@DisplayStart int = 0,
@SortCol bigint = 0,
@SortOrder nvarchar(5) = null,
@Search nvarchar(50) = '',
@Active nvarchar(1) = '' 
--@Status nvarchar(10)='',
--@CreatedBy int=0
AS
BEGIN

;With OutputResult as 
(
select ROW_NUMBER() over(order by 
case when NULLIF(@SortOrder,'') IS NULL then ps.Id end desc

) as RowNo, Count(ps.Id) over() Total,
--ps.Id,ps.MemberId,ps.PackageId,ps.SubscriptionStartDate,ps.SubscriptionEndDate,ps.IsActive,ps.PackageAmount
--from [dbo].[MemberPackageSubscription] ps
ps.Id,mr.Name as Name,pt.Name as Package,ps.SubscriptionStartDate,ps.SubscriptionEndDate,ps.PackageAmount,ps.IsActive
from  [dbo].[MemberPackageSubscription] ps
inner join [dbo].[MemberRegistration] mr on ps.MemberId=mr.Id
inner join [dbo].[PackagePricingPlan] ppp on ppp.Id=ps.PackagePricingPlanId
inner join [dbo].[Package] p on p.Id=ppp.PackageId
inner join [dbo].[PackageType] pt on pt.Id=p.PackageTypeId
where
(NULLIF(@Search, '') is NULL or ps.PackageAmount like '%'+@Search+'%'   )
AND (NULLIF(@Active, '') IS NULL or ps.IsActive = @Active)
--AND (NULLIF(@Status, '') IS NULL or c.Status = @Status)
--AND (NULLIF(@CreatedBy, '') IS NULL or c.CreatedBy = @CreatedBy)
)
select TOP (case @DisplayLength when -1 then (Select Count(*) from OutputResult) else @DisplayLength end) * from OutputResult where RowNo > @DisplayStart

END






GO
/****** Object:  StoredProcedure [dbo].[FetchPackageType]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<MUHAMMAD ZESHAN>
-- Create date: <June-26-2020>
-- Description:	<Fetch the Packages>
-- =============================================
create PROCEDURE [dbo].[FetchPackageType]
AS
BEGIN
select * from PackageType
END






GO
/****** Object:  StoredProcedure [dbo].[FetchParentCatagoryList]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FetchParentCatagoryList]
AS
BEGIN
SELECT pc.Id,pc.PartCategoryName, pc.CategoryType FROM [dbo].[PartnerCategory] pc where pc.CategoryType is null

END

--FLOOR((CAST (GetDate() AS INTEGER) - CAST(mr.DOB AS INTEGER)) / 365.25) AS Age
GO
/****** Object:  StoredProcedure [dbo].[FetchPartnerCategoriesByMemberId]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Muhammad Awais>
-- Create date: <July-04-2020,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FetchPartnerCategoriesByMemberId]
@MemberId bigint
AS
BEGIN

SELECT pcr.PartnerCategoryID, pcr.PartnerCategoryStatus 
FROM [dbo].[MemberRegistration] mr
LEFT JOIN [dbo].[PartnerCategoryResult] pcr ON pcr.MemberId=mr.Id

Where mr.Id=@MemberId
END
GO
/****** Object:  StoredProcedure [dbo].[FetchPaymentOptionddl]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[FetchPaymentOptionddl]
@PaymentType nvarchar(20)
AS
BEGIN
SELECT po.Id,po.BankName
FROM [dbo].[PaymentOptions] po
Where PaymentType=@PaymentType
END






GO
/****** Object:  StoredProcedure [dbo].[FetchPaymentOptions]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<MUHAMMAD ZESHAN>
-- Create date: <July-27-2020>
-- Description:	<Fetch the Page Contents>
-- =============================================
Create PROCEDURE [dbo].[FetchPaymentOptions]
@DisplayLength int = 10,
@DisplayStart int = 0,
@SortCol bigint = 0,
@SortOrder nvarchar(5) = null,
@Search nvarchar(50) = '',
@Active nvarchar(1) = '' 
--@Status nvarchar(10)='',
--@CreatedBy int=0
AS
BEGIN

;With OutputResult as 
(
select ROW_NUMBER() over(order by 
case when NULLIF(@SortOrder,'') IS NULL then po.Id end desc,
case when (@SortCol = 0 and @SortOrder = 'asc') then po.BankName end asc,	
case when (@SortCol = 0 and @SortOrder = 'desc') then po.BankName end desc

) as RowNo, Count(po.Id) over() Total,
po.Id, ISNULL(po.BankName,'') BankName ,po.PaymentType,po.AccountTitle,po.AccountNumber,po.BranchCode,po.IBAN,po.IsActive
from [dbo].[PaymentOptions] po

where
(NULLIF(@Search, '') is NULL or po.BankName like '%'+@Search+'%' or po.Description like '%'+@Search+'%'  )
AND (NULLIF(@Active, '') IS NULL or po.IsActive = @Active)
--AND (NULLIF(@Status, '') IS NULL or c.Status = @Status)
--AND (NULLIF(@CreatedBy, '') IS NULL or c.CreatedBy = @CreatedBy)
)
select TOP (case @DisplayLength when -1 then (Select Count(*) from OutputResult) else @DisplayLength end) * from OutputResult where RowNo > @DisplayStart

END




GO
/****** Object:  StoredProcedure [dbo].[FetchPremiumBestMatches]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FetchPremiumBestMatches]
@MemberId bigint
AS
BEGIN
SELECT top(15) mr.Id,mr.NickName,mr.IsMobilePic,mr.Name,FLOOR((CAST (GetDate() AS INTEGER) - CAST(mr.DOB AS INTEGER)) / 365.25) AS Age,mr.Gender,mr.ProfilePicPath,e.HighestEducation,r.ReligionName as Religion,c.CountryName as Country,mr.MaritalStatus as Status,
(select Top 1  IsLike from [dbo].[MemberLikeDislike] mld where mld.MemberID=@MemberId and mld.ResponseToMemberId=mr.Id) as SubmittedResponse
FROM [dbo].[MemberRegistration] mr 
LEFT join [dbo].[MemberEducationDetail] e on mr.Id=e.MemberId
LEFT join [dbo].[Religion] r on mr.ReligionId=r.Id
LEFT join [dbo].[Countries] c on mr.CountryId=c.CountryID
where mr.Id!=@MemberId
Order by mr.Id desc

END

--FLOOR((CAST (GetDate() AS INTEGER) - CAST(mr.DOB AS INTEGER)) / 365.25) AS Age
GO
/****** Object:  StoredProcedure [dbo].[FetchPremiumMember]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Hassnain Ali>
-- Create date: <Sep-10-2020>
-- Description:	<Fetch Pictures of premium member in client side>
-- =============================================
CREATE procedure [dbo].[FetchPremiumMember]
@IsActive nvarchar(1)=''
as
begin

select top 16 mr.ProfilePicPath,mr.Name,mr.Id as memberRegisterationId,mr.AboutMe,mr.Gender,mr.Subcast,mr.MaritalStatus from MemberRegistration mr
inner join MemberPackageSubscription mps on mps.MemberId=mr.Id
where 
(nullif(@IsActive,'') is null or mps.IsActive=@IsActive)
order by(mps.MemberId) desc
end

GO
/****** Object:  StoredProcedure [dbo].[FetchProfileLocationDetail]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Muhammad Zeshan>
-- Create date: <15-july-2020>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FetchProfileLocationDetail]
@MemberId bigint
AS
BEGIN

SELECT c.CountryName ,c.CountryID,
mld.PlaceOfBirth,mld.CountryLivingIn,mld.ResidingState,mld.ResidingCity,mld.Citizenship

From MemberRegistration m
left JOIN Countries c on m.CountryId=c.CountryID
left Join MemberLocationDetail mld on mld.MemberId=m.Id
WHERE m.Id=@MemberId

END


GO
/****** Object:  StoredProcedure [dbo].[FetchProfilePersonalInfo]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Muhammad Zeshan>
-- Create date: <July-15-2020,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FetchProfilePersonalInfo]
@MemberId bigint
AS
BEGIN
SELECT mld.Email,mr.Name,mr.Id,mr.IsMobilePic,mr.Subcast,mr.MaritalStatus,
mr.NoOfChildren,mr.Gender,mr.NoOfMarriage,
mr.ProfilePicPath,ma.Feet,ma.HeightUnit,ma.Inches,ma.Centimeters,ma.PhysicalStatus
FROM 
MemberRegistration mr 
Inner Join MemberLoginDetail mld on mld.MemberId=mr.Id
left join MemberAppearance ma on ma.MemberId=mr.Id
Where mr.Id=@MemberId

END
GO
/****** Object:  StoredProcedure [dbo].[FetchProfilePersonalInfoDetail]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Muhammad Zeshan>
-- Create date: <August-08-2020,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FetchProfilePersonalInfoDetail]
@MemberId bigint
AS
BEGIN

SELECT ma.MemberId,ma.Weight,ma.BodyType,ma.Complexion,ed.Occupation,ls.SmokingHabit,ls.Hobbies,ls.Interests,ml.LanguageId
FROM [dbo].[MemberRegistration] mr
LEFT JOIN [dbo].[MemberAppearance] ma ON ma.MemberId=mr.Id
LEFT JOIN [dbo].[MemberEducationDetail] ed ON ed.MemberId=mr.Id
LEFT JOIN [dbo].[MemberLifeStyle] ls ON ls.MemberId=mr.Id
LEFT JOIN [dbo].[MemberLanguages] ml ON ml.MemberId=mr.Id

Where mr.Id=@MemberId

END




GO
/****** Object:  StoredProcedure [dbo].[FetchProfileRequirementCheckListResult]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FetchProfileRequirementCheckListResult]
@MemberId bigint
AS
BEGIN
Select pc.MemberId, pc.PartnerCategoryID, pc.PartnerCategoryStatus as Status 
from [dbo].[PartnerCategoryResult] pc where pc.MemberId = 30 and pc.PartnerCategoryID is not null

END

--FLOOR((CAST (GetDate() AS INTEGER) - CAST(mr.DOB AS INTEGER)) / 365.25) AS Age
GO
/****** Object:  StoredProcedure [dbo].[FetchProfileRequirementList]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FetchProfileRequirementList]
AS
BEGIN
SELECT pf.Id,pf.RequirmentName FROM [dbo].[ProfileRequirement] pf 

END

--FLOOR((CAST (GetDate() AS INTEGER) - CAST(mr.DOB AS INTEGER)) / 365.25) AS Age
GO
/****** Object:  StoredProcedure [dbo].[FetchProposalQuestions]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FetchProposalQuestions]
@questionFor nvarchar
AS
BEGIN
SELECT pq.Id,pq.Question FROM [dbo].[ProposalQuestions] pq where pq.QuestionsFor = @questionFor and pq.QuestionType is null

END

GO
/****** Object:  StoredProcedure [dbo].[FetchProposalQuestionsByMemberId]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Muhammad Awais>
-- Create date: <July-04-2022,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[FetchProposalQuestionsByMemberId]
@MemberId bigint
AS
BEGIN

SELECT pq.ProposalQuestionsId, pq.ProposalQuestionsResult
FROM [dbo].[MemberRegistration] mr
LEFT JOIN [dbo].[ProposalQuestionsResult] pq ON pq.MemberId=mr.Id

Where mr.Id=@MemberId
END
GO
/****** Object:  StoredProcedure [dbo].[FetchStates]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[FetchStates]
@CountryId int
AS
BEGIN
SELECT s.StateID,s.Name
FROM [dbo].[States] s
Where CountryID=@CountryId
END






GO
/****** Object:  StoredProcedure [dbo].[FetchWifeDetailByMemberId]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Muhammad Awais>
-- Create date: <July-04-2022,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FetchWifeDetailByMemberId]
@MemberId bigint
AS
BEGIN

SELECT wd.MemberId, wd.ExsitingWife, wd.HaveWife, wd.MarriageYear, wd.WifeAge, wd.EducationLevelId, wd.WifeJob, wd.WifeKids, wd.WifeLocation, wd.WifeReligion,wd.LivingStatus
FROM [dbo].[WifeDetailResult] wd
--LEFT JOIN [dbo].[FacilitiesResult] fr ON fr.MemberId=mr.Id

Where wd.MemberId=@MemberId
END
GO
/****** Object:  StoredProcedure [dbo].[FetchWifeKidsDetailByMemberId]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[FetchWifeKidsDetailByMemberId]
@MemberId bigint
AS
BEGIN

SELECT *
FROM [dbo].[ExisitingKidsDetailResult] wd
--LEFT JOIN [dbo].[FacilitiesResult] fr ON fr.MemberId=mr.Id

Where wd.MemberId=@MemberId
END
GO
/****** Object:  StoredProcedure [dbo].[FetchWomanRights]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FetchWomanRights]
AS
BEGIN
SELECT wr.Id,wr.WomenRights FROM [dbo].[WomenRights] wr 

END

GO
/****** Object:  StoredProcedure [dbo].[FetchWomanRightsByMemberId]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Muhammad Awais>
-- Create date: <July-04-2022,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[FetchWomanRightsByMemberId]
@MemberId bigint
AS
BEGIN

SELECT WR.WomenRightsId, WR.WomenRightsResult
FROM [dbo].[MemberRegistration] mr
LEFT JOIN [dbo].[WomenRightsResult] WR ON WR.MemberId=mr.Id

Where mr.Id=@MemberId
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllCRList]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 
 create proc [dbo].[GetAllCRList]
 as
 begin
 select cl.*,Title from CR_List cl
 join CR_ListType ct on ct.ID = cl.ListTypeID
 end
GO
/****** Object:  StoredProcedure [dbo].[GetCRList_ByTypeID]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 
 CREATE proc [dbo].[GetCRList_ByTypeID]
 @ListTypeID bigint,
 @DisplayFor nvarchar(10)=''
 as
 begin
 select ID,Name,'false' as Status from  CR_List cl
-- join CR_ListType ct on ct.ID = cl.ListTypeID
 where cl.ListTypeID =@ListTypeID  and (DisplayFor ='both' or DisplayFor = @DisplayFor)
 end
GO
/****** Object:  StoredProcedure [dbo].[GetPackageRemainingWeeksByMemberId]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
    --Author: <Hassnain Ali >
        --Create date: <OCT-12 - 2020 >
            --Description: <Fetch Remaining Weeks of Member Subscribed Package >
                -- =============================================
                CREATE PROC[dbo].[GetPackageRemainingWeeksByMemberId]
@MemberId bigint = 0
AS
Begin
DECLARE @StartDate DATETIME
DECLARE @EndDate DATETIME


SET @StartDate=(SELECT TOP 1 mpsd.SubscriptionStartDate FROM MemberPackageSubscription mpsd WHERE mpsd.IsActive = 1 and mpsd.MemberId =@MemberId)
SET @EndDate=(SELECT TOP 1 mpsd.SubscriptionEndDate FROM MemberPackageSubscription mpsd WHERE mpsd.IsActive = 1 and mpsd.MemberId =@MemberId)

SELECT DATEADD(DAY, -(DATEPART(DW, DATEADD(WEEK, x.number, @StartDate)) -2), DATEADD(WEEK, x.number, @StartDate)) as[StartDate]
    , DATEADD(DAY, -(DATEPART(DW, DATEADD(WEEK, x.number + 1, @StartDate)) -1) , DATEADD(WEEK, x.number + 1, @StartDate)) AS[EndDate]
FROM master.dbo.spt_values x
WHERE x.type = 'P' AND x.number <= DATEDIFF(WEEK, @StartDate, DATEADD(WEEK, 0, CAST(@EndDate AS DATE)))
END
GO
/****** Object:  StoredProcedure [dbo].[MembersFetch]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Hassnain Ali>
-- Create date: <July-30-2020>
-- Description:	<Fetch All Members List in Admin Side>
-- =============================================
CREATE PROCEDURE [dbo].[MembersFetch]
@DisplayLength int = 10,
@DisplayStart int = 0,
@SortCol bigint = 0,
@SortOrder nvarchar(5) = null,
@Search nvarchar(50) = '',
@Active nvarchar(1) = '' ,
--@Status nvarchar(10)='',
@CreatedBy int=0
AS
BEGIN

;With OutputResult as 
(
select ROW_NUMBER() over(order by 
case when NULLIF(@SortOrder,'') IS NULL then mr.Id end desc,
case when (@SortCol = 0 and @SortOrder = 'asc') then mr.Name end asc,	
case when (@SortCol = 0 and @SortOrder = 'desc') then mr.Name end desc

) as RowNo, Count(mr.Id) over() Total,
mr.Id, ISNULL(mr.Name,'') MemberName ,mr.AboutMe,mr.Gender,mr.MaritalStatus,mr.LookingFor,mr.Subcast,mld.Email,mld.IsActive,mr.CountryId,mr.DOB,mld.Id as MemberLoginDetailId,mr.MobileNo,mr.MotherTongue,mr.ProfilePicPath
from [dbo].[MemberRegistration] mr
inner join MemberLoginDetail mld on mld.MemberId=mr.Id

where
(NULLIF(@Search, '') is NULL or mr.Name like '%'+@Search+'%' or mld.Email like '%'+@Search+'%'  )
AND (NULLIF(@Active, '') IS NULL or mld.IsActive = @Active)
--AND (mr.Id not in (select MemberId from MemberPackageSubscription where IsActive=1))
--AND (NULLIF(@Status, '') IS NULL or c.Status = @Status)
--AND (NULLIF(@CreatedBy, '') IS NULL or c.CreatedBy = @CreatedBy)
)
select TOP (case @DisplayLength when -1 then (Select Count(*) from OutputResult) else @DisplayLength end) * from OutputResult where RowNo > @DisplayStart

END
GO
/****** Object:  StoredProcedure [dbo].[PageContents]    Script Date: 02/25/2023 3:56:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<MUHAMMAD ZESHAN>
-- Create date: <June-24-2020>
-- Description:	<Fetch the Page Contents>
-- =============================================
CREATE PROCEDURE [dbo].[PageContents]
@DisplayLength int = 10,
@DisplayStart int = 0,
@SortCol bigint = 0,
@SortOrder nvarchar(5) = null,
@Search nvarchar(50) = '',
@Active nvarchar(1) = '' 
--@Status nvarchar(10)='',
--@CreatedBy int=0
AS
BEGIN

;With OutputResult as 
(
select ROW_NUMBER() over(order by 
case when NULLIF(@SortOrder,'') IS NULL then pc.Id end desc,
case when (@SortCol = 0 and @SortOrder = 'asc') then pc.PageName end asc,	
case when (@SortCol = 0 and @SortOrder = 'desc') then pc.PageName end desc

) as RowNo, Count(pc.Id) over() Total,
pc.Id, ISNULL(pc.PageName,'') PageName ,pc.PageUrl,pc.PageDescription,pc.IsActive
from [dbo].[PageContent] pc

where
(NULLIF(@Search, '') is NULL or pc.PageName like '%'+@Search+'%' or pc.PageDescription like '%'+@Search+'%'  )
AND (NULLIF(@Active, '') IS NULL or pc.IsActive = @Active)
--AND (NULLIF(@Status, '') IS NULL or c.Status = @Status)
--AND (NULLIF(@CreatedBy, '') IS NULL or c.CreatedBy = @CreatedBy)
)
select TOP (case @DisplayLength when -1 then (Select Count(*) from OutputResult) else @DisplayLength end) * from OutputResult where RowNo > @DisplayStart

END






GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'There should be Country Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberLocationDetail', @level2type=N'COLUMN',@level2name=N'Citizenship'
GO
USE [master]
GO
ALTER DATABASE [Marryme] SET  READ_WRITE 
GO
