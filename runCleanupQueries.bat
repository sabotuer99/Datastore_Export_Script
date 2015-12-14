@ECHO OFF
%=----------------------------------=%
%=  PREPARE THE DATA FOR EXPORT  =%
%=  Tables in 'automation' dataset:    =%
%=    HtsTicketAssignment                =%
%=    OrgGroup                               =%
%=    Ticket                                   =%
%=    UserProfile                              =%
%=----------------------------------=%

call bq --project_id=wyoorgdev rm -f automation.OrgGroup_Export
call bq --project_id=wyoorgdev query --destination_table=automation.OrgGroup_Export "SELECT supervisor, name FROM [automation.OrgGroup]"

call bq --project_id=wyoorgdev rm -f automation.UserProfile_Export
call bq --project_id=wyoorgdev query --destination_table=automation.UserProfile_Export "SELECT [group], agency, role, email, division, CASE WHEN active THEN 1 ELSE 0 END AS active, name FROM [automation.UserProfile]"

call bq --project_id=wyoorgdev rm -f automation.HtsTicketAssignment_Export
call bq --project_id=wyoorgdev query --destination_table=automation.HtsTicketAssignment_Export "SELECT status, userName, lastEscalation, dateAcknowledged, SUBSTR(FORMAT_UTC_USEC(dateAcknowledged * 1000), 0, 23) AS dateTimeAcknowledged, dateClosed, SUBSTR(FORMAT_UTC_USEC(dateClosed * 1000), 0, 23) AS dateTimeClosed, dateAssigned, SUBSTR(FORMAT_UTC_USEC(dateAssigned * 1000), 0, 23) AS dateTimeAssigned, ticketId FROM [automation.HtsTicketAssignment]"

call bq --project_id=wyoorgdev rm -f automation.Ticket_Export
call bq --project_id=wyoorgdev query --destination_table=automation.Ticket_Export "SELECT problemUserAgency, REPLACE(problemUserCity, ',', ' ') AS problemUserCity, problemUserDivision, REPLACE(createUserPhone, ',', ' ') AS createUserPhone, contactUserAgency, id, REPLACE(problemUserPhone, ',', ' ') AS problemUserPhone, priority, createUserState, createDate, SUBSTR(FORMAT_UTC_USEC(createDate * 1000), 0, 23) AS createDateTime, REPLACE(contactUserName, ',', ' ') AS contactUserName, REPLACE(problemUserMobilePhone, ',', ' ') AS problemUserMobilePhone, currentTimeOpenDate, SUBSTR(FORMAT_UTC_USEC(currentTimeOpenDate * 1000), 0, 23) AS currentTimeOpenDateTime, REPLACE(createUserMobilePhone, ',', ' ') AS createUserMobilePhone, CASE WHEN callBackCompleted THEN 1 ELSE 0 END AS callBackCompleted, status, CASE WHEN noCallBackNecessary THEN 1 ELSE 0 END AS noCallBackNecessary, createUserEmail, REPLACE(createUserName, ',', ' ') AS createUserName, contactUserDivision, problemUserEmail, contactUserEmail, ROUND (totalTimeOpen / (1000 *60 * 60 * 24 * 7),1) as totalWeeksOpen, ROUND (totalTimeOpen / (1000 *60 * 60 * 24),1) as totalDaysOpen, ROUND (totalTimeOpen / (1000 *60 * 60),1) as totalHoursOpen, ROUND (totalTimeOpen / (1000 *60),1) as totalMinutesOpen, REPLACE(contactUserPhone, ',', ' ') AS contactUserPhone, createUserAgency, updateDate, SUBSTR(FORMAT_UTC_USEC(updateDate * 1000), 0, 23) AS updateDateTime, REPLACE(contactUserMobilePhone, ',', ' ') AS contactUserMobilePhone, closeDate, SUBSTR(FORMAT_UTC_USEC(closeDate * 1000), 0, 23) AS closeDateTime, REPLACE(problemUserName, ',', ' ') AS problemUserName, REPLACE(lastUpdatedUserName, ',', ' ') AS lastUpdatedUserName FROM [automation.Ticket]"



