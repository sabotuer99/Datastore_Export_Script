@ECHO OFF
%=----------------------------------------------=%
%=  DOWNLOAD CSV FILES                                  =%
%=  Bucket                                                        =%
%=        wyoorgdev_backup_automation/                =%
%=  Files to download                                          =%
%=    HtsTicketAssignment_Export.csv                    =%
%=    OrgGroup_Export.csv                                   =%
%=    Ticket_Export.csv                                       =%
%=    UserProfile_Export.csv                                 =%
%=----------------------------------------------=%

call gsutil cp gs://wyoorgdev_backup_automation/HtsTicketAssignment_Export.csv  .
call gsutil cp gs://wyoorgdev_backup_automation/OrgGroup_Export.csv  .
call gsutil cp gs://wyoorgdev_backup_automation/Ticket_Export.csv  .
call gsutil cp gs://wyoorgdev_backup_automation/UserProfile_Export.csv  .


%=----------------------------------------------=%
%=  PUSH TO AZURE SQL                                   =%
%=  Server address                                            =%
%=        htsdata.database.windows.net                =%
%=----------------------------------------------=%

%=----------------------=%
%=       OrgGroup            =%
%=----------------------=%
sqlcmd -U jenkins@htsdata -S tcp:htsdata.database.windows.net -P %PASSWORD% -d HTSData -Q ^
 "IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'OrgGroup')) BEGIN DROP TABLE OrgGroup END CREATE TABLE [dbo].[OrgGroup]( [supervisor] varchar(255) NULL, [name] varchar(255) NULL)"

bcp dbo.OrgGroup in OrgGroup_Export.csv -U jenkins@htsdata -S tcp:htsdata.database.windows.net -P %PASSWORD% -d HTSData -t, -r 0x0A -c -k -e errorOG.txt


%=----------------------=%
%=  HtsTicketAssignment =%
%=----------------------=%
sqlcmd -U jenkins@htsdata -S tcp:htsdata.database.windows.net -P %PASSWORD% -d HTSData -Q ^
 "IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'HtsTicketAssignment')) BEGIN DROP TABLE HtsTicketAssignment END CREATE TABLE [dbo].[HtsTicketAssignment]( [status] [varchar](255) NULL, [userName] [varchar](255) NULL, [lastEscalation] [varchar](255) NULL, [dateAcknowledged] [bigint] NULL, [dateTimeAcknowledged] [datetime] NULL, [dateClosed] [bigint] NULL, [dateTimeClosed] [datetime] NULL, [dateAssigned] [bigint] NULL, [dateTimeAssigned] [datetime] NULL, [ticketId] [bigint] NULL)"

bcp dbo.HtsTicketAssignment in HtsTicketAssignment_Export.csv -U jenkins@htsdata -S tcp:htsdata.database.windows.net -P %PASSWORD% -d HTSData -t, -r 0x0A -c -k -e errorHA.txt


%=----------------------=%
%=      Ticket                 =%
%=----------------------=%
sqlcmd -U jenkins@htsdata -S tcp:htsdata.database.windows.net -P %PASSWORD% -d HTSData -Q ^
 "IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Ticket')) BEGIN DROP TABLE Ticket END CREATE TABLE [dbo].[Ticket]( [problemUserAgency] [nvarchar](255) NULL, [problemUserCity] [nvarchar](255) NULL, [problemUserDivision] [nvarchar](255) NULL, [createUserPhone] [nvarchar](255) NULL, [contactUserAgency] [nvarchar](255) NULL, [id] [bigint] NULL, [problemUserPhone] [nvarchar](255) NULL, [priority] [nvarchar](255) NULL, [createUserState] [nvarchar](255) NULL, [createDate] [bigint] NULL, [createDateTime] [datetime] NULL, [contactUserName] [nvarchar](255) NULL, [problemUserMobilePhone] [nvarchar](255) NULL, [currentTimeOpenDate] [bigint] NULL, [currentTimeOpenDateTime] [datetime] NULL, [createUserMobilePhone] [nvarchar](255) NULL, [callBackCompleted] [bit] NULL, [status] [nvarchar](255) NULL, [noCallBackNecessary] [bit] NULL, [createUserEmail] [nvarchar](255) NULL, [createUserName] [nvarchar](255) NULL, [contactUserDivision] [nvarchar](255) NULL, [problemUserEmail] [nvarchar](255) NULL, [contactUserEmail] [nvarchar](255) NULL, [totalWeeksOpen] [float] NULL, [totalDaysOpen] [float] NULL, [totalHoursOpen] [float] NULL, [totalMinutesOpen] [float] NULL, [contactUserPhone] [nvarchar](255) NULL, [createUserAgency] [nvarchar](255) NULL, [updateDate] [bigint] NULL, [updateDateTime] [datetime] NULL, [contactUserMobilePhone] [nvarchar](255) NULL, [closeDate] [bigint] NULL, [closeDateTime] [datetime] NULL, [problemUserName] [nvarchar](255) NULL, [lastUpdatedUserName] [nvarchar](255) NULL)"

bcp dbo.Ticket in Ticket_Export.csv -U jenkins@htsdata -S tcp:htsdata.database.windows.net -P %PASSWORD% -d HTSData -t, -r 0x0A -c -k  -e errorTK.txt


%=----------------------=%
%=      UserProfile            =%
%=----------------------=%
sqlcmd -U jenkins@htsdata -S tcp:htsdata.database.windows.net -P %PASSWORD% -d HTSData -Q ^
 "IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'UserProfile')) BEGIN DROP TABLE UserProfile END CREATE TABLE [dbo].[UserProfile]( [group] [nvarchar](255) NULL, [agency] [nvarchar](255) NULL, [role] [nvarchar](255) NULL, [email] [nvarchar](255) NULL, [division] [nvarchar](255) NULL, [active] [bit] NOT NULL, [name] [nvarchar](255) NULL)"

bcp dbo.UserProfile in UserProfile_Export.csv -U jenkins@htsdata -S tcp:htsdata.database.windows.net -P %PASSWORD% -d HTSData -t, -r 0x0A -c -k  -e errorUP.txt
