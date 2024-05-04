
GO
USE [Marryme]
GO
/****** Object:  Table [dbo].[AcceptanceCriteria]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[ActivityLog]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[AdminProfile]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[ApplicationSettings]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[Attachements]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[ChatFriendRequest]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[ChatHistoryDeletedMember]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[ChatMessage]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[ChatSession]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[Cities]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[ContactUs]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[Countries]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[DocumentTypes]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[EmailSMSTemplate]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[ExisitingKidsDetail]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[ExisitingKidsDetailResult]    Script Date: 09/04/22 10:10:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExisitingKidsDetailResult](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NULL,
	[ExisitingKidsDetailID] [bigint] NULL,
	[ExisitingKidsDetailResult] [nvarchar](50) NULL,
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
/****** Object:  Table [dbo].[Facilities]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[FacilitiesResult]    Script Date: 09/04/22 10:10:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacilitiesResult](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NULL,
	[FacilityId] [bigint] NULL,
	[FacilityResult] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_FacilitiesResult] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FamilyInvolvement]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[FamilyInvolvementResult]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[FeedBack]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[FieldsPermission]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[Languages]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[MarriageDuration]    Script Date: 09/04/22 10:10:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarriageDuration](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MarriageTime] [nvarchar](50) NULL,
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
/****** Object:  Table [dbo].[MarriagePolicy]    Script Date: 09/04/22 10:10:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarriagePolicy](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DivorceItem] [nvarchar](150) NULL,
	[KhulaItem] [nvarchar](150) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_MarriagePolicy] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberAppearance]    Script Date: 09/04/22 10:10:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberAppearance](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NOT NULL,
	[Height] [int] NULL,
	[PhysicalStatus] [nvarchar](20) NULL,
	[Weight] [int] NULL,
	[BodyType] [nvarchar](15) NULL,
	[Complexion] [nvarchar](20) NULL,
 CONSTRAINT [PK_MemberAppearance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberEducationDetail]    Script Date: 09/04/22 10:10:07 PM ******/
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
	[AnnualIncome] [decimal](18, 2) NULL,
 CONSTRAINT [PK_MemberEducationDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberFamilyDetail]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[MemberLanguages]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[MemberLifeStyle]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[MemberLikeDislike]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[MemberLocationDetail]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[MemberLoginDetail]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[MemberPackageConfirmPayment]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[MemberPackagePayment]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[MemberPackageSubscription]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[MemberPackageSubscriptionDetail]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[MemberRegistration]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[MemberReligiousDetail]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[MenCurrentState]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[Notification]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[NumberOfMarriage]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[Package]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[PackagePricingPlan]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[PackageType]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[PageContent]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[PartnerCategory]    Script Date: 09/04/22 10:10:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerCategory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PartCategoryName] [nvarchar](50) NULL,
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
/****** Object:  Table [dbo].[PartnerCategoryResult]    Script Date: 09/04/22 10:10:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerCategoryResult](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NULL,
	[PartnerCategoryID] [bigint] NULL,
	[PartnerCategoryStatus] [bit] NULL,
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
/****** Object:  Table [dbo].[PaymentOptions]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[ProfileRequirement]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[ProposalQuestions]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[ProposalQuestionsResult]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[Religion]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[ReligionSect]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[States]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[WifeDetail]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[WifeDetailResult]    Script Date: 09/04/22 10:10:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WifeDetailResult](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NULL,
	[WifeReligion] [nvarchar](50) NULL,
	[MarriageYear] [nvarchar](50) NULL,
	[WifeLocation] [nvarchar](200) NULL,
	[WifeKids] [nvarchar](50) NULL,
	[WifeJob] [nvarchar](50) NULL,
	[ExsitingWife] [nvarchar](50) NULL,
	[WifeEducation] [nvarchar](50) NULL,
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
/****** Object:  Table [dbo].[WomenCurrentState]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[WomenResponsibilities]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[WomenRights]    Script Date: 09/04/22 10:10:07 PM ******/
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
/****** Object:  Table [dbo].[WomenRightsResult]    Script Date: 09/04/22 10:10:07 PM ******/
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
SET IDENTITY_INSERT [dbo].[ChatFriendRequest] OFF
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
INSERT [dbo].[EmailSMSTemplate] ([Id], [Type], [Name], [CC], [BCC], [Subject], [MessageBody], [IsActive], [CreatedDate], [CreatedBy], [UpdatedBy], [UpdatedDate]) VALUES (4, N'Email', N'AccountActivationRequest', NULL, NULL, N'Marryme Account Activation Request', N'
	
		<title></title>
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
				<a href="/Account/ConfirmEmail?Email=awais.ramzan.ar@gmail.com&Code=OUREJxf2CuDv2VCw">Click Here</a> To activate your account.
				<p style="margin-top: 20px;margin-bottom: 0px">Thank you!</p>
				<p style="margin-top: 2px;">Team Matrimony</p>
			</div>
			<div style="text-align: center;background: #f5f5f5;padding: 15px 0;font-size: 13px;position: absolute;bottom: 0;left: 0;right: 0;margin: 0 -54px;">
				<p style="margin:0;">© 2022 Matrimony Management System Inc.</p>
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
SET IDENTITY_INSERT [dbo].[Facilities] ON 
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Food', N'W', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Clothes', N'W', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Medical', N'W', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'Basic Needs', N'W', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'Her Own House', N'W', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, N'Own Apartment', N'W', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, N'Her Kids Support', N'W', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, N'To have more Kids', N'W', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (9, N'Education for Kids', N'W', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, N'Expense for Kids', N'W', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (11, N'Respect Other Wives', N'M', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (12, N'Respect Other Kids', N'M', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (13, N'Respect all Family', N'M', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (14, N'Not Jealously', N'M', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (15, N'Not Fighting', N'M', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (16, N'Not Shouting', N'M', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (17, N'Share Responsibilities', N'M', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (18, N'Not be Selfish', N'M', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (19, N'Do not lie', N'M', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (20, N'No bad names', N'M', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (21, N'Protect Family Respect', N'M', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (22, N'No Manipulation', N'M', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (23, N'Keep Family Intact', N'M', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (24, N'God Fearing', N'M', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (25, N'Do Justice', N'M', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (26, N'Be Loving', N'M', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (27, N'Be Caring', N'M', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (28, N'Be Soft Spoken', N'M', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (29, N'Obey Husband', N'M', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (30, N'Do not do Complaints', N'M', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (31, N'No finger Pointing', N'M', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (32, N'Support equal rights', N'M', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (33, N'Do household work', N'M', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (34, N'Take care of Kids', N'M', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (35, N'Take care of Husband', N'M', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Facilities] ([ID], [FacilityName], [FacilityFor], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (36, N'Relocate If needed', N'M', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Facilities] OFF
GO
SET IDENTITY_INSERT [dbo].[FacilitiesResult] ON 
GO
INSERT [dbo].[FacilitiesResult] ([ID], [MemberId], [FacilityId], [FacilityResult], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (19, 30, 1, N'false', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[FacilitiesResult] ([ID], [MemberId], [FacilityId], [FacilityResult], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (20, 30, 15, N'true', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[FacilitiesResult] ([ID], [MemberId], [FacilityId], [FacilityResult], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (21, 30, 5, N'true', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[FacilitiesResult] ([ID], [MemberId], [FacilityId], [FacilityResult], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (22, 30, 4, N'false', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[FacilitiesResult] ([ID], [MemberId], [FacilityId], [FacilityResult], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (23, 30, 7, N'false', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[FacilitiesResult] OFF
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
SET IDENTITY_INSERT [dbo].[MemberAppearance] ON 
GO
INSERT [dbo].[MemberAppearance] ([Id], [MemberId], [Height], [PhysicalStatus], [Weight], [BodyType], [Complexion]) VALUES (15, 10, 180, N'Normal', 40, N'Slim', N'Fair')
GO
INSERT [dbo].[MemberAppearance] ([Id], [MemberId], [Height], [PhysicalStatus], [Weight], [BodyType], [Complexion]) VALUES (16, 11, 175, N'Normal', 78, N'Average', NULL)
GO
INSERT [dbo].[MemberAppearance] ([Id], [MemberId], [Height], [PhysicalStatus], [Weight], [BodyType], [Complexion]) VALUES (17, 9, NULL, N'Normal', NULL, NULL, NULL)
GO
INSERT [dbo].[MemberAppearance] ([Id], [MemberId], [Height], [PhysicalStatus], [Weight], [BodyType], [Complexion]) VALUES (18, 13, 150, N'Normal', NULL, NULL, NULL)
GO
INSERT [dbo].[MemberAppearance] ([Id], [MemberId], [Height], [PhysicalStatus], [Weight], [BodyType], [Complexion]) VALUES (19, 15, NULL, N'Normal', NULL, N'Average', N'Fair')
GO
INSERT [dbo].[MemberAppearance] ([Id], [MemberId], [Height], [PhysicalStatus], [Weight], [BodyType], [Complexion]) VALUES (20, 17, NULL, N'Normal', NULL, NULL, NULL)
GO
INSERT [dbo].[MemberAppearance] ([Id], [MemberId], [Height], [PhysicalStatus], [Weight], [BodyType], [Complexion]) VALUES (21, 18, 180, N'Normal', 42, N'Slim', N'Wheatish Brown')
GO
INSERT [dbo].[MemberAppearance] ([Id], [MemberId], [Height], [PhysicalStatus], [Weight], [BodyType], [Complexion]) VALUES (22, 19, 170, N'Normal', 80, N'Average', N'Fair')
GO
INSERT [dbo].[MemberAppearance] ([Id], [MemberId], [Height], [PhysicalStatus], [Weight], [BodyType], [Complexion]) VALUES (23, 21, 179, N'Normal', NULL, N'Average', NULL)
GO
INSERT [dbo].[MemberAppearance] ([Id], [MemberId], [Height], [PhysicalStatus], [Weight], [BodyType], [Complexion]) VALUES (24, 22, NULL, N'Normal', NULL, NULL, NULL)
GO
INSERT [dbo].[MemberAppearance] ([Id], [MemberId], [Height], [PhysicalStatus], [Weight], [BodyType], [Complexion]) VALUES (25, 23, 52, N'Normal', 100, N'Slim', N'Wheatish Brown')
GO
INSERT [dbo].[MemberAppearance] ([Id], [MemberId], [Height], [PhysicalStatus], [Weight], [BodyType], [Complexion]) VALUES (26, 24, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberAppearance] ([Id], [MemberId], [Height], [PhysicalStatus], [Weight], [BodyType], [Complexion]) VALUES (27, 27, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberAppearance] ([Id], [MemberId], [Height], [PhysicalStatus], [Weight], [BodyType], [Complexion]) VALUES (10015, 29, 175, N'Normal', 67, N'Slim', N'Fair')
GO
INSERT [dbo].[MemberAppearance] ([Id], [MemberId], [Height], [PhysicalStatus], [Weight], [BodyType], [Complexion]) VALUES (10016, 0, NULL, NULL, 167, N'Slim', N'Fair')
GO
INSERT [dbo].[MemberAppearance] ([Id], [MemberId], [Height], [PhysicalStatus], [Weight], [BodyType], [Complexion]) VALUES (20015, 30, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberAppearance] ([Id], [MemberId], [Height], [PhysicalStatus], [Weight], [BodyType], [Complexion]) VALUES (30015, 36, 175, N'Normal', 70, N'Slim', N'Wheatish Brown')
GO
SET IDENTITY_INSERT [dbo].[MemberAppearance] OFF
GO
SET IDENTITY_INSERT [dbo].[MemberEducationDetail] ON 
GO
INSERT [dbo].[MemberEducationDetail] ([Id], [MemberId], [HighestEducation], [EmployeedIn], [Occupation], [IncomeCurrency], [AnnualIncome]) VALUES (11, 10, N'Graduate', N'Private', N'fg', N'USD ($)', CAST(2000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[MemberEducationDetail] ([Id], [MemberId], [HighestEducation], [EmployeedIn], [Occupation], [IncomeCurrency], [AnnualIncome]) VALUES (12, 11, N'BCA', N'Private', NULL, N'INR0 (₹)', CAST(300000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[MemberEducationDetail] ([Id], [MemberId], [HighestEducation], [EmployeedIn], [Occupation], [IncomeCurrency], [AnnualIncome]) VALUES (13, 13, N'M.I.T', N'Private', NULL, N'PKR (RS)', CAST(30000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[MemberEducationDetail] ([Id], [MemberId], [HighestEducation], [EmployeedIn], [Occupation], [IncomeCurrency], [AnnualIncome]) VALUES (14, 15, N'BS IT', N'Government', NULL, N'PKR(RS)', CAST(25500.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[MemberEducationDetail] ([Id], [MemberId], [HighestEducation], [EmployeedIn], [Occupation], [IncomeCurrency], [AnnualIncome]) VALUES (15, 18, N'BS(IT)', N'Government', N'IT', N'PKR(RS)', CAST(75750.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[MemberEducationDetail] ([Id], [MemberId], [HighestEducation], [EmployeedIn], [Occupation], [IncomeCurrency], [AnnualIncome]) VALUES (16, 19, N'BCA', N'Private', N'Administrator', N'Not Available', NULL)
GO
INSERT [dbo].[MemberEducationDetail] ([Id], [MemberId], [HighestEducation], [EmployeedIn], [Occupation], [IncomeCurrency], [AnnualIncome]) VALUES (17, 21, N'MSC', N'Private', N'Not Available', N'Not Available', NULL)
GO
INSERT [dbo].[MemberEducationDetail] ([Id], [MemberId], [HighestEducation], [EmployeedIn], [Occupation], [IncomeCurrency], [AnnualIncome]) VALUES (18, 23, N'bsit', N'Government', N'software eng', N'PKR(RS)', CAST(25000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[MemberEducationDetail] ([Id], [MemberId], [HighestEducation], [EmployeedIn], [Occupation], [IncomeCurrency], [AnnualIncome]) VALUES (10011, 29, N'M.I.T', N'Private', N'Web Developer', N'PKR (RS)', CAST(30000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[MemberEducationDetail] ([Id], [MemberId], [HighestEducation], [EmployeedIn], [Occupation], [IncomeCurrency], [AnnualIncome]) VALUES (10012, 0, NULL, NULL, N'Web Developer', NULL, NULL)
GO
INSERT [dbo].[MemberEducationDetail] ([Id], [MemberId], [HighestEducation], [EmployeedIn], [Occupation], [IncomeCurrency], [AnnualIncome]) VALUES (20011, 36, N'M.I.T', N'Private', N'teacher', N'PKR (RS)', CAST(30000.00 AS Decimal(18, 2)))
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
INSERT [dbo].[MemberLoginDetail] ([Id], [MemberId], [Email], [Password], [IsEmailConfirmed], [ConfirmationCode], [IsActive], [IsFirstLoginAttempt], [IsMobileUser], [FirebaseUserId]) VALUES (20072, 33, N'awais.ramzan.ar@gmail.com', N'Z6VRscgsMeacItvJJmD6kSGkNTny4n9woEfCkSb9L9Y=', 0, N'OUREJxf2CuDv2VCw', 0, 1, 0, NULL)
GO
INSERT [dbo].[MemberLoginDetail] ([Id], [MemberId], [Email], [Password], [IsEmailConfirmed], [ConfirmationCode], [IsActive], [IsFirstLoginAttempt], [IsMobileUser], [FirebaseUserId]) VALUES (20073, 34, N'awaisramzan@gmail.com', N'2N5ttI+EjtfqD0POKKr/+d3n/kxyf3O/yK3AwNQtshQ=', 0, N'NhbYwZbCMUduNQUa', 0, 1, 0, NULL)
GO
INSERT [dbo].[MemberLoginDetail] ([Id], [MemberId], [Email], [Password], [IsEmailConfirmed], [ConfirmationCode], [IsActive], [IsFirstLoginAttempt], [IsMobileUser], [FirebaseUserId]) VALUES (20074, 35, N'awais.ramzan@gmail.com', N'2N5ttI+EjtfqD0POKKr/+d3n/kxyf3O/yK3AwNQtshQ=', 0, N'bu5V0x5mtKGNUKE9', 0, 1, 0, NULL)
GO
INSERT [dbo].[MemberLoginDetail] ([Id], [MemberId], [Email], [Password], [IsEmailConfirmed], [ConfirmationCode], [IsActive], [IsFirstLoginAttempt], [IsMobileUser], [FirebaseUserId]) VALUES (20075, 36, N'mubeenraza123@gmail.com', N'2N5ttI+EjtfqD0POKKr/+d3n/kxyf3O/yK3AwNQtshQ=', 1, N'ArxhipfpL4ACT3JU', 1, 0, 0, NULL)
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
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (19, N'mujju', N'Mujh', N'Self', NULL, NULL, N'Marriage', N'Male', N'74496272', CAST(N'1983-01-01T00:00:00.000' AS DateTime), N'Married', N'2', N'muslim', N'data:image/jpg;base64,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', NULL, 2, NULL, NULL, NULL, NULL, NULL, 1)
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
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (32, N'Muhammad Awais', N'Awais', N'Self', NULL, NULL, N'Marriage', N'Male', N'03016444241', CAST(N'1992-03-13T00:00:00.000' AS DateTime), N'Married', NULL, NULL, NULL, 1, 163, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (33, N'Muhammad Awais', N'Awais', N'Self', NULL, NULL, N'Marriage', N'Male', N'03016546548', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Married', NULL, NULL, NULL, 1, 163, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (34, N'Awais Ramzan', N'Prince', N'Self', NULL, NULL, N'Marriage', N'Male', N'03214569875', CAST(N'1901-01-01T00:00:00.000' AS DateTime), N'Married', NULL, NULL, NULL, 1, 163, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (35, N'Zohaib Ahmad', N'Zohaib', N'Self', NULL, NULL, N'Marriage', N'Male', N'03216548795', CAST(N'1902-02-02T00:00:00.000' AS DateTime), N'Married', NULL, NULL, NULL, 1, 163, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberRegistration] ([Id], [Name], [NickName], [ProfileCreatedBy], [MotherTongue], [NoOfMarriage], [LookingFor], [Gender], [MobileNo], [DOB], [MaritalStatus], [NoOfChildren], [Subcast], [ProfilePicPath], [ReligionId], [CountryId], [AboutMe], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsMobilePic]) VALUES (36, N'mubeen Raza', N'Mubeen', N'Self', NULL, N'1st', N'Marriage', N'Male', N'03216549875', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'UnMarried', N'None', N'Mughal', NULL, 1, 163, N'This is test about me', NULL, NULL, NULL, NULL, NULL)
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
SET IDENTITY_INSERT [dbo].[PartnerCategory] ON 
GO
INSERT [dbo].[PartnerCategory] ([Id], [PartCategoryName], [CategoryType], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Marital status', N'dropdown', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategory] ([Id], [PartCategoryName], [CategoryType], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Education Level', N'dropdown', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategory] ([Id], [PartCategoryName], [CategoryType], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Orphan', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategory] ([Id], [PartCategoryName], [CategoryType], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'Disable', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategory] ([Id], [PartCategoryName], [CategoryType], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'Poor', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategory] ([Id], [PartCategoryName], [CategoryType], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, N'Overage', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategory] ([Id], [PartCategoryName], [CategoryType], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, N'Overweight', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategory] ([Id], [PartCategoryName], [CategoryType], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, N'Stigmatized by Society', NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[PartnerCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[PartnerCategoryResult] ON 
GO
INSERT [dbo].[PartnerCategoryResult] ([ID], [MemberId], [PartnerCategoryID], [PartnerCategoryStatus], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10, 30, 3, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategoryResult] ([ID], [MemberId], [PartnerCategoryID], [PartnerCategoryStatus], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (11, 30, 5, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategoryResult] ([ID], [MemberId], [PartnerCategoryID], [PartnerCategoryStatus], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (12, 30, 7, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategoryResult] ([ID], [MemberId], [PartnerCategoryID], [PartnerCategoryStatus], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (13, 30, 8, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategoryResult] ([ID], [MemberId], [PartnerCategoryID], [PartnerCategoryStatus], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (14, 30, 4, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategoryResult] ([ID], [MemberId], [PartnerCategoryID], [PartnerCategoryStatus], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (15, 0, 3, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PartnerCategoryResult] ([ID], [MemberId], [PartnerCategoryID], [PartnerCategoryStatus], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (16, 30, NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[PartnerCategoryResult] OFF
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
INSERT [dbo].[WifeDetailResult] ([ID], [MemberId], [WifeReligion], [MarriageYear], [WifeLocation], [WifeKids], [WifeJob], [ExsitingWife], [WifeEducation], [HaveWife], [WifeAge], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10, 30, N'AQAAAB%2bLCAAAAAAABAAzBAC379yDAQAAAA%3d%3d', N'1969', N'sdf', N'2', N'asdf', N'1', N'sadf', N'0', N'34', NULL, NULL, NULL, NULL)
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
/****** Object:  StoredProcedure [dbo].[AdminReporting]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DisableCurrentMemberPackageIfExpired]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchAcceptanceCriteria]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchAcceptanceQuestionList]    Script Date: 09/04/22 10:10:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FetchAcceptanceQuestionList]
AS
BEGIN
SELECT ac.ID,ac.AcceptanceQuestion FROM [dbo].[AcceptanceCriteria] ac 

END



--FLOOR((CAST (GetDate() AS INTEGER) - CAST(mr.DOB AS INTEGER)) / 365.25) AS Age
GO
/****** Object:  StoredProcedure [dbo].[FetchAstroMatches]    Script Date: 09/04/22 10:10:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Hassnain Ali>
-- Create date: <Sep-10-2020>
-- Description:	<Fetch Astro Matches>
-- =============================================
CREATE procedure [dbo].[FetchAstroMatches]
 
@star nvarchar(50)=null,
@raashi nvarchar(50)=null,
@gothra nvarchar(50)=null,
@dosham nvarchar(50)=null,
@RecordToFetch int=5
as
begin
select top(@RecordToFetch) mr.*,c.Name as CountryName, s.Name as StateName,ci.Name as CityName,mrd.CityOfBirth,mrd.CountryOfBirth,mrd.Dosham,mrd.Gothra,mrd.Raasi,mrd.MemberId,mrd.Star,mrd.StateOfBirth,mrd.TimeOfBirth from MemberReligiousDetail mrd
inner join [dbo].[Countries] c on c.Id=mrd.CountryOfBirth
inner join [dbo].[States] s on s.StateID=mrd.StateOfBirth
inner join [dbo].[Cities] ci on ci.CityID=mrd.CityOfBirth
inner join MemberRegistration mr on mr.Id=mrd.MemberId
where
(nullif(@star,'') is null or mrd.Star like '%'+@star+'%')or
(nullif(@raashi,'') is null or mrd.Raasi like '%'+@raashi+'%')or
(nullif(@gothra,'') is null or mrd.Gothra like '%'+@gothra+'%')or
(nullif(@dosham,'') is null or mrd.Dosham like '%'+@dosham+'%')
end

GO
/****** Object:  StoredProcedure [dbo].[FetchChatFriendList]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchChatMemberConversation]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchChatMemberList]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchCities]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchCitiesAdminList]    Script Date: 09/04/22 10:10:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
    --Author: <MUHAMMAD ZESHAN >
        --Create date: <July-29 - 2020 >
            --Description: <Fetch the Cities >
                -- =============================================
                CREATE PROCEDURE[dbo].[FetchCitiesAdminList]
@DisplayLength int = 10,
@DisplayStart int = 0,
@SortCol bigint = 0,
@SortOrder nvarchar(5) = null,
@Search nvarchar(50) = '',
@Active nvarchar(1) = ''
--@Status nvarchar(10) = '',
    --@CreatedBy int = 0
AS
BEGIN

    ; With OutputResult as
        (
            select ROW_NUMBER() over(order by 
case when NULLIF(@SortOrder, '') IS NULL then cs.CityID end desc,
case when(@SortCol = 0 and @SortOrder = 'asc') then cs.Name end asc,	
case when(@SortCol = 0 and @SortOrder = 'desc') then cs.Name end desc

) as RowNo, Count(cs.CityID) over() Total,
    cs.CityID, cs.Name as CityName, s.Name as StateName, c.Name as CountryName
From[dbo].[Cities] cs
LEFT JOIN[dbo].[States] s on s.StateID = cs.StateID
LEFT JOIN[dbo].[Countries] c on c.Id = s.CountryID


where
    (NULLIF(@Search, '') is NULL or cs.Name like '%' +@Search+'%')
--AND(NULLIF(@Active, '') IS NULL or mr.IsActive = @Active)
--AND(NULLIF(@Status, '') IS NULL or c.Status = @Status)
--AND(NULLIF(@CreatedBy, '') IS NULL or c.CreatedBy = @CreatedBy)
)
select TOP(case @DisplayLength when - 1 then(Select Count(*) from OutputResult) else @DisplayLength end) * from OutputResult where RowNo > @DisplayStart

END
GO
/****** Object:  StoredProcedure [dbo].[FetchConfirmPaymentAdminList]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchConfirmPaymentClientList]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchContactUs]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchContactUsNotification]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchCountries]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchCountriesAdminList]    Script Date: 09/04/22 10:10:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<MUHAMMAD ZESHAN>
-- Create date: <July-29-2020>
-- Description:	<Fetch the Countries>
-- =============================================
Create PROCEDURE [dbo].[FetchCountriesAdminList]
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
c.Id,c.Name,c.ISO
FROM [dbo].[Countries] c 


where
(NULLIF(@Search, '') is NULL or c.Name like '%'+@Search+'%')
--AND (NULLIF(@Active, '') IS NULL or mr.IsActive = @Active)
--AND (NULLIF(@Status, '') IS NULL or c.Status = @Status)
--AND (NULLIF(@CreatedBy, '') IS NULL or c.CreatedBy = @CreatedBy)
)
select TOP (case @DisplayLength when -1 then (Select Count(*) from OutputResult) else @DisplayLength end) * from OutputResult where RowNo > @DisplayStart

END




GO
/****** Object:  StoredProcedure [dbo].[FetchCountryNameByMemberId]    Script Date: 09/04/22 10:10:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Muhammad Zeshan>
-- Create date: <13-july-2020>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FetchCountryNameByMemberId]
@MemberId bigint
AS
BEGIN

SELECT  c.Name ,c.Id
From MemberRegistration m
INNER JOIN Countries c on m.CountryId=c.Id
WHERE m.Id=@MemberId

END






GO
/****** Object:  StoredProcedure [dbo].[FetchFacilities]    Script Date: 09/04/22 10:10:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FetchFacilities]
@facilityFor nvarchar
AS
BEGIN
SELECT f.Id,f.FacilityName, f.FacilityFor FROM [dbo].[Facilities] f where (f.FacilityFor = @facilityFor)

END

--FLOOR((CAST (GetDate() AS INTEGER) - CAST(mr.DOB AS INTEGER)) / 365.25) AS Age
GO
/****** Object:  StoredProcedure [dbo].[FetchFacilitiesByMemberId]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchFeedBack]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchFeedBackAdminList]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchFeedBackNotification]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchInfoForPersonalProfileCard]    Script Date: 09/04/22 10:10:08 PM ******/
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
SELECT mld.Email,mr.Id,mr.Name,mr.MaritalStatus,mr.MobileNo,mr.DOB,mr.ProfilePicPath,med.HighestEducation,med.Occupation,r.Name as Religion
FROM 
MemberRegistration mr 
INNER JOIN MemberLoginDetail mld ON mld.MemberId=mr.Id
LEFT JOIN MemberEducationDetail med ON med.MemberId=mr.Id
LEFT JOIN Religion r ON mr.ReligionId=r.Id
Where mr.Id=@MemberId

END




GO
/****** Object:  StoredProcedure [dbo].[FetchLanguages]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchMemberAdminList]    Script Date: 09/04/22 10:10:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<MUHAMMAD ZESHAN>
-- Create date: <July-29-2020>
-- Description:	<Fetch the Members>
-- =============================================
CREATE PROCEDURE [dbo].[FetchMemberAdminList]
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
case when NULLIF(@SortOrder,'') IS NULL then mr.Id end desc,
case when (@SortCol = 0 and @SortOrder = 'asc') then mr.Name end asc,	
case when (@SortCol = 0 and @SortOrder = 'desc') then mr.Name end desc

) as RowNo, Count(mr.Id) over() Total,
mr.Id,mr.Name,mr.DOB,mr.Gender,e.HighestEducation,r.Name as Religion,c.Name as Country,mr.NickName,MLD.IsActive
,MLD.Email
FROM [dbo].[MemberRegistration] mr 
INNER JOIN MemberLoginDetail MLD ON MLD.MemberId=MR.Id
INNER JOIN MemberPackageSubscription MPSD ON MPSD.MemberId=MR.Id
LEFT join [dbo].[MemberEducationDetail] e on mr.Id=e.MemberId
LEFT join [dbo].[Religion] r on mr.ReligionId=r.Id
LEFT join [dbo].[Countries] c on mr.CountryId=c.Id
 
where
MPSD.IsActive=1 AND
(NULLIF(@Search, '') is NULL or mr.Name like '%'+@Search+'%')
--AND (NULLIF(@Active, '') IS NULL or mr.IsActive = @Active)
--AND (NULLIF(@Status, '') IS NULL or c.Status = @Status)
--AND (NULLIF(@CreatedBy, '') IS NULL or c.CreatedBy = @CreatedBy)
)
select TOP (case @DisplayLength when -1 then (Select Count(*) from OutputResult) else @DisplayLength end) * from OutputResult where RowNo > @DisplayStart

END


GO
/****** Object:  StoredProcedure [dbo].[FetchMemberDetail]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchMemberFieldPermission]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchMemberList]    Script Date: 09/04/22 10:10:08 PM ******/
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
SELECT Count(mr.Id) over() totalcount, mr.Id,mr.Name,mr.DOB,mr.Gender,mr.ProfilePicPath,mr.IsMobilePic,e.HighestEducation,r.ReligionName as Religion,c.CountryName as Country,mr.NickName
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
/****** Object:  StoredProcedure [dbo].[FetchMemberSubscription]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchNewlyRegisteredMemberList]    Script Date: 09/04/22 10:10:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FetchNewlyRegisteredMemberList]
AS
BEGIN
SELECT TOP(5) mr.Id,mr.Name,mr.DOB,mr.Gender,mr.ProfilePicPath,mr.IsMobilePic,e.HighestEducation,r.Name as Religion,c.Name as Country,mr.NickName
FROM [dbo].[MemberRegistration] mr 
left join [dbo].[MemberEducationDetail] e on mr.Id=e.MemberId
left join [dbo].[Religion] r on mr.ReligionId=r.Id
left join [dbo].[Countries] c on mr.CountryId=c.Id


END


GO
/****** Object:  StoredProcedure [dbo].[FetchOrderSummary]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchPackagePricingPlans]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchPackages]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchPackagesDuration]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchPackageSubscription]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchPackageType]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchParentCatagoryList]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchPartnerCategoriesByMemberId]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchPaymentOptionddl]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchPaymentOptions]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchPremiumBestMatches]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchPremiumMember]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchProfileLocationDetail]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchProfilePersonalInfo]    Script Date: 09/04/22 10:10:08 PM ******/
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
SELECT mld.Email,mr.Id,mr.IsMobilePic,mr.Subcast,mr.MaritalStatus,mr.NoOfChildren,mr.Gender,mr.NoOfMarriage,mr.ProfilePicPath,ma.Height,ma.PhysicalStatus
FROM 
MemberRegistration mr 
Inner Join MemberLoginDetail mld on mld.MemberId=mr.Id
left join MemberAppearance ma on ma.MemberId=mr.Id
Where mr.Id=@MemberId

END

GO
/****** Object:  StoredProcedure [dbo].[FetchProfilePersonalInfoDetail]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchProfileRequirementCheckListResult]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchProfileRequirementList]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchProposalQuestions]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchProposalQuestionsByMemberId]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchStates]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchStatesAdminList]    Script Date: 09/04/22 10:10:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<MUHAMMAD ZESHAN>
-- Create date: <July-29-2020>
-- Description:	<Fetch the States>
-- =============================================
Create PROCEDURE [dbo].[FetchStatesAdminList]
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
case when NULLIF(@SortOrder,'') IS NULL then s.StateID end desc,
case when (@SortCol = 0 and @SortOrder = 'asc') then s.Name end asc,	
case when (@SortCol = 0 and @SortOrder = 'desc') then s.Name end desc

) as RowNo, Count(s.StateID) over() Total,
s.StateID,c.Name as Country,s.Name as State
FROM [dbo].[States] s
LEFT JOIN [dbo].[Countries] c ON s.CountryID=c.Id


where
(NULLIF(@Search, '') is NULL or s.Name like '%'+@Search+'%')
--AND (NULLIF(@Active, '') IS NULL or mr.IsActive = @Active)
--AND (NULLIF(@Status, '') IS NULL or c.Status = @Status)
--AND (NULLIF(@CreatedBy, '') IS NULL or c.CreatedBy = @CreatedBy)
)
select TOP (case @DisplayLength when -1 then (Select Count(*) from OutputResult) else @DisplayLength end) * from OutputResult where RowNo > @DisplayStart

END




GO
/****** Object:  StoredProcedure [dbo].[FetchWifeDetailByMemberId]    Script Date: 09/04/22 10:10:08 PM ******/
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

SELECT wd.MemberId, wd.ExsitingWife, wd.HaveWife, wd.MarriageYear, wd.WifeAge, wd.WifeEducation, wd.WifeJob, wd.WifeKids, wd.WifeLocation, wd.WifeReligion
FROM [dbo].[WifeDetailResult] wd
--LEFT JOIN [dbo].[FacilitiesResult] fr ON fr.MemberId=mr.Id

Where wd.MemberId=@MemberId
END
GO
/****** Object:  StoredProcedure [dbo].[FetchWomanRights]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchWomanRightsByMemberId]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetPackageRemainingWeeksByMemberId]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[MembersFetch]    Script Date: 09/04/22 10:10:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Packages]    Script Date: 09/04/22 10:10:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<MUHAMMAD ZESHAN>
-- Create date: <June-26-2020>
-- Description:	<Fetch the Packages>
-- =============================================
CREATE PROCEDURE [dbo].[Packages]
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
case when NULLIF(@SortOrder,'') IS NULL then p.Id end desc,
case when (@SortCol = 0 and @SortOrder = 'asc') then p.PackageTypeId end asc,	
case when (@SortCol = 0 and @SortOrder = 'desc') then p.PackageTypeId end desc

) as RowNo, Count(p.Id) over() Total,
p.Id, ISNULL(p.PackageTypeId,'') PackageTypeId,pt.Name as PackageTypeName ,p.CanChat,p.CanMemberViewMobileNo,p.CanViewPhoto,p.IsAstroMatches,p.IsVisibleHighProfile,p.NumberOfAstroMatches,p.NumberOfChatMessages,p.NumberOfMobileNo,p.IsActive
from [dbo].[Package] p

inner join [dbo].[PackageType] pt on pt.Id=p.PackageTypeId

where
(NULLIF(@Search, '') is NULL or p.PackageTypeId like '%'+@Search+'%')
AND (NULLIF(@Active, '') IS NULL or p.IsActive = @Active)
--AND (NULLIF(@Status, '') IS NULL or c.Status = @Status)
--AND (NULLIF(@CreatedBy, '') IS NULL or c.CreatedBy = @CreatedBy)
)
select TOP (case @DisplayLength when -1 then (Select Count(*) from OutputResult) else @DisplayLength end) * from OutputResult where RowNo > @DisplayStart

END






GO
/****** Object:  StoredProcedure [dbo].[PageContents]    Script Date: 09/04/22 10:10:08 PM ******/
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
