USE [master]
GO
/****** Object:  Database [TaipeiBreakfast]    Script Date: 2015/5/2 下午 07:15:14 ******/
drop database TaipeiBreakfast
GO

CREATE DATABASE [TaipeiBreakfast]
 CONTAINMENT = NONE

GO
ALTER DATABASE [TaipeiBreakfast] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TaipeiBreakfast].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TaipeiBreakfast] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TaipeiBreakfast] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TaipeiBreakfast] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TaipeiBreakfast] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TaipeiBreakfast] SET ARITHABORT OFF 
GO
ALTER DATABASE [TaipeiBreakfast] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TaipeiBreakfast] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [TaipeiBreakfast] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TaipeiBreakfast] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TaipeiBreakfast] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TaipeiBreakfast] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TaipeiBreakfast] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TaipeiBreakfast] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TaipeiBreakfast] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TaipeiBreakfast] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TaipeiBreakfast] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TaipeiBreakfast] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TaipeiBreakfast] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TaipeiBreakfast] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TaipeiBreakfast] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TaipeiBreakfast] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TaipeiBreakfast] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TaipeiBreakfast] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TaipeiBreakfast] SET RECOVERY FULL 
GO
ALTER DATABASE [TaipeiBreakfast] SET  MULTI_USER 
GO
ALTER DATABASE [TaipeiBreakfast] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TaipeiBreakfast] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TaipeiBreakfast] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TaipeiBreakfast] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TaipeiBreakfast', N'ON'
GO
USE [TaipeiBreakfast]
GO
/****** Object:  Table [dbo].[Accuse]    Script Date: 2015/5/2 下午 07:15:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accuse](
	[AccuseID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[AccuseSub] [nvarchar](20) NULL,
	[AccuseContent] [nvarchar](300) NULL,
	[AccuseStatusID] [int] NOT NULL CONSTRAINT [DF_Accuse_AccuseStatusID]  DEFAULT ((1)),
	[AccuseTime] [datetime] NULL CONSTRAINT [DF_Accuse_AccuseTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_Accuse] PRIMARY KEY CLUSTERED 
(
	[AccuseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AccuseStatus]    Script Date: 2015/5/2 下午 07:15:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccuseStatus](
	[AccuseStatusID] [int] IDENTITY(1,1) NOT NULL,
	[AccuseStatus] [nvarchar](20) NULL,
 CONSTRAINT [PK_AccuseStatus] PRIMARY KEY CLUSTERED 
(
	[AccuseStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Administrator]    Script Date: 2015/5/2 下午 07:15:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Administrator](
	[AdministratorID] [int] IDENTITY(1,1) NOT NULL,
	[AdministrtorAcc] [varchar](20) NULL,
	[AdministrtorPwd] [varchar](20) NULL,
	[AdministrtorPermissionID] [int] NOT NULL,
 CONSTRAINT [PK_Administrtor] PRIMARY KEY CLUSTERED 
(
	[AdministratorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AdministratorPermission]    Script Date: 2015/5/2 下午 07:15:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdministratorPermission](
	[AdministratorPermissionID] [int] IDENTITY(1,1) NOT NULL,
	[AdministratorPermissionStatus] [nvarchar](20) NULL,
 CONSTRAINT [PK_AdministratorPermission] PRIMARY KEY CLUSTERED 
(
	[AdministratorPermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Advertisement]    Script Date: 2015/5/2 下午 07:15:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advertisement](
	[AdvertisementID] [int] IDENTITY(1,1) NOT NULL,
	[Context] [nvarchar](100) NULL,
	[Image] [image] NULL,
	[Days] [int] NOT NULL,
	[AdvertisementStatusID] [int] NOT NULL CONSTRAINT [DF_Advertisement_AdvertisementStatusID]  DEFAULT ((1)),
	[ShopID] [int] NOT NULL,
 CONSTRAINT [PK_Advertisement] PRIMARY KEY CLUSTERED 
(
	[AdvertisementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AdvertisementStatus]    Script Date: 2015/5/2 下午 07:15:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdvertisementStatus](
	[AdvertisementStatusID] [int] IDENTITY(1,1) NOT NULL,
	[AdvertisementStatus] [nvarchar](10) NULL,
 CONSTRAINT [PK_AdvertisementStatus] PRIMARY KEY CLUSTERED 
(
	[AdvertisementStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Daysoff]    Script Date: 2015/5/2 下午 07:15:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Daysoff](
	[DaysoffID] [int] IDENTITY(1,1) NOT NULL,
	[ShopID] [int] NOT NULL,
	[Daysoff] [datetime] NULL,
 CONSTRAINT [PK_Daysoff] PRIMARY KEY CLUSTERED 
(
	[DaysoffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Favorite]    Script Date: 2015/5/2 下午 07:15:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorite](
	[FavoriteID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[MealID] [int] NOT NULL,
 CONSTRAINT [PK_Favorite] PRIMARY KEY CLUSTERED 
(
	[FavoriteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Meal]    Script Date: 2015/5/2 下午 07:15:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meal](
	[MealID] [int] IDENTITY(1,1) NOT NULL,
	[MealName] [nvarchar](30) NULL,
	[Price] [float] NULL,
	[ShopID] [int] NOT NULL,
	[MealImage] [image] NULL,
	[MealStatus] [bit] NULL CONSTRAINT [DF_Meal_MealStatus]  DEFAULT ((1)),
	[MealKindID] [int] NOT NULL,
 CONSTRAINT [PK_Meal] PRIMARY KEY CLUSTERED 
(
	[MealID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MealKindList]    Script Date: 2015/5/2 下午 07:15:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MealKindList](
	[MealKindID] [int] IDENTITY(1,1) NOT NULL,
	[MealKindName] [nvarchar](20) NULL,
	[DefaultImage] [image] NULL,
 CONSTRAINT [PK_MealKindList] PRIMARY KEY CLUSTERED 
(
	[MealKindID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Member]    Script Date: 2015/5/2 下午 07:15:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Member](
	[MemberID] [int] IDENTITY(1,1) NOT NULL,
	[MemberAcc] [varchar](20) NOT NULL,
	[MemberPwd] [varchar](20) NOT NULL,
	[MemberLastName] [nvarchar](20) NULL,
	[MemberFirstName] [nvarchar](20) NULL,
	[MemberPhone] [varchar](20) NULL,
	[MemberTel] [varchar](20) NULL,
	[MemberEmail] [varchar](30) NULL,
	[MemberAddr] [nvarchar](30) NULL,
	[MemberImage] [image] NULL,
	[MemberStatus] [bit] NULL CONSTRAINT [DF_Member_MemberStatus]  DEFAULT ((1)),
	[MemberSuspend] [bit] NULL CONSTRAINT [DF_Member_MemberSuspend]  DEFAULT ((0)),
	[SpecialPriceID] [int] NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MessageBoard]    Script Date: 2015/5/2 下午 07:15:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MessageBoard](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[Context] [nvarchar](100) NULL,
	[MessageDate] [datetime] NULL CONSTRAINT [DF_MessageBoard_MessageDate]  DEFAULT (getdate()),
	[IPAddress] [varchar](20) NULL,
 CONSTRAINT [PK_MessageBoard] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[News]    Script Date: 2015/5/2 下午 07:15:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[News](
	[NewsID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](20) NULL,
	[Content] [varchar](max) NULL,
	[Date] [date] NULL CONSTRAINT [DF_News_Date]  DEFAULT (getdate()),
	[Image] [image] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[NewsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderCond]    Script Date: 2015/5/2 下午 07:15:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderCond](
	[OrderCondID] [int] IDENTITY(1,1) NOT NULL,
	[OrderCond] [nvarchar](10) NULL,
 CONSTRAINT [PK_OrderCond] PRIMARY KEY CLUSTERED 
(
	[OrderCondID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 2015/5/2 下午 07:15:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[MealID] [int] NOT NULL,
	[Count] [int] NULL,
	[Price] [float] NULL,
	[OrderSumID] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderSum]    Script Date: 2015/5/2 下午 07:15:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderSum](
	[OrderSumID] [int] IDENTITY(1,1) NOT NULL,
	[ShopID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
	[TotalPrice] [float] NULL,
	[OrderTime] [datetime] NULL CONSTRAINT [DF_OrderSum_OrderTime]  DEFAULT (getdate()),
	[ExpectTime] [datetime] NULL,
	[Memo] [nvarchar](60) NULL,
	[StarsforOwn] [int] NULL,
	[evaluateforShop] [nvarchar](100) NULL,
	[OrderCondID] [int] NOT NULL CONSTRAINT [DF_OrderSum_OrderCondID]  DEFAULT ((1)),
 CONSTRAINT [PK_OrderSum] PRIMARY KEY CLUSTERED 
(
	[OrderSumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Owner]    Script Date: 2015/5/2 下午 07:15:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Owner](
	[OwnID] [int] IDENTITY(1,1) NOT NULL,
	[OwnAcc] [varchar](20) NOT NULL,
	[OwnPwd] [varchar](20) NOT NULL,
	[OwnEmail] [varchar](30) NULL,
	[OwnLastName] [nvarchar](20) NULL,
	[OwnFirstName] [nvarchar](20) NULL,
	[OwnStatus] [bit] NULL CONSTRAINT [DF_Owner_OwnStatus]  DEFAULT ((1)),
	[OwnSuspend] [bit] NULL CONSTRAINT [DF_Owner_OwnSuspend]  DEFAULT ((0)),
 CONSTRAINT [PK_Owner] PRIMARY KEY CLUSTERED 
(
	[OwnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReplyMessage]    Script Date: 2015/5/2 下午 07:15:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReplyMessage](
	[ReplyMessageID] [int] IDENTITY(1,1) NOT NULL,
	[MessageID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
	[ReplyMessage] [nvarchar](100) NULL,
	[ReplyDate] [datetime] NULL CONSTRAINT [DF_ReplyMessage_ReplyDate]  DEFAULT (getdate()),
	[IpAddress] [varchar](20) NULL,
 CONSTRAINT [PK_ReplyMessage] PRIMARY KEY CLUSTERED 
(
	[ReplyMessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 2015/5/2 下午 07:15:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Shop](
	[ShopID] [int] IDENTITY(1,1) NOT NULL,
	[ShopName] [nvarchar](25) NOT NULL,
	[ShopPhone] [varchar](20) NULL,
	[ShopCity] [nvarchar](10) NOT NULL,
	[ShopArea] [nvarchar](10) NOT NULL,
	[ShopAddr] [nvarchar](40) NULL,
	[LastOrderNoon] [time](7) NULL CONSTRAINT [DF_Shop_LastOrderNoon]  DEFAULT ('12:00'),
	[LastOrderNight] [time](7) NULL CONSTRAINT [DF_Shop_LastOrderNight]  DEFAULT ('00:00'),
	[OwnID] [int] NOT NULL,
	[LogoImage] [image] NULL,
	[ShopSuspend] [bit] NULL CONSTRAINT [DF_Shop_ShopSuspend]  DEFAULT ((0)),
	[ShopCondID] [int] NOT NULL CONSTRAINT [DF_Shop_ShopCondID]  DEFAULT ((1)),
	[BeginBusinessTime] [time](7) NULL CONSTRAINT [DF_Shop_BeginBusinessTime]  DEFAULT ('07:00'),
	[EndBusinessTime] [time](7) NULL CONSTRAINT [DF_Shop_EndBusinessTime]  DEFAULT ('12:00'),
	[BusinessTimeNote] [nvarchar](100) NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ShopID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ShopCond]    Script Date: 2015/5/2 下午 07:15:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopCond](
	[ShopCondID] [int] IDENTITY(1,1) NOT NULL,
	[ShopCond] [nvarchar](10) NULL,
 CONSTRAINT [PK_ShopCond] PRIMARY KEY CLUSTERED 
(
	[ShopCondID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SpecialPrice]    Script Date: 2015/5/2 下午 07:15:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecialPrice](
	[SpecialPriceID] [int] IDENTITY(1,1) NOT NULL,
	[MealID] [int] NOT NULL,
	[SpecialPrice] [int] NOT NULL,
	[StartDate] [date] NULL CONSTRAINT [DF_SpecialPrice_StartDate]  DEFAULT (getdate()),
	[EndDate] [date] NULL,
 CONSTRAINT [PK_SpecialPrice] PRIMARY KEY CLUSTERED 
(
	[SpecialPriceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Accuse] ON 

GO
INSERT [dbo].[Accuse] ([AccuseID], [MemberID], [AccuseSub], [AccuseContent], [AccuseStatusID], [AccuseTime]) VALUES (1, 3, N'沒準備早餐', N'早上抵達時沒準備好餐點，也不理會', 1, CAST(N'2015-05-02 16:35:35.390' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Accuse] OFF
GO
SET IDENTITY_INSERT [dbo].[AccuseStatus] ON 

GO
INSERT [dbo].[AccuseStatus] ([AccuseStatusID], [AccuseStatus]) VALUES (1, N'處理中')
GO
INSERT [dbo].[AccuseStatus] ([AccuseStatusID], [AccuseStatus]) VALUES (2, N'申訴成立')
GO
INSERT [dbo].[AccuseStatus] ([AccuseStatusID], [AccuseStatus]) VALUES (3, N'申訴不成立')
GO
SET IDENTITY_INSERT [dbo].[AccuseStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Administrator] ON 

GO
INSERT [dbo].[Administrator] ([AdministratorID], [AdministrtorAcc], [AdministrtorPwd], [AdministrtorPermissionID]) VALUES (2, N'Manager', N'Manager', 1)
GO
INSERT [dbo].[Administrator] ([AdministratorID], [AdministrtorAcc], [AdministrtorPwd], [AdministrtorPermissionID]) VALUES (3, N'TeamLeader', N'TeamLeader', 2)
GO
INSERT [dbo].[Administrator] ([AdministratorID], [AdministrtorAcc], [AdministrtorPwd], [AdministrtorPermissionID]) VALUES (4, N'ProjectManager', N'ProjectManager', 3)
GO
SET IDENTITY_INSERT [dbo].[Administrator] OFF
GO
SET IDENTITY_INSERT [dbo].[AdministratorPermission] ON 

GO
INSERT [dbo].[AdministratorPermission] ([AdministratorPermissionID], [AdministratorPermissionStatus]) VALUES (1, N'一級主管')
GO
INSERT [dbo].[AdministratorPermission] ([AdministratorPermissionID], [AdministratorPermissionStatus]) VALUES (2, N'二級主管')
GO
INSERT [dbo].[AdministratorPermission] ([AdministratorPermissionID], [AdministratorPermissionStatus]) VALUES (3, N'三級主管')
GO
SET IDENTITY_INSERT [dbo].[AdministratorPermission] OFF
GO
SET IDENTITY_INSERT [dbo].[Advertisement] ON 

GO
INSERT [dbo].[Advertisement] ([AdvertisementID], [Context], [Image], [Days], [AdvertisementStatusID], [ShopID]) VALUES (1, N'鮪魚漢堡特價', NULL, 15, 1, 3)
GO
INSERT [dbo].[Advertisement] ([AdvertisementID], [Context], [Image], [Days], [AdvertisementStatusID], [ShopID]) VALUES (2, N'鮪魚蛋餅特價', NULL, 10, 2, 3)
GO
SET IDENTITY_INSERT [dbo].[Advertisement] OFF
GO
SET IDENTITY_INSERT [dbo].[AdvertisementStatus] ON 

GO
INSERT [dbo].[AdvertisementStatus] ([AdvertisementStatusID], [AdvertisementStatus]) VALUES (1, N'審核中')
GO
INSERT [dbo].[AdvertisementStatus] ([AdvertisementStatusID], [AdvertisementStatus]) VALUES (2, N'已通過')
GO
INSERT [dbo].[AdvertisementStatus] ([AdvertisementStatusID], [AdvertisementStatus]) VALUES (3, N'未通過')
GO
INSERT [dbo].[AdvertisementStatus] ([AdvertisementStatusID], [AdvertisementStatus]) VALUES (4, N'排程中')
GO
INSERT [dbo].[AdvertisementStatus] ([AdvertisementStatusID], [AdvertisementStatus]) VALUES (5, N'播放中')
GO
SET IDENTITY_INSERT [dbo].[AdvertisementStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Daysoff] ON 

GO
INSERT [dbo].[Daysoff] ([DaysoffID], [ShopID], [Daysoff]) VALUES (1, 3, CAST(N'2015-05-03 00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Daysoff] OFF
GO
SET IDENTITY_INSERT [dbo].[Favorite] ON 

GO
INSERT [dbo].[Favorite] ([FavoriteID], [MemberID], [MealID]) VALUES (1, 1, 2)
GO
INSERT [dbo].[Favorite] ([FavoriteID], [MemberID], [MealID]) VALUES (2, 1, 3)
GO
SET IDENTITY_INSERT [dbo].[Favorite] OFF
GO
SET IDENTITY_INSERT [dbo].[Meal] ON 

GO
INSERT [dbo].[Meal] ([MealID], [MealName], [Price], [ShopID], [MealImage], [MealStatus], [MealKindID]) VALUES (2, N'鮪魚漢堡', 40, 3, NULL, 1, 1)
GO
INSERT [dbo].[Meal] ([MealID], [MealName], [Price], [ShopID], [MealImage], [MealStatus], [MealKindID]) VALUES (3, N'鮪魚蛋餅', 35, 3, NULL, 1, 2)
GO
SET IDENTITY_INSERT [dbo].[Meal] OFF
GO
SET IDENTITY_INSERT [dbo].[MealKindList] ON 

GO
INSERT [dbo].[MealKindList] ([MealKindID], [MealKindName], [DefaultImage]) VALUES (1, N'漢堡', NULL)
GO
INSERT [dbo].[MealKindList] ([MealKindID], [MealKindName], [DefaultImage]) VALUES (2, N'蛋餅', NULL)
GO
INSERT [dbo].[MealKindList] ([MealKindID], [MealKindName], [DefaultImage]) VALUES (3, N'吐司', NULL)
GO
INSERT [dbo].[MealKindList] ([MealKindID], [MealKindName], [DefaultImage]) VALUES (4, N'三明治', NULL)
GO
INSERT [dbo].[MealKindList] ([MealKindID], [MealKindName], [DefaultImage]) VALUES (5, N'點心', NULL)
GO
SET IDENTITY_INSERT [dbo].[MealKindList] OFF
GO
SET IDENTITY_INSERT [dbo].[Member] ON 

GO
INSERT [dbo].[Member] ([MemberID], [MemberAcc], [MemberPwd], [MemberLastName], [MemberFirstName], [MemberPhone], [MemberTel], [MemberEmail], [MemberAddr], [MemberImage], [MemberStatus], [MemberSuspend], [SpecialPriceID]) VALUES (1, N'Alex@gmail.com', N'A', N'亞歷斯', N'王', N'02-54639214', N'02-45689523', N'Alex@gmail.com', N'新北市林口區中正路1號', NULL, 1, 0, NULL)
GO
INSERT [dbo].[Member] ([MemberID], [MemberAcc], [MemberPwd], [MemberLastName], [MemberFirstName], [MemberPhone], [MemberTel], [MemberEmail], [MemberAddr], [MemberImage], [MemberStatus], [MemberSuspend], [SpecialPriceID]) VALUES (2, N'Babe@yahoo.com..tw', N'B', N'北鼻', N'林', NULL, NULL, N'Baba@yahoo.com.tw', N'台北市南港區中正路1號', NULL, 1, 0, NULL)
GO
INSERT [dbo].[Member] ([MemberID], [MemberAcc], [MemberPwd], [MemberLastName], [MemberFirstName], [MemberPhone], [MemberTel], [MemberEmail], [MemberAddr], [MemberImage], [MemberStatus], [MemberSuspend], [SpecialPriceID]) VALUES (3, N'Carol@gmail.com', N'C', N'卡羅', N'李', NULL, NULL, N'Carol@gmail.com', N'台中市', NULL, 1, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[Member] OFF
GO
SET IDENTITY_INSERT [dbo].[MessageBoard] ON 

GO
INSERT [dbo].[MessageBoard] ([MessageID], [MemberID], [Context], [MessageDate], [IPAddress]) VALUES (1, 1, N'鮪魚蛋餅好吃', CAST(N'2015-05-02 16:46:53.170' AS DateTime), N'192.168.37.23')
GO
SET IDENTITY_INSERT [dbo].[MessageBoard] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

GO
INSERT [dbo].[News] ([NewsID], [Title], [Content], [Date], [Image]) VALUES (1, N'慶祝上市', N'歡慶上市 新活動即將展開', CAST(N'2015-05-02' AS Date), NULL)
GO
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderCond] ON 

GO
INSERT [dbo].[OrderCond] ([OrderCondID], [OrderCond]) VALUES (1, N'處理中')
GO
INSERT [dbo].[OrderCond] ([OrderCondID], [OrderCond]) VALUES (2, N'接受訂單')
GO
INSERT [dbo].[OrderCond] ([OrderCondID], [OrderCond]) VALUES (3, N'拒絕訂單')
GO
SET IDENTITY_INSERT [dbo].[OrderCond] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

GO
INSERT [dbo].[OrderDetail] ([OrderDetailID], [MealID], [Count], [Price], [OrderSumID]) VALUES (1, 2, 2, 40, 1)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailID], [MealID], [Count], [Price], [OrderSumID]) VALUES (2, 3, 2, 35, 1)
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderSum] ON 

GO
INSERT [dbo].[OrderSum] ([OrderSumID], [ShopID], [MemberID], [TotalPrice], [OrderTime], [ExpectTime], [Memo], [StarsforOwn], [evaluateforShop], [OrderCondID]) VALUES (1, 3, 1, 150, CAST(N'2015-05-02 16:49:15.460' AS DateTime), CAST(N'2015-05-03 00:00:00.000' AS DateTime), N'鮪魚漢堡不要菜', NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[OrderSum] OFF
GO
SET IDENTITY_INSERT [dbo].[Owner] ON 

GO
INSERT [dbo].[Owner] ([OwnID], [OwnAcc], [OwnPwd], [OwnEmail], [OwnLastName], [OwnFirstName], [OwnStatus], [OwnSuspend]) VALUES (1, N'Laya', N'Laya', N'Laya@gmail.com', N'拉', N'亞', 1, 0)
GO
INSERT [dbo].[Owner] ([OwnID], [OwnAcc], [OwnPwd], [OwnEmail], [OwnLastName], [OwnFirstName], [OwnStatus], [OwnSuspend]) VALUES (4, N'Mei', N'Mei', N'Mei@yahoo.com.tw', N'美', N'而美', 1, 1)
GO
INSERT [dbo].[Owner] ([OwnID], [OwnAcc], [OwnPwd], [OwnEmail], [OwnLastName], [OwnFirstName], [OwnStatus], [OwnSuspend]) VALUES (5, N'Sun', N'Sun', N'Sun@hotmail.com', N'太', N'陽', 1, 0)
GO
INSERT [dbo].[Owner] ([OwnID], [OwnAcc], [OwnPwd], [OwnEmail], [OwnLastName], [OwnFirstName], [OwnStatus], [OwnSuspend]) VALUES (6, N'Moon', N'Moon', N'Moon@gmail.com', N'月', N'亮', 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Owner] OFF
GO
SET IDENTITY_INSERT [dbo].[ReplyMessage] ON 

GO
INSERT [dbo].[ReplyMessage] ([ReplyMessageID], [MessageID], [MemberID], [ReplyMessage], [ReplyDate], [IpAddress]) VALUES (2, 1, 2, N'其實不好吃', CAST(N'2015-05-02 00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[ReplyMessage] ([ReplyMessageID], [MessageID], [MemberID], [ReplyMessage], [ReplyDate], [IpAddress]) VALUES (3, 1, 3, N'同意二樓', CAST(N'2015-05-02 17:10:05.927' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[ReplyMessage] OFF
GO
SET IDENTITY_INSERT [dbo].[Shop] ON 

GO
INSERT [dbo].[Shop] ([ShopID], [ShopName], [ShopPhone], [ShopCity], [ShopArea], [ShopAddr], [LastOrderNoon], [LastOrderNight], [OwnID], [LogoImage], [ShopSuspend], [ShopCondID], [BeginBusinessTime], [EndBusinessTime], [BusinessTimeNote]) VALUES (3, N'Laya', N'02-12345678', N'台北', N'大安', N'復興南路一段1號', CAST(N'12:00:00' AS Time), CAST(N'00:00:00' AS Time), 1, NULL, 0, 1, CAST(N'07:00:00' AS Time), CAST(N'11:00:00' AS Time), NULL)
GO
INSERT [dbo].[Shop] ([ShopID], [ShopName], [ShopPhone], [ShopCity], [ShopArea], [ShopAddr], [LastOrderNoon], [LastOrderNight], [OwnID], [LogoImage], [ShopSuspend], [ShopCondID], [BeginBusinessTime], [EndBusinessTime], [BusinessTimeNote]) VALUES (11, N'MEI', N'02-12547896', N'台北', N'大安', N'信義路', NULL, NULL, 4, NULL, NULL, 1, CAST(N'08:00:00' AS Time), CAST(N'12:00:00' AS Time), NULL)
GO
INSERT [dbo].[Shop] ([ShopID], [ShopName], [ShopPhone], [ShopCity], [ShopArea], [ShopAddr], [LastOrderNoon], [LastOrderNight], [OwnID], [LogoImage], [ShopSuspend], [ShopCondID], [BeginBusinessTime], [EndBusinessTime], [BusinessTimeNote]) VALUES (12, N'Moon', N'02-54129654', N'台北', N'信義區', N'信義路1段1號', CAST(N'12:00:00' AS Time), CAST(N'00:00:00' AS Time), 6, NULL, 0, 1, CAST(N'07:00:00' AS Time), CAST(N'12:00:00' AS Time), NULL)
GO
SET IDENTITY_INSERT [dbo].[Shop] OFF
GO
SET IDENTITY_INSERT [dbo].[ShopCond] ON 

GO
INSERT [dbo].[ShopCond] ([ShopCondID], [ShopCond]) VALUES (1, N'審核中')
GO
INSERT [dbo].[ShopCond] ([ShopCondID], [ShopCond]) VALUES (2, N'未通過')
GO
INSERT [dbo].[ShopCond] ([ShopCondID], [ShopCond]) VALUES (3, N'已通過')
GO
SET IDENTITY_INSERT [dbo].[ShopCond] OFF
GO
SET IDENTITY_INSERT [dbo].[SpecialPrice] ON 

GO
INSERT [dbo].[SpecialPrice] ([SpecialPriceID], [MealID], [SpecialPrice], [StartDate], [EndDate]) VALUES (3, 2, 35, NULL, NULL)
GO
INSERT [dbo].[SpecialPrice] ([SpecialPriceID], [MealID], [SpecialPrice], [StartDate], [EndDate]) VALUES (4, 3, 30, CAST(N'2015-05-02' AS Date), NULL)
GO
SET IDENTITY_INSERT [dbo].[SpecialPrice] OFF
GO
ALTER TABLE [dbo].[Accuse]  WITH CHECK ADD  CONSTRAINT [FK_Accuse_AccuseStatus] FOREIGN KEY([AccuseStatusID])
REFERENCES [dbo].[AccuseStatus] ([AccuseStatusID])
GO
ALTER TABLE [dbo].[Accuse] CHECK CONSTRAINT [FK_Accuse_AccuseStatus]
GO
ALTER TABLE [dbo].[Accuse]  WITH CHECK ADD  CONSTRAINT [FK_Accuse_Member] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Accuse] CHECK CONSTRAINT [FK_Accuse_Member]
GO
ALTER TABLE [dbo].[Administrator]  WITH CHECK ADD  CONSTRAINT [FK_Administrtor_AdministratorPermission] FOREIGN KEY([AdministrtorPermissionID])
REFERENCES [dbo].[AdministratorPermission] ([AdministratorPermissionID])
GO
ALTER TABLE [dbo].[Administrator] CHECK CONSTRAINT [FK_Administrtor_AdministratorPermission]
GO
ALTER TABLE [dbo].[Advertisement]  WITH CHECK ADD  CONSTRAINT [FK_Advertisement_AdvertisementStatus] FOREIGN KEY([AdvertisementStatusID])
REFERENCES [dbo].[AdvertisementStatus] ([AdvertisementStatusID])
GO
ALTER TABLE [dbo].[Advertisement] CHECK CONSTRAINT [FK_Advertisement_AdvertisementStatus]
GO
ALTER TABLE [dbo].[Daysoff]  WITH CHECK ADD  CONSTRAINT [FK_Daysoff_Shop] FOREIGN KEY([ShopID])
REFERENCES [dbo].[Shop] ([ShopID])
GO
ALTER TABLE [dbo].[Daysoff] CHECK CONSTRAINT [FK_Daysoff_Shop]
GO
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD  CONSTRAINT [FK_Favorite_Meal] FOREIGN KEY([MealID])
REFERENCES [dbo].[Meal] ([MealID])
GO
ALTER TABLE [dbo].[Favorite] CHECK CONSTRAINT [FK_Favorite_Meal]
GO
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD  CONSTRAINT [FK_Favorite_Member] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Favorite] CHECK CONSTRAINT [FK_Favorite_Member]
GO
ALTER TABLE [dbo].[Meal]  WITH CHECK ADD  CONSTRAINT [FK_Meal_MealKindList] FOREIGN KEY([MealKindID])
REFERENCES [dbo].[MealKindList] ([MealKindID])
GO
ALTER TABLE [dbo].[Meal] CHECK CONSTRAINT [FK_Meal_MealKindList]
GO
ALTER TABLE [dbo].[Meal]  WITH CHECK ADD  CONSTRAINT [FK_Meal_Shop] FOREIGN KEY([ShopID])
REFERENCES [dbo].[Shop] ([ShopID])
GO
ALTER TABLE [dbo].[Meal] CHECK CONSTRAINT [FK_Meal_Shop]
GO
ALTER TABLE [dbo].[Member]  WITH CHECK ADD  CONSTRAINT [FK_Member_SpecialPrice] FOREIGN KEY([SpecialPriceID])
REFERENCES [dbo].[SpecialPrice] ([SpecialPriceID])
GO
ALTER TABLE [dbo].[Member] CHECK CONSTRAINT [FK_Member_SpecialPrice]
GO
ALTER TABLE [dbo].[MessageBoard]  WITH CHECK ADD  CONSTRAINT [FK_MessageBoard_Member] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[MessageBoard] CHECK CONSTRAINT [FK_MessageBoard_Member]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Meal] FOREIGN KEY([MealID])
REFERENCES [dbo].[Meal] ([MealID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Meal]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_OrderSum] FOREIGN KEY([OrderSumID])
REFERENCES [dbo].[OrderSum] ([OrderSumID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_OrderSum]
GO
ALTER TABLE [dbo].[OrderSum]  WITH CHECK ADD  CONSTRAINT [FK_OrderSum_Member] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[OrderSum] CHECK CONSTRAINT [FK_OrderSum_Member]
GO
ALTER TABLE [dbo].[OrderSum]  WITH CHECK ADD  CONSTRAINT [FK_OrderSum_OrderCond] FOREIGN KEY([OrderCondID])
REFERENCES [dbo].[OrderCond] ([OrderCondID])
GO
ALTER TABLE [dbo].[OrderSum] CHECK CONSTRAINT [FK_OrderSum_OrderCond]
GO
ALTER TABLE [dbo].[OrderSum]  WITH CHECK ADD  CONSTRAINT [FK_OrderSum_Shop] FOREIGN KEY([ShopID])
REFERENCES [dbo].[Shop] ([ShopID])
GO
ALTER TABLE [dbo].[OrderSum] CHECK CONSTRAINT [FK_OrderSum_Shop]
GO
ALTER TABLE [dbo].[ReplyMessage]  WITH CHECK ADD  CONSTRAINT [FK_ReplyMessage_Member] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[ReplyMessage] CHECK CONSTRAINT [FK_ReplyMessage_Member]
GO
ALTER TABLE [dbo].[ReplyMessage]  WITH CHECK ADD  CONSTRAINT [FK_ReplyMessage_MessageBoard] FOREIGN KEY([MessageID])
REFERENCES [dbo].[MessageBoard] ([MessageID])
GO
ALTER TABLE [dbo].[ReplyMessage] CHECK CONSTRAINT [FK_ReplyMessage_MessageBoard]
GO
ALTER TABLE [dbo].[SpecialPrice]  WITH CHECK ADD  CONSTRAINT [FK_SpecialPrice_Meal] FOREIGN KEY([MealID])
REFERENCES [dbo].[Meal] ([MealID])
GO
ALTER TABLE [dbo].[SpecialPrice] CHECK CONSTRAINT [FK_SpecialPrice_Meal]
GO
USE [master]
GO
ALTER DATABASE [TaipeiBreakfast] SET  READ_WRITE 
GO
