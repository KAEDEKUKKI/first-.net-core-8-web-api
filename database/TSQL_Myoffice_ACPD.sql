
/****** Object:  Table [dbo].[MyOffice_ACPD]    Script Date: 2024/12/18 ¤W¤È 11:24:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MyOffice_ACPD](
	[ACPD_SID] [char](20) NOT NULL,
	[ACPD_Cname] [nvarchar](60) NULL,
	[ACPD_Ename] [nvarchar](40) NULL,
	[ACPD_Sname] [nvarchar](40) NULL,
	[ACPD_Email] [nvarchar](60) NULL,
	[ACPD_Status] [tinyint] NULL,
	[ACPD_Stop] [bit] NULL,
	[ACPD_StopMemo] [nvarchar](60) NULL,
	[ACPD_LoginID] [nvarchar](30) NULL,
	[ACPD_LoginPWD] [nvarchar](60) NULL,
	[ACPD_Memo] [nvarchar](600) NULL,
	[ACPD_NowDateTime] [datetime] NULL,
	[ACPD_NowID] [nvarchar](20) NULL,
	[ACPD_UPDDateTime] [datetime] NULL,
	[ACPD_UPDID] [nvarchar](20) NULL,
 CONSTRAINT [PK_MyOffice_ACPD] PRIMARY KEY CLUSTERED 
(
	[ACPD_SID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[MyOffice_ACPD] ADD  CONSTRAINT [DF_MyOffice_ACPD_acpd_status]  DEFAULT ((0)) FOR [ACPD_Status]
GO

ALTER TABLE [dbo].[MyOffice_ACPD] ADD  CONSTRAINT [DF_MyOffice_ACPD_acpd_stop]  DEFAULT ((0)) FOR [ACPD_Stop]
GO

ALTER TABLE [dbo].[MyOffice_ACPD] ADD  CONSTRAINT [DF_MyOffice_ACPD_acpd_nowdatetime]  DEFAULT (getdate()) FOR [ACPD_NowDateTime]
GO

ALTER TABLE [dbo].[MyOffice_ACPD] ADD  CONSTRAINT [DF_MyOffice_ACPD_acpd_upddatetime]  DEFAULT (getdate()) FOR [ACPD_UPDDateTime]
GO


