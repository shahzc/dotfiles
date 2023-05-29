#!/bin/bash


set_defaults() {
	set -x
	
	# Dock 
	defaults write com.apple.dock mru-spaces -bool NO
	defaults write com.apple.dock show-recents -bool NO
	defaults write com.apple.dock mineffect -string suck
	defaults write com.apple.dock expose-group-apps -bool YES
	defaults write com.apple.dock show-process-indicators -bool NO
	defaults write com.apple.dock showAppExposeGestureEnabled -bool YES
	killall Dock 2> /dev/null
	

	# Finder
	defaults write com.apple.finder ShowPathbar -bool YES
	defaults write com.apple.finder QuitMenuItem -bool YES
	defaults write com.apple.finder ShowStatusBar -bool YES
	defaults write com.apple.finder AppleShowAllFiles -bool YES
	defaults write com.apple.finder QLEnableTextSelection -bool YES
	defaults write com.apple.finder ShowHardDrivesOnDesktop -bool NO
	defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES
	defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
	defaults write com.apple.finder FXPreferredViewStyle -string "clmv"
	defaults write com.apple.finder FXEnableExtensionChangeWarning -bool NO
	defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool YES
	defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool YES \
	OpenWith -bool YES \
	Privileges -bool YES
	killall Finder 2> /dev/null
	

	# Siri
	defaults write com.apple.Siri StatusMenuVisible -bool NO
	defaults write com.apple.Siri UserHasDeclinedEnable -bool NO
	defaults write com.apple.Siri VoiceTriggerUserEnabled -bool NO
	killall Siri 2> /dev/null
	
	
	# Safari
	killall Safari 2> /dev/null
	killall "Safari Technology Preview" 2> /dev/null
	{ set +x; } 2> /dev/null
	for app in ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari.plist ; do
		set -x
		defaults write $app ShowIconsInTabs -bool YES
		defaults write $app HistoryAgeInDaysLimit -int 0
		defaults write $app IncludeDevelopMenu -bool YES
		defaults write $app AutoOpenSafeDownloads -bool NO
		defaults write $app ShowSidebarInTopSites -bool NO
		defaults write $app ShowOverlayStatusBar -bool YES
		defaults write $app UniversalSearchEnabled -bool NO
		defaults write $app DebugSnapshotsUpdatePolicy -int 2
		defaults write $app SendDoNotTrackHTTPHeader -bool YES
		defaults write $app SuppressSearchSuggestions -bool YES
		defaults write $app ShowFullURLInSmartSearchField -bool YES
		defaults write $app WebKitPreferences.developerExtrasEnabled -bool YES
		defaults write $app WebKitDeveloperExtrasEnabledPreferenceKey -bool YES
		defaults write $app WebKitPreferences.javaScriptCanOpenWindowsAutomatically -bool NO
		{ set +x; } 2>/dev/null
	done
	
	for app in com.apple.Safari.SandboxBroker com.apple.SafariTechnologyPreview.SandboxBroker; do
		set -x
		defaults write $app ShowDevelopMenu -bool YES
		{ set +x; } 2>/dev/null
	done
	set -x
	

	# Activity Monitor
	defaults write com.apple.ActivityMonitor IconType -int 5
	defaults write com.apple.ActivityMonitor DisplayType -int 4
	defaults write com.apple.ActivityMonitor UpdatePeriod -int 1
	defaults write com.apple.ActivityMonitor ShowCategory -int 100
	killall Activity\ Monitor 2> /dev/null


	# Disk Utility
	defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool YES
	defaults write com.apple.DiskUtility SidebarShowAllDevices -bool YES
	defaults write com.apple.DiskUtility advanced-image-options -bool YES
	defaults write com.apple.DiskUtility WorkspaceShowAPFSSnapshots -bool YES
	killall Disk\ Utility 2> /dev/null

	
	# Xcode
	echo "Setting up Xcode.app"
	if [ -d "/Applications/Xcode.app" ]; then
    	    xcode-select -s /Applications/Xcode.app
    	    xcodebuild -license accept
    	    xcodebuild -runFirstLaunch
    	    mkdir -p /Library/Developer/
    	    ln -sf /Applications/Xcode.app/Contents/version.plist /Library/Developer/version.plist
	    defaults write com.apple.dt.Xcode ShowDVTDebugMenu -bool YES
	    defaults write com.apple.dt.Xcode DVTTextIndentUsingTabs -bool YES
	    defaults write com.apple.dt.Xcode IDEFileExtensionDisplayMode -int 1
	    defaults write com.apple.dt.Xcode DVTTextShowFoldingSidebar -bool YES
	    defaults write com.apple.dt.Xcode IDEIssueNavigatorDetailLevel -int 30
	    defaults write com.apple.dt.Xcode IDESearchNavigatorDetailLevel -int 30
	    defaults write com.apple.dt.Xcode DVTEnableDockIconVersionNumber -bool YES
	    defaults write com.apple.dt.Xcode IDEAlwaysShowCompressedStackFrames -bool NO
	    defaults write com.apple.dt.Xcode IDEIndexerActivityShowNumericProgress -bool YES
	    killall Xcode 2> /dev/null
	else
    	    echo "Xcode.app not found in /Applications"
	fi
	
	

	# Global
	defaults write -g KeyRepeat -int 2
	defaults write -g _NS_4445425547 -bool YES 
	defaults write -g InitialKeyRepeat -int 10
	defaults write -g AppleKeyboardUIMode -int 3
	defaults write -g AppleICUForce24HourTime -bool NO
	defaults write -g ApplePressAndHoldEnabled -bool NO
	defaults write -g NSQuitAlwaysKeepsWindows -bool NO
	defaults write -g com.apple.sound.beep.feedback -bool YES
	defaults write -g NSNavPanelExpandedStateForSaveMode -bool YES
	defaults write -g NSNavPanelExpandedStateForSaveMode2 -bool YES
	defaults write -g NSAutomaticSpellingCorrectionEnabled -bool NO
	defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool NO
	defaults write -g WebAutomaticSpellingCorrectionEnabled -bool NO

	
	# iTerm2
	defaults write com.googlecode.iterm2 EnableProxyIcon -bool YES
	defaults write com.googlecode.iterm2 AutoHideTmuxClientSession -bool YES
	defaults write com.googlecode.iterm2 DoubleClickPerformsSmartSelection -bool YES
	defaults write com.googlecode.iterm2 BootstrapDaemon -bool NO
	defaults write com.googlecode.iterm2 UseSystemCursorWhenPossible -bool YES
	defaults write com.googlecode.iterm2 FocusFollowsMouse -bool YES
	defaults write com.googlecode.iterm2 OpenTmuxWindowsIn -int 2
	defaults write com.googlecode.iterm2 WindowNumber -bool NO
	defaults write com.googlecode.iterm2 HideTabNumber -bool YES
	defaults write com.googlecode.iterm2 AlternateMouseScroll -bool YES
	killall iTerm2 2> /dev/null

	
	# Spotlight
	defaults write com.apple.spotlight orderedItems -array \
	'{"enabled" = 1;"name" = "APPLICATIONS";}' \
	'{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
	'{"enabled" = 1;"name" = "DIRECTORIES";}' \
	'{"enabled" = 1;"name" = "PDF";}' \
	'{"enabled" = 1;"name" = "FONTS";}' \
	'{"enabled" = 0;"name" = "DOCUMENTS";}' \
	'{"enabled" = 0;"name" = "MESSAGES";}' \
	'{"enabled" = 0;"name" = "CONTACT";}' \
	'{"enabled" = 0;"name" = "EVENT_TODO";}' \
	'{"enabled" = 0;"name" = "IMAGES";}' \
	'{"enabled" = 0;"name" = "BOOKMARKS";}' \
	'{"enabled" = 0;"name" = "MUSIC";}' \
	'{"enabled" = 0;"name" = "MOVIES";}' \
	'{"enabled" = 0;"name" = "PRESENTATIONS";}' \
	'{"enabled" = 0;"name" = "SPREADSHEETS";}' \
	'{"enabled" = 0;"name" = "SOURCE";}' \
	'{"enabled" = 0;"name" = "MENU_DEFINITION";}' \
	'{"enabled" = 0;"name" = "MENU_OTHER";}' \
	'{"enabled" = 0;"name" = "MENU_CONVERSION";}' \
	'{"enabled" = 0;"name" = "MENU_EXPRESSION";}' \
	'{"enabled" = 0;"name" = "MENU_WEBSEARCH";}' 


	# TextEdit
	defaults write com.apple.TextEdit RichText -int 0
	defaults write com.apple.TextEdit PlainTextEncoding -int 4
	defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4
	killall TextEdit 2> /dev/null

	# Terminal
	defaults write com.apple.Terminal ShowLineMarks -int 0 
	defaults write com.apple.Terminal StringEncodings -array 4
	defaults write com.apple.Terminal FocusFollowsMouse -string YES
	defaults write com.apple.Terminal SecureKeyboardEntry -bool YES
	defaults write com.apple.Terminal FocusFollowsMouseInBackground -bool YES
	killall Terminal 2> /dev/null 

	killall cfprefsd\ agent 2> /dev/null 
	killall cfprefsd\ daemon 2> /dev/null 

	{ set +x; } 2> /dev/null
	
}
set_defaults 
