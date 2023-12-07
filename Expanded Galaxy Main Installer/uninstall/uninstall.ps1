
#!/usr/bin/env pwsh
$backupParentFolder = Get-Item -Path "..$([System.IO.Path]::DirectorySeparatorChar)backup"
$mostRecentBackupFolder = Get-ChildItem -LiteralPath $backupParentFolder.FullName -Directory | ForEach-Object {
    $dirName = $_.Name
    try {
        [datetime]$dt = [datetime]::ParseExact($dirName, "yyyy-MM-dd_HH.mm.ss", $null)
        Write-Host "Found backup '$dirName'"
        return [PSCustomObject]@{
            Directory = $_.FullName
            DateTime = $dt
        }
    } catch {
        if ($dirName -and $dirName -ne '' -and -not ($dirName -match "^\s*$")) {
            Write-Host "Ignoring directory '$dirName'. $($_.Exception.Message)"
        }
    }
} | Sort-Object DateTime -Descending | Select-Object -ExpandProperty Directory -First 1
if ($null -eq $mostRecentBackupFolder -or -not $mostRecentBackupFolder -or -not (Test-Path -LiteralPath $mostRecentBackupFolder -ErrorAction SilentlyContinue)) {
    $mostRecentBackupFolder = "C:\Users\boden\Documents\GitHub\Expanded-Galaxy-Main\Expanded Galaxy Main Installer\backup\2023-12-07_17.13.41"
    if (-not (Test-Path -LiteralPath $mostRecentBackupFolder -ErrorAction SilentlyContinue)) {
        Write-Host "No backups found in '$($backupParentFolder.FullName)'"
        exit
    }
    Write-Host "Using hardcoded backup dir: '$mostRecentBackupFolder'"
} else {
    Write-Host "Selected backup folder '$mostRecentBackupFolder'"
}

$deleteListFile = $mostRecentBackupFolder + "$([System.IO.Path]::DirectorySeparatorChar)remove these files.txt"
$existingFiles = New-Object System.Collections.Generic.HashSet[string]
if (-not (Test-Path -LiteralPath $deleteListFile -ErrorAction SilentlyContinue)) {
    Write-Host "Delete file list not found."
    #exit
} else {
    $filesToDelete = Get-Content -LiteralPath $deleteListFile
    foreach ($file in $filesToDelete) {
        if ($file) { # Check if $file is non-null and non-empty
            if (Test-Path -LiteralPath $file -ErrorAction SilentlyContinue) {
                # Check if the path is not a directory
                if (-not (Get-Item -LiteralPath $file).PSIsContainer) {
                    $existingFiles.Add($file) | Out-Null
                }
            } else {
                Write-Host "WARNING! $file no longer exists! Running this script is no longer recommended!"
            }
        }
    }
}


$numberOfExistingFiles = $existingFiles.Count

$allItemsInBackup = Get-ChildItem -LiteralPath $mostRecentBackupFolder -Recurse | Where-Object { $_.Name -ne 'remove these files.txt' }
$filesInBackup = ($allItemsInBackup | Where-Object { -not $_.PSIsContainer })
$folderCount = ($allItemsInBackup | Where-Object { $_.PSIsContainer }).Count

# Display relative file paths if file count is less than 6
if ($filesInBackup.Count -lt 6) {
    $allItemsInBackup |
    Where-Object { -not $_.PSIsContainer } |
    ForEach-Object {
        $relativePath = $_.FullName -replace [regex]::Escape($mostRecentBackupFolder), ""
        Write-Host $relativePath.TrimStart("\")
    }
}

$validConfirmations = @("y", "yes")
$confirmation = Read-Host "Really uninstall $numberOfExistingFiles files and restore the most recent backup (containing $($filesInBackup.Count) files and $folderCount folders)? (y/N)"
if ($confirmation.Trim().ToLower() -notin $validConfirmations) {
    Write-Host "Operation cancelled."
    exit
}

$deletedCount = 0
foreach ($file in $existingFiles) {
    if ($file -and (Test-Path -LiteralPath $file -ErrorAction SilentlyContinue)) {
        Remove-Item $file -Force
        Write-Host "Removed $file..."
        $deletedCount++
    }
}

if ($deletedCount -ne 0) {
    Write-Host "Deleted $deletedCount files."
}

foreach ($file in $filesInBackup) {
    try {
        $relativePath = $file.FullName.Substring($mostRecentBackupFolder.Length)
        $destinationPath = Join-Path "C:\Program Files (x86)\Steam\steamapps\common\Knights of the Old Republic II" -ChildPath $relativePath

        # Create the directory structure if it doesn't exist
        $destinationDir = [System.IO.Path]::GetDirectoryName($destinationPath)
        if (-not (Test-Path -LiteralPath $destinationDir)) {
            New-Item -LiteralPath $destinationDir -ItemType Directory -Force
        }

        # Copy the file to the destination
        Copy-Item -LiteralPath $file.FullName -Destination $destinationPath -Force
        Write-Host "Restoring backup of '$($file.Name)' to '$destinationDir'..."
    } catch {
        Write-Host "Failed to restore backup of $($file.Name) because of: $($_.Exception.Message)"
    }
}
Pause
