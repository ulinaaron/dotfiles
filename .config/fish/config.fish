# Paths
fish_add_path -g ~/.config/composer/vendor/bin
fish_add_path -g ~/.npm/node_modules
fish_add_path -g ~/.config/scripts
fish_add_path -g ~/.local/bin
fish_add_path -g /home/linuxbrew/.linuxbrew/bin
fish_add_path -g ~/.cargo/bin
fish_add_path -g ~/Applications
fish_add_path -g ~/AppImages
fish_add_path -g ~/.npm-global/bin
fish_add_path -g ~/.local/venv/bin
fish_add_path -g ~/Applications/zed.app/bin
fish_add_path /home/aaron/.spicetify

source ~/.config/fish/colors

set -g fish_term24bit 1
set -Ux VISUAL micro
set -Ux EDITOR micro

# Greeting
# Replace default Fish greeting with Neofetch
function fish_greeting
    # neofetch --ascii ~/.resources/varix.txt --ascii_colors 1 2 3 4 5 6 7 8
    # macchina
       set wallpaper (bash -c "source ~/.config/varix/theming/current.bash && echo \$wallpaper")
    # fastfetch --logo "$wallpaper"
    fastfetch
end

function lk
    set loc (walk $argv); and cd $loc
end

function refresh_waybar
    kill waybar
    nohup ~/.config/hypr/scripts/statusbar &>/dev/null &
end

# ssh-add ~/.ssh/id_rsa 2>/dev/null
abbr list 'exa -ha --long --grid  --group-directories-first --git --icons'
abbr sshkey 'cat ~/.ssh/id_rsa.pub | xclip -selection clipboard'
abbr mnt-shrr 'sudo sshfs -o allow_other,default_permissions,IdentityFile=/home/aaron/.ssh/id_rsa runcloud@5.161.62.143:/home/runcloud/webapps/shrr-24/wp-content/themes/breakdance-zero /mnt/shrr'

alias editor="micro"
alias mv="mv -iv"
alias cp="cp -riv"
alias mkdir="mkdir -vp"
alias art="php artisan"
alias phpls="phpactor language-server"
alias hx="helix"

set VIRTUAL_ENV "/home/aaron/.venv"

alias pragtical="~/AppImages/gearlever_pragtical_d0fec7.appimage"

zoxide init fish | source

starship init fish | source

alias cd=z

export "MICRO_TRUECOLOR=1"


# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
