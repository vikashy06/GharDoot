@echo off
title GharDoot Local Mobile Server
cd /d "%~dp0"
echo ==========================================================
echo    Starting GharDoot Local Web Server for Mobile...
echo ==========================================================
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0serve.ps1"
pause
