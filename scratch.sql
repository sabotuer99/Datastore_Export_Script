IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'OrgGroup')) BEGIN DROP TABLE OrgGroup END CREATE TABLE OrgGroup (supervisor nvarchar(255), name nvarchar(255)) 


BULK INSERT OrgGroup FROM 'OrgGroup_Export.csv' WITH ( FIELDTERMINATOR = ',', ROWTERMINATOR = '\n' ) 


IF (EXISTS (SELECT * ^
    FROM INFORMATION_SCHEMA.TABLES ^
	WHERE TABLE_SCHEMA = 'dbo' ^
	AND TABLE_NAME = 'OrgGroup')) ^
	BEGIN ^
	DROP TABLE OrgGroup ^
	END ^
^
CREATE TABLE [dbo].[OrgGroup]( ^
    [supervisor] nvarchar(255) null, ^
	[name] nvarchar(255) null)

CREATE TABLE [dbo].[HtsAssignments]( ^
	[status] [varchar](255) NULL, ^ 
	[userName] [varchar](255) NULL, ^
	[lastEscalation] [varchar](255) NULL, ^
	[dateAcknowledged] [bigint] NULL, ^
	[dateTimeAcknowledged] [datetime] NULL, ^
	[dateClosed] [bigint] NULL, ^
	[dateTimeClosed] [datetime] NULL, ^
	[dateAssigned] [bigint] NULL, ^
	[dateTimeAssigned] [datetime] NULL, ^
	[ticketId] [bigint] NULL ^
)