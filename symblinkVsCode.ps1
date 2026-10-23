$ErrorActionPreference = "Stop"

$dotfiles = "C:\home\repo\me\dotfiles\vscode"
$vscodeUser = "$env:APPDATA\Code\User"
$logFile = "$PSScriptRoot\symblinkVsCode.log"

function Write-Log {
    param(
        [Parameter(Mandatory)]
        [string]$Message,
        [ValidateSet("INFO", "WARN", "ERROR")]
        [string]$Level = "INFO"
    )

    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $line = "[$timestamp] [$Level] $Message"

    switch ($Level) {
        "WARN"  { Write-Warning $Message }
        "ERROR" { Write-Host $line -ForegroundColor Red }
        default { Write-Host $line }
    }

    Add-Content -Path $logFile -Value $line
}

function New-SymlinkForFile {
    param(
        [Parameter(Mandatory)]
        [string]$FileName
    )

    $sourcePath = Join-Path $dotfiles $FileName
    $targetPath = Join-Path $vscodeUser $FileName

    if (-not (Test-Path $sourcePath)) {
        throw "Source file not found: $sourcePath"
    }

    try {
        if (Test-Path $targetPath) {
            Move-Item -Path $targetPath -Destination (Join-Path $backup $FileName) -ErrorAction Stop
            Write-Log "Backed up existing $FileName to $backup"
        }
        else {
            Write-Log "No existing $FileName found to back up." -Level WARN
        }

        New-Item -ItemType SymbolicLink -Path $targetPath -Target $sourcePath -ErrorAction Stop | Out-Null
        Write-Log "Linked $FileName -> $sourcePath"
    }
    catch {
        Write-Log "Failed to link $FileName : $($_.Exception.Message)" -Level ERROR
        throw
    }
}

try {
    Write-Log "Starting VS Code dotfiles symlink setup."

    if (-not (Test-Path $dotfiles)) {
        throw "Dotfiles source folder not found: $dotfiles"
    }

    if (-not (Test-Path $vscodeUser)) {
        throw "VS Code User folder not found: $vscodeUser. Is VS Code installed?"
    }

    # Create backup folder
    $backup = "$vscodeUser\backup-$(Get-Date -Format yyyyMMdd-HHmmss)"
    New-Item -ItemType Directory -Path $backup -Force -ErrorAction Stop | Out-Null
    Write-Log "Created backup folder: $backup"

    # Create symlinks (with backup of any existing files)
    New-SymlinkForFile -FileName "settings.json"
    New-SymlinkForFile -FileName "keybindings.json"

    Write-Log "VS Code dotfiles linked successfully."
}
catch {
    Write-Log "VS Code dotfiles setup failed: $($_.Exception.Message)" -Level ERROR
    exit 1
}