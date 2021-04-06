Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco install firefox
choco install spotify
choco install telegram
choco install microsoft-teams

choco install git
choco install nodejs
choco install postgresql

choco install dbeaver
choco install vscode
choco install intellijidea-community
