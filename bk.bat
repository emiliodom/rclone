@echo off
setlocal EnableExtensions EnableDelayedExpansion

:: Define the paths for your rclone program, filter file, and log directory
set "RCLONE=C:\rclone\rclone.exe"
set "FILTER=C:\rclone\filters.txt"
set "LOG_DIR=C:\rclone\logs"

if not exist "%LOG_DIR%" mkdir "%LOG_DIR%"

for /f %%I in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd"') do set "LOG_DATE=%%I"
set "LOG=%LOG_DIR%\rclone-log-%LOG_DATE%.txt"

call :run_backup "Documents" "C:\Users\HP Pro Book\Documents" "Gdrive:DocumentsBackup"
call :run_backup "Pictures" "C:\Users\HP Pro Book\Pictures" "Gdrive:PicturesBackup"
call :run_backup "Music" "C:\Users\HP Pro Book\Music" "Gdrive:MusicBackup"
call :run_backup "Videos" "C:\Users\HP Pro Book\Videos" "Gdrive:VideosBackup"
call :run_backup "Downloads" "C:\Users\HP Pro Book\Downloads" "Gdrive:DownloadsBackup"
call :run_backup "Desktop" "C:\Users\HP Pro Book\Desktop" "Gdrive:DesktopBackup"
call :run_backup "F Desktop" "F:\Desktop" "Gdrive:F_DesktopBackup"
call :run_backup "F Desktop - French" "F:\Desktop\French" "Gdrive:F_FrenchBackup"
call :run_backup "F Desktop - Marleny" "F:\Desktop\Marleny" "Gdrive:F_MarlenyBackup"
call :run_backup "F Desktop - Parasol" "F:\Desktop\Parasol" "Gdrive:F_ParasolBackup"
call :run_backup "F Desktop - Visa" "F:\Desktop\Visa" "Gdrive:F_VisaBackup"
call :run_backup "F Desktop - yaman" "F:\Desktop\yaman" "Gdrive:F_yamanBackup"
call :run_backup "F Docs" "F:\Docs" "Gdrive:F_DocsBackup"
call :run_backup "F Downloads" "F:\Downloads" "Gdrive:F_DownloadsBackup"
call :run_backup "F utorrent" "F:\utorrent" "Gdrive:F_utorrentBackup"

exit

:run_backup
set "JOB_NAME=%~1"
set "SOURCE=%~2"
set "DEST=%~3"

>>"%LOG%" echo ==== [%DATE% %TIME%] START !JOB_NAME! ^> !DEST! ====
"%RCLONE%" copy "%SOURCE%" "%DEST%" -u --filter-from "%FILTER%" --log-file "%LOG%" --log-level INFO
set "EXIT_CODE=%ERRORLEVEL%"

if "%EXIT_CODE%"=="0" (
	>>"%LOG%" echo ==== [%DATE% %TIME%] END !JOB_NAME! SUCCESS ====
) else (
	>>"%LOG%" echo ==== [%DATE% %TIME%] END !JOB_NAME! FAILED (exit !EXIT_CODE!) ====
)

exit /b %EXIT_CODE%