#!/usr/bin/env bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##

# Not my own work. This was added through Github PR. Credit to original author

#----- Optimized bars animation without much CPU usage increase --------
bar="▁▂▃▄▅▆▇█"
dict="s/;//g"

# Calculate the length of the bar outside the loop
bar_length=${#bar}

# Create dictionary to replace char with bar
for ((i = 0; i < bar_length; i++)); do
    dict+=";s/$i/${bar:$i:1}/g"
done

# Create cava config
config_file="/tmp/waybar_cava_config"
echo "
[general]
bars = 10

[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 7
" > $config_file


# Kill cava if it's already running
pkill -f "cava -p $config_file"

cava -p $config_file | while read -r line; do
    echo $line | sed $dict
done

# Read stdout from cava and perform substitution in a
