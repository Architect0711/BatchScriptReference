REM ECHO OFF

REM -----------------------------------------------------------------------------------
REM Read File Contents
REM -----------------------------------------------------------------------------------
REM Set the File Path
SET FILE_PATH=".\ReadTextFileIntoVariable.txt"
REM Get the Path of this Script
SET SCRIPT_PATH=%~dp0
REM Change to the Path of this Script
CD %SCRIPT_PATH%
REM Read the File Contents
SET /p FILE_CONTENTS=<%FILE_PATH%
REM Output the File Contents to the Console
ECHO %FILE_CONTENTS%

REM ----------------------------------------------------------------------------------
REM Wait after the Script is finished so the User can read the Output
REM -----------------------------------------------------------------------------------
TIMEOUT 5