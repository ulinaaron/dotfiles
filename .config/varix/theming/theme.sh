#!/usr/bin/env bash

## Variables ------------------------------
# Base Mix Factor
BASE_MIX_FACTOR=.30

# Dark Mix Colors
BASE_DARK_BLACK="#11111b"
BASE_DARK_BLACK_MIX=$BASE_MIX_FACTOR
BASE_DARK_RED="#f38ba8"
BASE_DARK_RED_MIX=$BASE_MIX_FACTOR
BASE_DARK_GREEN="#a6e3a1"
BASE_DARK_GREEN_MIX=$BASE_MIX_FACTOR
BASE_DARK_YELLOW="#fab387"
BASE_DARK_YELLOW_MIX=$BASE_MIX_FACTOR
BASE_DARK_BLUE="#74c7ec"
BASE_DARK_BLUE_MIX=$BASE_MIX_FACTOR
BASE_DARK_MAGENTA="#cba6f7"
BASE_DARK_MAGENTA_MIX=$BASE_MIX_FACTOR
BASE_DARK_CYAN="#89dceb"
BASE_DARK_CYAN_MIX=$BASE_MIX_FACTOR
BASE_DARK_WHITE="#a6adc8"
BASE_DARK_WHITE_MIX=$BASE_MIX_FACTOR

# Lightness Amount
BASE_LIGHTEN_FACTOR=0.10

# Light Mix Colors
BASE_LIGHT_BLACK="#1e1e2e"
BASE_LIGHT_BLACK_MIX=$BASE_MIX_FACTOR
BASE_LIGHT_RED="#eba0ac"
BASE_LIGHT_RED_MIX=$BASE_MIX_FACTOR
BASE_LIGHT_GREEN="#94e2d5"
BASE_LIGHT_GREEN_MIX=$BASE_MIX_FACTOR
BASE_LIGHT_YELLOW="#f9e2af"
BASE_LIGHT_YELLOW_MIX=$BASE_MIX_FACTOR
BASE_LIGHT_BLUE="#89dceb"
BASE_LIGHT_BLUE_MIX=$BASE_MIX_FACTOR
BASE_LIGHT_MAGENTA="#f5c2e7"
BASE_LIGHT_MAGENTA_MIX=$BASE_MIX_FACTOR
BASE_LIGHT_CYAN="#89dceb"
BASE_LIGHT_CYAN_MIX=$BASE_MIX_FACTOR
BASE_LIGHT_WHITE="#cdd6f4"
BASE_LIGHT_WHITE_MIX=$BASE_MIX_FACTOR

##EDITOR Mixes
## We'll be mixing our wallpaper colors with Catppuccin Mocha
EDITOR_LIGHTEN_FACTOR=0.10
EDITOR_DESATURATE_FACTOR=0.1
EDITOR_MIX_FACTOR=0.35

# Dark Mix Colors
EDITOR_DARK_BLACK="#1e1e2e"
EDITOR_DARK_BLACK_MIX=$EDITOR_MIX_FACTOR
EDITOR_DARK_RED="#f38ba8"
EDITOR_DARK_RED_MIX=$EDITOR_MIX_FACTOR
EDITOR_DARK_GREEN="#a6e3a1"
EDITOR_DARK_GREEN_MIX=0.7
EDITOR_DARK_YELLOW="#f9e2af"
EDITOR_DARK_YELLOW_MIX=$EDITOR_MIX_FACTOR
EDITOR_DARK_BLUE="#89b4fa"
EDITOR_DARK_BLUE_MIX=$EDITOR_MIX_FACTOR
EDITOR_DARK_MAGENTA="#cba6f7"
EDITOR_DARK_MAGENTA_MIX=$EDITOR_MIX_FACTOR
EDITOR_DARK_CYAN="#94e2d5"
EDITOR_DARK_CYAN_MIX=$EDITOR_MIX_FACTOR
EDITOR_DARK_WHITE="#cdd6f4"
EDITOR_DARK_WHITE_MIX=$EDITOR_MIX_FACTOR

# Light Mix Colors
EDITOR_LIGHT_BLACK="#1e1e2e"
EDITOR_LIGHT_BLACK_MIX=$EDITOR_MIX_FACTOR
EDITOR_LIGHT_RED="#f38ba8"
EDITOR_LIGHT_RED_MIX=$EDITOR_MIX_FACTOR
EDITOR_LIGHT_GREEN="#a6e3a1"
EDITOR_LIGHT_GREEN_MIX=0.7
EDITOR_LIGHT_YELLOW="#f9e2af"
EDITOR_LIGHT_YELLOW_MIX=$EDITOR_MIX_FACTOR
EDITOR_LIGHT_BLUE="#89b4fa"
EDITOR_LIGHT_BLUE_MIX=$EDITOR_MIX_FACTOR
EDITOR_LIGHT_MAGENTA="#cba6f7"
EDITOR_LIGHT_MAGENTA_MIX=$EDITOR_MIX_FACTOR
EDITOR_LIGHT_CYAN="#94e2d5"
EDITOR_LIGHT_CYAN_MIX=$EDITOR_MIX_FACTOR
EDITOR_LIGHT_WHITE="#cdd6f4"
EDITOR_LIGHT_WHITE_MIX=$EDITOR_MIX_FACTOR

# Get Current Directory
DIR="$(dirname "$0")"
TEMPLATES="$DIR/templates"

## Directories ------------------------------
PATH_ALAC="$HOME/dotfiles/.config/alacritty"
PATH_KITTY="$HOME/dotfiles/.config/kitty"
PATH_ROFI="$HOME/dotfiles/.config/rofi"
PATH_WAYB="$HOME/dotfiles/.config/varix/waybar/shared"
PATH_GTK3="$HOME/dotfiles/.themes/Varix/gtk-3.0"
PATH_GTK4="$HOME/dotfiles/.themes/Varix/gtk-4.0"
PATH_OBSIDIAN="$HOME/Nextcloud/Notes/.obsidian/snippets"
PATH_VSCODIUM="$HOME/.vscode-oss/extensions/ulinaaron.walthings-1.0.0-universal"

## Source Theme File ------------------------
CURRENT_THEME="$HOME/dotfiles/.config/varix/theming/current.bash"
DARk_THEME="$HOME/dotfiles/.config/varix/theming/dark.bash"
LIGHT_THEME="$HOME/dotfiles/.config/varix/theming/light.bash"
DEFAULT_THEME="$HOME/dotfiles/.config/varix/theming/default.bash"
PYWAL_THEME="$HOME/.cache/wal/colors.sh"

# Set the default directory
DEFAULT_DIR="$(xdg-user-dir PICTURES)/Themes"

## Check if current file exist
if [[ ! -e "$CURRENT_THEME" ]]; then
	touch "$CURRENT_THEME"
fi

SOURCE="$DEFAULT_DIR"

# Check if --file or --random option was passed
if [ "$1" == "--file" ]; then
    # Check if a file was passed
    if [ -z "$2" ]; then
        echo "No file specified"
        exit 1
    fi
    # Check if the file exists
    if [ ! -f "$2" ]; then
        echo "File not found: $2"
        exit 1
    fi
    # Set SOURCE to the specified file
    SOURCE="$2"
elif [ "$1" == "--random" ]; then
    # Check if a directory was passed
    if [ -z "$2" ]; then
        echo "No directory specified"
        exit 1
    fi
    # Check if the directory exists
    if [ ! -d "$2" ]; then
        echo "Directory not found: $2"
        exit 1
    fi
    # Set SOURCE to the specified directory
    SOURCE="$2"
fi

generate_colors() {
    if [[ `which wal` ]]; then
        notify-send -t 3000 -h string:x-canonical-private-synchronous:sys-notify-runpywal -i ${DIR}/assets/notifications/timer.png "Walthings" "Generating Colorscheme. Please wait..."

        if [ "$1" == "light" ]; then
            wal -q -n -s -t -e -l -i "$SOURCE"
        else
            wal -q -n -s -t -e -i "$SOURCE"
        fi

        if [[ "$?" != 0 ]]; then
            notify-send -h string:x-canonical-private-synchronous:sys-notify-runpywal -u normal -i ${DIR}/assets/notifications/palette.png "Walthings"  "Failed to generate colorscheme."
            exit
        fi
    else
        notify-send -h string:x-canonical-private-synchronous:sys-notify-runpywal -u normal -i ${DIR}/assets/notifications/palette.png "Walthings"  "'pywal' is not installed."
        exit
    fi
}

modify_colors() {
    altbackground="`pastel color $background | pastel lighten 0.10 | pastel format hex`"
    altforeground="`pastel color $foreground | pastel darken 0.30 | pastel format hex`"
    modbackground=(`pastel gradient -n 3 $background $altbackground | pastel format hex`)
    accent="$color4"
    ecomment="`pastel color $foreground | pastel darken 0.40 | pastel desaturate .6 |  pastel format hex`"
    eblack="`pastel color $color0 | pastel mix -f $EDITOR_DARK_BLACK_MIX $EDITOR_DARK_BLACK | pastel desaturate $EDITOR_DESATURATE_FACTOR | pastel format hex`"
    ered="`pastel color $color1 | pastel mix -f $EDITOR_DARK_RED_MIX $EDITOR_DARK_RED | pastel desaturate $EDITOR_DESATURATE_FACTOR | pastel format hex`"
    egreen="`pastel color $color2 | pastel mix -f $EDITOR_DARK_GREEN_MIX $EDITOR_DARK_GREEN | pastel desaturate $EDITOR_DESATURATE_FACTOR | pastel format hex`"
    eyellow="`pastel color $color3 | pastel mix -f $EDITOR_DARK_YELLOW_MIX $EDITOR_DARK_YELLOW | pastel desaturate $EDITOR_DESATURATE_FACTOR | pastel format hex`"
    eblue="`pastel color $color4 | pastel mix -f $EDITOR_DARK_BLUE_MIX $EDITOR_DARK_BLUE | pastel desaturate $EDITOR_DESATURATE_FACTOR | pastel format hex`"
    emagenta="`pastel color $color5 | pastel mix -f $EDITOR_DARK_MAGENTA_MIX $EDITOR_DARK_MAGENTA | pastel desaturate $EDITOR_DESATURATE_FACTOR | pastel format hex`"
    ecyan="`pastel color $color6 | pastel mix -f $EDITOR_DARK_CYAN_MIX $EDITOR_DARK_CYAN | pastel desaturate $EDITOR_DESATURATE_FACTOR | pastel format hex`"
    ewhite="`pastel color $color7 | pastel mix -f $EDITOR_DARK_WHITE_MIX $EDITOR_DARK_WHITE | pastel desaturate $EDITOR_DESATURATE_FACTOR | pastel format hex`"
    elblack="`pastel color $color8 | pastel lighten $EDITOR_LIGHTEN_FACTOR | pastel mix -f $EDITOR_LIGHT_BLACK_MIX $EDITOR_LIGHT_BLACK | pastel desaturate $EDITOR_DESATURATE_FACTOR | pastel format hex`"
    elred="`pastel color $color9 | pastel lighten $EDITOR_LIGHTEN_FACTOR | pastel mix -f $EDITOR_LIGHT_RED_MIX $EDITOR_LIGHT_RED | pastel desaturate $EDITOR_DESATURATE_FACTOR | pastel format hex`"
    elgreen="`pastel color $color10 | pastel lighten $EDITOR_LIGHTEN_FACTOR | pastel mix -f $EDITOR_LIGHT_GREEN_MIX $EDITOR_LIGHT_GREEN | pastel desaturate $EDITOR_DESATURATE_FACTOR | pastel format hex`"
    elyellow="`pastel color $color11 | pastel lighten $EDITOR_LIGHTEN_FACTOR | pastel mix -f $EDITOR_LIGHT_YELLOW_MIX $EDITOR_LIGHT_YELLOW | pastel desaturate $EDITOR_DESATURATE_FACTOR | pastel format hex`"
    elblue="`pastel color $color12 | pastel lighten $EDITOR_LIGHTEN_FACTOR | pastel mix -f $EDITOR_LIGHT_BLUE_MIX $EDITOR_LIGHT_BLUE | pastel desaturate $EDITOR_DESATURATE_FACTOR | pastel format hex`"
    elmagenta="`pastel color $color13 | pastel lighten $EDITOR_LIGHTEN_FACTOR | pastel mix -f $EDITOR_LIGHT_MAGENTA_MIX $EDITOR_LIGHT_MAGENTA | pastel desaturate $EDITOR_DESATURATE_FACTOR | pastel format hex`"
    elcyan="`pastel color $color14 | pastel lighten $EDITOR_LIGHTEN_FACTOR | pastel mix -f $EDITOR_LIGHT_CYAN_MIX $EDITOR_LIGHT_CYAN | pastel desaturate $EDITOR_DESATURATE_FACTOR | pastel format hex`"
    elwhite="`pastel color $color15 | pastel lighten $EDITOR_LIGHTEN_FACTOR | pastel mix -f $EDITOR_LIGHT_WHITE_MIX $BASE_LIGHT_WHITE | pastel desaturate $EDITOR_DESATURATE_FACTOR | pastel format hex`"

    color0="`pastel color $color0 | pastel mix -f $BASE_DARK_BLACK_MIX $BASE_DARK_BLACK | pastel format hex`"
    color1="`pastel color $color1 | pastel mix -f $BASE_DARK_RED_MIX $BASE_DARK_RED | pastel format hex`"
    color2="`pastel color $color2 | pastel mix -f $BASE_DARK_GREEN_MIX $BASE_DARK_GREEN | pastel format hex`"
    color3="`pastel color $color3 | pastel mix -f $BASE_DARK_YELLOW_MIX $BASE_DARK_YELLOW | pastel format hex`"
    color4="`pastel color $color4 | pastel mix -f $BASE_DARK_BLUE_MIX $BASE_DARK_BLUE | pastel format hex`"
    color5="`pastel color $color5 | pastel mix -f $BASE_DARK_MAGENTA_MIX $BASE_DARK_MAGENTA | pastel format hex`"
    color6="`pastel color $color6 | pastel mix -f $BASE_DARK_CYAN_MIX $BASE_DARK_CYAN | pastel format hex`"
    color7="`pastel color $color7 | pastel mix -f $BASE_DARK_WHITE_MIX $BASE_DARK_WHITE | pastel format hex`"
    color8="`pastel color $color8 | pastel lighten $BASE_LIGHTEN_FACTOR | pastel mix -f $BASE_LIGHT_BLACK_MIX $BASE_LIGHT_BLACK | pastel format hex`"
    color9="`pastel color $color9 | pastel lighten $BASE_LIGHTEN_FACTOR | pastel mix -f $BASE_LIGHT_RED_MIX $BASE_LIGHT_RED | pastel format hex`"
    color10="`pastel color $color10 | pastel lighten $BASE_LIGHTEN_FACTOR | pastel mix -f $BASE_LIGHT_GREEN_MIX $BASE_LIGHT_GREEN | pastel format hex`"
    color11="`pastel color $color11 | pastel lighten $BASE_LIGHTEN_FACTOR | pastel mix -f $BASE_LIGHT_YELLOW_MIX $BASE_LIGHT_YELLOW | pastel format hex`"
    color12="`pastel color $color12 | pastel lighten $BASE_LIGHTEN_FACTOR | pastel mix -f $BASE_LIGHT_BLUE_MIX $BASE_LIGHT_BLUE | pastel format hex`"
    color13="`pastel color $color13 | pastel lighten $BASE_LIGHTEN_FACTOR | pastel mix -f $BASE_LIGHT_MAGENTA_MIX $BASE_LIGHT_MAGENTA | pastel format hex`"
    color14="`pastel color $color14 | pastel lighten $BASE_LIGHTEN_FACTOR | pastel mix -f $BASE_LIGHT_CYAN_MIX $BASE_LIGHT_CYAN | pastel format hex`"
    color15="`pastel color $color15 | pastel lighten $BASE_LIGHTEN_FACTOR | pastel mix -f $BASE_LIGHT_WHITE_MIX $BASE_LIGHT_WHITE | pastel format hex`"
}


## Sources -----------------------------
# source_file() {
#     generate_colors
#     cat ${PYWAL_THEME} > ${CURRENT_THEME}
#
#  #    cat ${PYWAL_THEME} > ${DARK_THEME}
# 	# cat ${PYWAL_THEME} > ${LIGHT_THEME}
#
# 	source ${CURRENT_THEME}
#     modify_colors
# }

source_file() {
    if [ "$1" == "--light" ] || [ "$1" == "-l" ]; then
        generate_colors "light"
        cat ${PYWAL_THEME} > ${LIGHT_THEME}
        source ${LIGHT_THEME}
    else
        generate_colors
        cat ${PYWAL_THEME} > ${CURRENT_THEME}
        source ${CURRENT_THEME}
    fi
    modify_colors
}

source_random() {

    # Check for wallpapers
    check_wallpaper() {
        if [[ -d "$SOURCE" ]]; then
            WFILES="`ls --format=single-column $SOURCE | wc -l`"
            if [[ "$WFILES" == 0 ]]; then
                notify-send -h string:x-canonical-private-synchronous:sys-notify-noimg -u low -i ${PATH_MAKO}/icons/picture.png "There are no wallpapers in : $SOURCE"
                exit
            fi
        else
            mkdir -p "$SOURCE"
            notify-send -h string:x-canonical-private-synchronous:sys-notify-noimg -u low -i ${PATH_MAKO}/icons/picture.png "Put some wallpapers in : $SOURCE"
            exit
        fi
    }

    check_wallpaper
    generate_colors
    cat ${PYWAL_THEME} > ${CURRENT_THEME}
	source ${CURRENT_THEME}
    modify_colors
}

source_current() {
	source ${CURRENT_THEME}
	 modify_colors
}

apply_wallpaper() {
    sed -i -e "s#WALLPAPER=.*#WALLPAPER='$wallpaper'#g" $HOME/dotfiles/.config/varix/theming/set_wallpaper
	bash ${DIR}/set_wallpaper &
}

apply_startpage() {
	cp $HOME/.cache/wal/colors.css $HOME/dotfiles/.config/startpage/colors.css
}


## Execute Script ---------------------------

execute_scripts() {
	apply_wallpaper

	# apply_alacritty
	source "$TEMPLATES/alacritty"
	source "$TEMPLATES/kitty"

	# apply_rofi
	source "$TEMPLATES/rofi"

	# apply_waybar
	source "$TEMPLATES/waybar"

	# apply_hypr
	source "$TEMPLATES/hypr"

	# apply_gtk3
	source "$TEMPLATES/gtk"

	# apply_obsidian
	source "$TEMPLATES/obsidian"

	# LabWC
	source "$TEMPLATES/labwc-theme"

	# apply VSCodium Theme
	# source "$TEMPLATES/vscodium"

	source "$TEMPLATES/swaync"

	source "$TEMPLATES/varix-kvantum"

	# source "$TEMPLATES/sway"

	source "$TEMPLATES/zed"

	apply_startpage

	pywalfox update
}


## Source Theme Accordingly -----------------
if [[ "$1" == '--file' ]]; then
	source_file
	execute_scripts

	pkill waybar && bash $HOME/.config/varix/labwc/scripts/statusbar &
	labwc -r &
	$HOME/.config/varix/scripts/gtkthemes &
	$HOME/.config/varix/scripts/icons ${color2} &
elif [[ "$1" == '--random' ]]; then
	source_random
	execute_scripts

	# pkill waybar && bash $HOME/.config/varix/hyprland/scripts/statusbar &
	pkill waybar && bash $HOME/.config/varix/labwc/scripts/statusbar &
	labwc -r &
	$HOME/.config/varix/scripts/gtkthemes &
	$HOME/.config/varix/scripts/icons ${color2} &
elif [[ "$1" == '--refresh' ]]; then
	source_current
	execute_scripts

	# pkill waybar && bash $HOME/.config/varix/hyprland/scripts/statusbar &
	pkill waybar && bash $HOME/.config/varix/labwc/scripts/statusbar &
	labwc -r &
	$HOME/.config/varix/scripts/gtkthemes &
	$HOME/.config/varix/scripts/icons ${color2} &

# elif [[ "$1" == '--unlink' ]]; then

else
	echo "Available Options: --file  --random"
	exit 1
fi
