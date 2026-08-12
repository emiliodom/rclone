# Rclone Backup Script

This folder contains a Windows batch script that runs a set of `rclone copy` jobs to back up local folders to Google Drive.

## What It Does

- Uses `bk.bat` to copy selected folders from this PC and the `F:` drive to a Google Drive remote named `Gdrive:`.
- Uses `filters.txt` to exclude cache, build, system, and other unwanted folders.
- Writes transfer details to daily log files under `logs\` with explicit start and end markers for each backup folder.
- Includes a local HTML dashboard in `index.html` for loading either the whole `logs\` folder or a single `rclone-log.txt` file.
- The dashboard remembers the last source when permissions allow, defaults to the newest log date, and switches between folder mode and flat-log mode automatically.
- In flat-log mode it derives pills, filters, charts, and summaries from the raw log content, then exports the current view to CSV, JSON, or PDF.

## Requirements

- `rclone.exe` in this folder.
- A configured rclone remote named `Gdrive` that points to Google Drive.
- Google Drive API access enabled for the app used to authorize the remote.
- If the Google Drive app is in testing mode, the account running the backup must be added as a test user.

## Files

- `bk.bat` - runs the backup jobs.
- `filters.txt` - shared filter rules used by every copy job.
- `logs\rclone-log-YYYY-MM-DD.txt` - daily log output written by the script.
- `rclone-log.txt` - flat log source that the dashboard can parse directly.
- `index.html` - local dashboard for loading and reviewing a logs folder or a single log file.
- `rclone.exe` - bundled rclone binary.
- `README.txt` and `README.html` - rclone manual files bundled with the binary.

## Backup Targets

The batch file currently backs up these locations:

- `C:\Users\HP Pro Book\Documents`
- `C:\Users\HP Pro Book\Pictures`
- `C:\Users\HP Pro Book\Music`
- `C:\Users\HP Pro Book\Videos`
- `C:\Users\HP Pro Book\Downloads`
- `C:\Users\HP Pro Book\Desktop`
- `F:\Desktop`
- `F:\Desktop\French`
- `F:\Desktop\Marleny`
- `F:\Desktop\Parasol`
- `F:\Desktop\Visa`
- `F:\Desktop\yaman`
- `F:\Docs`
- `F:\Downloads`
- `F:\utorrent`

Each source is copied into a matching folder on Google Drive, such as `Gdrive:DocumentsBackup` or `Gdrive:F_DocsBackup`.

## Filter Rules

`filters.txt` excludes common local caches, build artifacts, and large working folders such as:

- `node_modules`
- `.npm`
- `dist`
- `build`
- `.next`
- `.cache`
- `__pycache__`
- `.vscode/extensions`
- temporary Gemini folders
- selected project and game directories
- Windows system directories

It also excludes localized Windows symlink folders such as `Mi música`, `Mis imágenes`, and `Mis vídeos`.

## Usage

1. Confirm the Google Drive remote exists and is named `Gdrive`.
2. Review `filters.txt` if you need to add or remove exclusions.
3. Run `bk.bat` from this folder.
4. Open `index.html` in a Chromium-based browser and choose either the `logs\` folder or `rclone-log.txt`.
5. Use the calendar selector to switch dates if you need an older log day.
6. Use the derived pills to filter by content category or path group.
7. Use the export buttons if you want CSV, JSON, or PDF output.

## Notes

- The script uses `rclone copy`, so destination folders are updated with new or changed files but are not made identical to the source.
- The batch file generates one log file per day using the current date.
- The dashboard can still calculate per-folder success and failure totals when valid start/end markers are present, but it falls back to flat-log parsing when they are not.
- If you change source paths or the remote name, update `bk.bat` accordingly.