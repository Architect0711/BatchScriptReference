ECHO OFF

REM https://www.youtube.com/watch?v=dUJE45v7DJw
REM -----------------------------------------------------------------------------------
REM Declare Variables
REM -----------------------------------------------------------------------------------
REM Enter the Drive Letter of the Backup Source. 
SET BACKUP_SOURCE=C
REM Enter the Drive Letter of the Backup Destination. Make sure to set a fixed Letter for your Backup Drive.
SET BACKUP_DESTINATION=D

REM Show some Info Texts to the User
SET MESSAGE_INFO=Creating a Backup of your System
REM Tell the User that the Script will look for their Source Drive
SET MESSAGE_CHECK_IF_SOURCE_EXISTS=Checking if Source Drive %BACKUP_SOURCE%:\ exists
REM Tell the User their Source Drive was found
SET MESSAGE_SOURCE_EXISTS_TRUE=Source Drive %BACKUP_SOURCE%:\ was found
REM Tell the User their Source Drive was NOT found
SET MESSAGE_SOURCE_EXISTS_FALSE=Source Drive %BACKUP_SOURCE%:\ was not found - make sure it can be found and press Enter
REM Tell the User that the Script will look for their Destination Drive
SET MESSAGE_CHECK_IF_DESTINATION_EXISTS=Checking if Destination Drive %BACKUP_DESTINATION%:\ exists
REM Tell the User their Destination Drive was found
SET MESSAGE_DESTINATION_EXISTS_TRUE=Destination Drive %BACKUP_DESTINATION%:\ was found
REM Tell the User their Destination Drive was NOT found
SET MESSAGE_DESTINATION_EXISTS_FALSE=Destination Drive %BACKUP_DESTINATION%:\ was not found - make sure it can be found and press Enter
REM Tell the User that the Script is ready to perform the Backup
SET MESSAGE_DO_BACKUP=Ready to perform Backup

REM -----------------------------------------------------------------------------------
REM Display a Message to the User so they know why the Console was opened
REM -----------------------------------------------------------------------------------
ECHO  -----------------------------------------------------------------------------------
ECHO  %MESSAGE_INFO%
ECHO  -----------------------------------------------------------------------------------
GOTO :CHECK_IF_SOURCE_EXISTS

:CHECK_IF_SOURCE_EXISTS
REM -----------------------------------------------------------------------------------
REM Check if the Source Drive is available
REM -----------------------------------------------------------------------------------
ECHO  -----------------------------------------------------------------------------------
ECHO  %MESSAGE_CHECK_IF_SOURCE_EXISTS%
ECHO  -----------------------------------------------------------------------------------
IF NOT EXIST %BACKUP_SOURCE%:\ (
    GOTO :SOURCE_EXISTS_FALSE
) ELSE (
    GOTO :SOURCE_EXISTS_TRUE
)

:SOURCE_EXISTS_TRUE
REM Green Text Color if the Drive was found
COLOR A
ECHO  -----------------------------------------------------------------------------------
ECHO  %MESSAGE_SOURCE_EXISTS_TRUE%
ECHO  -----------------------------------------------------------------------------------
GOTO :CHECK_IF_DESTINATION_EXISTS

:SOURCE_EXISTS_FALSE
REM Red Text Color if the Drive was not found
COLOR C
ECHO  -----------------------------------------------------------------------------------
ECHO  %MESSAGE_SOURCE_EXISTS_FALSE%
ECHO  -----------------------------------------------------------------------------------
PAUSE
GOTO :CHECK_IF_SOURCE_EXISTS

:CHECK_IF_DESTINATION_EXISTS
REM -----------------------------------------------------------------------------------
REM Check if the Destination Drive is available
REM -----------------------------------------------------------------------------------
ECHO  -----------------------------------------------------------------------------------
ECHO  %MESSAGE_CHECK_IF_DESTINATION_EXISTS%
ECHO  -----------------------------------------------------------------------------------
IF NOT EXIST %BACKUP_DESTINATION%:\ (
    GOTO :DESTINATION_EXISTS_FALSE
) ELSE (
    GOTO :DESTINATION_EXISTS_TRUE
)

:DESTINATION_EXISTS_TRUE
REM Green Text Color if the Drive was found
COLOR A
ECHO  -----------------------------------------------------------------------------------
ECHO  %MESSAGE_DESTINATION_EXISTS_TRUE%
ECHO  -----------------------------------------------------------------------------------
GOTO :DO_BACKUP

:DESTINATION_EXISTS_FALSE
REM Red Text Color if the Drive was not found
COLOR C
ECHO  -----------------------------------------------------------------------------------
ECHO  %MESSAGE_DESTINATION_EXISTS_FALSE%
ECHO  -----------------------------------------------------------------------------------
PAUSE
GOTO :CHECK_IF_DESTINATION_EXISTS

:DO_BACKUP
ECHO  -----------------------------------------------------------------------------------
ECHO  %MESSAGE_DO_BACKUP%
ECHO  -----------------------------------------------------------------------------------
PAUSE
WBADMIN START BACKUP -backuptarget:%BACKUP_DESTINATION%: -include:%BACKUP_SOURCE%: -allCritical
GOTO :FINISHED

REM -----------------------------------------------------------------------------------
REM Keep the Script open when it is finished so the User can read the Output
REM -----------------------------------------------------------------------------------
:FINISHED
PAUSE

