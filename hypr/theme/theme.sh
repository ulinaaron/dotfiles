#!/usr/bin/env bash

## Copyright (C) 2020-2024 Aditya Shakya <adi1090x@gmail.com>
##
## Script To Apply Themes

## Theme ------------------------------------
DIR="{{config}}/hypr"

## Directories ------------------------------
PATH_ALAC="{{config}}/alacritty"
PATH_ROFI="{{config}}/rofi"
PATH_WAYB="{{config}}/waybar"
PATH_WLOG="{{config}}/wlogout"
PATH_MAKO="{{config}}/mako"
PATH_GTK3="{{config}}/gtk-3.0"
PATH_GTK4="{{config}}/gtk-4.0"
PATH_SPICE="{{config}}/spicetify"
PATH_OBSIDIAN="$HOME/Nextcloud/Notes/.obsidian/snippets"


## Source Theme File ------------------------
CURRENT_THEME="{{config}}/hypr/theme/current.bash"
DEFAULT_THEME="{{config}}/hypr/theme/default.bash"
PYWAL_THEME="$HOME/.cache/wal/colors.sh"

## Check if current file exist
if [[ ! -e "$CURRENT_THEME" ]]; then
	touch "$CURRENT_THEME"
fi

## Default Theme
source_default() {
	cat ${DEFAULT_THEME} > ${CURRENT_THEME}
	source ${CURRENT_THEME}
	altbackground="`pastel color $background | pastel lighten 0.10 | pastel format hex`"
	altforeground="`pastel color $foreground | pastel darken 0.30 | pastel format hex`"
	modbackground=(`pastel gradient -n 3 $background $altbackground | pastel format hex`)
	accent="$color5"
	notify-send -h string:x-canonical-private-synchronous:sys-notify-dtheme -u normal -i ${PATH_MAKO}/icons/palette.png "Applying Default Theme..."
}

## Random Theme
source_pywal() {
	 if [[ "$2" == "--file" && -n "$3" ]]; then
        # wallpaper="$1"
		WALLDIR="$3"
    else
        # wallpaper="outrun-neon.jpg" # or any default wallpaper you want
		# Set you wallpaper directory here.
		WALLDIR="`xdg-user-dir PICTURES`/Themes"
    fi

	# Check for wallpapers
	check_wallpaper() {
        if [[ -d "$WALLDIR" ]]; then
            WFILES="`ls --format=single-column $WALLDIR | wc -l`"
            if [[ "$WFILES" == 0 ]]; then
                notify-send -h string:x-canonical-private-synchronous:sys-notify-noimg -u low -i ${PATH_MAKO}/icons/picture.png "There are no wallpapers in : $WALLDIR"
                exit
            fi
        else
            mkdir -p "$WALLDIR"
            notify-send -h string:x-canonical-private-synchronous:sys-notify-noimg -u low -i ${PATH_MAKO}/icons/picture.png "Put some wallpapers in : $WALLDIR"
            exit
        fi
    }

	# Run `pywal` to generate colors
	generate_colors() {	
		# if [[ -d "$WALLDIR" ]]; then
		# 	check_wallpaper
		# fi
		if [[ `which wal` ]]; then
			notify-send -t 50000 -h string:x-canonical-private-synchronous:sys-notify-runpywal -i ${PATH_MAKO}/icons/timer.png "Generating Colorscheme. Please wait..."
			wal -q -n -s -t -e -i "$WALLDIR"
			if [[ "$?" != 0 ]]; then
				notify-send -h string:x-canonical-private-synchronous:sys-notify-runpywal -u normal -i ${PATH_MAKO}/icons/palette.png "Failed to generate colorscheme."
				exit
			fi
		else
			notify-send -h string:x-canonical-private-synchronous:sys-notify-runpywal -u normal -i ${PATH_MAKO}/icons/palette.png "'pywal' is not installed."
			exit
		fi
	}

	generate_colors
	cat ${PYWAL_THEME} > ${CURRENT_THEME}
	source ${CURRENT_THEME}
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

## Wallpaper ---------------------------------
apply_wallpaper() {
	sed -i -e "s#WALLPAPER=.*#WALLPAPER='$wallpaper'#g" ${DIR}/scripts/wallpaper
	bash ${DIR}/scripts/wallpaper &
}

## Alacritty ---------------------------------
apply_alacritty() {
	# alacritty : colors
	cat > ${PATH_ALAC}/colors.toml <<- _EOF_
		## Colors configuration
		[colors.primary]
		background = "${background}"
		foreground = "${foreground}"
		
		[colors.normal]
		black   = "${color0}"
		red     = "${color1}"
		green   = "${color2}"
		yellow  = "${color3}"
		blue    = "${color4}"
		magenta = "${color5}"
		cyan    = "${color6}"
		white   = "${color7}"
		
		[colors.bright]
		black   = "${color8}"
		red     = "${color9}"
		green   = "${color10}"
		yellow  = "${color11}"
		blue    = "${color12}"
		magenta = "${color13}"
		cyan    = "${color14}"
		white   = "${color15}"
	_EOF_
}

apply_obsidian() {
	# obsidian : colors
	cat > ${PATH_OBSIDIAN}/varix.css <<- _EOF_
		.theme-dark {
			--mono-rgb-0: 0, 0, 0;
			--mono-rgb-100: 255, 255, 255;
			--color-red-rgb: `pastel color $color9 | pastel format rgb`;
			--color-red: ${color9};
			--color-orange-rgb: `pastel color $color9 | pastel format rgb`;
			--color-orange: ${color9};
			--color-yellow-rgb: `pastel color $color11 | pastel format rgb`;
			--color-yellow: ${color11};
			--color-green-rgb: `pastel color $color10 | pastel format rgb`;
			--color-green: ${color10};
			--color-cyan-rgb: `pastel color $color14 | pastel format rgb`;
			--color-cyan: ${color14};
			--color-blue-rgb: `pastel color $color4 | pastel format rgb`;
			--color-blue: ${color4};
			--color-purple-rgb: `pastel color $color13 | pastel format rgb`;
			--color-purple: ${color13};
			--color-pink-rgb: `pastel color $color13 | pastel format rgb`;
			--color-pink: ${color13};
			--color-base-00: ${background};
			--color-base-05: `pastel color $background | pastel lighten 0.05 | pastel format hex`;
			--color-base-10: `pastel color $background | pastel lighten 0.10 | pastel format hex`;
			--color-base-20: `pastel color $background | pastel lighten 0.20 | pastel format hex`;
			--color-base-25: `pastel color $background | pastel lighten 0.25 | pastel format hex`;
			--color-base-30: `pastel color $background | pastel lighten 0.30 | pastel format hex`;
			--color-base-35: `pastel color $background | pastel lighten 0.35 | pastel format hex`;
			--color-base-40: `pastel color $background | pastel lighten 0.40 | pastel format hex`;
			--color-base-50: `pastel color $background | pastel lighten 0.50 | pastel format hex`;
			--color-base-60: `pastel color $background | pastel lighten 0.60 | pastel format hex`;
			--color-base-70: `pastel color $background | pastel lighten 0.70 | pastel format hex`;
			--color-base-100: `pastel color $background | pastel lighten 0.90 | pastel format hex`;
		}
	_EOF_
}

apply_spicetify() {
	cat > ${PATH_SPICE}/Themes/Custom/color.ini <<- EOF
		[Base]
			main_fg                               = ${foreground}
			secondary_fg                          = ${color0}
			main_bg                               = ${background}
			sidebar_and_player_bg                 = ${background}
			cover_overlay_and_shadow              = ${color1}
			indicator_fg_and_button_bg            = ${color1}
			pressing_fg                           = ${color7}
			slider_bg                             = ${background}
			sidebar_indicator_and_hover_button_bg = ${color1}
			scrollbar_fg_and_selected_row_bg      = ${background}
			pressing_button_fg                    = ${color7}
			pressing_button_bg                    = ${color5}
			selected_button                       = ${color13}
			miscellaneous_bg                      = ${background}
			miscellaneous_hover_bg                = ${color7}
			preserve_1                            = ${color7}
	EOF

	# spicetify apply
}

## Mako --------------------------------------
apply_mako() {
	# mako : config
	sed -i '/# Mako_Colors/Q' ${PATH_MAKO}/config
	cat >> ${PATH_MAKO}/config <<- _EOF_
		# Mako_Colors
		background-color=${background}
		text-color=${foreground}
		border-color=${modbackground[1]}
		progress-color=over ${accent}

		[urgency=low]
		border-color=${modbackground[1]}
		default-timeout=2000

		[urgency=normal]
		border-color=${modbackground[1]}
		default-timeout=5000

		[urgency=high]
		border-color=${color1}
		text-color=${color1}
		default-timeout=0
	_EOF_

	pkill mako && bash ${DIR}/scripts/notifications &
}

## Rofi --------------------------------------
apply_rofi() {
	# rofi : colors
	cat > ${PATH_ROFI}/shared/colors.rasi <<- EOF
		* {
		    background:     ${background};
		    background-opaque:     ${background}E6;
		    background-alt: ${modbackground[1]};
		    foreground:     ${foreground};
		    selected:       ${accent};
		    active:         ${color2};
		    urgent:         ${color1};
		}
	EOF
}

## Waybar ------------------------------------
apply_waybar() {
	# waybar : colors
	cat > ${PATH_WAYB}/colors.css <<- EOF
		/** ********** Colors ********** **/
		@define-color background      ${background};
		@define-color background-alt1 ${modbackground[1]};
		@define-color background-alt2 ${modbackground[2]};
		@define-color foreground      ${foreground};
		@define-color selected        ${accent};
		@define-color black           ${color0};
		@define-color red             ${color1};
		@define-color green           ${color2};
		@define-color yellow          ${color3};
		@define-color blue            ${color4};
		@define-color magenta         ${color5};
		@define-color cyan            ${color6};
		@define-color white           ${color7};
	EOF

	pkill waybar && bash ${DIR}/scripts/statusbar &
}

## Wlogout -----------------------------------
apply_wlogout() {
	# wlogout : colors
	cat > ${PATH_WLOG}/colors.css <<- EOF
		/** ********** Colors ********** **/
		@define-color background      ${background};
		@define-color background-alt1 ${modbackground[1]};
		@define-color background-alt2 ${modbackground[2]};
		@define-color foreground      ${foreground};
		@define-color selected        ${accent};
		@define-color black           ${color0};
		@define-color red             ${color1};
		@define-color green           ${color2};
		@define-color yellow          ${color3};
		@define-color blue            ${color4};
		@define-color magenta         ${color5};
		@define-color cyan            ${color6};
		@define-color white           ${color7};
	EOF
}

## Wofi --------------------------------------
apply_wofi() {
	# wofi : colors	
	sed -i ${PATH_WOFI}/style.css \
		-e "s/@define-color background .*/@define-color background      ${background};/g" \
		-e "s/@define-color background-alt1 .*/@define-color background-alt1 ${modbackground[1]};/g" \
		-e "s/@define-color background-alt2 .*/@define-color background-alt2 ${modbackground[2]};/g" \
		-e "s/@define-color foreground .*/@define-color foreground      ${foreground};/g" \
		-e "s/@define-color selected .*/@define-color selected        ${accent};/g" \
		-e "s/@define-color black .*/@define-color black           ${color0};/g" \
		-e "s/@define-color red .*/@define-color red             ${color1};/g" \
		-e "s/@define-color green .*/@define-color green           ${color2};/g" \
		-e "s/@define-color yellow .*/@define-color yellow          ${color3};/g" \
		-e "s/@define-color blue .*/@define-color blue            ${color4};/g" \
		-e "s/@define-color magenta .*/@define-color magenta         ${color5};/g" \
		-e "s/@define-color cyan .*/@define-color cyan            ${color6};/g" \
		-e "s/@define-color white .*/@define-color white           ${color7};/g"
}

## Hyprland --------------------------------------
apply_hypr() {
	# hyprland : theme
	sed -i ${DIR}/hyprtheme.conf \
		-e "s/\$active_border_col_1 =.*/\$active_border_col_1 = 0xFF${accent:1}/g" \
		-e "s/\$active_border_col_2 =.*/\$active_border_col_2 = 0xFF${color1:1}/g" \
		-e "s/\$inactive_border_col_1 =.*/\$inactive_border_col_1 = 0xFF${modbackground[1]:1}/g" \
		-e "s/\$inactive_border_col_2 =.*/\$inactive_border_col_2 = 0xFF${modbackground[2]:1}/g" \
		-e "s/\$group_border_active_col =.*/\$group_border_active_col = 0xFF${color2:1}/g" \
		-e "s/\$group_border_inactive_col =.*/\$group_border_inactive_col = 0xFF${color3:1}/g" \
		-e "s/\$group_border_locked_active_col =.*/\$group_border_locked_active_col = 0xFF${color1:1}/g" \
		-e "s/\$group_border_locked_inactive_col =.*/\$group_border_locked_inactive_col = 0xFF${color4:1}/g" \
		-e "s/\$groupbar_text_color =.*/\$groupbar_text_color = 0xFF${foreground:1}/g"
}

## GTK 3
apply_gtk3() {
	# gtk-3.0 : colors
		cat > ${PATH_GTK3}/gtk.css <<- EOF
		/** ********** Colors ********** **/
		@define-color window_bg_color ${background};
		@define-color window_fg_color ${foreground};
		@define-color view_bg_color ${background};
		@define-color view_fg_color ${foreground};
		@define-color headerbar_bg_color ${modbackground[1]};
		@define-color headerbar_fg_color ${foreground};
		@define-color headerbar_border_color ${foreground};
		@define-color headerbar_backdrop_color @window_bg_color;
		@define-color headerbar_shade_color rgba(0, 0, 0, 0.36);
		@define-color headerbar_darker_shade_color rgba(0, 0, 0, 0.9);
		@define-color sidebar_bg_color ${modbackground[1]};
		@define-color sidebar_fg_color ${foreground};
		@define-color sidebar_backdrop_color ${modbackground[1]};
		@define-color sidebar_shade_color rgba(0, 0, 0, 0.25);
		@define-color sidebar_border_color rgba(0, 0, 0, 0.36);
		@define-color card_bg_color rgba(255, 255, 255, 0.08);
		@define-color card_fg_color ${foreground};
		@define-color card_shade_color rgba(0, 0, 0, 0.36);
		@define-color dialog_bg_color ${modbackground[1]};
		@define-color dialog_fg_color ${foreground};
		@define-color popover_bg_color ${modbackground[1]};
		@define-color popover_fg_color ${foreground};
		@define-color popover_shade_color rgba(0, 0, 0, 0.25);
		@define-color thumbnail_bg_color ${modbackground[1]};
		@define-color thumbnail_fg_color ${foreground};
		@define-color shade_color rgba(0, 0, 0, 0.25);
		@define-color scrollbar_outline_color rgba(0, 0, 0, 0.5);
		@define-color incognito_bg_color ${modbackground[2
		]};
		@define-color new_title_bg_color ${modbackground[1]};

		/********** Thunar * */
		.thunar .sidebar.frame { border: none; }

		.thunar .sidebar .view:selected, .thunar .sidebar iconview:selected { background-color: ${modbackground[1]}; color: ${color13}; }

		# .thunar .sidebar .view:backdrop, .thunar .sidebar iconview:backdrop { background-color: #211818; }

		.thunar .sidebar .view:backdrop:selected, .thunar .sidebar iconview:backdrop:selected { background-color:  ${modbackground[1]}; color: ${color13}; }

		.thunar .standard-view > .view, .thunar .standard-view > iconview { border-radius: 0; }

		.thunar.background, .thunar .frame {
			background-color: ${background};
		}
	EOF

	 # Copy gtk.css to gtk-dark.css
  	cp ${PATH_GTK3}/gtk.css ${PATH_GTK3}/gtk-dark.css
  	cp ${PATH_GTK3}/gtk.css ${PATH_GTK4}/gtk.css
  	cp ${PATH_GTK4}/gtk.css ${PATH_GTK4}/gtk-dark.css
}

apply_startpage() {
	cp $HOME/.cache/wal/colors.css {{config}}/startpage/colors.css
}

## Source Theme Accordingly -----------------
if [[ "$1" == '--default' ]]; then
	source_default
elif [[ "$1" == '--pywal' ]]; then
	source_pywal
else
	echo "Available Options: --default  --pywal"
	exit 1
fi

## Execute Script ---------------------------

apply_wallpaper
apply_alacritty
apply_mako
apply_rofi
apply_waybar
apply_wlogout
apply_hypr
apply_gtk3
apply_spicetify
apply_obsidian
apply_startpage
