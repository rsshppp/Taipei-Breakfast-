USE [master]
GO
/****** Object:  Database [TaipeiBreakfast]    Script Date: 2015/4/29 下午 05:06:27 ******/
CREATE DATABASE [TaipeiBreakfast]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TaipeiBreakfast', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TaipeiBreakfast.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TaipeiBreakfast_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TaipeiBreakfast_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[Accuse]    Script Date: 2015/4/29 下午 05:06:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accuse](
	[AccuseID] [int] NOT NULL,
	[MemberID] [int] NULL,
	[AccuseSub] [nvarchar](20) NULL,
	[AccuseContent] [nvarchar](300) NULL,
	[AccuseStatusID] [int] NULL,
	[AccuseTime] [datetime] NULL,
 CONSTRAINT [PK_Accuse] PRIMARY KEY CLUSTERED 
(
	[AccuseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AccuseStatus]    Script Date: 2015/4/29 下午 05:06:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccuseStatus](
	[AccuseStatusID] [int] NOT NULL,
	[AccuseStatus] [nvarchar](20) NULL,
 CONSTRAINT [PK_AccuseStatus] PRIMARY KEY CLUSTERED 
(
	[AccuseStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AdministratorPermission]    Script Date: 2015/4/29 下午 05:06:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdministratorPermission](
	[AdministratorPermissionID] [int] NOT NULL,
	[AdministratorPermissionStatus] [nvarchar](20) NULL,
 CONSTRAINT [PK_AdministratorPermission] PRIMARY KEY CLUSTERED 
(
	[AdministratorPermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Administrtor]    Script Date: 2015/4/29 下午 05:06:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Administrtor](
	[AdministratorID] [int] NOT NULL,
	[AdministrtorAcc] [varchar](20) NULL,
	[AdministrtorPwd] [varchar](20) NULL,
	[AdministrtorPermissionID] [int] NULL,
 CONSTRAINT [PK_Administrtor] PRIMARY KEY CLUSTERED 
(
	[AdministratorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Advertisement]    Script Date: 2015/4/29 下午 05:06:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advertisement](
	[AdvertisementID] [int] NOT NULL,
	[Context] [nvarchar](100) NULL,
	[Image] [image] NULL,
	[Days] [int] NULL,
	[Passed] [bit] NULL,
	[AdvertisementStatusID] [int] NULL,
	[ShopID] [int] NULL,
 CONSTRAINT [PK_Advertisement] PRIMARY KEY CLUSTERED 
(
	[AdvertisementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AdvertisementStatus]    Script Date: 2015/4/29 下午 05:06:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdvertisementStatus](
	[AdvertisementStatusID] [int] NOT NULL,
	[AdvertisementStatus] [nvarchar](10) NULL,
 CONSTRAINT [PK_AdvertisementStatus] PRIMARY KEY CLUSTERED 
(
	[AdvertisementStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Daysoff]    Script Date: 2015/4/29 下午 05:06:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Daysoff](
	[DaysoffID] [int] NOT NULL,
	[ShopID] [int] NULL,
	[Daysoff] [datetime] NULL,
 CONSTRAINT [PK_Daysoff] PRIMARY KEY CLUSTERED 
(
	[DaysoffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Favorite]    Script Date: 2015/4/29 下午 05:06:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorite](
	[FavoriteID] [int] NOT NULL,
	[MemberID] [int] NULL,
	[MealID] [int] NULL,
 CONSTRAINT [PK_Favorite] PRIMARY KEY CLUSTERED 
(
	[FavoriteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Meal]    Script Date: 2015/4/29 下午 05:06:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meal](
	[MealID] [int] NOT NULL,
	[MealName] [nvarchar](30) NULL,
	[Price] [float] NULL,
	[ShopID] [int] NULL,
	[MealImage] [image] NULL,
	[MealStatus] [bit] NULL,
	[MealKindID] [int] NULL,
 CONSTRAINT [PK_Meal] PRIMARY KEY CLUSTERED 
(
	[MealID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MealKindList]    Script Date: 2015/4/29 下午 05:06:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MealKindList](
	[MealKindID] [int] NOT NULL,
	[MealKindName] [nvarchar](20) NULL,
	[DefaultImage] [image] NULL,
 CONSTRAINT [PK_MealKindList] PRIMARY KEY CLUSTERED 
(
	[MealKindID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Member]    Script Date: 2015/4/29 下午 05:06:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Member](
	[MemberID] [int] NOT NULL,
	[MemberAcc] [varchar](20) NULL,
	[MemberPwd] [varchar](20) NULL,
	[MemberLastName] [nvarchar](20) NULL,
	[MemberFirstName] [nvarchar](20) NULL,
	[MemberPhone] [varchar](20) NULL,
	[MemberTel] [varchar](20) NULL,
	[MemberEmail] [varchar](30) NULL,
	[MemberAddr] [nvarchar](30) NULL,
	[MemberImage] [image] NULL,
	[MemberStatus] [bit] NULL,
	[MemberSuspend] [bit] NULL,
	[SpecialPriceID] [int] NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MessageBoard]    Script Date: 2015/4/29 下午 05:06:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MessageBoard](
	[MessageID] [int] NOT NULL,
	[MemberID] [int] NULL,
	[Context] [nvarchar](100) NULL,
	[MessageDate] [datetime] NULL,
	[IPAddress] [varchar](20) NULL,
 CONSTRAINT [PK_MessageBoard] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[News]    Script Date: 2015/4/29 下午 05:06:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[News](
	[NewsID] [int] NOT NULL,
	[Title] [nvarchar](20) NULL,
	[Content] [varchar](max) NULL,
	[Date] [date] NULL,
	[Image] [image] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[NewsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderCond]    Script Date: 2015/4/29 下午 05:06:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderCond](
	[OrderCondID] [int] NOT NULL,
	[OrderCond] [nvarchar](10) NULL,
 CONSTRAINT [PK_OrderCond] PRIMARY KEY CLUSTERED 
(
	[OrderCondID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 2015/4/29 下午 05:06:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailID] [int] NOT NULL,
	[MealID] [int] NULL,
	[Count] [int] NULL,
	[Price] [float] NULL,
	[OrderSumID] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderSum]    Script Date: 2015/4/29 下午 05:06:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderSum](
	[OrderSumID] [int] NOT NULL,
	[ShopID] [int] NULL,
	[MemberID] [int] NULL,
	[TotalPrice] [float] NULL,
	[OrderTime] [datetime] NULL,
	[ExpectTime] [datetime] NULL,
	[Memo] [nvarchar](60) NULL,
	[StarsforOwn] [int] NULL,
	[evaluateforShop] [nvarchar](100) NULL,
	[OrderCondID] [int] NULL,
 CONSTRAINT [PK_OrderSum] PRIMARY KEY CLUSTERED 
(
	[OrderSumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Owner]    Script Date: 2015/4/29 下午 05:06:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Owner](
	[OwnID] [int] NOT NULL,
	[OwnAcc] [varchar](20) NULL,
	[OwnPwd] [varchar](20) NULL,
	[OwnEmail] [varchar](30) NULL,
	[OwnLastName] [nvarchar](20) NULL,
	[OwnFirstName] [nvarchar](20) NULL,
	[OwnStatus] [bit] NULL,
	[OwnSuspend] [bit] NULL,
 CONSTRAINT [PK_Owner] PRIMARY KEY CLUSTERED 
(
	[OwnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReplyMessage]    Script Date: 2015/4/29 下午 05:06:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReplyMessage](
	[ReplyMessageID] [int] NOT NULL,
	[MessageID] [int] NULL,
	[MemberID] [int] NULL,
	[ReplyMessage] [nvarchar](100) NULL,
	[ReplyDate] [datetime] NULL,
	[IpAddress] [varchar](20) NULL,
 CONSTRAINT [PK_ReplyMessage] PRIMARY KEY CLUSTERED 
(
	[ReplyMessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 2015/4/29 下午 05:06:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Shop](
	[ShopID] [int] NOT NULL,
	[ShopName] [nvarchar](25) NULL,
	[ShopPhone] [varchar](20) NULL,
	[ShopCity] [nvarchar](10) NULL,
	[ShopArea] [nvarchar](10) NULL,
	[ShopAddr] [nvarchar](40) NULL,
	[LastOrderNoon] [datetime] NULL,
	[LastOrderNight] [datetime] NULL,
	[OwnID] [int] NULL,
	[LogoImage] [image] NULL,
	[ShopSuspend] [bit] NULL,
	[ShopCondID] [int] NULL,
	[BeginBusinessTime] [datetime] NULL,
	[EndBusinessTime] [datetime] NULL,
	[BusinessTimeNote] [nvarchar](100) NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ShopID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ShopCond]    Script Date: 2015/4/29 下午 05:06:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopCond](
	[ShopCondID] [int] NOT NULL,
	[ShopCond] [nvarchar](10) NULL,
 CONSTRAINT [PK_ShopCond] PRIMARY KEY CLUSTERED 
(
	[ShopCondID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SpecialPrice]    Script Date: 2015/4/29 下午 05:06:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecialPrice](
	[SpecialPriceID] [int] NOT NULL,
	[MealID] [int] NULL,
	[SpecialPrice] [int] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
 CONSTRAINT [PK_SpecialPrice] PRIMARY KEY CLUSTERED 
(
	[SpecialPriceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

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
ALTER TABLE [dbo].[Administrtor]  WITH CHECK ADD  CONSTRAINT [FK_Administrtor_AdministratorPermission] FOREIGN KEY([AdministrtorPermissionID])
REFERENCES [dbo].[AdministratorPermission] ([AdministratorPermissionID])
GO
ALTER TABLE [dbo].[Administrtor] CHECK CONSTRAINT [FK_Administrtor_AdministratorPermission]
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
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_Owner] FOREIGN KEY([OwnID])
REFERENCES [dbo].[Owner] ([OwnID])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_Owner]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_ShopCond] FOREIGN KEY([ShopCondID])
REFERENCES [dbo].[ShopCond] ([ShopCondID])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_ShopCond]
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
