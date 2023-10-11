if status is-login
    
    # Greeting
    # Replace default Fish greeting with Neofetch
    function fish_greeting
        neofetch
    end

    # Use startship for prompt
    starship init fish | source

    # asdf
    # source "$(brew --prefix asdf)/libexec/asdf.fish"

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

    set -gx VISUAL nvim
    set -gx EDITOR nvim
    set -gx OEDITOR ewrap
    set -gx OVISUAL ewrap
    set -gx COLORTERM truecolor
    set -gx DEFAULT_USER $USER

    set -Ux fish_tmux_config $HOME/.config/tmux.conf

    # ssh-add ~/.ssh/id_rsa 2>/dev/null
    abbr list 'exa -ha --long --grid  --group-directories-first --git --icons'
    abbr fresh 'source ~/.config/fish/config.fish'

    ### Functions / Aliases
    alias editor="helix-ide"
    alias notes="helix-notes"
    alias chez="chezmoi"

    alias config_fish="chezmoi edit ~/.config/fish/config.fish"
    alias config_hx="chezmoi edit ~/.config/helix/config.toml"
    alias config_zellij="chezmoi edit ~/.config/zellij/config.kdl"

    alias dashboard="wtfutil"

    alias chezfig="cd ~/.local/share/chezmoi/dot_config"
    alias litexl='"/Applications/Lite XL.app/Contents/MacOS/lite-xl" &; disown'
    alias prag='"/Applications/Pragtical.app/Contents/MacOS/pragtical" &; disown'
end
# pnpm
set -gx PNPM_HOME "/Users/aaronmazade/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

# Nightfox Color Palette
# Style: nightfox
# Upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/nightfox/nightfox_fish.fish
set -l foreground cdcecf
set -l selection 2b3b51
set -l comment 738091
set -l red c94f6d
set -l orange f4a261
set -l yellow dbc074
set -l green 81b29a
set -l purple 9d79d6
set -l cyan 63cdcf
set -l pink d67ad2

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
