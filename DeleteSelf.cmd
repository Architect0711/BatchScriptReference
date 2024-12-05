ECHO OFF

REM -----------------------------------------------------------------------------------
REM Makes the script delete itself, e.g. after work is completed
REM -----------------------------------------------------------------------------------
start /b "" cmd /c del "%~f0"&exit /b