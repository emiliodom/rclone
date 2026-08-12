@echo off

:: Define the paths for your rclone program, filter file, and log file
set RCLONE="C:\rclone\rclone.exe"
set FILTER="C:\rclone\filters.txt"
set LOG="C:\rclone\rclone-log.txt"

:: 1. Backup Documents
%RCLONE% copy "C:\Users\HP Pro Book\Documents" Gdrive:DocumentsBackup -u --filter-from %FILTER% --log-file %LOG% --log-level INFO

:: 2. Backup Pictures
%RCLONE% copy "C:\Users\HP Pro Book\Pictures" Gdrive:PicturesBackup -u --filter-from %FILTER% --log-file %LOG% --log-level INFO

:: 3. Backup Music
%RCLONE% copy "C:\Users\HP Pro Book\Music" Gdrive:MusicBackup -u --filter-from %FILTER% --log-file %LOG% --log-level INFO

:: 4. Backup Videos
%RCLONE% copy "C:\Users\HP Pro Book\Videos" Gdrive:VideosBackup -u --filter-from %FILTER% --log-file %LOG% --log-level INFO

:: 5. Backup Downloads
%RCLONE% copy "C:\Users\HP Pro Book\Downloads" Gdrive:DownloadsBackup -u --filter-from %FILTER% --log-file %LOG% --log-level INFO

:: 6. Backup C: Drive Desktop
%RCLONE% copy "C:\Users\HP Pro Book\Desktop" Gdrive:DesktopBackup -u --filter-from %FILTER% --log-file %LOG% --log-level INFO

:: 7. Backup F: Drive Desktop
%RCLONE% copy "F:\Desktop" Gdrive:F_DesktopBackup -u --filter-from %FILTER% --log-file %LOG% --log-level INFO

:: 8. Backup F: Drive Desktop - French
%RCLONE% copy "F:\Desktop\French" Gdrive:F_FrenchBackup -u --filter-from %FILTER% --log-file %LOG% --log-level INFO

:: 9. Backup F: Drive Desktop - Marleny
%RCLONE% copy "F:\Desktop\Marleny" Gdrive:F_MarlenyBackup -u --filter-from %FILTER% --log-file %LOG% --log-level INFO

:: 10. Backup F: Drive Desktop - Parasol
%RCLONE% copy "F:\Desktop\Parasol" Gdrive:F_ParasolBackup -u --filter-from %FILTER% --log-file %LOG% --log-level INFO

:: 11. Backup F: Drive Desktop - Visa
%RCLONE% copy "F:\Desktop\Visa" Gdrive:F_VisaBackup -u --filter-from %FILTER% --log-file %LOG% --log-level INFO

:: 12. Backup F: Drive Desktop - yaman
%RCLONE% copy "F:\Desktop\yaman" Gdrive:F_yamanBackup -u --filter-from %FILTER% --log-file %LOG% --log-level INFO

:: 13. Backup F: Drive Docs
%RCLONE% copy "F:\Docs" Gdrive:F_DocsBackup -u --filter-from %FILTER% --log-file %LOG% --log-level INFO

:: 14. Backup F: Drive Downloads
%RCLONE% copy "F:\Downloads" Gdrive:F_DownloadsBackup -u --filter-from %FILTER% --log-file %LOG% --log-level INFO

:: 15. Backup F: Drive utorrent
%RCLONE% copy "F:\utorrent" Gdrive:F_utorrentBackup -u --filter-from %FILTER% --log-file %LOG% --log-level INFO

exit