ECHO OFF

REM -----------------------------------------------------------------------------------
REM Documentation
REM -----------------------------------------------------------------------------------
REM SqlCmd Utility: https://docs.microsoft.com/de-de/sql/tools/sqlcmd-utility?view=sql-server-ver15

REM -----------------------------------------------------------------------------------
REM Set the Source and Destination Names to Variables
REM -----------------------------------------------------------------------------------
REM Name of the Database that should be backed up
SET SRC_DB_NAME=MyDatabase
REM Folder where the Backup should be saved
SET DST_FOLDER=C:\Database
REM Name of the Backup File
SET DST_FILE=MyDatabaseBackup

REM -----------------------------------------------------------------------------------
REM Use the SqlCmd Utility to create the Backup
REM -----------------------------------------------------------------------------------

REM The . points to the local Sql Server with the default Name
REM Replace the . with an IP or Hostname to point to the remote Sql Server with the default Name (e.g. 192.168.0.123)
REM Replace the . with a Database Name to point to the local Sql Server with that Name (e.g. MySqlServerInstance)
REM Replace the . with Hostname\Database or IP\Database to point to the remote Sql Server with that Name (e.g. 192.168.0.123\MySqlServerInstance)
REM -E (use trusted connection)
REM -S [protocol:]server[instance_name][,port]
REM -Q "cmdline query" (and exit)  
SqlCmd -E -S . -Q "BACKUP DATABASE %SRC_DB_NAME% TO DISK='%DST_FOLDER%\%DST_FILE%.bak'"

REM ----------------------------------------------------------------------------------
REM Wait after the Script is finished so the User can read the Output
REM -----------------------------------------------------------------------------------
TIMEOUT 5