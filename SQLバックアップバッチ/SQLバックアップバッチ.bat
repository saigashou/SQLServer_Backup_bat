@echo off

title @@SQLT[o[@obNAbv
::obN(f)Ά(0)
color f0
::ϊtiYYYYMMDDj
set dateback=%date:~0,4%%date:~5,2%%date:~8,2%


ECHO 
echo @@SQLT[o[@obNAbv
echo 

::T[oΌ^IPAhX\CX^XΌ
set /p server="T[oΌ^IPAhX\CX^XΌ"

::[U[ID
set /p userID="[U[ID"

::pX[h
set password="pX[h"

::DBΌ
set DB="DBΌ"

::obNAbvζ
set /p backupPAS="obNAbvζ"

::SQLt@C
rem set /p SQL="SQLΆtpX"


::’όΝmF
if %server%==- (goto END) else (goto SHORI)
if %userID%==- (goto END) else (goto SHORI)
if %password%==- (goto END) else (goto SHORI)
if %DB%==- (goto END) else (goto SHORI)
if %backupPAS%==- (goto END) else (goto SHORI)

::*************************************************
:SHORI
::*************************************************
echo DATABASE BACKUPπJn΅ά·.......

::log
set Log=%backupPAS%\Backup_%dateback%.log

::SQLΆ
set SQL="BACKUP DATABASE %DB% TO DISK='%backupPAS%\%DB%_%dateback%.bak' WITH INIT"
::-------------------------------
::DATABASEBACKUPJn
::-------------------------------
SQLCMD -S %server% -U %userID% -P %password% -Q %SQL% >%Log%
rem SQLCMD -S %server% -U %userID% -P %password% -i %SQL% >%Log%


echo DATABASE BACKUP IΉB


::********************************************
:END
