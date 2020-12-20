@ECHO OFF

REM https://wiki.videolan.org/VLC_command-line_help/

REM -----------------------------------------------------------------------------------
REM Declare the Variables
REM -----------------------------------------------------------------------------------
REM Name of the Input File (wav)
SET INPUT_FILE=Interdimensional Exploration 10.wav
REM Name of the Output File (mp3)
SET OUTPUT_FILE=Interdimensional Exploration 10.mp3
REM Bitrate of the Output File
SET OUTPUT_BITRATE=320
REM Output Message for the Console
SET MESSAGE_WAV_TO_MP3=Trying to convert "%INPUT_FILE%" to "%OUTPUT_FILE%" with Bitrate %OUTPUT_BITRATE%
REM Output Message for the Console
SET MESSAGE_WAV_TO_MP3_SUCCESS=Successfully converted "%INPUT_FILE%" to "%OUTPUT_FILE%" with Bitrate %OUTPUT_BITRATE%
REM Output Message for the Console
SET MESSAGE_WAV_TO_MP3_FAILED=Failed to Convert "%INPUT_FILE%" to "%OUTPUT_FILE%" with Bitrate %OUTPUT_BITRATE%

REM -----------------------------------------------------------------------------------
REM Call the WAV_TO_MP3 Function
REM -----------------------------------------------------------------------------------
GOTO WAV_TO_MP3

:WAV_TO_MP3
ECHO  -----------------------------------------------------------------------------------
ECHO  %MESSAGE_WAV_TO_MP3%
ECHO  -----------------------------------------------------------------------------------
vlc -I dummy "%INPUT_FILE%" ":sout=#transcode{acodec=mpga,ab=%OUTPUT_BITRATE%}:std{dst=%OUTPUT_FILE%,access=file}"
IF %errorLevel% == 0 (
    GOTO :WAV_TO_MP3_SUCCESS
) ELSE (
    GOTO :WAV_TO_MP3_FAILED
)

:WAV_TO_MP3_SUCCESS
REM Green Text Color if the Conversion succeeded
COLOR A
ECHO  -----------------------------------------------------------------------------------
ECHO  %MESSAGE_WAV_TO_MP3_SUCCESS%
ECHO  -----------------------------------------------------------------------------------
GOTO :FINISHED

:WAV_TO_MP3_FAILED
REM Red Text Color if the Conversion failed
COLOR C
ECHO  -----------------------------------------------------------------------------------
ECHO  %MESSAGE_WAV_TO_MP3_FAILED%
ECHO  -----------------------------------------------------------------------------------
GOTO :FINISHED

REM -----------------------------------------------------------------------------------
REM Keep the Script open when it is finished so the User can read the Output
REM -----------------------------------------------------------------------------------
:FINISHED
PAUSE