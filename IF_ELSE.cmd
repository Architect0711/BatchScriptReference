ECHO OFF
REM -----------------------------------------------------------------------------------
REM IF ELSE STATEMENT - SINGLE LINE
REM -----------------------------------------------------------------------------------
IF 1 == 1 ( ECHO 1 == 1 ) ELSE ( ECHO 1 != 1 )

REM -----------------------------------------------------------------------------------
REM IF NOT ELSE STATEMENT - MULTILINE
REM -----------------------------------------------------------------------------------
IF NOT EXIST C:\ (
	REM Jump to a Function Declaration
    GOTO :DRIVE_EXISTS_FALSE
) ELSE (
	REM Jump to a Function Declaration
    GOTO :DRIVE_EXISTS_TRUE
)

REM -----------------------------------------------------------------------------------
REM FUNCTION DECLARATIONS
REM -----------------------------------------------------------------------------------
REM Function Declaration
:DRIVE_EXISTS_TRUE
ECHO C:\ exists
REM Control falls through to the next Function, so we need to jump to another Function when finished
GOTO :FINISHED

REM Function Declaration
:DRIVE_EXISTS_FALSE
ECHO C:\ does not exist
REM Control falls through to the next Function, so we need to jump to another Function when finished
GOTO :FINISHED

REM Function Declaration
:FINISHED
PAUSE