@echo off
setlocal enabledelayedexpansion

:: Ask for the YouTube URL
set /p url="Enter YouTube URL: "

:: Remove unwanted parameters like "list", "start_radio"
for /f "delims=" %%i in ('echo %url% ^| findstr /r "^https://www.youtube.com/watch\?v="') do set cleaned_url=%%i
set cleaned_url=%cleaned_url:&list=*%
set cleaned_url=%cleaned_url:&start_radio=*%

:: Ask for download quality
echo Please choose a download quality:
echo 1. Music (MP3)
echo 2. Video 360p
echo 3. Video 480p
echo 4. Video 720p
echo 5. Video 1080p
echo 6. Video 2160p
set /p quality="Select an option (1-6): "

:: Set download format based on choice
if "%quality%"=="1" (
    set format=140
) else if "%quality%"=="2" (
    set format=best[height<=360]
) else if "%quality%"=="3" (
    set format=best[height<=480]
) else if "%quality%"=="4" (
    set format=best[height<=720]
) else if "%quality%"=="5" (
    set format=best[height<=1080]
) else if "%quality%"=="6" (
    set format=best[height<=2160]
) else (
    echo Invalid option!
    exit /b
)

:: Download video using yt-dlp
yt-dlp -f %format% %cleaned_url%

if %errorlevel% neq 0 (
    echo An error occurred while downloading.
) else (
    echo Download complete!
)

pause
