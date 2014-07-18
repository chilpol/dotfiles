#!/bin/sh
sudo defaults write com.apple.loginwindow LogoutHook /Users/chibluong/dotfiles/bin/mute-on.sh
sudo defaults write com.apple.loginwindow LoginHook /Users/chibluong/dotfiles/bin/mute-off.sh
