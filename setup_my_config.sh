#/bin/bash 

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `macos.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Disable the sound effects on boot
# sudo nvram SystemAudioVolume=" "

# ----- Finder -----------------------------------------------------------------
# Allow quitting via ⌘ + Q; doing so will also hide desktop icons
defaults write com.apple.finder "QuitMenuItem" -bool true && killall Finder
# defaults delete com.apple.finder "QuitMenuItem" && killall Finder

# Don't show all filename extensions
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "false" && killall Finder
# defaults delete NSGlobalDomain "AppleShowAllExtensions" && killall Finder

# Don't show hidden files by default
defaults write com.apple.Finder "AppleShowAllFiles" -bool "false" && killall Finder
# defaults delete com.apple.Finder "AppleShowAllFiles" && killall Finder

# Display a warning when changing a file extension
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "true" && killall Finder
# defaults delete com.apple.finder "FXEnableExtensionChangeWarning" && killall Finder

# Home directory is opened in the fileviewer dialog when saving a new document
defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "false" && killall Finder
# defaults delete NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" && killall Finder

# Size of Finder sidebar icons
defaults write NSGlobalDomain "NSTableViewDefaultSizeMode" -int "2" && killall Finder
# defaults delete NSGlobalDomain "NSTableViewDefaultSizeMode" && killall Finder

# Enable window animations and Get Info animations
defaults write com.apple.finder "DisableAllAnimations" -bool "false" && killall Finder
# defaults delete com.apple.finder "DisableAllAnimations" && killall Finder

# Set Downloads as the default location for new Finder windows
defaults write com.apple.finder "NewWindowTarget" -string "PfLo"
# defaults delete com.apple.finder "NewWindowTarget" && killall Finder

defaults write com.apple.finder "NewWindowTargetPath" -string "file://${HOME}/Downloads/"
# defaults delete com.apple.finder "NewWindowTargetPath" && killall Finder

# Show status bar
defaults write com.apple.finder "ShowStatusBar" -bool "true" && killall Finder
# defaults delete com.apple.finder "ShowStatusBar" && killall Finder

# Show path bar
defaults write com.apple.finder "ShowPathbar" -bool "true" && killall Finder
# defaults delete com.apple.finder "ShowPathbar" && killall Finder

# Display full POSIX path as Finder window title
# defaults write com.apple.finder "_FXShowPosixPathInTitle" -bool "true" && killall Finder
# defaults delete com.apple.finder "_FXShowPosixPathInTitle" && killall Finder

# Keep folders on top when sorting by name
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true" && killall Finder

# When performing a search, search the current folder by default
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf" && killall Finder

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices "DSDontWriteNetworkStores" -bool "true" && killall Finder
# defaults delete com.apple.desktopservices "DSDontWriteNetworkStores" && killall Finder

defaults write com.apple.desktopservices "DSDontWriteUSBStores" -bool "true" && killall Finder
# defaults delete com.apple.desktopservices "DSDontWriteUSBStores" && killall Finder

defaults write com.apple.desktopservices "DSDontWriteNetworkStores" -bool "true" && killall Finder
# defaults write com.apple.desktopservices "DSDontWriteNetworkStores" -bool "false" && killall Finder

# Show icons for hard drives, servers, and removable media on the desktop
# defaults write com.apple.finder "ShowExternalHardDrivesOnDesktop" -bool "true"
# defaults write com.apple.finder "ShowHardDrivesOnDesktop" -bool "true"
# defaults write com.apple.finder "ShowMountedServersOnDesktop" -bool "true"
# defaults write com.apple.finder "ShowRemovableMediaOnDesktop" -bool "true"

# ----- Dock -------------------------------------------------------------------
# defaults write com.apple.dock "orientation" -string "left" && killall Dock
defaults write com.apple.dock "orientation" -string "bottom" && killall Dock
# defaults write com.apple.dock "orientation" -string "right" && killall Dock

defaults write com.apple.dock "tilesize" -int "50" && killall Dock
# defaults delete com.apple.dock "tilesize" && killall Dock

# defaults write com.apple.dock "autohide" -bool "false" && killall Dock
defaults write com.apple.dock "autohide" -bool "true" && killall Dock
# defaults delete com.apple.dock "autohide" && killall Dock

# Remove the auto-hiding Dock delay
defaults write com.apple.dock "autohide-delay" -float 0 && killall Dock
# defaults delete com.apple.dock "autohide-delay" && killall Dock

# Remove the animation when hiding/showing the Dock
defaults write com.apple.dock "autohide-time-modifier" -float 0 && killall Dock
# defaults delete com.apple.dock "autohide-time-modifier" && killall Dock

# Don't show recent applications in Dock
defaults write com.apple.dock "show-recents" -bool false && killall Dock
# defaults delete com.apple.dock "show-recents" && killall Dock

# Change minimize/maximize window effect
# defaults write com.apple.dock "mineffect" -string "scale" && killall Dock
# defaults delete com.apple.dock "mineffect" && killall Dock

# ----- Screenshots ------------------------------------------------------------
# Remove the default shadow from screenshots
defaults write com.apple.screencapture "disable-shadow" -bool "true"
# defaults delete com.apple.screencapture "disable-shadow"

# Include date and time in screenshot filenames
defaults write com.apple.screencapture "include-date" -bool "true" 
# defaults delete com.apple.screencapture "include-date"

# Set default screenshot location
defaults write com.apple.screencapture "location" -string "~/Desktop" && killall SystemUIServer
# defaults delete com.apple.screencapture "location" && killall SystemUIServer

# Display the thumbnail after taking a screenshot
defaults write com.apple.screencapture "show-thumbnail" -bool "true"
# defaults delete com.apple.screencapture "show-thumbnail"

# Choose the screenshots image format
defaults write com.apple.screencapture "type" -string "png"
# defaults delete com.apple.screencapture "type"

# ----- TextEditer -------------------------------------------------------------
defaults write com.apple.TextEdit "RichText" -bool "false" && killall TextEdit
# defaults delete com.apple.TextEdit "RichText" && killall TextEdit

# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit "PlainTextEncoding" -int 4 && killall TextEdit
# defaults delete com.apple.TextEdit "PlainTextEncoding" && killall TextEdit

defaults write com.apple.TextEdit "PlainTextEncodingForWrite" -int 4 && killall TextEdit
# defaults delete com.apple.TextEdit "PlainTextEncodingForWrite" && killall TextEdit

# ----- Menubar ----------------------------------------------------------------
# Digital clock format
# Thu 18 Aug 21:46:18
# defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE d MMM HH:mm:ss\""
# Thu 9:46:18
# defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE h:mm:ss\""
# Thu 21:46
defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE HH:mm\""
# defaults delete com.apple.menuextra.clock "DateFormat"

# ----- Settings ---------------------------------------------------------------
# Always show scrollbars
defaults write NSGlobalDomain "AppleShowScrollBars" -string "Always"
# defaults delete NSGlobalDomain "AppleShowScrollBars"
# Possible values: `WhenScrolling`, `Automatic` and `Always`

# Speed up Mission Control animations
defaults write com.apple.dock "expose-animation-duration" -float 0.1
# defaults delete com.apple.dock "expose-animation-duration"

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock "mru-spaces" -bool "false"
# defaults delete com.apple.dock "mru-spaces"

## Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# 13: Lock Screen

# Top left screen corner → Mission Control
# defaults write com.apple.dock "wvous-tl-corner" -int 2
# defaults write com.apple.dock "wvous-tl-modifier" -int 0

# Top right screen corner → Desktop
# defaults write com.apple.dock "wvous-tr-corner" -int 4
# defaults write com.apple.dock "wvous-tr-modifier" -int 0

# Bottom left screen corner → Launchpad
defaults write com.apple.dock "wvous-bl-corner" -int 11
defaults write com.apple.dock "wvous-bl-modifier" -int 0

# Bottom right screen corner → Mission Control
defaults write com.apple.dock "wvous-br-corner" -int 2
defaults write com.apple.dock "wvous-br-modifier" -int 0

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain "AppleKeyboardUIMode" -int 3
# defaults delete NSGlobalDomain "AppleKeyboardUIMode"

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain "KeyRepeat" -int 2
# defaults delete NSGlobalDomain "KeyRepeat"

defaults write NSGlobalDomain "InitialKeyRepeat" -int 15
# defaults delete NSGlobalDomain "InitialKeyRepeat"

# Set mouse tracking speed max
defaults write -g com.apple.mouse.scaling 3
defaults write -g com.apple.mouse.scaling 5

# Disable Apple Press and Hold
defaults write -g ApplePressAndHoldEnabled -bool "false"
