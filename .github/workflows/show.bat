@echo off
setlocal

set USERNAME=ME2008
set PASSWORD=MR.English2008

echo Username: %USERNAME%
echo Password: %PASSWORD%

REM Run Python script and capture GoFile link
set "LINK="
for /f "delims=" %%A in ('python screenshot.py') do (
    echo %%A | findstr /i "https://" >nul
    if not errorlevel 1 (
        set "LINK=%%A"
    )
)

REM Validate link
if not defined LINK (
    echo [ERROR] No download link found.
    exit /b 1
)

echo Screenshot: %LINK%

REM Optional: use the link (examples)
REM start "" %LINK%
REM curl %LINK% --output image.png

endlocal