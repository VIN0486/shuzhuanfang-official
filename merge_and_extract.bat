@echo off
setlocal
cd /d "%~dp0"

set "ZIP=ShuZhuanFang_Portable_v18.zip"
set "PART1=%ZIP%.001"
set "PART2=%ZIP%.002"

if not exist "%PART1%" goto missing
if not exist "%PART2%" goto missing

echo Combining files...
copy /b "%PART1%"+"%PART2%" "%ZIP%" >nul
if errorlevel 1 goto failed

echo Extracting...
tar -xf "%ZIP%"
if errorlevel 1 goto failed

echo.
echo Done. Open the extracted ShuZhuanFang folder and run the application exe.
pause
exit /b 0

:missing
echo Missing part file. Keep .001 and .002 beside this script.
pause
exit /b 1

:failed
echo Combine or extraction failed.
pause
exit /b 1
