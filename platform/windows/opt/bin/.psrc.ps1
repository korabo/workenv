# Microsoft.Powershell_profile.ps1
# 1.2 ST(KRB/SPG) 190930
# in powershell, crate/update profile like below
# . c:\opt\bin\.psrc.ps1
# .prof-upd

echo "usgin profile of c:\opt\bin\.psrc.ps1"
# ${ENV:userprofile}\OneDrive\ドキュメント\PowerShell\Microsoft.PowerShell_profile.ps1
# ${ENV:userprofile}\OneDrive\ドキュメント\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

# create/update profile
function global:.prof-upd {
  # スクリプト実行が許可されていなければ許可する
  if((Get-ExecutionPolicy -Scope LocalMachine) -ne "RemoteSigned"){
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
  }
  # Profile が無ければ作成
  if (!(test-path $profile)) {
    echo "create profile at $profile"
    new-item -path $profile -itemtype file -force
  }
  echo "Add source line to file: $profile"
  echo "Only 1 line is enough, please remove excess lines."
  echo '# .psrc.ps1 v1.0-210611 ST(KRB/SPG/RPA/SCR)' >> $profile
  echo '. "c:\opt\bin\.psrc.ps1"' >> $profile
  notepad $profile
}

# setup env.
if (!(Test-Path env:_MYENV_)) {
  $ENV:_SCOOP_SHIMS_PATH_ = "${ENV:USERPROFILE}\scoop\shims"
  $ENV:_SCOOP_APPS_PATH_  = "${ENV:USERPROFILE}\scoop\apps"
  $ENV:_LIBREOFFICE_PATH_ = "${ENV:_SCOOP_APPS_PATH_}\libreoffice-stable\current"
  $ENV:_LIBREOFFICE_      = "LibreOfficePortable.exe"

  # -- Alias --
  # -- hlp --
  New-Alias hlp c:\opt\bin\hlp.cmd
  # -- Scoop Apps --
  function global:scapps {
    Get-ChildItem "${ENV:_SCOOP_SHIMS_PATH_}\*.exe"
  }
  # -- if other env setup exist --
  # . c:\opt\bin\.env.ps1

  # -- opt/bin --
  $Env:PATH = "C:\opt\bin;${ENV:PATH}"
  # LibreOffice
  $Env:PATH = "${ENV:_LIBREOFFICE_PATH_};${ENV:PATH}"
  # if VSC is in Other than scoop path
  # $Env:PATH = "C:\opt\Programs\Microsoft VS Code;${ENV:PATH}"

  # . C:\opt\bin\hlp
  # ver
  echo "setup done; 'hlp' to show help"

}

$Env:_MYENV_ = "MyEnv"
