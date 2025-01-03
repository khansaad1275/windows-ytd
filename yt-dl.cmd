@echo off
setlocal EnableDelayedExpansion

:: Prompt the user for a YouTube URL
set /p "url=Enter YouTube URL: "

:: Handle special characters in URL (escape '&' and other potential issues)
set "url=!url:&=^&!"

:: Ask the user for the quality option
echo Please choose a download quality:
echo 1. Music (MP3)
echo 2. Video 360p (MP4)
echo 3. Video 480p (MP4)
echo 4. Video 720p (MP4)
echo 5. Video 1080p (MP4)
echo 6. Video 2160p (MP4)
set /p "quality=Select an option (1-6): "

:: Set download options based on user input
if "%quality%"=="1" (
    set "format=140"  :: Music (MP3)
    set "ext=mp3"     :: Set extension for audio
)
if "%quality%"=="2" (
    set "format=18"   :: Video 360p (MP4)
    set "ext=mp4"     :: Set extension for video
)
if "%quality%"=="3" (
    set "format=22"   :: Video 480p (MP4)
    set "ext=mp4"     :: Set extension for video
)
if "%quality%"=="4" (
    set "format=22"   :: Video 720p (MP4)
    set "ext=mp4"     :: Set extension for video
)
if "%quality%"=="5" (
    set "format=137"  :: Video 1080p (MP4)
    set "ext=mp4"     :: Set extension for video
)
if "%quality%"=="6" (
    set "format=137"  :: Video 2160p (MP4)
    set "ext=mp4"     :: Set extension for video
)

:: Ensure that the URL is passed correctly to yt-dlp (using quotes and handling & properly)
:: Specify the output format with correct extension: mp3 for audio, mp4 for video
yt-dlp -f !format! "!url!" -o "%USERPROFILE%\Videos\%(title)s.!(ext)"

:: Check if the video was already downloaded
if exist "%USERPROFILE%\Videos\%(title)s.!(ext)" (
    echo The video has already been downloaded.
) else (
    echo Download started...
)

pause
