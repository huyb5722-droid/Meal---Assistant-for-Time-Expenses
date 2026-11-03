@echo off
setlocal
cd /d "%~dp0"

where node >nul 2>nul
if errorlevel 1 (
  echo Node.js is not installed on this computer.
  echo Install Node.js 18 or newer, then double-click this file again.
  start "" https://nodejs.org/
  pause
  exit /b 1
)

set "MATE_PORT=4173"
if exist ".env" (
  for /f "tokens=1,* delims==" %%A in ('findstr /b "PORT=" ".env" 2^>nul') do set "MATE_PORT=%%B"
)
set "MATE_URL=http://127.0.0.1:%MATE_PORT%"

call :check_server
if not errorlevel 1 goto :open_browser

echo Starting the MATE server on port %MATE_PORT%...
start "MATE Server" /D "%~dp0" cmd /k "node server.js"

for /l %%I in (1,1,20) do (
  timeout /t 1 /nobreak >nul
  call :check_server
  if not errorlevel 1 goto :open_browser
)

echo.
echo MATE could not connect to its server.
echo Check the MATE Server window for an error. Port %MATE_PORT% may already be in use.
echo Close any other server using this port, then double-click Run-MATE.bat again.
pause
exit /b 1

:open_browser
echo MATE server is ready at %MATE_URL%.
start "" "%MATE_URL%"
exit /b 0

:check_server
powershell -NoProfile -Command "try { $health = Invoke-RestMethod -Uri '%MATE_URL%/api/health' -TimeoutSec 2; if ($health.ok) { exit 0 } } catch {}; exit 1" >nul 2>nul
exit /b %errorlevel%
