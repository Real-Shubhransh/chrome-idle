# ===== CONFIG =====
$downloadUrl = "https://github.com/Real-Shubhransh/chrome-idle/releases/latest/download/chrome_idle.exe"
$appName = "chrome_idle"
$exeName = "chrome_idle.exe"

# Install location (user-level, no admin required)
$installDir = "$env:LOCALAPPDATA\Programs\$appName"
$exePath = Join-Path $installDir $exeName

# Start Menu shortcut name
$shortcutName = "chrome idle.lnk"
$startMenuPath = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs"
$shortcutPath = Join-Path $startMenuPath $shortcutName

# ===== CREATE INSTALL DIR =====
if (!(Test-Path $installDir)) {
    New-Item -ItemType Directory -Path $installDir | Out-Null
}

# ===== DOWNLOAD EXE =====
Write-Output "Downloading EXE..."
Invoke-WebRequest -Uri $downloadUrl -OutFile $exePath

# ===== CREATE SHORTCUT =====
Write-Output "Creating Start Menu shortcut..."
$wsh = New-Object -ComObject WScript.Shell
$shortcut = $wsh.CreateShortcut($shortcutPath)
$shortcut.TargetPath = $exePath
$shortcut.WorkingDirectory = $installDir
$shortcut.Save()

Write-Output "Done! You can now search 'chrome idle' in Start."
