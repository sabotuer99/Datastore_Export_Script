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
call bq --project_id=wyoorgdev query --destination_table=automation.UserProfile_Export "SELECT [group], agency, role, email, division, active, name FROM [automation.UserProfile]"

call bq --project_id=wyoorgdev rm -f automation.HtsTicketAssignment_Export
call bq --project_id=wyoorgdev query --destination_table=automation.HtsTicketAssignment_Export "SELECT status, userName, lastEscalation, dateAcknowledged, MSEC_TO_TIMESTAMP(dateAcknowledged) AS dateTimeAcknowledged, dateClosed, MSEC_TO_TIMESTAMP(dateClosed) AS dateTimeClosed, dateAssigned, MSEC_TO_TIMESTAMP(dateAssigned) AS dateTimeAssigned, ticketId FROM [automation.HtsTicketAssignment]"

call bq --project_id=wyoorgdev rm -f automation.Ticket_Export
call bq --project_id=wyoorgdev query --destination_table=automation.Ticket_Export "SELECT problemUserAgency, REPLACE(problemUserCity, ',', ' ') AS problemUserCity, problemUserDivision, REPLACE(createUserPhone, ',', ' ') AS createUserPhone, contactUserAgency, id, REPLACE(problemUserPhone, ',', ' ') AS problemUserPhone, priority, createUserState, createDate, MSEC_TO_TIMESTAMP(createDate) AS createDateTime, REPLACE(contactUserName, ',', ' ') AS contactUserName, REPLACE(problemUserMobilePhone, ',', ' ') AS problemUserMobilePhone, currentTimeOpenDate, MSEC_TO_TIMESTAMP(currentTimeOpenDate) AS currentTimeOpenDateTime, REPLACE(createUserMobilePhone, ',', ' ') AS createUserMobilePhone, callBackCompleted, status, noCallBackNecessary, createUserEmail, REPLACE(createUserName, ',', ' ') AS createUserName, contactUserDivision, problemUserEmail, contactUserEmail, ROUND (totalTimeOpen / (1000 *60 * 60 * 24 * 7),1) as totalWeeksOpen, ROUND (totalTimeOpen / (1000 *60 * 60 * 24),1) as totalDaysOpen, ROUND (totalTimeOpen / (1000 *60 * 60),1) as totalHoursOpen, ROUND (totalTimeOpen / (1000 *60),1) as totalMinutesOpen, REPLACE(contactUserPhone, ',', ' ') AS contactUserPhone, createUserAgency, updateDate, MSEC_TO_TIMESTAMP(updateDate) AS updateDateTime, REPLACE(contactUserMobilePhone, ',', ' ') AS contactUserMobilePhone, closeDate, MSEC_TO_TIMESTAMP(closeDate) AS closeDateTime, REPLACE(problemUserName, ',', ' ') AS problemUserName, REPLACE(lastUpdatedUserName, ',', ' ') AS lastUpdatedUserName FROM [automation.Ticket]"



