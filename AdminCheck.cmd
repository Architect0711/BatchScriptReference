@ECHO OFF

REM https://stackoverflow.com/questions/4051883/batch-script-how-to-check-for-admin-rights

REM -----------------------------------------------------------------------------------
REM Declare the Variables
REM -----------------------------------------------------------------------------------
REM Tell the User that the Script is checking for Admin Privileges
SET MESSAGE_ADMIN_CHECK=Checking for Admin Privileges
REM Tell the User that the Script was started with Admin Privileges
SET MESSAGE_ADMIN_CHECK_TRUE=The Script was started with Admin Privileges
REM Tell the User that the Script was not started with Admin Privileges
SET MESSAGE_ADMIN_CHECK_FALSE=The Script was not started with Admin Privileges

REM -----------------------------------------------------------------------------------
REM Call the ADMIN_CHECK Function
REM -----------------------------------------------------------------------------------
GOTO ADMIN_CHECK

REM -----------------------------------------------------------------------------------
REM Export the Logs in a specified Timeframe using WEVTUTIL
REM -----------------------------------------------------------------------------------
:ADMIN_CHECK
ECHO  -----------------------------------------------------------------------------------
ECHO  %MESSAGE_ADMIN_CHECK%
ECHO  -----------------------------------------------------------------------------------
NET SESSION >NUL 2>&1
IF %errorLevel% == 0 (
    GOTO :ADMIN_CHECK_TRUE
) ELSE (
    GOTO :ADMIN_CHECK_FALSE
)

:ADMIN_CHECK_TRUE
REM Green Text Color if the Script was started with Admin Privileges
COLOR A
ECHO  -----------------------------------------------------------------------------------
ECHO  %MESSAGE_ADMIN_CHECK_TRUE%
ECHO  -----------------------------------------------------------------------------------
GOTO :FINISHED

:ADMIN_CHECK_FALSE
REM Red Text Color if the Script was not started with Admin Privileges
COLOR C
ECHO  -----------------------------------------------------------------------------------
ECHO  %MESSAGE_ADMIN_CHECK_FALSE%
ECHO  -----------------------------------------------------------------------------------
GOTO :FINISHED

REM -----------------------------------------------------------------------------------
REM Keep the Script open when it is finished so the User can read the Output
REM -----------------------------------------------------------------------------------
:FINISHED
PAUSE