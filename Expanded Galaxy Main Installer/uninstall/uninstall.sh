
#!/bin/bash

backupParentFolder="../backup"
mostRecentBackupFolder=$(ls -d "$backupParentFolder"/* | while read -r dir; do
    dirName=$(basename "$dir")
    if [[ "$dirName" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}_[0-9]{2}\.[0-9]{2}\.[0-9]{2}$ ]]; then
        # Convert the directory name to a sortable format YYYYMMDDHHMMSS and echo both the sortable format and the original directory
        echo "${dirName:0:4}${dirName:5:2}${dirName:8:2}${dirName:11:2}${dirName:14:2}${dirName:17:2} $dir"
    else
        if [[ -n "$dirName" && ! "$dirName" =~ ^[[:space:]]*$ ]]; then
            echo "Ignoring directory '$dirName'" >&2
        fi
    fi
done | sort -r | awk 'NR==1 {print $2}')



if [[ ! -d "$mostRecentBackupFolder" ]]; then
    mostRecentBackupFolder="C:\Users\boden\Documents\GitHub\Expanded-Galaxy-Main\Expanded Galaxy Main Installer\backup\2023-12-07_17.13.41"
    if [[ ! -d "$mostRecentBackupFolder" ]]; then
        echo "No backups found in '$backupParentFolder'"
        exit 1
    fi
    echo "Using hardcoded backup dir: '$mostRecentBackupFolder'"
else
    echo "Selected backup folder '$mostRecentBackupFolder'"
fi

existingFiles=()
deleteListFile="$mostRecentBackupFolder/remove these files.txt"
if [[ ! -f "$deleteListFile" ]]; then
    echo "File list not found."
    #exit 1
else
    declare -a filesToDelete
    mapfile -t filesToDelete < "$deleteListFile"
    echo "Building file lists..."
    for file in "${filesToDelete[@]}"; do
        normalizedFile=$(echo "$file" | tr '\\' '/')
        if [[ -n "$file" && -f "$file" ]]; then
            existingFiles+=("$file")
        else
            echo "WARNING! $file no longer exists! Running this script is no longer recommended!"
        fi
    done
fi


fileCount=$(find "$mostRecentBackupFolder" -type f ! -name 'remove these files.txt' | wc -l)
folderCount=$(find "$mostRecentBackupFolder" -type d | wc -l)

# Display relative file paths if file count is less than 6
if [[ $fileCount -lt 6 ]]; then
    find "$mostRecentBackupFolder" -type f ! -name 'remove these files.txt' | sed "s|^$mostRecentBackupFolder/||"
fi

read -rp "Really uninstall ${#existingFiles[@]} files and restore the most recent backup (containing $fileCount files and $folderCount folders)? " confirmation
if [[ "$confirmation" != "y" && "$confirmation" != "yes" ]]; then
    echo "Operation cancelled."
    exit 1
fi

deletedCount=0
for file in "${existingFiles[@]}"; do
    if [[ -f "$file" ]]; then
        rm -f "$file"
        echo "Removed $file..."
        ((deletedCount++))
    fi
done

if [[ $deletedCount -ne 0 ]]; then
    echo "Deleted $deletedCount files."
fi

while IFS= read -r -d $'\0' file; do
    relativePath=${file#$mostRecentBackupFolder}
    destinationPath="C:\Program Files (x86)\Steam\steamapps\common\Knights of the Old Republic II/$relativePath"
    destinationDir=$(dirname "$destinationPath")
    if [[ ! -d "$destinationDir" ]]; then
        mkdir -p "$destinationDir"
    fi
    cp "$file" "$destinationPath" && echo "Restoring backup of '$(basename $file)' to '$destinationDir'..."
done < <(find "$mostRecentBackupFolder" -type f ! -name 'remove these files.txt' -print0)

read -rp "Press enter to continue..."

    