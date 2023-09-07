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
fish_add_path -g ~/.config/nnn/scripts
fish_add_path -g /opt/local/bin
fish_add_path -g /Users/aaronmazade/.npm-global/lib/node_modules
fish_add_path -g ~/.config/scripts

set -gx VISUAL helix-ide
set -gx EDITOR helix-ide
set -gx COLORTERM truecolor
set -gx DEFAULT_USER $USER

if status is-login
    ssh-add ~/.ssh/id_rsa 2>/dev/null
end

function fish_greeting
    neofetch
end

# Use startship for prompt
starship init fish | source

# if set -q ZELLIJ
# else
#   zellij
# end

if status is-interactive
    # Commands to run in interactive sessions can go here
    # eval (zellij setup --generate-auto-start fish | string collect)

    export NNN_OPENER=nuke
    export NNN_PLUG='v:imgview;r:renamer;t:-!~/.config/nnn/scripts/helix-open $PWD/$nnn'
    export NNN_FCOLORS='0404040000000600010F0F02'

end

### Functions / Aliases
alias zshconfig="hx ~/.zshrc"
alias editor="zellij --layout editor"
alias zj="zellij"
alias kittyconfig="hx ~/.config/kitty/kitty.conf"
alias j="jump"
alias filetree="xplr"
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
alias fishconfig="hx ~/.config/fish/config.fish"
alias s="kitty +kitten ssh"
alias litexl='"/Applications/Lite XL.app/Contents/MacOS/lite-xl" &; disown'
alias prag='"/Applications/Pragtical.app/Contents/MacOS/pragtical" &; disown'
