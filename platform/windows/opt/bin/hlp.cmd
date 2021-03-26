@echo off
echo - - - - - - - - [ HELP ]
echo hlp             : help diplay for this
if NOT DEFINED _MYENV_ GOTO _BODY_
:# -- doskey --
echo - - - - - - - - [ ALIAS ]
echo scapps          : show scoop CLI applications
:# -- setuped path --
echo - - - - - - - - [ OPT/BIN ]
echo hosts           : for open ^%systemroot^%\system32\drivers\etc or -e: edit
echo mysbench        : for start MySQLWorkbench
echo libreoffice     : LibreOfficePortable
echo localc          : LibreOfficeCalcPortable
GOTO _DFLT_

:_BODY_
echo ##
echo ## For extened environment, execute below.
echo ## call c:\opt\bin\.cmdrc.cmd
echo ##
:_DFLT_
:# -- scoop --
echo - - - - - - - - [ TERMINAL ]
echo wt              : for Windows Terminal
echo powershell      : for Windows Power Shell 5.1 with NO-Profile
echo pwsh            : for Windows Power Shell Core (7.x) with NO-Profile
echo cmd             : for cmd.exe with NO-Profile
echo - - - - - - - - [ SCOOP ]
echo sakura,rlogin,mysqlworkbench,chrome,firefox,,
echo code            : for Visual Studio Code
echo chrome          : for Google Chrome Browser
echo firefox         : for Firefox Browser
echo keepassxc       : for keep password secret
:# echo Cygwin.lnk      : for Cygwin64 Terminal
:# -- system application --
echo - - - - - - - - [ WINDOWS ]
echo notepad         : for NotePad
echo mspaint         : for PaintBrush
echo calc            : for Calculator
echo - - - - - - - - - - - - - - - - - - - - - - -

:END
@echo on
