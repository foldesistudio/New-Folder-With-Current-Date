:: time and date stamp YYYYMMDD, HHMMSS and YYYY-MM-DD_HH-MM-SS
@echo off
chcp 1250
for /f "delims=" %%a in ('wmic OS Get localdatetime  ^| find "."') do set dt=%%a
set datestamp=%dt:~0,8%
set timestamp=%dt:~8,6%
set YYYY=%dt:~0,4%
set MM=%dt:~4,2%
set DD=%dt:~6,2%
set HH=%dt:~8,2%
set Min=%dt:~10,2%
set Sec=%dt:~12,2%

echo Hol készültek a felvételek (város, intézmény)?
    set /P folderName=

echo Mi a projekt neve?
    set /P folderName2=

set stamp=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%
set rendezveny_mappa=%YYYY%-%MM%-%DD% - %folderName2% - %folderName%
echo stamp: "%stamp%"
echo datestamp: "%datestamp%"
echo timestamp: "%timestamp%"

for /f "tokens=1-3 delims=/" %%a in ("%date%") do md "%rendezveny_mappa%"

md "%rendezveny_mappa%"\Canon\
md "%rendezveny_mappa%"\JVC\
md "%rendezveny_mappa%"\Panasonic\
md "%rendezveny_mappa%"\SJCAM\
md "%rendezveny_mappa%"\Kesz\
md "%rendezveny_mappa%"\Zene\
:: pause