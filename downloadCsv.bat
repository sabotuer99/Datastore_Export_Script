@ECHO OFF
%=----------------------------------------------=%
%=  DOWNLOAD CSV FILES                  				=%
%=  Bucket  													=%
%=        wyoorgdev_backup_automation/				=%
%=  Files to download                          				=%
%=    HtsTicketAssignment_Export.csv    			=%
%=    OrgGroup_Export.csv                   				=%
%=    Ticket_Export.csv                       				=%
%=    UserProfile_Export.csv                 				=%
%=----------------------------------------------=%

call gsutil cp gs://wyoorgdev_backup_automation/HtsTicketAssignment_Export.csv  .
call gsutil cp gs://wyoorgdev_backup_automation/OrgGroup_Export.csv  .
call gsutil cp gs://wyoorgdev_backup_automation/Ticket_Export.csv  .
call gsutil cp gs://wyoorgdev_backup_automation/UserProfile_Export.csv  .