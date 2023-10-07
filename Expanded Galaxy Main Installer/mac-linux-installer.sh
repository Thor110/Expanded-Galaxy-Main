#!/bin/bash
mytitle="Star Wars : Knights of the Old Republic II : Expanded Galaxy Project Main Installer"
# Function to check for chitin.key in a folder
check_folder() {
    # Convert to absolute path
    local absolutePath
    if command -v realpath &> /dev/null; then
        absolutePath=$(realpath "$1")
    elif command -v readlink &> /dev/null; then
        absolutePath=$(readlink -f "$1")
    else
        absolutePath="$1"
    fi
    
    if [[ -f "$absolutePath/chitin.key" ]]; then
        echo "chitin.key found"
        return 0
    else
        echo "chitin.key not found"
        return 1
    fi
}

# Function to display choices and capture user input
process_choice() {
    local title="$1"
    local pathOptions="$2"
    local varToSet="$3"

    local index=1
    local pathOpt=()

    for opt in ${pathOptions[@]}; do
        if [[ -d "$opt" ]]; then
            echo "[$index] $title - $opt"
            pathOpt[$index]="$opt"
            ((index++))
        fi
    done

    echo "[$index] Enter a manual path"
    local manualIndex=$index

    read -p "Please choose an option [1-$index] " choice

    if [[ $choice -eq $manualIndex ]]; then
        read -p "Enter your manual path: " chosenPath
    else
        chosenPath="${pathOpt[$choice]}"
    fi

    check_folder "$chosenPath"
    if [[ $? -eq 0 ]]; then
        echo "Check for chitin.key - success"
    else
        echo "Check for chitin.key - failure"
        process_choice "$title" "$pathOptions" "$varToSet"
        return
    fi

    eval $varToSet="'$chosenPath'"
}

# Main logic

# Set up path choices
KOTOR2PathOptions=("~/Library/Application Support/Steam/steamapps/common/Knights of the Old Republic II/Knights of the Old Republic II.app/Contents/Assets" 
                   "~/.local/share/Steam/common/SteamApps/Knights of the Old Republic II"
                   "~/.local/share/Steam/common/steamapps/Knights of the Old Republic II" 
                   "~/.local/share/Steam/common/Knights of the Old Republic II")

process_choice "TSL" "${KOTOR2PathOptions[@]}" KOTORPaths

echo "TSL Path chosen: $KOTORPaths"

read -p "Press [Enter] to continue..."

echo "Installing Expanded Galaxy Project Main"

# Call executable based on chosen path
if [[ -f "$KOTORPaths/tslpatchdata/pykotorcli_linux" ]]; then
    "$KOTORPaths/tslpatchdata/pykotorcli_linux" "$KOTORPaths" "$(pwd)"
    echo "Star Wars : Knights of the Old Republic II Expanded Galaxy Main Project Installation Completed!"
else
    echo "An error occurred: Cannot find the executable 'pykotorcli_linux'"
    exit 2
fi

read -p "Press [Enter] to continue..."