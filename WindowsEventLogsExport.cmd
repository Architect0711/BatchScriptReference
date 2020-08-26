ECHO OFF

REM -----------------------------------------------------------------------------------
REM Get the Location of this Batch Script
REM -----------------------------------------------------------------------------------
SET LOCAL_PATH=%~dp0

REM -----------------------------------------------------------------------------------
REM Export the Logs in a specified Timeframe using WEVTUTIL
REM -----------------------------------------------------------------------------------
WEVTUTIL epl System %LOCAL_PATH%\System.evtx "/q:*[System[TimeCreated[@SystemTime>='2020-01-01T00:00:00' and @SystemTime<='2021-01-01T00:00:00']]]"

REM -----------------------------------------------------------------------------------
REM Wait after the Script is finished so the User can read the Output
REM -----------------------------------------------------------------------------------
TIMEOUT 5
