ECHO OFF

REM Get the Location of this Batch Script
SET LOCAL_PATH=%~dp0
REM Enter the Name of the Python Script that should be started
SET PYTHON_SCRIPT_NAME=MyPythonScript.py
REM Build the full Path to the Python Script here
SET PYTHON_SCRIPT_PATH=%LOCAL_PATH%%PYTHON_SCRIPT_NAME%
REM Build the full Path to the Python Executable here
SET PYTHON_EXE_PATH=%LOCAL_PATH%venv\Scripts\Python.exe

REM Start the Script with the specified Python Executable
REM Use the -i Flag to launch Python in interactive Mode
REM https://docs.python.org/3/using/cmdline.html#cmdoption-i
%PYTHON_EXE_PATH% -i %PYTHON_SCRIPT_PATH%

REM Wait after the Script is finished so the User can read the Output
TIMEOUT 5