#!/usr/bin/env bash

# Get Current Directory
DIR="$(dirname "$0")"
TEMPLATES="$DIR/templates"

## Directories ------------------------------
PATH_ALAC="$HOME/.config/alacritty"
PATH_ROFI="$HOME/.config/rofi"
PATH_WAYB="$HOME/.config/waybar"
PATH_WLOG="$HOME/.config/wlogout"
PATH_GTK3="$HOME/.config/gtk-3.0"
PATH_GTK4="$HOME/.config/gtk-4.0"
PATH_OBSIDIAN="$HOME/Nextcloud/Notes/.obsidian/snippets"
PATH_VSCODIUM="$HOME/.vscode-oss/extensions/ulinaaron.walthings-1.0.0-universal"

## Source Theme File ------------------------
CURRENT_THEME="$HOME/.config/walthings/current.bash"
DEFAULT_THEME="$HOME/.config/walthings/default.bash"
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
        wal -q -n -s -t -e -i "$SOURCE"
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
	color0="`pastel color $color0 | pastel mix -f {{base_dark_black_mix}} {{base_dark_black}} | pastel format hex`"
	color1="`pastel color $color1 | pastel mix -f {{base_dark_red_mix}} {{base_dark_red}} | pastel format hex`"
	color2="`pastel color $color2 | pastel mix -f {{base_dark_green_mix}} {{base_dark_green}} | pastel format hex`"
	color3="`pastel color $color3 | pastel mix -f {{base_dark_yellow_mix}} {{base_dark_yellow}} | pastel format hex`"
	color4="`pastel color $color4 | pastel mix -f {{base_dark_blue_mix}} {{base_dark_blue}} | pastel format hex`"
	color5="`pastel color $color5 | pastel mix -f {{base_dark_magenta_mix}} {{base_dark_magenta}} | pastel format hex`"
	color6="`pastel color $color6 | pastel mix -f {{base_dark_cyan_mix}} {{base_dark_cyan}} | pastel format hex`"
	color7="`pastel color $color7 | pastel mix -f {{base_dark_white_mix}} {{base_dark_white}} | pastel format hex`"
	color8="`pastel color $color8 | pastel lighten {{base_lighten_factor}} | pastel mix -f {{base_light_black_mix}} {{base_light_black}} | pastel format hex`"
	color9="`pastel color $color9 | pastel lighten {{base_lighten_factor}} | pastel mix -f {{base_light_red_mix}} {{base_light_red}} | pastel format hex`"
	color10="`pastel color $color10 | pastel lighten {{base_lighten_factor}} | pastel mix -f {{base_light_green_mix}} {{base_light_green}} | pastel format hex`"
	color11="`pastel color $color11 | pastel lighten {{base_lighten_factor}} | pastel mix -f {{base_light_yellow_mix}} {{base_light_yellow}} | pastel format hex`"
	color12="`pastel color $color12 | pastel lighten {{base_lighten_factor}} | pastel mix -f {{base_light_blue_mix}} {{base_light_blue}} | pastel format hex`"
	color13="`pastel color $color13 | pastel lighten {{base_lighten_factor}} | pastel mix -f {{base_light_magenta_mix}} {{base_light_magenta}} | pastel format hex`"
	color14="`pastel color $color14 | pastel lighten {{base_lighten_factor}} | pastel mix -f {{base_light_cyan_mix}} {{base_light_cyan}} | pastel format hex`"
	color15="`pastel color $color15 | pastel lighten {{base_lighten_factor}} | pastel mix -f {{base_light_white_mix}} {{base_light_white}} | pastel format hex`"
}


## Sources -----------------------------
source_file() {
    generate_colors
    cat ${PYWAL_THEME} > ${CURRENT_THEME}
	source ${CURRENT_THEME}
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

apply_wallpaper() {
    sed -i -e "s#WALLPAPER=.*#WALLPAPER='$wallpaper'#g" ${DIR}/set_wallpaper
	bash ${DIR}/set_wallpaper &
}

apply_startpage() {
	cp $HOME/.cache/wal/colors.css $HOME/.config/startpage/colors.css
}

## Source Theme Accordingly -----------------
if [[ "$1" == '--file' ]]; then
	source_file
elif [[ "$1" == '--random' ]]; then
	source_random
# elif [[ "$1" == '--link' ]]; then

# elif [[ "$1" == '--unlink' ]]; then

else
	echo "Available Options: --file  --random"
	exit 1
fi

## Execute Script ---------------------------

apply_wallpaper
# apply_alacritty
source "$TEMPLATES/alacritty"
# apply_rofi
source "$TEMPLATES/rofi"
# apply_waybar
source "$TEMPLATES/waybar"
# apply_wlogout
source "$TEMPLATES/wlogout"
# apply_hypr
source "$TEMPLATES/hypr"
# apply_gtk3
source "$TEMPLATES/gtk"
# apply_obsidian
source "$TEMPLATES/obsidian"
# apply VSCodium Theme
source "$TEMPLATES/vscodium"

source "$TEMPLATES/swaync"
apply_startpage			
