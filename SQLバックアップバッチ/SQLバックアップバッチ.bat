@echo off

title 　　SQLサーバー　バックアップ
::白バック(f)黒文字(0)
color f0
::日付（YYYYMMDD）
set dateback=%date:~0,4%%date:~5,2%%date:~8,2%


ECHO ＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊
echo 　　SQLサーバー　バックアップ
echo ＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊

::サーバ名／IPアドレス\インスタンス名
set /p server="サーバ名／IPアドレス\インスタンス名＞"

::ユーザーID
set /p userID="ユーザーID＞"

::パスワード
set password="パスワード＞"

::DB名
set DB="DB名＞"

::バックアップ先
set /p backupPAS="バックアップ先＞"

::SQLファイル時
rem set /p SQL="SQL文フルパス＞"


::未入力確認
if %server%==- (goto END) else (goto SHORI)
if %userID%==- (goto END) else (goto SHORI)
if %password%==- (goto END) else (goto SHORI)
if %DB%==- (goto END) else (goto SHORI)
if %backupPAS%==- (goto END) else (goto SHORI)

::*************************************************
:SHORI
::*************************************************
echo DATABASE BACKUPを開始します.......

::log
set Log=%backupPAS%\Backup_%dateback%.log

::SQL文
set SQL="BACKUP DATABASE %DB% TO DISK='%backupPAS%\%DB%_%dateback%.bak' WITH INIT"
::-------------------------------
::DATABASEBACKUP開始
::-------------------------------
SQLCMD -S %server% -U %userID% -P %password% -Q %SQL% >%Log%
rem SQLCMD -S %server% -U %userID% -P %password% -i %SQL% >%Log%


echo DATABASE BACKUP 終了。


::********************************************
:END
