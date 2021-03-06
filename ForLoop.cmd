ECHO OFF

REM https://ss64.com/nt/for.html
REM -----------------------------------------------------------------------------------
REM Get the Location of this Batch Script
REM -----------------------------------------------------------------------------------
SET LOCAL_PATH=%~dp0

REM -----------------------------------------------------------------------------------
REM FOR LOOP - SINGLE LINE
REM -----------------------------------------------------------------------------------
REM Print all File Names in the current Directory
FOR %%i IN (%LOCAL_PATH%*) DO ECHO %%i 

REM -----------------------------------------------------------------------------------
REM FOR LOOP - MULTILINE
REM -----------------------------------------------------------------------------------
REM Print all Numbers from a List of Numbers from 1 to 100
FOR /l %%i IN (1, 1, 100) DO (
	ECHO %%i 
)

REM -----------------------------------------------------------------------------------
REM Wait after the Script is finished so the User can read the Output
REM -----------------------------------------------------------------------------------
TIMEOUT 5