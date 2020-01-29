# Install Windows Programs
# 
# ----
# 
# Requirements:
#  - Windows machine
#  - Enable PowerShell scripts: Set-ExecutionPolicy Bypass
#    - https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7
#  - Run in Powershell as an administrator user: .\install-windows-programs.ps1

# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install Chocolately packages from a text file
#  - One per line in the text file
#  - Packages listed at https://chocolatey.org/packages
if (!(Test-Path .\windows-programs.txt)) {
  Write-Warning "Package text file doesn't exist, please create 'windows-programs-example.txt' based on 'windows-programs-example.txt'"
} else {
  foreach ($line in Get-Content .\windows-programs.txt) {
    if ($line -match $regex) {
      choco install $line -y
    }
  }
}
