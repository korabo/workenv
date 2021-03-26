@echo off
REM https://qiita.com/yz2cm/items/8058d503a1b84688af09
set _HOSTS_PATH_=C:\Windows\system32\drivers\etc
if "%1"=="-h" (
  set "_USG0_=Usage: %0 (<-h|-e> <notepad|sakura>)"
  set "_USG1_=   -h:help, -e:edit"
  set "_USG2_=e.g.): %0 -h  -> show help"
  set "_USG3_=     : %0     -> open directory %_HOSTS_PATH_%"
  set "_USG4_=     : %0 -e  -> edit hosts file with notepad/sakura"
  setlocal EnableDelayedExpansion
  (
    echo !_USG0_!
    echo !_USG1_!
    echo !_USG2_!
    echo !_USG3_!
    echo !_USG4_!
  )
  GOTO END
)

if /I "%1" EQU ""         GOTO EXPL
if /I "%2" EQU "sakura"   GOTO SAKURA
if /I "%2" EQU "notepad"  GOTO NOTEPAD

if DEFINED _MYENV_        GOTO SAKURA
GOTO NOTEPAD

:NOTEPAD
set "_EDITOR_=notepad.exe"
GOTO EDIT

:SAKURA
set "_EDITOR_=sakura.exe"
GOTO EDIT

:EDIT
echo "%_EDITOR_% %_HOSTS_PATH_%\hosts"
start /B %_EDITOR_% %_HOSTS_PATH_%\hosts
GOTO END

:EXPL
explorer %_HOSTS_PATH_%

:END
@echo on
