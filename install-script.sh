# OSX Post Install Script
#
#!/bin/sh
#
# Install xcode command line tools
xcode-select --install
#
# Check for Homebrew,
# Install if we don't have it

if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

PATH="/usr/local/opt/coreutils/libexec/gnubin:${PATH}"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}"

# Install Bash replacements
bashshell=(
  coreutils
  findutils
  bash
)
echo "installing bashshell…"
brew install ${bashshell[@]}
# Add Bash shell to /etc/shells file
  echo "/usr/local/bin/bash" | sudo tee -a /etc/shells

# Install Fish shell
fishshell=(
  fish
)
echo "installing fishshell…"
brew install ${fishshell[@]}
# Add fish shell to /etc/shells file
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
# Change default shell to Fish
chsh -s /usr/local/bin/fish

# Install Fisherman
curl -sL get.fisherman.sh | fish

muttmail=(
  msmtp
  mutt
  offlineimap
  urlview
  w3m
)
echo "installing muttmail…"
brew install ${muttmail[@]}

ircchat=(
  aspell --with-lang-en_US
  weechat --with-lua --with-perl --with-python --with-ruby --HEAD --with-aspell
)
echo "installing ircchat…"
brew install ${ircchat[@]}

binaries=(
	ffmpeg
    	git
	htmldoc
	htop-osx
	imagemagick
	tmux
    	tree
    	vim
    	wget
	youtube-dl
)
echo "installing binaries…"
brew install ${binaries[@]}

echo "Tapping a few casks…"
brew tap homebrew/dupes
brew tap homebrew/x11
brew tap homebrew/versions
brew install homebrew/dupes/grep
brew install homebrew/dupes/nano --disable-nls --enable-color --enable-extra --enable-multibuffer --enable-nanorc --enable-utf8
brew install caskroom/cask/brew-cask

apps=(
  1password
  alfred
  alternote
  atom
  bartender
  bettertouchtool
  cheatsheet
  cleanmymac
  daisydisk
  dropbox
  dropzone
  firefox
  flux
  google-chrome
  hazel
  iterm2
  itsycal
  keka
  mamp
  moom
  nvalt
  omnifocus
  seil
  slack
  textexpander
  transmission
  typora
  vlc
  xquartz
  xclip
  )

# Install apps to /Applications
# Default is: /Users/$user/Applications

echo "installing apps…"
brew cask install --appdir="/Applications" ${apps[@]}

# Quicklook plugins
qlplugins=(
  betterzipql
  qlstephen
  suspicious-package
)

echo "installing Quick look plugins…"
brew cask install --appdir="/Applications" ${qlplugins[@]}

#
#Install Fonts
#

brew tap caskroom/fonts
brew cask install font-ubuntu

#
#Cleanup After Install
#

brew cleanup
brew cask cleanup

## Install Powerline Fonts
## https://ruigomes.me/blog/perfect-iterm-osx-terminal-installation/
git clone https://github.com/powerline/fonts.git && cd fonts && ./install.sh
