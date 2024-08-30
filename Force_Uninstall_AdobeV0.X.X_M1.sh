#!/bin/bash

echo "Starting Adobe software uninstallation on M1 Mac..."

# Function to uninstall Adobe Creative Cloud
uninstall_creative_cloud() {
    if [ -d "/Applications/Utilities/Adobe Creative Cloud/HDCore/Uninstaller" ]; then
        echo "Uninstalling Adobe Creative Cloud..."
        /Applications/Utilities/Adobe Creative Cloud/HDCore/Uninstaller --uninstall=1
    else
        echo "Adobe Creative Cloud not found."
    fi
}

# Function to remove Adobe applications
remove_adobe_apps() {
    declare -a adobe_apps=("Adobe Photoshop" "Adobe Premiere Pro" "Adobe Illustrator" "Adobe Lightroom" "Adobe InDesign" "Adobe Acrobat Reader" "Adobe After Effects" "Adobe Audition" "Adobe Bridge" "Adobe Dreamweaver" "Adobe Animate" "Adobe Media Encoder")

    for app in "${adobe_apps[@]}"; do
        app_path="/Applications/$app.app"
        if [ -d "$app_path" ]; then
            echo "Removing $app..."
            sudo rm -rf "$app_path"
        else
            echo "$app not found."
        fi
    done
}

# Function to remove Adobe related directories and files
remove_adobe_related_files() {
    echo "Removing Adobe related files and directories..."
    sudo rm -rf /Library/Application\ Support/Adobe
    sudo rm -rf ~/Library/Application\ Support/Adobe
    sudo rm -rf ~/Library/Preferences/com.adobe.*
    sudo rm -rf ~/Library/Caches/Adobe
    sudo rm -rf /Library/Preferences/com.adobe.*
    sudo rm -rf /Library/Caches/Adobe
    sudo rm -rf ~/Library/Application\ Support/com.adobe.*
}

# Function to run diagnostics
run_diagnostics() {
    echo "Running diagnostics..."
    # You can add any specific diagnostic commands here, such as checking system logs or resource usage
    # Example: Checking if any Adobe processes are still running
    ps aux | grep -i adobe
    echo "Diagnostics complete."
}

# Execute the functions
uninstall_creative_cloud
remove_adobe_apps
remove_adobe_related_files
run_diagnostics

echo "Adobe software uninstallation and diagnostics complete."
