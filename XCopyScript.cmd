ECHO OFF

REM -----------------------------------------------------------------------------------
REM Documentation
REM -----------------------------------------------------------------------------------
REM XCopy Command: https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/xcopy

REM -----------------------------------------------------------------------------------
REM Set the Source and Destination Paths to Variables
REM -----------------------------------------------------------------------------------
REM Get the Path of this Script
SET SCRIPT_PATH=%~dp0
REM Change to the Path of this Script
CD %SCRIPT_PATH%
REM Source Path
SET SRC_PATH=%SCRIPT_PATH%XCopySrc
REM Destination Path
SET DST_PATH=%SCRIPT_PATH%XCopyDst
REM Output the Source Path
ECHO Src: %SRC_PATH%
REM Output the Destination Path
ECHO Dst: %DST_PATH%

REM -----------------------------------------------------------------------------------
REM Copy all Folder Contents
REM -----------------------------------------------------------------------------------
ECHO f|XCOPY /e /y /i /exclude:XCopyExclude.txt "%SRC_PATH%\*.*" "%DST_PATH%"

REM ----------------------------------------------------------------------------------
REM Wait after the Script is finished so the User can read the Output
REM -----------------------------------------------------------------------------------
TIMEOUT 5