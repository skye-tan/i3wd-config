[private]
@default:
    just --list

# copy the configuration files to the designated target
apply target='~/.config/':
    cp -r config/i3 {{target}}
    cp -r config/i3status {{target}}
    cp -r config/i3blocks {{target}}

# print help
@help:
    just --list
