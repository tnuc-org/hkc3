:: 
:: INITIALISATION
:: 
@ECHO OFF
TITLE HotkeyChanger 3.08
SET CURDIR=%~dp0
CD %CURDIR%..
SET HKCDIR=%APPDATA%\HKC3
SET CFGDIR=%APPDATA%\Tibia
:: 
:: CHECK INTEGRITY
::
IF NOT EXIST "%CURDIR%..\Tibia.exe" GOTO direrr
IF NOT EXIST "%CURDIR%..\mc85.exe" GOTO mcerr
IF NOT EXIST "%CURDIR%XXMKLINK.EXE" GOTO xxmerr
IF NOT EXIST "%CURDIR%ico" GOTO icoerr
IF NOT EXIST "%CURDIR%ico\r1.ico" GOTO icoerr
IF NOT EXIST "%CURDIR%ico\r2.ico" GOTO icoerr
IF NOT EXIST "%CURDIR%ico\r3.ico" GOTO icoerr
IF NOT EXIST "%CURDIR%ico\r4.ico" GOTO icoerr
IF NOT EXIST "%CURDIR%ico\r5.ico" GOTO icoerr
IF NOT EXIST "%CURDIR%ico\r6.ico" GOTO icoerr
IF NOT EXIST "%CURDIR%ico\r7.ico" GOTO icoerr
IF NOT EXIST "%CURDIR%ico\r8.ico" GOTO icoerr
IF NOT EXIST "%CURDIR%ico\r9.ico" GOTO icoerr
IF NOT EXIST "%CURDIR%ico\r0.ico" GOTO icoerr
IF NOT EXIST "%CURDIR%ico\b1.ico" GOTO icoerr
IF NOT EXIST "%CURDIR%ico\b2.ico" GOTO icoerr
IF NOT EXIST "%CURDIR%ico\b3.ico" GOTO icoerr
IF NOT EXIST "%CURDIR%ico\b4.ico" GOTO icoerr
IF NOT EXIST "%CURDIR%ico\b5.ico" GOTO icoerr
IF NOT EXIST "%CURDIR%ico\b6.ico" GOTO icoerr
IF NOT EXIST "%CURDIR%ico\b7.ico" GOTO icoerr
IF NOT EXIST "%CURDIR%ico\b8.ico" GOTO icoerr
IF NOT EXIST "%CURDIR%ico\b9.ico" GOTO icoerr
IF NOT EXIST "%CURDIR%ico\b0.ico" GOTO icoerr
IF NOT EXIST "%CURDIR%ico\xbow.ico" GOTO icoerr
IF NOT EXIST "%CURDIR%ico\sca.ico" GOTO icoerr
IF NOT EXIST "%CURDIR%ico\sov.ico" GOTO icoerr
IF NOT EXIST "%CURDIR%ico\th.ico" GOTO icoerr
IF NOT EXIST "%CURDIR%ico\uh.ico" GOTO icoerr
IF NOT EXIST "%CURDIR%ico\sd.ico" GOTO icoerr
IF NOT EXIST "%CURDIR%ico\para.ico" GOTO icoerr
IF NOT EXIST "%CURDIR%ico\save.ico" GOTO icoerr
IF NOT EXIST "%CURDIR%ico\hkc3.ico" GOTO icoerr
:: 
:: CHECK IF IS_SETUP
:: 
IF NOT EXIST "%HKCDIR%\isset.hkc" GOTO setup
::
:: CATCH PARAMETERS
::
IF "%1"=="-SW" GOTO switch
IF "%1"=="-SV" GOTO saveall
::
:: NORMAL RUN
::
:menu
CLS
ECHO ###############################################################################
ECHO ###############################################################################
ECHO ##                                                                           ##
ECHO ##  HKC3 - Main Menu                                                 by Flo  ##
ECHO ##  -----------------------------------------------------------------------  ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  (1) Switch to another Hotkey Set                                         ##
ECHO ##  (2) Save Current Config                                                  ##
ECHO ##  (3) Advanced Options                                                     ##
ECHO ##  (4) Create Desktop Shortcuts                                             ##
ECHO ##  (5) Backup/Restore Tool                                                  ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  (9) HELP                                                                 ##
ECHO ##                                                                           ##
ECHO ##  (X) Exit                                                                 ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ###############################################################################
ECHO ###############################################################################
SET /P MCHOICE=
IF "%MCHOICE%"=="1" GOTO mswitch
IF "%MCHOICE%"=="2" GOTO saveall
IF "%MCHOICE%"=="3" GOTO setopt
IF "%MCHOICE%"=="4" GOTO linker
IF "%MCHOICE%"=="5" GOTO backup
IF "%MCHOICE%"=="6" GOTO qsave
IF "%MCHOICE%"=="7" GOTO qload
IF "%MCHOICE%"=="X" GOTO end
IF "%MCHOICE%"=="x" GOTO end
IF "%MCHOICE%"=="9" START "" "http://tnuc.org/files/?go=hkchelp"
GOTO menu
:setopt
CLS
IF EXIST "%HKCDIR%\mc.hkc" (SET MC=1) ELSE (SET MC=0)
IF EXIST "%HKCDIR%\silent.hkc" (SET SILENT=1) ELSE (SET SILENT=0)
IF EXIST "%HKCDIR%\boot.hkc" (SET BOOT=1) ELSE (SET BOOT=0)
ECHO ###############################################################################
ECHO ###############################################################################
ECHO ##                                                                           ##
ECHO ##  HKC3 - Advanced Options                                          by Flo  ##
ECHO ##  -----------------------------------------------------------------------  ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
IF "%MC%"=="1" ECHO ##  (1) Disable MC Mode (Currently ON)                                       ##
IF "%MC%"=="0" ECHO ##  (1) Enable MC Mode (Currently OFF)                                       ##
IF "%SILENT%"=="1" ECHO ##  (2) Disable Silent Mode (Currently ON)                                   ##
IF "%SILENT%"=="0" ECHO ##  (2) Enable Silent Mode (Currently OFF)                                   ##
IF "%BOOT%"=="1" ECHO ##  (3) Disable Boot Mode (Currently ON)                                     ##
IF "%BOOT%"=="0" ECHO ##  (3) Enable Boot Mode (Currently OFF)                                     ##
ECHO ##                                                                           ##
ECHO ##  (5) Edit Titles                                                          ##
ECHO ##                                                                           ##
ECHO ##  (7) Show AppData Folders                                                 ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  (X) Back to Main Menu                                                    ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ###############################################################################
ECHO ###############################################################################
SET /P MCHOICE=
IF "%MCHOICE%"=="1" GOTO togmc
IF "%MCHOICE%"=="2" GOTO togslnt
IF "%MCHOICE%"=="3" GOTO togboot
IF "%MCHOICE%"=="5" GOTO titles
IF "%MCHOICE%"=="7" START explorer.exe "%HKCDIR%" & START explorer.exe "%CFGDIR%"
IF "%MCHOICE%"=="X" GOTO menu
IF "%MCHOICE%"=="x" GOTO menu
GOTO setopt
:togmc
IF "%MC%"=="1" (DEL "%HKCDIR%\mc.hkc">nul) ELSE (ECHO hi> "%HKCDIR%\mc.hkc")
IF "%MC%"=="1" (ECHO hi>"%HKCDIR%\justoff.hkc") ELSE (IF EXIST "%HKCDIR%\justoff.hkc" DEL "%HKCDIR%\justoff.hkc">nul)
GOTO setopt
:togslnt
IF "%SILENT%"=="1" (DEL "%HKCDIR%\silent.hkc">nul) ELSE (ECHO hi> "%HKCDIR%\silent.hkc")
GOTO setopt
:togboot
IF "%BOOT%"=="1" (DEL "%HKCDIR%\boot.hkc">nul) ELSE (ECHO hi> "%HKCDIR%\boot.hkc")
GOTO setopt
:titles
CLS
SET /P TITLE1=<"%HKCDIR%\Titles\t1.hkc"
SET /P TITLE2=<"%HKCDIR%\Titles\t2.hkc"
SET /P TITLE3=<"%HKCDIR%\Titles\t3.hkc"
SET /P TITLE4=<"%HKCDIR%\Titles\t4.hkc"
SET /P TITLE5=<"%HKCDIR%\Titles\t5.hkc"
SET /P TITLE6=<"%HKCDIR%\Titles\t6.hkc"
SET /P TITLE7=<"%HKCDIR%\Titles\t7.hkc"
SET /P TITLE8=<"%HKCDIR%\Titles\t8.hkc"
SET /P TITLE9=<"%HKCDIR%\Titles\t9.hkc"
SET /P TITLE0=<"%HKCDIR%\Titles\t0.hkc"
ECHO ###############################################################################
ECHO ###############################################################################
ECHO ##                                                                           ##
ECHO ##  HKC3 - Options - Edit Titles                                     by Flo  ##
ECHO ##  -----------------------------------------------------------------------  ##
ECHO ##                                                                           ##
ECHO ##  (1) %TITLE1%
ECHO ##  (2) %TITLE2%
ECHO ##  (3) %TITLE3%
ECHO ##  (4) %TITLE4%
ECHO ##  (5) %TITLE5%
ECHO ##  (6) %TITLE6%
ECHO ##  (7) %TITLE7%
ECHO ##  (8) %TITLE8%
ECHO ##  (9) %TITLE9%
ECHO ##  (0) %TITLE0%
ECHO ##                                                                           ##
ECHO ##  (X) Back to Options                                                      ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ###############################################################################
ECHO ###############################################################################
SET /P MCHOICE=
SET PAR=%MCHOICE%
IF "%MCHOICE%"=="1" GOTO rename
IF "%MCHOICE%"=="2" GOTO rename
IF "%MCHOICE%"=="3" GOTO rename
IF "%MCHOICE%"=="4" GOTO rename
IF "%MCHOICE%"=="5" GOTO rename
IF "%MCHOICE%"=="6" GOTO rename
IF "%MCHOICE%"=="7" GOTO rename
IF "%MCHOICE%"=="8" GOTO rename
IF "%MCHOICE%"=="9" GOTO rename
IF "%MCHOICE%"=="0" GOTO rename
IF "%MCHOICE%"=="x" GOTO setopt
IF "%MCHOICE%"=="X" GOTO setopt
GOTO titles
:rename
CLS
ECHO ###############################################################################
ECHO ###############################################################################
ECHO ##                                                                           ##
ECHO ##  HKC3 - Options - Edit Titles                                     by Flo  ##
ECHO ##  -----------------------------------------------------------------------  ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##   Enter a new Title for Hotkey Set %PAR%                                      ##
ECHO ##                                                                           ##
IF "%PAR%"=="1" ECHO ##   Old title was: %TITLE1%
IF "%PAR%"=="2" ECHO ##   Old title was: %TITLE2%
IF "%PAR%"=="3" ECHO ##   Old title was: %TITLE3%
IF "%PAR%"=="4" ECHO ##   Old title was: %TITLE4%
IF "%PAR%"=="5" ECHO ##   Old title was: %TITLE5%
IF "%PAR%"=="6" ECHO ##   Old title was: %TITLE6%
IF "%PAR%"=="7" ECHO ##   Old title was: %TITLE7%
IF "%PAR%"=="8" ECHO ##   Old title was: %TITLE8%
IF "%PAR%"=="9" ECHO ##   Old title was: %TITLE9%
IF "%PAR%"=="0" ECHO ##   Old title was: %TITLE0%
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ###############################################################################
ECHO ###############################################################################
SET /P PAR2=
IF NOT "%PAR2%"=="" ECHO ^%PAR2%>"%HKCDIR%\Titles\t%PAR%.hkc"
GOTO titles
:linker
CLS
SET /P TITLE1=<"%HKCDIR%\Titles\t1.hkc"
SET /P TITLE2=<"%HKCDIR%\Titles\t2.hkc"
SET /P TITLE3=<"%HKCDIR%\Titles\t3.hkc"
SET /P TITLE4=<"%HKCDIR%\Titles\t4.hkc"
SET /P TITLE5=<"%HKCDIR%\Titles\t5.hkc"
SET /P TITLE6=<"%HKCDIR%\Titles\t6.hkc"
SET /P TITLE7=<"%HKCDIR%\Titles\t7.hkc"
SET /P TITLE8=<"%HKCDIR%\Titles\t8.hkc"
SET /P TITLE9=<"%HKCDIR%\Titles\t9.hkc"
SET /P TITLE0=<"%HKCDIR%\Titles\t0.hkc"
ECHO ###############################################################################
ECHO ###############################################################################
ECHO ##                                                                           ##
ECHO ##  HKC3 - Creating Desktop Shortcuts                                by Flo  ##
ECHO ##  -----------------------------------------------------------------------  ##
ECHO ##                                                                           ##
ECHO ##  (1) %TITLE1%
ECHO ##  (2) %TITLE2%
ECHO ##  (3) %TITLE3%
ECHO ##  (4) %TITLE4%
ECHO ##  (5) %TITLE5%
ECHO ##  (6) %TITLE6%
ECHO ##  (7) %TITLE7%
ECHO ##  (8) %TITLE8%
ECHO ##  (9) %TITLE9%
ECHO ##  (0) %TITLE0%
ECHO ##  (S) SAVEALL (shortcut to the Save Current Config function)               ##
ECHO ##                                                                           ##
ECHO ##  (X) Back to Main Menu                                                    ##
ECHO ##                                                                           ##
ECHO ###############################################################################
ECHO ###############################################################################
SET /P MCHOICE=
SET PAR=%MCHOICE%
IF "%MCHOICE%"=="1" GOTO linker2
IF "%MCHOICE%"=="2" GOTO linker2
IF "%MCHOICE%"=="3" GOTO linker2
IF "%MCHOICE%"=="4" GOTO linker2
IF "%MCHOICE%"=="5" GOTO linker2
IF "%MCHOICE%"=="6" GOTO linker2
IF "%MCHOICE%"=="7" GOTO linker2
IF "%MCHOICE%"=="8" GOTO linker2
IF "%MCHOICE%"=="9" GOTO linker2
IF "%MCHOICE%"=="0" GOTO linker2
IF "%MCHOICE%"=="s" GOTO linkerS
IF "%MCHOICE%"=="S" GOTO linkerS
IF "%MCHOICE%"=="x" GOTO menu
IF "%MCHOICE%"=="X" GOTO menu
GOTO linker
:linker2
SET /P TTLE=<"%HKCDIR%\Titles\t%PAR%.hkc"
CLS
ECHO ###############################################################################
ECHO ###############################################################################
ECHO ##                                                                           ##
ECHO ##  HKC3 - Creating Desktop Shortcuts                                by Flo  ##
ECHO ##  -----------------------------------------------------------------------  ##
ECHO ##                                                                           ##
ECHO ##  Creating shortcut to Hotkey Set %PAR%, %TTLE%
ECHO ##                                                                           ##
ECHO ##  Choose an Icon Design:                                                   ##
ECHO ##                                                                           ##
ECHO ##  (1) Red Set Number                 (6) Thunder Hammer                    ##
ECHO ##  (2) Blue Set Number                (7) Arbalest                          ##
ECHO ##                                     (8) SD Rune                           ##
ECHO ##  (4) Sword of Valor                 (9) UH Rune                           ##
ECHO ##  (5) Stonecutter Axe                (0) Paralyze Rune                     ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  (X) Back to Main Menu                                                    ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ###############################################################################
ECHO ###############################################################################
SET /P MCHOICE=
SET ICON=nil
IF "%MCHOICE%"=="1" SET ICON=r%PAR%
IF "%MCHOICE%"=="2" SET ICON=b%PAR%
IF "%MCHOICE%"=="4" SET ICON=sov
IF "%MCHOICE%"=="5" SET ICON=sca
IF "%MCHOICE%"=="6" SET ICON=th
IF "%MCHOICE%"=="7" SET ICON=xbow
IF "%MCHOICE%"=="8" SET ICON=sd
IF "%MCHOICE%"=="9" SET ICON=uh
IF "%MCHOICE%"=="0" SET ICON=para
IF "%MCHOICE%"=="x" GOTO menu
IF "%MCHOICE%"=="X" GOTO menu
IF "%ICON%"=="nil" GOTO linker2
SET /P DESKDIR=<"%HKCDIR%\lang.hkc"
"%CURDIR%XXMKLINK.EXE" "%USERPROFILE%\%DESKDIR%\%TTLE%.lnk" "%CURDIR%hkc3.bat" "-SW %PAR%" "%HKCDIR%" "Switch to HK Set %PAR%" "1" "%CURDIR%ico\%ICON%.ico" /q 
CLS
ECHO ###############################################################################
ECHO ###############################################################################
ECHO ##                                                                           ##
ECHO ##  HKC3 - Creating Desktop Shortcuts                                by Flo  ##
ECHO ##  -----------------------------------------------------------------------  ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  Success!                                                                 ##
ECHO ##  A Shortcut to Hotkey Set %PAR% has been created in your desktop.             ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  Or well, hopefully...                                                    ##
ECHO ##  Too lazy to script something to check whether or not it actually worked  ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  Press any key to get back to the main menu.                              ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ###############################################################################
ECHO ###############################################################################
PAUSE
GOTO menu
:linkerS
SET /P DESKDIR=<"%HKCDIR%\lang.hkc"
"%CURDIR%XXMKLINK.EXE" "%USERPROFILE%\%DESKDIR%\Save Hotkey Config.lnk" "%CURDIR%hkc3.bat" "-SV" "%HKCDIR%" "Save Current Config" "1" "%CURDIR%ico\save.ico" /q 
CLS
ECHO ###############################################################################
ECHO ###############################################################################
ECHO ##                                                                           ##
ECHO ##  HKC3 - Creating Desktop Shortcuts                                by Flo  ##
ECHO ##  -----------------------------------------------------------------------  ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  Success!                                                                 ##
ECHO ##  A SAVEALL Shortcut has been created in your desktop.                     ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  Or well, hopefully...                                                    ##
ECHO ##  Too lazy to script something to check whether or not it actually worked  ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  Press any key to get back to the main menu.                              ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ###############################################################################
ECHO ###############################################################################
PAUSE
GOTO menu
:setup
ECHO ###############################################################################
ECHO ###############################################################################
ECHO ##                                                                           ##
ECHO ##  HKC3 - Installation                                              by Flo  ##
ECHO ##  -----------------------------------------------------------------------  ##
ECHO ##                                                                           ##
ECHO ##  Creating AppData Folders...                                              ##
MD "%HKCDIR%">nul
MD "%HKCDIR%\Sets">nul
MD "%HKCDIR%\Backup">nul
MD "%HKCDIR%\Titles">nul
MD "%HKCDIR%\Maps">nul
ECHO ##    Done.                                                                  ##
ECHO ##  Detecting System Language...                                             ##
ECHO hi > "%APPDATA%\HKC3\isset.hkc"
IF EXIST "%USERPROFILE%\desktop" @ECHO desktop> "%HKCDIR%\lang.hkc"
IF EXIST "%USERPROFILE%\skrivbord" @ECHO skrivbord> "%HKCDIR%\lang.hkc"
IF EXIST "%USERPROFILE%\pulpit" @ECHO escritorio> "%HKCDIR%\lang.hkc"
IF EXIST "%USERPROFILE%\escritorio" @ECHO escritorio> "%HKCDIR%\lang.hkc"
IF EXIST "%USERPROFILE%\bureaublad" @ECHO bureaublad> "%HKCDIR%\lang.hkc"
IF EXIST "%USERPROFILE%\ty�p�yt�" @ECHO ty�p�yt�> "%HKCDIR%\lang.hkc"
IF EXIST "%USERPROFILE%\skrivebord" @ECHO skrivebord> "%HKCDIR%\lang.hkc"
IF EXIST "%USERPROFILE%\ambiente de trabalho" @ECHO ambiente de trabalho> "%HKCDIR%\lang.hkc"
IF NOT EXIST "%HKCDIR%\lang.hkc" GOTO langerr
SET /P DESKDIR=<"%HKCDIR%\lang.hkc"
ECHO ##    Done.                                                                  ##
ECHO ##  Checking for older versions...                                           ##
FOR %%I in (0 1 2 3 4 5 6 7 8 9) DO @ECHO Set %%I>"%HKCDIR%\Titles\t%%I.hkc"
IF EXIST "%CFGDIR%\TibiaSet1.cfg" GOTO fromhkc2
IF EXIST "%CFGDIR%\TibiaSet2.cfg" GOTO fromhkc2
ECHO ##    Done. Found none.                                                      ##
ECHO ##  Initialising Hotkey Sets...                                              ##
FOR %%I in (0 1 2 3 4 5 6 7 8 9) DO (COPY "%CFGDIR%\Tibia.cfg" "%HKCDIR%\Sets\%%I.cfg">nul)
ECHO ^1>"%HKCDIR%\active.hkc
FINDSTR /C:"Buddy = (" "%CFGDIR%\Tibia.cfg">"%HKCDIR%\vip.hkc"
ECHO ##    Done.                                                                  ##
ECHO ##  Creating initial Hotkey Backup...                                        ##
FOR %%I in (1 2 3 4 5 6 7 8 9 0) DO COPY "%HKCDIR%\Sets\%%I.cfg" "%HKCDIR%\Backup\%%I.cfg">nul
COPY "%HKCDIR%\vip.hkc" "%HKCDIR%\Backup\vip.hkc">nul
TIME /T> "%HKCDIR%\Backup\t.hkc"
DATE /T> "%HKCDIR%\Backup\d.hkc"
ECHO ##    Done.                                                                  ##
ECHO ##  Creating initial Map Backup...                                           ##
COPY "%CFGDIR%\Automap\*.map" "%HKCDIR%\Maps\*.map">nul
TIME /T> "%HKCDIR%\Maps\t.hkc"
DATE /T> "%HKCDIR%\Maps\d.hkc"
ECHO ##    Done.                                                                  ##
ECHO ##                                                                           ##
ECHO ##  Installation complete, press any key to continue.                        ##
ECHO ###############################################################################
ECHO ###############################################################################
PAUSE
"%CURDIR%XXMKLINK.EXE" "%USERPROFILE%\%DESKDIR%\HKC3.lnk" "%CURDIR%hkc3.bat" "" "%HKCDIR%" "HKC Main Menu" "1" "%CURDIR%ico\hkc3.ico" /q
"%CURDIR%XXMKLINK.EXE" "%USERPROFILE%\%DESKDIR%\Set 1.lnk" "%CURDIR%hkc3.bat" "-SW 1" "%HKCDIR%" "Switch to HK Set 1" "1" "%CURDIR%ico\r1.ico" /q
"%CURDIR%XXMKLINK.EXE" "%USERPROFILE%\%DESKDIR%\Set 2.lnk" "%CURDIR%hkc3.bat" "-SW 2" "%HKCDIR%" "Switch to HK Set 2" "1" "%CURDIR%ico\r2.ico" /q
CLS
ECHO ###############################################################################
ECHO ###############################################################################
ECHO ##                                                                           ##
ECHO ##  HKC3 - Installation                                              by Flo  ##
ECHO ##  -----------------------------------------------------------------------  ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  HKC3 has been successfully installed.                                    ##
ECHO ##                                                                           ##
ECHO ##  Setup has created a Shortcut to the HKC3 main menu as well as            ##
ECHO ##  two shortcuts to switch to Hotkey Set 1 and 2 on your desktop.           ##
ECHO ##  If you are planning on using more than just two hotkey sets you can      ##
ECHO ##  at any time create shortcuts to up to eight more sets -                  ##
ECHO ##  or (new in HKC3) switch sets from the main menu.                         ##
ECHO ##                                                                           ##
ECHO ##  If you are not familiar with HKC2 please refer to the /First Steps/      ##
ECHO ##  chapter in the manual to learn how to use HKC3.                          ##
ECHO ##                                                                           ##
ECHO ##  Press any key to close this window. Have fun with HKC3.             -F   ##
ECHO ##                                                                           ##
ECHO ###############################################################################
ECHO ###############################################################################
ping 127.0.0.1 -n 2 -w 750 > nul
START "" "http://tnuc.org/files/?go=hkchelp"
GOTO pause
:fromhkc2
ECHO ##    Done. Found HKC2.                                                      ##
ECHO ##  Retrieving HKC2 Hotkey Sets...                                           ##
FOR %%J in (1 2 3 4 5 6 7 8) DO IF NOT EXIST "%CFGDIR%\TibiaSet%%J.cfg" @ECHO ^%%J>"%HKCDIR%\active.hkc"
SET /P CURSET=<"%HKCDIR%\active.hkc"
IF "%CURSET%"=="1" (COPY "%CFGDIR%\Tibia.cfg" "%HKCDIR%\Sets\1.cfg">nul) ELSE (COPY "%CFGDIR%\TibiaSet1.cfg" "%HKCDIR%\Sets\1.cfg">nul)
IF "%CURSET%"=="2" (COPY "%CFGDIR%\Tibia.cfg" "%HKCDIR%\Sets\2.cfg">nul) ELSE (COPY "%CFGDIR%\TibiaSet2.cfg" "%HKCDIR%\Sets\2.cfg">nul)
IF "%CURSET%"=="3" (COPY "%CFGDIR%\Tibia.cfg" "%HKCDIR%\Sets\3.cfg">nul) ELSE (COPY "%CFGDIR%\TibiaSet3.cfg" "%HKCDIR%\Sets\3.cfg">nul)
IF "%CURSET%"=="4" (COPY "%CFGDIR%\Tibia.cfg" "%HKCDIR%\Sets\4.cfg">nul) ELSE (COPY "%CFGDIR%\TibiaSet4.cfg" "%HKCDIR%\Sets\4.cfg">nul)
IF "%CURSET%"=="5" (COPY "%CFGDIR%\Tibia.cfg" "%HKCDIR%\Sets\5.cfg">nul) ELSE (COPY "%CFGDIR%\TibiaSet5.cfg" "%HKCDIR%\Sets\5.cfg">nul)
IF "%CURSET%"=="6" (COPY "%CFGDIR%\Tibia.cfg" "%HKCDIR%\Sets\6.cfg">nul) ELSE (COPY "%CFGDIR%\TibiaSet6.cfg" "%HKCDIR%\Sets\6.cfg">nul)
IF "%CURSET%"=="7" (COPY "%CFGDIR%\Tibia.cfg" "%HKCDIR%\Sets\7.cfg">nul) ELSE (COPY "%CFGDIR%\TibiaSet7.cfg" "%HKCDIR%\Sets\7.cfg">nul)
IF "%CURSET%"=="8" (COPY "%CFGDIR%\Tibia.cfg" "%HKCDIR%\Sets\8.cfg">nul) ELSE (COPY "%CFGDIR%\TibiaSet8.cfg" "%HKCDIR%\Sets\8.cfg">nul)
COPY "%CFGDIR%\Tibia.cfg" "%HKCDIR%\Sets\9.cfg">nul
COPY "%CFGDIR%\Tibia.cfg" "%HKCDIR%\Sets\0.cfg">nul
FINDSTR /C:"Buddy = (" "%CFGDIR%\Tibia.cfg">"%HKCDIR%\vip.hkc"
ECHO ##    Done.                                                                  ##
ECHO ##  Creating initial Hotkey Backup...                                        ##
FOR %%I in (1 2 3 4 5 6 7 8 9 0) DO COPY "%HKCDIR%\Sets\%%I.cfg" "%HKCDIR%\Backup\%%I.cfg">nul
COPY "%HKCDIR%\vip.hkc" "%HKCDIR%\Backup\vip.hkc">nul
TIME /T> "%HKCDIR%\Backup\t.hkc"
DATE /T> "%HKCDIR%\Backup\d.hkc"
ECHO ##    Done.                                                                  ##
ECHO ##  Creating initial Map Backup...                                           ##
COPY "%CFGDIR%\Automap\*.map" "%HKCDIR%\Maps\*.map">nul
TIME /T> "%HKCDIR%\Maps\t.hkc"
DATE /T> "%HKCDIR%\Maps\d.hkc"
ECHO ##    Done.                                                                  ##
ECHO ##                                                                           ##
ECHO ##  Installation complete, press any key to continue.                        ##
ECHO ###############################################################################
ECHO ###############################################################################
PAUSE
"%CURDIR%XXMKLINK.EXE" "%USERPROFILE%\%DESKDIR%\HKC3.lnk" "%CURDIR%hkc3.bat" "" "%HKCDIR%" "HKC Main Menu" "1" "%CURDIR%ico\hkc3.ico" /q
"%CURDIR%XXMKLINK.EXE" "%USERPROFILE%\%DESKDIR%\Set 1.lnk" "%CURDIR%hkc3.bat" "-SW 1" "%HKCDIR%" "Switch to HK Set 1" "1" "%CURDIR%ico\r1.ico" /q
"%CURDIR%XXMKLINK.EXE" "%USERPROFILE%\%DESKDIR%\Set 2.lnk" "%CURDIR%hkc3.bat" "-SW 2" "%HKCDIR%" "Switch to HK Set 2" "1" "%CURDIR%ico\r2.ico" /q
CLS
ECHO ###############################################################################
ECHO ###############################################################################
ECHO ##                                                                           ##
ECHO ##  HKC3 - Installation                                              by Flo  ##
ECHO ##  -----------------------------------------------------------------------  ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  HKC3 has been successfully installed.                                    ##
ECHO ##                                                                           ##
ECHO ##  Setup has created a Shortcut to the HKC3 main menu as well as            ##
ECHO ##  two shortcuts to switch to Hotkey Set 1 and 2 on your desktop.           ##
ECHO ##  If you are planning on using more than just two hotkey sets you can      ##
ECHO ##  at any time create shortcuts to up to eight more sets -                  ##
ECHO ##  or (new in HKC3) switch sets from the main menu.                         ##
ECHO ##                                                                           ##
ECHO ##  Before using HKC3 please make sure you remove all HKC2 files and         ##
ECHO ##  shortcut from your system to make sure you don't run those by accident.  ##
ECHO ##                                                                           ##
ECHO ##  Press any key to close this window. Have fun with HKC3.             -F   ##
ECHO ##                                                                           ##
ECHO ###############################################################################
ECHO ###############################################################################
ping 127.0.0.1 -n 2 -w 750 > nul
START "" "http://tnuc.org/files/?go=hkchelp"
GOTO pause
:mswitch
CLS
SET /P TITLE1=<"%HKCDIR%\Titles\t1.hkc"
SET /P TITLE2=<"%HKCDIR%\Titles\t2.hkc"
SET /P TITLE3=<"%HKCDIR%\Titles\t3.hkc"
SET /P TITLE4=<"%HKCDIR%\Titles\t4.hkc"
SET /P TITLE5=<"%HKCDIR%\Titles\t5.hkc"
SET /P TITLE6=<"%HKCDIR%\Titles\t6.hkc"
SET /P TITLE7=<"%HKCDIR%\Titles\t7.hkc"
SET /P TITLE8=<"%HKCDIR%\Titles\t8.hkc"
SET /P TITLE9=<"%HKCDIR%\Titles\t9.hkc"
SET /P TITLE0=<"%HKCDIR%\Titles\t0.hkc"
ECHO ###############################################################################
ECHO ###############################################################################
ECHO ##                                                                           ##
ECHO ##  HKC3 - Switching to another Hotkey Set                           by Flo  ##
ECHO ##  -----------------------------------------------------------------------  ##
ECHO ##                                                                           ##
ECHO ##  (1) %TITLE1%
ECHO ##  (2) %TITLE2%
ECHO ##  (3) %TITLE3%
ECHO ##  (4) %TITLE4%
ECHO ##  (5) %TITLE5%
ECHO ##  (6) %TITLE6%
ECHO ##  (7) %TITLE7%
ECHO ##  (8) %TITLE8%
ECHO ##  (9) %TITLE9%
ECHO ##  (0) %TITLE0%
ECHO ##                                                                           ##
ECHO ##  (X) Back to Main Menu                                                    ##
ECHO ##                                                                           ##
IF NOT EXIST "%HKCDIR%\mc.hkc" ECHO ##  WARNING: MC MODE DISABLED! Make sure Tibia is closed before going on.    ##
IF EXIST "%HKCDIR%\mc.hkc" ECHO ##                                                                           ##
ECHO ###############################################################################
ECHO ###############################################################################
SET /P MCHOICE=
SET PAR=%MCHOICE%
IF "%MCHOICE%"=="1" GOTO switch2
IF "%MCHOICE%"=="2" GOTO switch2
IF "%MCHOICE%"=="3" GOTO switch2
IF "%MCHOICE%"=="4" GOTO switch2
IF "%MCHOICE%"=="5" GOTO switch2
IF "%MCHOICE%"=="6" GOTO switch2
IF "%MCHOICE%"=="7" GOTO switch2
IF "%MCHOICE%"=="8" GOTO switch2
IF "%MCHOICE%"=="9" GOTO switch2
IF "%MCHOICE%"=="0" GOTO switch2
IF "%MCHOICE%"=="x" GOTO menu
IF "%MCHOICE%"=="X" GOTO menu
GOTO mswitch
:switch
SET PAR=%2
:switch2
SET /P FROM=<"%HKCDIR%\active.hkc"
FOR %%R in ("%APPDATA%\Tibia\Tibia.cfg") DO IF %%~zR LSS 1024 GOTO fixcfg
IF EXIST "%HKCDIR%\justoff.hkc" GOTO justoff
IF "%PAR%"=="%FROM%" GOTO swsame
IF EXIST "%HKCDIR%\mc.hkc" GOTO swmc
FINDSTR /C:"Buddy = (" "%CFGDIR%\Tibia.cfg">"%HKCDIR%\vip.hkc"
IF EXIST "%HKCDIR%\Sets\%FROM%.cfg" DEL "%HKCDIR%\Sets\%FROM%.cfg">nul
COPY "%CFGDIR%\Tibia.cfg" "%HKCDIR%\Sets\%FROM%.cfg">nul
DEL "%CFGDIR%\Tibia.cfg">nul
FINDSTR /V /C:"Buddy = (" "%HKCDIR%\Sets\%PAR%.cfg">"%CFGDIR%\Tibia.cfg"
FINDSTR /C:"Buddy = (" "%HKCDIR%\vip.hkc">>"%CFGDIR%\Tibia.cfg"
SET /P TTLE=<"%HKCDIR%\Titles\t%PAR%.hkc"
ECHO ^%PAR%>"%HKCDIR%\active.hkc"
CLS
ECHO ###############################################################################
ECHO ###############################################################################
ECHO ##                                                                           ##
ECHO ##  HKC3 - Switching to another Hotkey Set                           by Flo  ##
ECHO ##  -----------------------------------------------------------------------  ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  -NORMAL MODE-                                                            ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  Hotkey Set %PAR%, %TTLE%
ECHO ##    has been successfully activated.                                       ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  Press any key to close this window.                                      ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ###############################################################################
ECHO ###############################################################################
IF EXIST "%HKCDIR%\boot.hkc" GOTO boot
IF EXIST "%HKCDIR%\silent.hkc" GOTO end
GOTO pause
:justoff
DEL "%CFGDIR%\Tibia.cfg">nul
DEL "%HKCDIR%\justoff.hkc">nul
FINDSTR /V /C:"Buddy = (" "%HKCDIR%\Sets\%PAR%.cfg">"%CFGDIR%\Tibia.cfg"
FINDSTR /C:"Buddy = (" "%HKCDIR%\vip.hkc">>"%CFGDIR%\Tibia.cfg"
SET /P TTLE=<"%HKCDIR%\Titles\t%PAR%.hkc"
ECHO ^%PAR%>"%HKCDIR%\active.hkc"
CLS
ECHO ###############################################################################
ECHO ###############################################################################
ECHO ##                                                                           ##
ECHO ##  HKC3 - Switching to another Hotkey Set                           by Flo  ##
ECHO ##  -----------------------------------------------------------------------  ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  -NOTICE-                                                                 ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  Hotkey Set %PAR%, %TTLE%
ECHO ##    has been successfully activated.                                       ##
ECHO ##                                                                           ##
ECHO ##  This was the first time you switched Sets after disabling MC mode,       ##
ECHO ##  therefore the previous Set was not saved.                                ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  Press any key to close this window.                                      ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ###############################################################################
ECHO ###############################################################################
GOTO pause
:fixcfg
IF EXIST "%CFGDIR%\Tibia.cfg" DEL "%CFGDIR%\Tibia.cfg"
FINDSTR /V /C:"Buddy = (" "%HKCDIR%\Sets\%FROM%.cfg">"%CFGDIR%\Tibia.cfg"
FINDSTR /C:"Buddy = (" "%HKCDIR%\vip.hkc">>"%CFGDIR%\Tibia.cfg"
CLS
ECHO ###############################################################################
ECHO ###############################################################################
ECHO ##                                                                           ##
ECHO ##  HKC3 - Automatic Config Restore                                  by Flo  ##
ECHO ##  -----------------------------------------------------------------------  ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  -NOTICE-                                                                 ##
ECHO ##                                                                           ##
ECHO ##  Your last used Tibia.cfg file seemed strangely small.                    ##
ECHO ##  It might have been reset by playing a client or watching a cam           ##
ECHO ##  older than version 8.41.                                                 ##
ECHO ##                                                                           ##
ECHO ##  HKC has automatically restored the previous config, no data lost.        ##
ECHO ##  If you were attempting to switch to another Hotkey Set, this was         ##
ECHO ##  aborted. Just do it again to go on as if nothing happened.               ##
ECHO ##                                                                           ##
ECHO ##  Press any key to close this window.                                      ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ###############################################################################
ECHO ###############################################################################
GOTO pause
:swsame
IF EXIST "%HKCDIR%\mc.hkc" GOTO swmc
SET /P TTLE=<"%HKCDIR%\Titles\t%PAR%.hkc"
ECHO ^%PAR%>"%HKCDIR%\active.hkc"
CLS
ECHO ###############################################################################
ECHO ###############################################################################
ECHO ##                                                                           ##
ECHO ##  HKC3 - Switching to another Hotkey Set                           by Flo  ##
ECHO ##  -----------------------------------------------------------------------  ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  -NORMAL MODE-                                                            ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  Hotkey Set %PAR%, %TTLE%
ECHO ##    is already active.                                                     ##
ECHO ##                                                                           ##
ECHO ##  No action has been taken.                                                ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  Press any key to close this window.                                      ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ###############################################################################
ECHO ###############################################################################
IF EXIST "%HKCDIR%\boot.hkc" GOTO boot
IF EXIST "%HKCDIR%\silent.hkc" GOTO end
GOTO pause 
:swmc
IF EXIST "%CFGDIR%\Tibia.cfg" DEL "%CFGDIR%\Tibia.cfg"
FINDSTR /V /C:"Buddy = (" "%HKCDIR%\Sets\%PAR%.cfg">"%CFGDIR%\Tibia.cfg"
FINDSTR /C:"Buddy = (" "%HKCDIR%\vip.hkc">>"%CFGDIR%\Tibia.cfg"
SET /P TTLE=<"%HKCDIR%\Titles\t%PAR%.hkc"
ECHO ^%PAR%>"%HKCDIR%\active.hkc"
CLS
ECHO ###############################################################################
ECHO ###############################################################################
ECHO ##                                                                           ##
ECHO ##  HKC3 - Switching to another Hotkey Set                           by Flo  ##
ECHO ##  -----------------------------------------------------------------------  ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  -MC MODE-                                                                ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  Hotkey Set %PAR%, %TTLE%
ECHO ##    has been successfully activated.                                       ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  Press any key to close this window.                                      ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ###############################################################################
ECHO ###############################################################################
IF EXIST "%HKCDIR%\boot.hkc" GOTO boot
IF EXIST "%HKCDIR%\silent.hkc" GOTO end
GOTO pause
:saveall
SET /P CURSET=<"%HKCDIR%\active.hkc"
:saveallb
SET /P CURTITLE=<"%HKCDIR%\Titles\t%CURSET%.hkc"
FOR %%I IN (0 1 2 3 4 5 6 7) DO FINDSTR /C:"Hotkey = (%%I," "%CFGDIR%\Tibia.cfg">"%HKCDIR%\hktmp%%I.hkc"
FOR %%J IN (0 1 2 3 4 5 6 7) DO SET /P THK%%J=<"%HKCDIR%\hktmp%%J.hkc"
FOR %%K IN (0 1 2 3 4 5 6 7) DO DEL "%HKCDIR%\hktmp%%K.hkc">nul
:saveall2
CLS
ECHO ###############################################################################
ECHO ###############################################################################
ECHO ##                                                                           ##
ECHO ##  HKC3 - Save Current Config                                       by Flo  ##
ECHO ##  -----------------------------------------------------------------------  ##
ECHO ##                                                                           ##
ECHO ##  Are you sure you want to save the current config?                        ##
ECHO ##  Hotkey Set %CURSET%, %CURTITLE%
ECHO ##                                                                           
ECHO ##  %THK0%
ECHO ##  %THK1%
ECHO ##  %THK2%
ECHO ##  %THK3%
ECHO ##  %THK4%
ECHO ##  %THK5%
ECHO ##  %THK6%
ECHO ##  %THK7%
ECHO ##                                                                           ##
ECHO ##  (1) Yes, save       (2) Save as a different set          (X) No, cancel  ##
ECHO ##                                                                           ##
ECHO ###############################################################################
ECHO ###############################################################################
SET /P MCHOICE=
IF "%MCHOICE%"=="1" GOTO saveall3
IF "%MCHOICE%"=="2" GOTO savealt
IF "%MCHOICE%"=="X" GOTO savetmp
IF "%MCHOICE%"=="x" GOTO savetmp
GOTO saveall2
:savetmp
IF "%1"=="-SV" GOTO end
GOTO menu
:saveall3
SET /P FROM=<"%HKCDIR%\active.hkc"
FINDSTR /C:"Buddy = (" "%CFGDIR%\Tibia.cfg">"%HKCDIR%\vip.hkc"
IF EXIST "%HKCDIR%\Sets\%FROM%.cfg" DEL "%HKCDIR%\Sets\%FROM%.cfg">nul
COPY "%CFGDIR%\Tibia.cfg" "%HKCDIR%\Sets\%FROM%.cfg">nul
CLS
ECHO ###############################################################################
ECHO ###############################################################################
ECHO ##                                                                           ##
ECHO ##  HKC3 - Save Current Config                                       by Flo  ##
ECHO ##  -----------------------------------------------------------------------  ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  Success!                                                                 ##
ECHO ##  Current Hotkey Set has been saved.                                       ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
IF "%1"=="-SV" ECHO ##  Press any key to close this window.                                      ##
IF NOT "%1"=="-SV" ECHO ##  Press any key to get back to the main menu.                              ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ###############################################################################
ECHO ###############################################################################
IF "%1"=="-SV" IF EXIST "%HKCDIR%\silent.hkc" GOTO end
IF "%1"=="-SV" GOTO pause
PAUSE
GOTO menu
:savealt
CLS
SET /P TITLE1=<"%HKCDIR%\Titles\t1.hkc"
SET /P TITLE2=<"%HKCDIR%\Titles\t2.hkc"
SET /P TITLE3=<"%HKCDIR%\Titles\t3.hkc"
SET /P TITLE4=<"%HKCDIR%\Titles\t4.hkc"
SET /P TITLE5=<"%HKCDIR%\Titles\t5.hkc"
SET /P TITLE6=<"%HKCDIR%\Titles\t6.hkc"
SET /P TITLE7=<"%HKCDIR%\Titles\t7.hkc"
SET /P TITLE8=<"%HKCDIR%\Titles\t8.hkc"
SET /P TITLE9=<"%HKCDIR%\Titles\t9.hkc"
SET /P TITLE0=<"%HKCDIR%\Titles\t0.hkc"
ECHO ###############################################################################
ECHO ###############################################################################
ECHO ##                                                                           ##
ECHO ##  HKC3 - Save Current Config                                       by Flo  ##
ECHO ##  -----------------------------------------------------------------------  ##
ECHO ##                                                                           ##
ECHO ##  (1) %TITLE1%
ECHO ##  (2) %TITLE2%
ECHO ##  (3) %TITLE3%
ECHO ##  (4) %TITLE4%
ECHO ##  (5) %TITLE5%
ECHO ##  (6) %TITLE6%
ECHO ##  (7) %TITLE7%
ECHO ##  (8) %TITLE8%
ECHO ##  (9) %TITLE9%
ECHO ##  (0) %TITLE0%
ECHO ##                                                                           ##
IF NOT "%1"=="-SV" ECHO ##  (X) Back to Main Menu                                                    ##
IF "%1"=="-SV" ECHO ##  (X) Cancel                                                               ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ###############################################################################
ECHO ###############################################################################
SET /P MCHOICE=
SET CURSET=%MCHOICE%
IF "%MCHOICE%"=="1" GOTO saveallb
IF "%MCHOICE%"=="2" GOTO saveallb
IF "%MCHOICE%"=="3" GOTO saveallb
IF "%MCHOICE%"=="4" GOTO saveallb
IF "%MCHOICE%"=="5" GOTO saveallb
IF "%MCHOICE%"=="6" GOTO saveallb
IF "%MCHOICE%"=="7" GOTO saveallb
IF "%MCHOICE%"=="8" GOTO saveallb
IF "%MCHOICE%"=="9" GOTO saveallb
IF "%MCHOICE%"=="0" GOTO saveallb
IF "%MCHOICE%"=="X" GOTO savetmp
IF "%MCHOICE%"=="x" GOTO savetmp
GOTO savealt
:backup
CLS
ECHO ###############################################################################
ECHO ###############################################################################
ECHO ##                                                                           ##
ECHO ##  HKC3 - Backup                                                    by Flo  ##
ECHO ##  -----------------------------------------------------------------------  ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  (1) Backup Hotkey Sets                                                   ##
ECHO ##  (2) Restore Hotkey Sets                                                  ##
ECHO ##                                                                           ##
ECHO ##  (4) Backup Mapfiles                                                      ##
ECHO ##  (5) Restore Mapfiles                                                     ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  (X) Back to Main Menu                                                    ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ###############################################################################
ECHO ###############################################################################
SET /P MCHOICE=
IF "%MCHOICE%"=="1" GOTO hback
IF "%MCHOICE%"=="2" GOTO hrest
IF "%MCHOICE%"=="4" GOTO mback
IF "%MCHOICE%"=="5" GOTO mrest
IF "%MCHOICE%"=="X" GOTO menu
IF "%MCHOICE%"=="x" GOTO menu
GOTO backup
:hback
CLS
ECHO ###############################################################################
ECHO ###############################################################################
ECHO ##                                                                           ##
ECHO ##  HKC3 - Hotkey Sets Backup                                        by Flo  ##
ECHO ##  -----------------------------------------------------------------------  ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  (1) Yes, make a backup                                                   ##
ECHO ##  (2) No, cancel                                                           ##
ECHO ##                                                                           ##
ECHO ##  (X) Back to Main Menu                                                    ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  Making a backup of your hotkey sets will copy them including VIP data    ##
ECHO ##  to a separate location inside your HKC3 Folder. You can restore your     ##
ECHO ##  hotkeys from this backup in case you fuck up somehow.                    ##
ECHO ##                                                                           ##
ECHO ##  NOTE: Unsaved changes after last switching will not be backed up.        ##
ECHO ##  NOTE: Previous backups will be overwritten.                              ##
ECHO ##                                                                           ##
ECHO ###############################################################################
ECHO ###############################################################################
SET /P MCHOICE=
IF "%MCHOICE%"=="1" GOTO hback2
IF "%MCHOICE%"=="2" GOTO backup
IF "%MCHOICE%"=="X" GOTO menu
IF "%MCHOICE%"=="x" GOTO menu
GOTO hback
:hback2
DEL "%HKCDIR%\Backup\*.cfg">nul
DEL "%HKCDIR%\Backup\*.hkc">nul
TIME /T> "%HKCDIR%\Backup\t.hkc"
DATE /T> "%HKCDIR%\Backup\d.hkc"
FOR %%I IN (0 1 2 3 4 5 6 7 8 9) DO COPY "%HKCDIR%\Sets\%%I.cfg" "%HKCDIR%\Backup\%%I.cfg">nul
COPY "%HKCDIR%\vip.hkc" "%HKCDIR%\Backup\vip.hkc">nul
CLS
ECHO ###############################################################################
ECHO ###############################################################################
ECHO ##                                                                           ##
ECHO ##  HKC3 - Hotkey Sets Backup                                        by Flo  ##
ECHO ##  -----------------------------------------------------------------------  ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  Success!                                                                 ##
ECHO ##  Hotkey Sets have been backed up.                                         ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  Press any key to get back to the main menu.                              ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ###############################################################################
ECHO ###############################################################################
PAUSE
GOTO menu
:mback
CLS
ECHO ###############################################################################
ECHO ###############################################################################
ECHO ##                                                                           ##
ECHO ##  HKC3 - Mapfiles Backup                                           by Flo  ##
ECHO ##  -----------------------------------------------------------------------  ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  (1) Yes, make a backup (may take 1-2 minutes)                            ##
ECHO ##  (2) No, cancel                                                           ##
ECHO ##                                                                           ##
ECHO ##  (X) Back to Main Menu                                                    ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  Making a backup of your mapfiles will copy all your mapfiles to your     ##
ECHO ##  your HKC3 Folder. You can restore your maps from this backup in case     ##
ECHO ##  you lose yours.                                                          ##
ECHO ##  (Really, never lost mine, no idea how you guys keep doing it lol)        ##
ECHO ##                                                                           ##
ECHO ##  NOTE: Previous backups will be overwritten.                              ##
ECHO ##                                                                           ##
ECHO ###############################################################################
ECHO ###############################################################################
SET /P MCHOICE=
IF "%MCHOICE%"=="1" GOTO mback2
IF "%MCHOICE%"=="2" GOTO backup
IF "%MCHOICE%"=="X" GOTO menu
IF "%MCHOICE%"=="x" GOTO menu
GOTO mback
:mback2
DEL "%HKCDIR%\Maps\*.map">nul
COPY "%CFGDIR%\Automap\*.map" "%HKCDIR%\Maps\*.map">nul
TIME /T> "%HKCDIR%\Maps\t.hkc"
DATE /T> "%HKCDIR%\Maps\d.hkc"
CLS
ECHO ###############################################################################
ECHO ###############################################################################
ECHO ##                                                                           ##
ECHO ##  HKC3 - Mapfiles Backup                                           by Flo  ##
ECHO ##  -----------------------------------------------------------------------  ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  Success!                                                                 ##
ECHO ##  Mapfiles have been backed up.                                            ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  Press any key to get back to the main menu.                              ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ###############################################################################
ECHO ###############################################################################
PAUSE
GOTO menu
:mrest
SET /P RESTDATE=<"%HKCDIR%\Maps\d.hkc"
SET /P TIME=<"%HKCDIR%\Maps\t.hkc"
CLS
ECHO ###############################################################################
ECHO ###############################################################################
ECHO ##                                                                           ##
ECHO ##  HKC3 - Mapfiles Restore                                          by Flo  ##
ECHO ##  -----------------------------------------------------------------------  ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  (1) Yes, restore my mapfiles (may take 1-2 minutes)                      ##
ECHO ##  (2) No, cancel                                                           ##
ECHO ##                                                                           ##
ECHO ##  (X) Back to Main Menu                                                    ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  When restoring your mapfiles backup all mapfiles in your Tibia           ##
ECHO ##  folder -which means the maps you are using at the moment- will be        ##
ECHO ##  deleted and replaced by the ones from your last backup.                  ##
ECHO ##                                                                           ##
ECHO ##  Last backup was made %RESTDATE%, %TIME%                                  ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ###############################################################################
ECHO ###############################################################################
SET /P MCHOICE=
IF "%MCHOICE%"=="1" GOTO mrest2
IF "%MCHOICE%"=="2" GOTO backup
IF "%MCHOICE%"=="X" GOTO menu
IF "%MCHOICE%"=="x" GOTO menu
GOTO mrest
:mrest2
DEL "%CFGDIR%\Automap\*.map">nul
COPY "%HKCDIR%\Maps\*.map" "%CFGDIR%\Automap\*.map">nul
CLS
ECHO ###############################################################################
ECHO ###############################################################################
ECHO ##                                                                           ##
ECHO ##  HKC3 - Mapfiles Restore                                          by Flo  ##
ECHO ##  -----------------------------------------------------------------------  ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  Success!                                                                 ##
ECHO ##  Mapfiles have been restored.                                             ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  Press any key to get back to the main menu.                              ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ###############################################################################
ECHO ###############################################################################
PAUSE
GOTO menu
:hrest
SET /P RESTDATE=<"%HKCDIR%\Backup\d.hkc"
SET /P TIME=<"%HKCDIR%\Backup\t.hkc"
CLS
ECHO ###############################################################################
ECHO ###############################################################################
ECHO ##                                                                           ##
ECHO ##  HKC3 - Hotkey Sets Restore                                       by Flo  ##
ECHO ##  -----------------------------------------------------------------------  ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  (1) Yes, restore my hotkey sets                                          ##
ECHO ##  (2) No, cancel                                                           ##
ECHO ##                                                                           ##
ECHO ##  (X) Back to Main Menu                                                    ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  When restoring your hotkey sets backup all your current hotkey sets      ##
ECHO ##  will be deleted and replaced by the ones from your last backup.          ##
ECHO ##  (Fuck me, who would have guessed that?)                                  ##
ECHO ##                                                                           ##
ECHO ##  Last backup was made %RESTDATE%, %TIME%                                  ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ###############################################################################
ECHO ###############################################################################
SET /P MCHOICE=
IF "%MCHOICE%"=="1" GOTO hrest2
IF "%MCHOICE%"=="2" GOTO backup
IF "%MCHOICE%"=="X" GOTO menu
IF "%MCHOICE%"=="x" GOTO menu
GOTO hrest
:hrest2
IF EXIST "%HKCDIR%\justoff.hkc" DEL "%HKCDIR%\justoff.hkc">nul
DEL "%HKCDIR%\vip.hkc">nul
COPY "%HKCDIR%\Backup\vip.hkc" "%HKCDIR%\vip.hkc">nul
DEL "%HKCDIR%\Sets\*.cfg">nul
FOR %%I IN (0 1 2 3 4 5 6 7 8 9) DO COPY "%HKCDIR%\Backup\%%I.cfg" "%HKCDIR%\Sets\%%I.cfg">nul
DEL "%CFGDIR%\Tibia.cfg">nul
SET /P PAR=<"%HKCDIR%\active.hkc"
FINDSTR /V /C:"Buddy = (" "%HKCDIR%\Sets\%PAR%.cfg">"%CFGDIR%\Tibia.cfg"
FINDSTR /C:"Buddy = (" "%HKCDIR%\vip.hkc">>"%CFGDIR%\Tibia.cfg"
CLS
ECHO ###############################################################################
ECHO ###############################################################################
ECHO ##                                                                           ##
ECHO ##  HKC3 - Hotkey Sets Restore                                       by Flo  ##
ECHO ##  -----------------------------------------------------------------------  ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  Success!                                                                 ##
ECHO ##  Hotkey Sets have been restored.                                          ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  Press any key to get back to the main menu.                              ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ###############################################################################
ECHO ###############################################################################
PAUSE
GOTO menu
:direrr
ECHO ###############################################################################
ECHO ###############################################################################
ECHO ##                                                                           ##
ECHO ##  HKC3 - Error                                                     by Flo  ##
ECHO ##  -----------------------------------------------------------------------  ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  Could not find ..\Tibia.exe                                              ##
ECHO ##  Please put your HKC3 folder into your Tibia folder.                      ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  Example:                                                                 ##
ECHO ##  C:\Program Files\Tibia\HKC3\                                             ##
ECHO ##  D:\Tibia\HKC3\                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ###############################################################################
ECHO ###############################################################################
GOTO pause
:mcerr
ECHO ###############################################################################
ECHO ###############################################################################
ECHO ##                                                                           ##
ECHO ##  HKC3 - Error                                                     by Flo  ##
ECHO ##  -----------------------------------------------------------------------  ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  Could not find ..\mc85.exe                                               ##
ECHO ##                                                                           ##
ECHO ##  You are using an alternative version of HKC3 that was made to comply     ##
ECHO ##  with Lord of War's (NG) MC for Tibia 8.5.                                ##
ECHO ##                                                                           ##
ECHO ##  Won't get HKC3 to run without it, blame your own idiocy.                 ##
ECHO ##  If you get this message after Tibia got updated and you deleted the old  ##
ECHO ##  MC either check http://tnuc.org for a new version or instead rename      ##
ECHO ##  your new MC (mc83.exe, mc83.exe, mc842.exe,whatever it may be called)    ##
ECHO ##  to mc85.exe. OR make a fake file called mc85 and change the file         ##
ECHO ##  extension to .exe, though Boot mode will result in an error then,        ##
ECHO ##  logically.                                                               ##
ECHO ##                                                                           ##
ECHO ###############################################################################
ECHO ###############################################################################
GOTO pause
:xxmerr
ECHO ###############################################################################
ECHO ###############################################################################
ECHO ##                                                                           ##
ECHO ##  HKC3 - Error                                                     by Flo  ##
ECHO ##  -----------------------------------------------------------------------  ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  Could not find XXMKLINK.EXE                                              ##
ECHO ##                                                                           ##
ECHO ##  What the fuck are you doing?                                             ##
ECHO ##  Why did you even take it out of this folder?                             ##
ECHO ##  Get it back in here.                                                     ##
ECHO ##                                                                           ##
ECHO ##  // But man... exe is hack :( //                                          ##
ECHO ##  Fuck yourself then, you won't get HKC to run without it.                 ##
ECHO ##                                                                           ##
ECHO ##  Unless you know batch, that is, HEHE.                                    ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ###############################################################################
ECHO ###############################################################################
GOTO pause
:icoerr
ECHO ###############################################################################
ECHO ###############################################################################
ECHO ##                                                                           ##
ECHO ##  HKC3 - Error                                                     by Flo  ##
ECHO ##  -----------------------------------------------------------------------  ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  Could not find Icon files                                                ##
ECHO ##                                                                           ##
ECHO ##  What the fuck are you doing?                                             ##
ECHO ##  You were supposed to move the HKC folder as whole.                       ##
ECHO ##  Get the Icons back into your HKC3\Icons\ folder.                         ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##  PS: You're XXXX.                                                          ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ###############################################################################
ECHO ###############################################################################
GOTO pause
:langerr
ECHO ##    ERROR.                                                                 ##
ECHO ##                                                                           ##
ECHO ## System Language not supported.                                            ##
ECHO ## Aborting Setup...                                                         ##
ECHO ## Uninstalling HKC3...                                                      ##
DEL "%HKCDIR%\Sets\*.*">nul
DEL "%HKCDIR%\Backup\*.*">nul
DEL "%HKCDIR%\Titles\*.*">nul
DEL "%HKCDIR%\Maps\*.*">nul
RMDIR "%HKCDIR%\Sets">nul
RMDIR "%HKCDIR%\Backup">nul
RMDIR "%HKCDIR%\Titles">nul
RMDIR "%HKCDIR%\Maps">nul
DEL "%HKCDIR%\*.*">nul
RMDIR "%HKCDIR%">nul
ECHO ##    Done.                                                                  ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ##                                                                           ##
ECHO ###############################################################################
ECHO ###############################################################################
GOTO pause
:boot
START "" "%CURDIR%..\mc85.exe"
IF EXIST "%HKCDIR%\silent.hkc" GOTO end
:pause
PAUSE
:: Wow, did you really read all through this you paranoid whore?
:: If I wanted to hack you I wouldn't use batch :S
:end