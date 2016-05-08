# Install Bash replacements
bashshell=(
  coreutils
  findutils
  bash
)
echo "installing bash shell…" brew install ${bashshell[@]}

# Add Bash shell to /etc/shells file
echo "/usr/local/bin/bash" | sudo tee -a /etc/shells

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
echo "installing ircchat…" brew install ${ircchat[@]}

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

# Install Fish shell
fishshell=(
  fish
)
echo "installing fishshell…" brew install ${fishshell[@]}

# Add fish shell to /etc/shells file
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells

# Change default shell to Fish
chsh -s /usr/local/bin/fish

# Install Fisherman
curl -sL get.fisherman.sh | fish
