# workenv
CLI Oriented working env. on Windows
Windowsコマンドライン中心設定
- Ver:1.0.2 Rev:20220814 ST(KRB) LibreOffice

## Directries
```powershell
mkdir c:\home\seeds
mkdir c:\home\docs
mkdir c:\opt\bin
mkdir c:\opt\tools
mkdir c:\tmp
mkdir c:\var
```
## Scripts
### copy files from git
```powershell
cd \tmp
git clone https://github.com/korabo/workenv
cd workenv\platform\windows\opt\bin
cp * \opt\bin
```

### setup Profiles (cmd.exe, powershell, pwsh)
#### CMD.EXE
```powershell
REG ADD "HKCU\Software\Microsoft\Command Processor" /v AutoRun /t REG_EXPAND_SZ /d "c:\opt\bin\.cmdrc.cmd"
```

* If same key on HKLM, that has higher priority. In that case, please remove or modify 'AutoRun' on HKLM.
* HKCU: Hkey Current User
* HKLM: Hkey Local Machine

Start cmd.exe , setup profile, you can use 'hlp' to show custom help.

```powershell
cmd.exe
hlp
```
#### WindowsPowerShell
```powershell
powershell
. c:\opt\bin\.psrc.ps1
.prof-upd
```

Display notepad with profile line as below.
If duplicated lines there, please remove excesses.

```text
# .psrc.ps1 v1.0-210611 ST(KRB/SPG/RPA/SCR)
. c:\opt\bin\.psrc.ps1
```

IMPORTANT first '.' must be, as to source script.

# Pwsh (PowerShell Core)
```powershell
type $profile
```

If file exists and including same profile lines as WindowsPowerShell, then it is enough, no more actions needed.
But if no profile here, then do as WindowsPowerShell.

```powershell
. c:\opt\bin\.psrc.ps1
.prof-upd
```

