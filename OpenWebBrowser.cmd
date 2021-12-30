ECHO OFF

REM -----------------------------------------------------------------------------------
REM Documentation
REM -----------------------------------------------------------------------------------
REM Open a Web Page in a Windows Batch File: https://stackoverflow.com/questions/26223936/open-a-web-page-in-a-windows-batch-file

REM -----------------------------------------------------------------------------------
REM Set the Url and Browser Path to Variables
REM -----------------------------------------------------------------------------------
REM Url of the Webpage that will be opened
SET URL=http://www.stackoverflow.com
REM Path for the browser exe to open
SET BROWSER_PATH=C:\Program Files\Google\Chrome\Application\chrome.exe

REM -----------------------------------------------------------------------------------
REM Open with the default Browser
REM -----------------------------------------------------------------------------------
START "" "%URL%"

REM -----------------------------------------------------------------------------------
REM Open with the specified Browser
REM -----------------------------------------------------------------------------------
CALL "%BROWSER_PATH%" "%URL%"

REM ----------------------------------------------------------------------------------
REM Wait after the Script is finished so the User can read the Output
REM -----------------------------------------------------------------------------------
TIMEOUT 5