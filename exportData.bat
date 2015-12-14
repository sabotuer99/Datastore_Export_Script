@ECHO OFF
%=------------------------------------=%
%=  EXPORT DATA TO CLOUD STORAGE  =%
%=  Tables to export                           =%
%=    HtsTicketAssignment_Export        =%
%=    OrgGroup_Export                       =%
%=    Ticket_Export                           =%
%=    UserProfile_Export                     =%
%=----------------------------------=%

call bq --project_id=wyoorgdev extract --destination_format=CSV automation.HtsTicketAssignment_Export gs://wyoorgdev_backup_automation/HtsTicketAssignment_Export.csv

call bq --project_id=wyoorgdev extract --destination_format=CSV automation.OrgGroup_Export gs://wyoorgdev_backup_automation/OrgGroup_Export.csv

call bq --project_id=wyoorgdev extract --destination_format=CSV automation.Ticket_Export gs://wyoorgdev_backup_automation/Ticket_Export.csv

call bq --project_id=wyoorgdev extract --destination_format=CSV automation.UserProfile_Export gs://wyoorgdev_backup_automation/UserProfile_Export.csv