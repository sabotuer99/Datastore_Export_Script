@ECHO OFF

%=  run gsutil once to clear update notifications, then run again to get file list =%

for %%z in (Ticket HtsTicketAssignment UserProfile OrgGroup) do (

	call gsutil > NUL
	call gsutil ls -l gs://wyoorgdev_backup_automation/*.%%z* > List.txt

	%=  Strip "TOTAL" line from input =%
	setlocal EnableDelayedExpansion
	for /f "tokens=1-3delims= " %%a in (List.txt) do  ( 
		if %%a NEQ TOTAL: (
			echo %%b %%c >> Trimmed.txt
		) 
	)
	sort -r Trimmed.txt -o Sorted.txt
	for /f "tokens=2delims= " %%i in ('head -n 1 Sorted.txt') do echo %%i
	rm Trimmed.txt
	rm Sorted.txt
	rm List.txt
	
)