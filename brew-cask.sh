echo "Tapping a few casks…"
brew tap homebrew/dupes
brew tap homebrew/x11
brew tap homebrew/versions
brew install homebrew/dupes/grep
brew install homebrew/dupes/nano --disable-nls --enable-color --enable-extra --enable-multibuffer --enable-nanorc --enable-utf8

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
  iterm2
  itsycal
  mamp
  moom
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


## Install Powerline Fonts
## https://ruigomes.me/blog/perfect-iterm-osx-terminal-installation/
git clone https://github.com/powerline/fonts.git && cd fonts && ./install.sh

#
#Cleanup After Install
#

brew cleanup
brew cask cleanup
