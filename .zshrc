autoload -Uz compinit
compinit -C

export HOMEBREW_NO_AUTO_UPDATE=1


/usr/sbin/DevToolsSecurity &>/dev/null
/usr/sbin/dev_mkdb &>/dev/null
/usr/sbin/spctl developer-mode enable-terminal &>/dev/null
/usr/local/bin/purge-dotfolders &>/dev/null
/usr/local/bin/purge-dotfiles &>/dev/null

export HOME='/Users/admin'
autoload -U zmv
# Don't ask before running a rm *
setopt RM_STAR_SILENT
# Auto insert quotes on typed URLs
autoload -U url-quote-magic
zle -N self-insert url-quote-magic
export JCOLOR=1
eval "$(/opt/homebrew/bin/brew shellenv)"

   

export DOTFILES="$(dirname "$(readlink "$HOME/.zshrc")")"
if [[ $(arch) == arm64* ]]; then
  export BREW_PREFIX=/opt/homebrew
else
  export BREW_PREFIX=/usr/local
fi

export CFLAGS="-I/opt/homebrew/include"
export CPPFLAGS="-I/opt/homebrew/include"
export CXXFLAGS="-I/opt/homebrew/include"
export LDFLAGS="-L/opt/homebrew/lib"
export PKG_CONFIG_PATH="/opt/homebrew/lib/pkgconfig"

###############################################################
################################################### VARIABLES #
######################################
#####################################

export udid="00008110-001110CE02E9801E"
export uu="00008110-001110CE02E9801E"
export SHELL="/opt/homebrew/Cellar/zsh/5.9/bin/zsh-5.9"
export SUDO_USER="root"

export DEVELOPER_DIR="/Applications/Xcode.app/Contents/Developer"

if [[ -L /var/db/xcode_select_link ]]; then
	alias xcopen="open -a \$(dirname $(dirname $(readlink /var/db/xcode_select_link)))"
	export IOS_SDK="$(dirname $(dirname $(readlink /var/db/xcode_select_link)))/Contents/Developer/Platforms/iPhoneOS.platform/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/"
	export MACOS_SDK="$(dirname $(dirname $(readlink /var/db/xcode_select_link)))/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/"
fi

###############################################################
######################################################## PATHS # 
######################################
#####################################

export PATH="$PATH:/opt/homebrew/Cellar:/opt/homebrew/include:/opt/homebrew/bin:/opt/homebrew/Cellar/openssl@3/3.0.7/bin:/opt/homebrew/opt/coreutils/libexec/gnubin:/opt/homebrew/lib:/usr/local/bin:/usr/local/include:/usr/local/lib:/usr/local/sbin:/usr/local/share:/usr/bin:/usr/lib:/usr/libexec:/usr/sbin:/usr/share:/usr/standalone:/bin:/sbin:/Applications/Xcode.app/Contents/Developer/usr/bin:
:/Library/Developer/CommandLineTools/usr:/usr/local/include/openssl:/opt/homebrew/bin:/opt/homebrew/opt/openjdk/bin"

MANPATH="/opt/homebrew/share/man:/usr/share/man:/usr/local/share/man:/Applications/Xcode.app/Contents/Developer/usr/share/man:/Library/Developer/CommandLineTools/usr/share/man:/usr/local/share/man:/usr/local/share/man/man5:/usr/local/share/man/man3:/usr/local/share/man/man8:/usr/local/share/man/man1:/usr/local/share/man/man7"


						        
################################################################
######################################################## ALIAS # 
######################################
#####################################

alias wifi="/usr/sbin/networksetup -setairportpower en0"

alias wget="/opt/homebrew/Cellar/wget/1.21.4/bin/wget --no-check-certificate"

alias imazing="/Applications/iMazing.app/Contents/MacOS/iMazingRelauncher"

alias iMazing="/Applications/iMazing.app/Contents/MacOS/iMazingRelauncher"x

alias git='/Library/Developer/CommandLineTools/usr/bin/git'

alias du="du -c -h -s "

alias strings="/usr/local/bin/strings"

alias iproclist="pymobiledevice3 developer dvt proclist --no-color | jq ."


alias dotfiles="/usr/bin/open -t '/Users/admin/.dotfiles/.zshrc'"

alias sys="/usr/bin/open '/System/Applications/System Settings.app'"

alias pw='/usr/bin/open "/System/Library/PreferencePanes/Passwords.prefPane"'

alias idevicename="/usr/local/bin/idevicename"

alias ipkill="pymobiledevice3 developer dvt pkill"

alias ideviceimagemounter="/usr/local/bin/ideviceimagemounter"

alias cat='ccat -G Tag="darkgreen" -G Plaintext="fuchsia" -G Plaintext="darkgreen" -G Decimal="bold" -G Literal="*teal*"'

alias ccat='ccat -G Tag="darkgreen" -G Plaintext="fuchsia" -G Plaintext="darkgreen" -G Decimal="bold" -G Literal="*teal*"'

alias pymobiledevice3='/usr/local/bin/pymobiledevice3'

alias chm="sudo chmod -vR 0000"

alias achf="sudo  /usr/bin/chflags -vR nohidden"

alias chf="sudo  /usr/bin/chflags -vR uchg"

alias nochf="sudo /usr/bin/chflags -vR nouchg"

alias achm="sudo chmod -vR 7777"

alias achown="chown -R admin:everyone"

alias mkdir="/bin/mkdir"

alias pymobiledevice3="/opt/homebrew/bin/python3.11 -m pymobiledevice3"

alias sig-strip='sudo codesign --force --deep --remove-signature'

alias fhosts="/bin/cat /Users/admin/Documents/Hosts/Factory/hosts > /etc/hosts; tail /etc/hosts | ccat"

alias ehosts="/bin/cat /Users/admin/Documents/Hosts/Everyday/hosts > /etc/hosts; tail /etc/hosts | ccat"

alias chosts="/bin/cat /Users/admin/Documents/Hosts/Custom/hosts > /etc/hosts; tail /etc/hosts | ccat"

alias la="ls -av1|cat"

alias expose='printf "\n\n\033[33;1m$(/bin/cat /var/root/.dotfiles/.me | base64 -D ;)\033[1m\n\n\n"'


alias zsource="source /Users/admin/.dotfiles/.zshrc"

alias mdmclient='/usr/libexec/mdmclient encrypt "ASRD"'

alias read-defs="/usr/bin/defaults read"

alias write-defs="/usr/bin/defaults write"

alias read-app="/usr/bin/defaults read -app"

alias write-app="/usr/bin/defaults write -app"

alias RH="zsh --no-rcs -c '/usr/bin/open 'https://robinhood.com/login''"

alias Youtube="zsh --no-rcs -c '/usr/bin/open 'https://www.youtube.com''"

alias chatgpt='/usr/bin/open "https://chat.openai.com/auth/login?next=/chat"'


alias recursive-shred='find . -type f -print0 | xargs -0 shred -fuzv -n'

alias lsregister="/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister"

alias seedutil="/System/Library/PrivateFrameworks/Seeding.framework/Versions/A/Resources/seedutil"

alias xc-open="zsh --no-rcs -c '/usr/bin/open -a /Applications/Xcode*.app/'"

alias xcopen="zsh --no-rcs -c '/usr/bin/open -a /Applications/Xcode*.app/'"

alias lsof="/usr/sbin/lsof"

alias shred="shred -fuzv -n"

alias extract-certs="codesign -dvvvv --extract-certificates"

alias log="/usr/bin/log stream --level info"

alias debug-log="/usr/bin/log stream --level debug"

alias root-util="/usr/local/bin/root_util bless --verbose $@ &>/dev/null"

################################################################
########################### FUNCTIONS #
######################################
#####################################


alias plx="plutil -convert xml1"


alias plb="plutil -convert binary1"


alias plok="plutil -lint"


myip() {
printf "\033[1;32m$(myIP=$(curl "ipecho.net/plain" 2>/dev/null) && echo ""; echo "IP Address: $myIP";)\033[0m\n";
echo "";
}

hide-dotfiles() {
defaults -host admin write com.apple.finder AppleShowAllFiles -bool NO 
defaults -host admin write com.apple.finder QLEnableTextSelection -bool YES 
defaults -host admin write com.apple.finder ShowStatusBar -bool YES 
defaults -host admin write com.apple.finder AppleShowAllFiles -bool YES 
defaults -host admin write com.apple.finder ShowHardDrivesOnDesktop -bool NO 
defaults -host admin write com.apple.finder ShowExternalHardDrivesOnDesktop -bool YES 
defaults -host admin write com.apple.finder QuitMenuItem -bool YES 
defaults -host admin write com.apple.finder ShowPathbar -bool YES 
defaults -host admin write com.apple.finder FXEnableExtensionChangeWarning -bool NO 
defaults -host admin write com.apple.finder _FXShowPosixPathInTitle -bool true 
killall Finder 2>/dev/null
}


show-dotfiles() {
defaults -host admin write com.apple.finder AppleShowAllFiles -bool YES 
defaults -host admin write com.apple.finder QLEnableTextSelection -bool YES 
defaults -host admin write com.apple.finder ShowStatusBar -bool YES 
defaults -host admin write com.apple.finder AppleShowAllFiles -bool YES 
defaults -host admin write com.apple.finder ShowHardDrivesOnDesktop -bool NO 
defaults -host admin write com.apple.finder ShowExternalHardDrivesOnDesktop -bool YES 
defaults -host admin write com.apple.finder QuitMenuItem -bool YES 
defaults -host admin write com.apple.finder ShowPathbar -bool YES 
defaults -host admin write com.apple.finder FXEnableExtensionChangeWarning -bool NO 
defaults -host admin write com.apple.finder _FXShowPosixPathInTitle -bool true 
killall Finder 2>/dev/null
}




ireboot() {
set -x ;
/opt/homebrew/bin/python3.11 -m pymobiledevice3 diagnostics restart --udid $uu
{ set +x ; } 2>/dev/null 
}

Search() {
printf "\033[32;1mGoogle Search:\033[0m\n" ; 
read SearchString
/usr/bin/open "https://google.com/search?q=$SearchString"
}


Google() {
zsh --no-rcs -c "/usr/bin/open 'https://www.google.com/?client=safari'"
}

idevicepair() {
/usr/local/bin/idevicepair validate -u $(idevice_id -l) 2>/dev/null& ;
/usr/local/bin/idevicepair pair -u $(idevice_id -l) 
}


harlogger() {
/opt/homebrew/bin/python3.11 -m harlogger profile
}


pymount() {
set -x
/opt/homebrew/bin/python3.11 -m pymobiledevice3 mounter auto-mount --udid $(idevice_id -l) ; 
 { set +x; } 2>/dev/null
}


upymount() {
set -x
pymobiledevice3 mounter umount-developer --udid $(idevice_id -l) ;
{ set +x; } 2>/dev/null
}


usb-location() {
	locations=(`mobdev list | awk '/UDID/ { gsub(/^(.*location ID = )+|(,.*)+$/, ""); print}'`); echo $locations|ccat 
}


signinfo() {
    codesign -d -vvvv -- "$1" 2>&1 | awk -F '=' '$1=="Identifier" { print $2 }'
}


purgedns() {
sudo killall -HUP mDNSResponder 2>/dev/null
sudo killall -HUP mDNSResponder 2>/dev/null  
sudo killall -HUP mDNSResponder 2>/dev/null 
sudo killall mDNSResponderHelper 2>/dev/null
sudo dscacheutil -flushcache 2>/dev/null
echo "macOS DNS Cache Reset"|ccat;
}

fsmonitor() {
/Applications/FileMonitor.app/Contents/MacOS/FileMonitor -pretty
}


function ps(){
/usr/bin/printf "\033[33;1m $(/bin/ps axwww -o user,uid,pid,command ;)\033[1m\n\n\n" 
}


function kill-apps() {
  IFS=$'\n'
  red=$(tput setaf 1)
  normal=$(tput sgr0)
  if [ -z "$1" ] || [ "$1" = "--help" ]; then
    printf "%s\n" "Usage: kill-apps string"
    return 0
  fi
  printf "%s\n" "Finding apps that match “$1”…"
  sleep 1
  processes=($(pgrep -afil "$1"))
  if [ ${#processes[@]} -eq 0 ]; then
    printf "%s\n" "No apps found"
    return 0
  else
    printf "%s\n" "${processes[@]}"
    printf "$red%s$normal" "Kill found apps (y or n)? "
    read -r answer
    if [ "$answer" = "y" ]; then
      printf "%s\n" "Killing found apps…"
      sleep 1
      for process in "${processes[@]}"; do
        echo $process | awk '{print $1}' | xargs sudo kill 2>&1 | grep -v "No such process"
      done
      printf "%s\n" "Done"
      return 0
    fi
  fi
}


open-ports(){	
set -x
netstat -p tcp -van | grep '^Proto\|LISTEN'
{set +x;} 2> /dev/null
}


################################################################
######################################################### MISC # 
######################################
#####################################

source "/Users/admin/.dotfiles/.zcompdump"
source "/Users/admin/.dotfiles/zsh-autosuggestions.zsh"
source "/Users/admin/.dotfiles/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"


export CLICOLOR=1
export LSCOLORS=exFxCxDxBxegedabagacad
export LS_COLORS="di=34:ln=1;35:so=1;32:pi=1;33:ex=1;31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
if [[ -x "$(which dircolors 2> /dev/null)" ]]; then
	eval "$(dircolors -b)"
	export LS_OPTIONS="--color=auto"
fi
export LS_OPTIONS="--color=auto"
alias ls="/bin/ls -av1F $LS_OPTIONS"


export EDITOR="$(which nano)"
ECID="0x001110ce02e9801e"
alias ents="codesign -d --entitlements -"


listsysctls () { set -A reply $(sysctl -AN ${1%.*}) }
                   compctl -K listsysctls sysctl
CRYPTEXCTL_UDID=00008110-001110CE02E9801E
alias strings='/usr/local/bin/strings'

setopt rm_starsilent

alias wget="wget --no-check-certificate"

setopt RM_STAR_SILENT

autoload -U url-quote-magic

zle -N self-insert url-quote-magic

function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null ))
}
compctl -K _pip_completion /opt/homebrew/opt/python@3.11/bin/python3.11 -m pip
compctl -K _pip_completion /Applications/Xcode.app/Contents/Developer/usr/bin/python3 -m pip
compctl -K _pip_completion /Applications/Xcode.app/Contents/Developer/usr/bin/python3.9 -m pip

#export DYLD_INSERT=/Applications/Xcode.app/Contents/Frameworks/libxcodebuildLoader.dylib
#export DYLD_INSERT_LIBRARIES=/Applications/Xcode.app/Contents/Frameworks/libxcodebuildLoader.dylib
