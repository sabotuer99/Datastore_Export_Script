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
call bq --project_id=wyoorgdev query --destination_table=automation.HtsTicketAssignment_Export "SELECT status, userName, lastEscalation, dateAcknowledged, MSEC_TO_TIMESTAMP(dateAcknowledged) AS dateTimeAcknowledged, dateClosed, MSEC_TO_TIMESTAMP(dateClosed) AS dateTimeClosed, dateAssigned, MSEC_TO_TIMESTAMP(dateAssigned) AS dateTimeAssigned, ticketId FROM [automation.HtsAssignments]"



