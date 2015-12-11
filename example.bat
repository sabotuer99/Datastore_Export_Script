@ECHO OFF
SETLOCAL enabledelayedexpansion
(
FOR /f "tokens=1*delims=, " %%h IN (swydf.txt) DO (
 FOR /f "tokens=1-7delims=/: " %%a IN ("%%i") DO (
  SET /a rmonth=10+%%a
  SET /a rday=10+%%b
  SET /a rhour=10+%%d
  IF %%d==12 (SET rhour=10)
  ECHO %%c!rmonth!!rday!%%f!rhour!%%e,%%h,%%i
 )
)
)>sorttemp.txt
(
FOR /f "tokens=1*delims=," %%i IN ('sort ^<sorttemp.txt') DO ECHO %%j
)>output.txt
TYPE output.txt
DEL sorttemp.txt /F /Q
GOTO :eof