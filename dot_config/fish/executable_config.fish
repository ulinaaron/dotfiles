# Greeting
# Replace default Fish greeting with Neofetch
function fish_greeting
    neofetch
end

# Use startship for prompt
starship init fish | source

# asdf
source "$(brew --prefix asdf)/libexec/asdf.fish"

# Paths
fish_add_path -g ~/bin ~/usr/local/bin ~/.npm-global/bin /Applications/Lite\ XL.app/Contents/MacOS/lite-xl
fish_add_path -g /opt/homebrew /opt/homebrew/bin/lua ~/.local/bin ~/.emacs.d
fish_add_path -g ~/.rvm/gems/ruby-2.7.3/bin ~/.rvm/bin /opt/homebrew/opt/openssl@3/bin ~/Library/pnpm
fish_add_path -g ~/Apps
fish_add_path -g ~/Applications
fish_add_path -g ~/.composer/vendor/bin
fish_add_path -g ~/.cargo/bin
fish_add_path -g /Applications/Sublime\ Text.app/Contents/SharedSupport/bin
fish_add_path -g /opt/homebrew/bin/lua
fish_add_path -g ~/.config/emacs/bin
fish_add_path -g /opt/local/bin
fish_add_path -g /Users/aaronmazade/.npm-global/lib/node_modules
fish_add_path -g ~/.config/scripts

set -gx VISUAL helix-ide
set -gx EDITOR helix-ide
set -gx OEDITOR ewrap
set -gx OVISUAL ewrap
set -gx COLORTERM truecolor
set -gx DEFAULT_USER $USER

#if status is-login
#    ssh-add ~/.ssh/id_rsa 2>/dev/null
#end

### Functions / Aliases
alias editor="helix-ide"
alias notes="helix-notes"
alias chez="chezmoi"

alias config_fish="chezmoi edit ~/.config/fish/config.fish"
alias config_hx="chezmoi edit ~/.config/helix/config.toml"
alias config_zellij="chezmoi edit ~/.config/zellij/config.kdl"

alias chezfig="cd ~/.local/share/chezmoi/dot_config"
alias litexl='"/Applications/Lite XL.app/Contents/MacOS/lite-xl" &; disown'
alias prag='"/Applications/Pragtical.app/Contents/MacOS/pragtical" &; disown'
