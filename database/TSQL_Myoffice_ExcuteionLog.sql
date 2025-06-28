
/****** Object:  Table [dbo].[MyOffice_ExcuteionLog]    Script Date: 2024/12/18 ¤W¤È 11:26:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MyOffice_ExcuteionLog](
	[DeLog_AutoID] [bigint] IDENTITY(1,1) NOT NULL,
	[DeLog_StoredPrograms] [nvarchar](120) NOT NULL,
	[DeLog_GroupID] [uniqueidentifier] NOT NULL,
	[DeLog_isCustomDebug] [bit] NOT NULL,
	[DeLog_ExecutionProgram] [nvarchar](120) NOT NULL,
	[DeLog_ExecutionInfo] [nvarchar](max) NULL,
	[DeLog_verifyNeeded] [bit] NULL,
	[DeLog_ExDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_MOTC_DataExchangeLog] PRIMARY KEY CLUSTERED 
(
	[DeLog_AutoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[MyOffice_ExcuteionLog] ADD  CONSTRAINT [DF_MOTC_DataExchangeLog_DeLog_isCustomDebug]  DEFAULT ((0)) FOR [DeLog_isCustomDebug]
GO

ALTER TABLE [dbo].[MyOffice_ExcuteionLog] ADD  CONSTRAINT [DF_MyOffice_ExcuteionLog_DeLog_verifyNeeded]  DEFAULT ((0)) FOR [DeLog_verifyNeeded]
GO

ALTER TABLE [dbo].[MyOffice_ExcuteionLog] ADD  CONSTRAINT [DF_MOTC_DataExchangeLog_DeLog_ExDateTime]  DEFAULT (getdate()) FOR [DeLog_ExDateTime]
GO


