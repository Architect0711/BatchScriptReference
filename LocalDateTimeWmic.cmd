ECHO OFF

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
REM Get the Time Parts from the DateTime String
REM -----------------------------------------------------------------------------------
REM Hours - 2 Digits - E.g 23
SET HOURS=%ldt:~8,2%
REM Minutes - 2 Digits - E.g 59
SET MINUTES=%ldt:~10,2%
REM Seconds - 2 Digits - E.g 59
SET SECONDS=%ldt:~12,2%

REM -----------------------------------------------------------------------------------
REM Construct a formatted DateTime String 
REM -----------------------------------------------------------------------------------
REM E.g 19901224_235959
SET FORMATTED_DATE_TIME=%YEAR%%MONTH%%DAY%_%HOURS%%MINUTES%%SECONDS%