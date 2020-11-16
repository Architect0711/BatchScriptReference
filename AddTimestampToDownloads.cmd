ECHO OFF

REM -----------------------------------------------------------------------------------
REM Documentation
REM -----------------------------------------------------------------------------------
REM https://stackoverflow.com/questions/10393248/get-filename-from-string-path

REM -----------------------------------------------------------------------------------
REM Get the current local DateTime from WMIC
REM -----------------------------------------------------------------------------------
FOR /F "usebackq tokens=1,2 delims==" %%i IN (`wmic os get LocalDateTime /VALUE 2^>NUL`) DO IF '.%%i.'=='.LocalDateTime.' SET ldt=%%j

REM -----------------------------------------------------------------------------------
REM Get the Date Parts from the DateTime String
REM -----------------------------------------------------------------------------------
REM Year - 4 Digits - E.g 1990
SET YEAR=%ldt:~0,4%
REM Month - 2 Digits - E.g 12
SET MONTH=%ldt:~4,2%
REM Day - 2 Digits - E.g 24
SET DAY=%ldt:~6,2%

REM -----------------------------------------------------------------------------------
REM Construct a formatted DateTime String 
REM -----------------------------------------------------------------------------------
REM E.g 19901224
SET FORMATTED_DATE_TIME=%YEAR%%MONTH%%DAY%

REM -----------------------------------------------------------------------------------
REM Set the Source and Destination Folders
REM -----------------------------------------------------------------------------------
SET SRC_PATH=C:\Users\%USERNAME%\Downloads
SET DST_PATH=C:\Users\%USERNAME%\Downloads

REM -----------------------------------------------------------------------------------
REM Loop through the Source Directory and move all Files to the Destination Directory with added Timestamps
REM -----------------------------------------------------------------------------------
FOR %%i IN ("%SRC_PATH%\*") DO (
	ECHO Processing %%~nxi
	MOVE /y "%SRC_PATH%\%%~nxi" "%DST_PATH%\%FORMATTED_DATE_TIME%_%%~nxi"
)

REM -----------------------------------------------------------------------------------
REM Wait after the Script is finished so the User can read the Output
REM -----------------------------------------------------------------------------------
PAUSE