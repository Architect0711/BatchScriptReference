ECHO OFF

REM -----------------------------------------------------------------------------------
REM PARENT
REM -----------------------------------------------------------------------------------
REM Variable to hold Argument Nr. 1
SET ARG_1=%1
REM Variable to hold Argument Nr. 2
SET ARG_2=%2
REM Variable to hold Argument Nr. 3
SET ARG_3=%3
REM Now call the Child Script
CALL "Child.cmd" %ARG_1% %ARG_2% %ARG_3%
REM ----------------------------------------------------------------------------------
REM Wait after the Script is finished so the User can read the Output
REM -----------------------------------------------------------------------------------
TIMEOUT 5

ECHO OFF

REM -----------------------------------------------------------------------------------
REM CHILD
REM -----------------------------------------------------------------------------------
REM Variable to hold Argument Nr. 1
SET ARG_1=%1
REM Variable to hold Argument Nr. 2
SET ARG_2=%2
REM Variable to hold Argument Nr. 3
SET ARG_3=%3
REM Output Argument Nr. 1 to the Console
ECHO %ARG_1%
REM Output Argument Nr. 2 to the Console
ECHO %ARG_2%
REM Output Argument Nr. 3 to the Console
ECHO %ARG_3%

REM ----------------------------------------------------------------------------------
REM Wait after the Script is finished so the User can read the Output
REM -----------------------------------------------------------------------------------
TIMEOUT 5