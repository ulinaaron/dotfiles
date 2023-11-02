if status is-login

    # Greeting
    # Replace default Fish greeting with Neofetch
    function fish_greeting
        neofetch
    end

    # Paths
    fish_add_path -g ~/bin ~/usr/local/bin ~/.npm-global/bin /Applications/Lite\ XL.app/Contents/MacOS/lite-xl
    fish_add_path -g /opt/homebrew /opt/homebrew/bin/lua ~/.local/bin
    fish_add_path -g ~/.rvm/gems/ruby-2.7.3/bin ~/.rvm/bin /opt/homebrew/opt/openssl@3/bin ~/Library/pnpm
    fish_add_path -g ~/Apps
    fish_add_path -g ~/Applications
    fish_add_path -g ~/.composer/vendor/bin
    fish_add_path -g ~/.cargo/bin
    fish_add_path -g /opt/homebrew/bin/lua
    fish_add_path -g ~/.config/emacs/bin
    fish_add_path -g /opt/local/bin
    fish_add_path -g /Users/aaronmazade/.npm-global/lib/node_modules
    fish_add_path -g ~/.config/scripts
    fish_add_path -g ~/.local/bin/distant

    set -gx VISUAL nvim
    set -gx EDITOR nvim
    set -gx COLORTERM truecolor
    set -gx DEFAULT_USER $USER

    set -Ux fish_tmux_config $HOME/.config/tmux.conf

    # ssh-add ~/.ssh/id_rsa 2>/dev/null
    abbr list 'exa -ha --long --grid  --group-directories-first --git --icons'

    alias mv="mv -iv"
    alias cp="cp -riv"
    alias mkdir="mkdir -vp"
end
# pnpm
set -gx PNPM_HOME "/Users/aaronmazade/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

function fzf --wraps=fzf --description="Use fzf-tmux if in tmux session"
  if set --query TMUX
    fzf-tmux $argv
  else
    command fzf $argv
  end
end
