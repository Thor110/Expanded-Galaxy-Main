param (
    [string]$TSLPath = ""
)

# Initialize empty hashtable to store KOTOR paths
$KOTORPaths = @{}

function Check-RegKey {
    param([string]$path)
    return (Get-ItemProperty -Path $path -Name 'InstallLocation' -ErrorAction SilentlyContinue).InstallLocation
}

function Check-Folder {
    param([string]$path)
    return Test-Path -Path "$path\chitin.key"
}

function Process-Choice {
    param([string]$title, [array]$options, [string]$cmdlinePath)

    if ($cmdlinePath) {
        Write-Host "Command-line argument detected. Using path: $cmdlinePath"
        $KOTORPaths[$title] = $cmdlinePath
        if (Check-Folder -path $cmdlinePath) {
            Write-Host "chitin.key found for $cmdlinePath"
        } else {
            Write-Host "ERROR! chitin.key not found at " + $cmdlinePath
            exit 1
        }
        return
    }

    # Display choices to the user
    $index = 1
    $options | ForEach-Object {
        $found = if (Check-RegKey -path $_) { "" } else { " (NOT FOUND)" }
        Write-Host "[$index] $title - $_$found"
        $index++
    }
    Write-Host "[$index] $title - Manual"

    # Capture user input
    $choice = Read-Host "Please choose an option [1-$index]"

    if ($choice -eq $index) {
        $path = Read-Host "Please enter your $title directory"
    } else {
        $path = Check-RegKey -path $options[$choice - 1]
    }

    if (-not $path) {
        Write-Host "Path: '$path' not found!"
        Process-Choice -title $title -options $options -cmdlinePath $cmdlinePath
    }

    # Store the path
    $KOTORPaths[$title] = $path

    Write-Host "User chose: $path"
    Write-Host "Check for chitin.key - $(if (Check-Folder -path $path) {'success'} else {'failure'})"
}

# Possible registry keys for each version
$KOTOR1Options = @(
    'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 32370',
    'HKLM:\SOFTWARE\GOG.com\Games\1207666283',
    'HKLM:\SOFTWARE\WOW6432Node\BioWare\SW\KOTOR',
    'HKLM:\SOFTWARE\BioWare\SW\KOTOR'
)

$KOTOR2Options = @(
    'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 208580',
    'HKLM:\SOFTWARE\GOG.com\Games\1421404581',
    'HKLM:\SOFTWARE\WOW6432Node\LucasArts\KotOR2',
    'HKLM:\SOFTWARE\LucasArts\KotOR2'
)

Process-Choice -title "TSL" -options $KOTOR2Options -cmdlinePath $TSLPath

# Use the paths stored in $KOTORPaths for the rest of your script
Write-Host "`nStored Paths:"
$KOTORPaths.Keys | ForEach-Object { Write-Host "$_ : $($KOTORPaths[$_])" }

Read-Host "Press any key to start the install."
Write-Host "Installing Expanded Galaxy Project Main"

try {
    & 'tslpatchdata\pykotorcli.exe' "$($KOTORPaths['TSL'])" "$PWD"
    Write-Host "Star Wars : Knights of the Old Republic II Expanded Galaxy Main Project Installation Completed!"
} catch {
    Write-Host "An error occurred: $_"
    exit 2
}
Read-Host "Press Enter to continue..."