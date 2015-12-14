IF (EXISTS (SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_SCHEMA = 'dbo' 
    AND TABLE_NAME = 'OrgGroup')) 
    BEGIN 
        DROP TABLE OrgGroup 
    END 
 
 CREATE TABLE [dbo].[OrgGroup]( 
    [supervisor] nvarchar(255) null, 
    [name] nvarchar(255) null)
	
	
IF (EXISTS (SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_SCHEMA = 'dbo' 
    AND TABLE_NAME = 'HtsTicketAssignment')) 
    BEGIN 
        DROP TABLE HtsTicketAssignment 
    END 
 
CREATE TABLE [dbo].[HtsAssignment]( 
    [status] [varchar](255) NULL, 
    [userName] [varchar](255) NULL, 
    [lastEscalation] [varchar](255) NULL, 
    [dateAcknowledged] [bigint] NULL, 
    [dateTimeAcknowledged] [datetime] NULL, 
    [dateClosed] [bigint] NULL, 
    [dateTimeClosed] [datetime] NULL, 
    [dateAssigned] [bigint] NULL, 
    [dateTimeAssigned] [datetime] NULL, 
    [ticketId] [bigint] NULL)
	
	
IF (EXISTS (SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_SCHEMA = 'dbo' 
    AND TABLE_NAME = 'Ticket')) 
    BEGIN 
        DROP TABLE Ticket 
    END 
 
CREATE TABLE [dbo].[Ticket]( 
    [problemUserAgency] [nvarchar](255) NULL, 
    [problemUserCity] [nvarchar](255) NULL, 
    [problemUserDivision] [nvarchar](255) NULL, 
    [createUserPhone] [nvarchar](255) NULL, 
    [contactUserAgency] [nvarchar](255) NULL, 
    [id] [bigint] NULL, 
    [problemUserPhone] [nvarchar](255) NULL, 
    [priority] [nvarchar](255) NULL, 
    [createUserState] [nvarchar](255) NULL, 
    [createDate] [bigint] NULL, 
    [createDateTime] [datetime] NULL, 
    [contactUserName] [nvarchar](255) NULL, 
    [problemUserMobilePhone] [nvarchar](255) NULL, 
    [currentTimeOpenDate] [bigint] NULL, 
    [currentTimeOpenDateTime] [datetime] NULL, 
    [createUserMobilePhone] [nvarchar](255) NULL, 
    [callBackCompleted] [bit] NULL, 
    [status] [nvarchar](255) NULL, 
    [noCallBackNecessary] [bit] NULL, 
    [createUserEmail] [nvarchar](255) NULL, 
    [createUserName] [nvarchar](255) NULL, 
    [contactUserDivision] [nvarchar](255) NULL, 
    [problemUserEmail] [nvarchar](255) NULL, 
    [contactUserEmail] [nvarchar](255) NULL, 
    [totalWeeksOpen] [float] NULL, 
    [totalDaysOpen] [float] NULL, 
    [totalHoursOpen] [float] NULL, 
    [totalMinutesOpen] [float] NULL, 
    [contactUserPhone] [nvarchar](255) NULL, 
    [createUserAgency] [nvarchar](255) NULL, 
    [updateDate] [bigint] NULL, 
    [updateDateTime] [datetime] NULL, 
    [contactUserMobilePhone] [nvarchar](255) NULL, 
    [closeDate] [bigint] NULL, 
    [closeDateTime] [datetime] NULL, 
    [problemUserName] [nvarchar](255) NULL, 
    [lastUpdatedUserName] [nvarchar](255) NULL)
	
	
IF (EXISTS (SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_SCHEMA = 'dbo' 
    AND TABLE_NAME = 'UserProfile')) 
    BEGIN 
        DROP TABLE UserProfile 
    END 
 
CREATE TABLE [dbo].[UserProfile]( 
    [group] [nvarchar](255) NULL, 
    [agency] [nvarchar](255) NULL, 
    [role] [nvarchar](255) NULL, 
    [email] [nvarchar](255) NULL, 
    [division] [nvarchar](255) NULL, 
    [active] [bit] NOT NULL, 
    [name] [nvarchar](255) NULL)