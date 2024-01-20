# :resetwsl.ps1

$scriptBlock = {
    Write-Host "Restarting WSL2"
    taskkill /f /im wslservice.exe /im wslhost.exe /im wsl.exe
    wsl --shutdown
    sleep 3
    powershell -Command "{Get-Service LxssManager|Restart-Service}"
    sleep 3
    Write-Host "Restarted WSL2"
}

# sudo powershell -c "echo taskkill /f /im wslservice.exe /im wslhost.exe /im wsl.exe;sleep 3;echo wsl --shutdown"

sudo powershell -Command "& { $scriptBlock }"

bash
