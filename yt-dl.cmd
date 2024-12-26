@echo off
cls
setlocal enabledelayedexpansion

:: Define the output directory
set OUTPUT_PATH=%USERPROFILE%\Videos

:: Check if yt-dlp is installed
where yt-dlp >nul 2>nul
if errorlevel 1 (
    echo yt-dlp is not installed. Please run the install_yt-dlp.bat script first.
    pause
    exit /b
)

:: Ask user to enter the YouTube link
set /p VIDEO_URL="Enter YouTube URL: "

:: Show the quality options
echo.
echo Please choose a download quality:
echo 1. Music (MP3)
echo 2. Video 360p
echo 3. Video 480p
echo 4. Video 720p
echo 5. Video 1080p
echo 6. Video 2160p
set /p option="Select an option (1-6): "

:: Choose download format based on user's input
if "%option%"=="1" (
    set FORMAT=140
) else if "%option%"=="2" (
    set FORMAT="best[height<=360]"
) else if "%option%"=="3" (
    set FORMAT="best[height<=480]"
) else if "%option%"=="4" (
    set FORMAT="best[height<=720]"
) else if "%option%"=="5" (
    set FORMAT="best[height<=1080]"
) else if "%option%"=="6" (
    set FORMAT="best[height<=2160]"
) else (
    echo Invalid option selected. Exiting.
    pause
    exit /b
)

:: Download the video in the selected format
yt-dlp -f %FORMAT% %VIDEO_URL% -o "%OUTPUT_PATH%\%(title)s.%(ext)s"

:: Check if download was successful
if %errorlevel% equ 0 (
    echo Download successful! Files saved to %OUTPUT_PATH%.
) else (
    echo An error occurred while downloading.
)

pause
