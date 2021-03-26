@echo off
:# .cmdrc.cmd
:# 1.3 ST(KRB/SPG/SCR/RPAT/OPA) 210327
:# if wants auto-load, add registry like below
:# REG ADD "HKCU\Software\Microsoft\Command Processor" /v AutoRun /t REG_EXPAND_SZ /d "c:\opt\bin\.cmdrc.cmd"

if DEFINED _MYENV_ GOTO _END_

set _SCOOP_SHIMS_PATH_=%USERPROFILE%\scoop\shims
set _SCOOP_APPS_PATH_=%USERPROFILE%\scoop\apps
set _LIBREOFFICE_PATH_=%_SCOOP_APPS_PATH_%\libreoffice-stable\current
set _LIBREOFFICE_=LibreOfficePortable.exe

:# -- Alias --
:# -- hlp --
doskey hlp=call c:\opt\bin\hlp.cmd
:# -- Scoop Apps --
doskey scapps=dir %_SCOOP_SHIMS_PATH_%\*.exe $*
:# -- if other env setup exist --
:# call c:\opt\bin\.env.cmd

:# -- opt/bin --
set "PATH=C:\opt\bin;%PATH%"
:# LibreOffice
set "PATH=%_LIBREOFFICE_PATH_%;%PATH%"
:# if VSC is in Other than scoop path
:# set "PATH=C:\opt\Programs\Microsoft VS Code;%PATH%"

:# call C:\opt\bin\hlp

set _MYENV_=MyEnv
:# ver
echo "setup done; 'hlp' to show help"

:_END_
@echo on
