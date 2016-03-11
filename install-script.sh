# OSX Post Install Script
#
#!/bin/sh
#
# Install xcode command line tools
xcode-select --install
#
# Install Brew Packages
#
# Check for Homebrew,
# Install if we don't have it

if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

PATH="/usr/local/opt/coreutils/libexec/gnubin:${PATH}"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}"

binaries=(
	coreutils
	findutils
	bash # Add to /etc/shells
  fish # Add to /etc/shells
	ffmpeg
	htmldoc
	htop-osx
	imagemagick
  msmtp
  mutt
  offlineimap
	tmux
  tree
  urlview
  aspell --with-lang-en_US
  vim
	weechat --with-aspell --with-perl --with-python
  wget
	youtube-dl
  )

echo "installing binaries..."
brew install ${binaries[@]}

brew tap homebrew/dupes
brew tap homebrew/x11
brew tap homebrew/versions

# xclip can't be installed before xquartz
# brew install homebrew/x11/xclip

brew install homebrew/dupes/grep
brew install homebrew/dupes/nano --disable-nls --enable-color --enable-extra --enable-multibuffer --enable-nanorc --enable-utf8

brew install caskroom/cask/brew-cask

# Don't understand why this isn't found.
# brew cask install google-chrome-canary

apps=(
	1password
	alfred
	alternote
	atom
	bartender
	brackets
	cleanmymac
	daisydisk
	dropbox
	firefox
  firefoxdeveloperedition
	flux
	github-desktop
	google-chrome
  google-chrome-canary
	hazel
	iterm2
  itsycal
	keka
  moom
	nvalt
	omnifocus
	seil
	slack
	textexpander
	transmission
	vlc
	xquartz
  xclip
  )

# Install apps to /Applications
# Default is: /Users/$user/Applications

echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

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
