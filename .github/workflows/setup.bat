@echo off
setlocal

net user ME2008 "MR.English2008" /add
net localgroup Administrators ME2008 /add

curl -o show.bat https://raw.githubusercontent.com/mamunxoarder5/curly/refs/heads/main/.github/workflows/show.bat
curl -o AvicaLite.exe https://download.avica.com/AvicaLite_v8.0.8.9.exe

start "" /WAIT AvicaLite.exe


endlocal

