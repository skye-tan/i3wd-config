[private]
default:
    @just --choose --unsorted

# copy the configuration files to the designated target.
apply target='~/.config':
    cp -r config/i3 {{target}}
    cp -r config/i3status {{target}}
    cp -r config/i3blocks {{target}}
    cp -r config/i3status-rust {{target}}

# take a copy of the current configuration files.
store target='~/.config':
    cp -r {{target}}/i3 config/
    cp -r {{target}}/i3status config/
    cp -r {{target}}/i3blocks config/
    cp -r {{target}}/i3status-rust config/

# print help.
help:
    @just --list --unsorted
