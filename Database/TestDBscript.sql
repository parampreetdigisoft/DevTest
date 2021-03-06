USE [master]
GO
/****** Object:  Database [TestDB]    Script Date: 28/02/2017 14:54:24 ******/
CREATE DATABASE [TestDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER2016\MSSQL\DATA\TestDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER2016\MSSQL\DATA\TestDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TestDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TestDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TestDB] SET  MULTI_USER 
GO
ALTER DATABASE [TestDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TestDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TestDB] SET QUERY_STORE = OFF
GO
USE [TestDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [TestDB]
GO
/****** Object:  Table [dbo].[DevTest]    Script Date: 28/02/2017 14:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DevTest](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CampaignName] [varchar](255) NULL,
	[Date] [datetime] NULL,
	[Clicks] [int] NULL,
	[Conversions] [int] NULL,
	[Impressions] [int] NULL,
	[AffiliateName] [varchar](255) NULL,
 CONSTRAINT [PK_DevTest] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[DevTest] ON 

INSERT [dbo].[DevTest] ([ID], [CampaignName], [Date], [Clicks], [Conversions], [Impressions], [AffiliateName]) VALUES (2, N'New', NULL, 11, 1, 1, N'Hello')
INSERT [dbo].[DevTest] ([ID], [CampaignName], [Date], [Clicks], [Conversions], [Impressions], [AffiliateName]) VALUES (3, N'Test', NULL, 4, 5, 1, N'Naaa')
INSERT [dbo].[DevTest] ([ID], [CampaignName], [Date], [Clicks], [Conversions], [Impressions], [AffiliateName]) VALUES (4, N'abcd', NULL, 1, 1, 1, N'Test')
INSERT [dbo].[DevTest] ([ID], [CampaignName], [Date], [Clicks], [Conversions], [Impressions], [AffiliateName]) VALUES (6, N'Newss', CAST(N'2018-01-01T00:00:00.000' AS DateTime), 1, 2, 3, N'4')
INSERT [dbo].[DevTest] ([ID], [CampaignName], [Date], [Clicks], [Conversions], [Impressions], [AffiliateName]) VALUES (8, N'sss', NULL, 2, 2, 2, N'sasa')
INSERT [dbo].[DevTest] ([ID], [CampaignName], [Date], [Clicks], [Conversions], [Impressions], [AffiliateName]) VALUES (9, N'asds', NULL, 2, 2, 2, N'sad')
SET IDENTITY_INSERT [dbo].[DevTest] OFF
/****** Object:  StoredProcedure [dbo].[dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5_QueueActivation]    Script Date: 28/02/2017 14:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5_QueueActivation] AS 
BEGIN 
	SET NOCOUNT ON;

	RECEIVE TOP(0) [conversation_handle] FROM dbo.[dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5];

	IF EXISTS (SELECT * FROM sys.service_queues WITH(NOLOCK) WHERE name = N'dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5')
	BEGIN
		IF ((SELECT COUNT(*) FROM dbo.[dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5] WITH(NOLOCK) WHERE message_type_name = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR message_type_name = N'dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5/Dispose') > 0)
		BEGIN 
			DECLARE @schema_id INT
DECLARE @conversation_handle UNIQUEIDENTIFIER

SELECT @schema_id = schema_id FROM sys.schemas WHERE name = N'dbo';

IF EXISTS (SELECT * FROM sys.objects WHERE schema_id = @schema_id AND name = N'tr_dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5') DROP TRIGGER [dbo].[tr_dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5];
IF EXISTS (SELECT * FROM sys.service_queues WITH(NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5') EXEC (N'ALTER QUEUE [dbo].[dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5] WITH ACTIVATION (STATUS = OFF)');

SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service = N'dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5';
DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations
OPEN conversation_cursor
FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
WHILE @@FETCH_STATUS = 0 
BEGIN
	END CONVERSATION @conversation_handle WITH CLEANUP;
    FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
END
CLOSE conversation_cursor;
DEALLOCATE conversation_cursor;
DROP TABLE #Conversations;

IF EXISTS (SELECT * FROM sys.services WHERE name = N'dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5') DROP SERVICE [dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5];
IF EXISTS (SELECT * FROM sys.service_queues WHERE schema_id = @schema_id AND name = N'dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5') DROP QUEUE dbo.[dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5];
IF EXISTS (SELECT * FROM sys.service_contracts WHERE name = N'dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5') DROP CONTRACT [dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5];
IF EXISTS (SELECT * FROM sys.service_message_types WHERE name = N'dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5/StartDialog/Insert') DROP MESSAGE TYPE[dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5/StartDialog/Insert];
IF EXISTS (SELECT * FROM sys.service_message_types WHERE name = N'dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5/StartDialog/Update') DROP MESSAGE TYPE[dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5/StartDialog/Update];
IF EXISTS (SELECT * FROM sys.service_message_types WHERE name = N'dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5/StartDialog/Delete') DROP MESSAGE TYPE[dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5/StartDialog/Delete];
IF EXISTS (SELECT * FROM sys.service_message_types WHERE name = N'dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5/Dispose') DROP MESSAGE TYPE[dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5/Dispose];
IF EXISTS (SELECT * FROM sys.service_message_types WHERE name = N'dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5/ID') DROP MESSAGE TYPE[dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5/ID];
IF EXISTS (SELECT * FROM sys.service_message_types WHERE name = N'dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5/CampaignName') DROP MESSAGE TYPE[dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5/CampaignName];
IF EXISTS (SELECT * FROM sys.service_message_types WHERE name = N'dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5/Date') DROP MESSAGE TYPE[dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5/Date];
IF EXISTS (SELECT * FROM sys.service_message_types WHERE name = N'dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5/Clicks') DROP MESSAGE TYPE[dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5/Clicks];
IF EXISTS (SELECT * FROM sys.service_message_types WHERE name = N'dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5/Conversions') DROP MESSAGE TYPE[dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5/Conversions];
IF EXISTS (SELECT * FROM sys.service_message_types WHERE name = N'dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5/Impressions') DROP MESSAGE TYPE[dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5/Impressions];
IF EXISTS (SELECT * FROM sys.service_message_types WHERE name = N'dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5/AffiliateName') DROP MESSAGE TYPE[dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5/AffiliateName];
IF EXISTS (SELECT * FROM sys.objects WHERE schema_id = @schema_id AND name = N'dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5_QueueActivation') DROP PROCEDURE [dbo].[dbo_DevTest_19dbebcb-937d-4e9d-8ef2-f29179368bc5_QueueActivation];
		END 
	END
END
GO
USE [master]
GO
ALTER DATABASE [TestDB] SET  READ_WRITE 
GO
