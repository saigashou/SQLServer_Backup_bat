@echo off

title �@�@SQL�T�[�o�[�@�o�b�N�A�b�v
::���o�b�N(f)������(0)
color f0
::���t�iYYYYMMDD�j
set dateback=%date:~0,4%%date:~5,2%%date:~8,2%


ECHO ����������������������������������������������������������
echo �@�@SQL�T�[�o�[�@�o�b�N�A�b�v
echo ����������������������������������������������������������

::�T�[�o���^IP�A�h���X\�C���X�^���X��
set /p server="�T�[�o���^IP�A�h���X\�C���X�^���X����"

::���[�U�[ID
set /p userID="���[�U�[ID��"

::�p�X���[�h
set password="�p�X���[�h��"

::DB��
set DB="DB����"

::�o�b�N�A�b�v��
set /p backupPAS="�o�b�N�A�b�v�恄"

::SQL�t�@�C����
rem set /p SQL="SQL���t���p�X��"


::�����͊m�F
if %server%==- (goto END) else (goto SHORI)
if %userID%==- (goto END) else (goto SHORI)
if %password%==- (goto END) else (goto SHORI)
if %DB%==- (goto END) else (goto SHORI)
if %backupPAS%==- (goto END) else (goto SHORI)

::*************************************************
:SHORI
::*************************************************
echo DATABASE BACKUP���J�n���܂�.......

::log
set Log=%backupPAS%\Backup_%dateback%.log

::SQL��
set SQL="BACKUP DATABASE %DB% TO DISK='%backupPAS%\%DB%_%dateback%.bak' WITH INIT"
::-------------------------------
::DATABASEBACKUP�J�n
::-------------------------------
SQLCMD -S %server% -U %userID% -P %password% -Q %SQL% >%Log%
rem SQLCMD -S %server% -U %userID% -P %password% -i %SQL% >%Log%


echo DATABASE BACKUP �I���B


::********************************************
:END
