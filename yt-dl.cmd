@echo off
setlocal EnableDelayedExpansion

:: Prompt the user for a YouTube URL
set /p "url=Enter YouTube URL: "

:: Handle special characters in URL (escape '&' and other potential issues)
set "url=!url:&=^&!"

:: Ask the user for the quality option
echo Please choose a download quality:
echo 1. Music (MP3)
echo 2. Video 360p
echo 3. Video 480p
echo 4. Video 720p
echo 5. Video 1080p
echo 6. Video 2160p
set /p "quality=Select an option (1-6): "

:: Set download options based on user input
if "%quality%"=="1" set "format=140"  :: Music (MP3)
if "%quality%"=="2" set "format=18"   :: Video 360p
if "%quality%"=="3" set "format=22"   :: Video 480p
if "%quality%"=="4" set "format=22"   :: Video 720p
if "%quality%"=="5" set "format=137"  :: Video 1080p
if "%quality%"=="6" set "format=137"  :: Video 2160p

:: Ensure that the URL is passed correctly to yt-dlp (using quotes and handling & properly)
yt-dlp -f !format! "!url!" -o "%USERPROFILE%\Videos\%(title)s.%(ext)s"

pause
