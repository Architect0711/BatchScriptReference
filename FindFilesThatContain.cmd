ECHO OFF

REM -----------------------------------------------------------------------------------
REM Declare the Variables
REM -----------------------------------------------------------------------------------
REM Get the Location of this Batch Script
SET LOCAL_PATH=%~dp0
REM Enter a Substring that should be contained in the Filename to filter the Files searched
SET FILE_NAME_CONTAINS=cmd
REM Enter the Name of the Searchterm that should be searched for
SET SEARCH_TERM=SqlCmd

REM -----------------------------------------------------------------------------------
REM Echo the Name of all the Files that contain the Searchterm
REM -----------------------------------------------------------------------------------
ECHO -----------------------------------------------------------------------------------
ECHO Searching all Files in "%LOCAL_PATH%" if they contain "%SEARCH_TERM%"
ECHO -----------------------------------------------------------------------------------
FOR %%i IN (%LOCAL_PATH%\*) DO (
	ECHO %%i | FIND /I "%FILE_NAME_CONTAINS%">NUL && ( FINDSTR "%SEARCH_TERM%" "%%i">NUL && ( ECHO It's a Match! ... File "%%i" contained "%SEARCH_TERM%" ) || ( ECHO No Match... File "%%i" did not contain "%SEARCH_TERM%") ) || ( ECHO No Match... Filename "%%i" did not match with "%FILE_NAME_CONTAINS%")
)

REM -----------------------------------------------------------------------------------
REM Keep the Script open when it is finished so the User can read the Output
REM -----------------------------------------------------------------------------------
PAUSE
