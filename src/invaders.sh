#!/bin/bash
## ----------------------------------------------
## @File: invaders.sh
source lib/utils
source lib/cursor_move
source lib/title
source lib/ownship
source lib/bullet
source lib/enemy

SCORE=0
HIGH=0
LIVES=3

function showDocs() {
  grep -Ir '^##' . | sed -e 's/^.*##//' 1>&2
}

##
## @Name: main
## @desc: runs the bash Invaders Game
function main() {
    touch ~/temp/bhinv-debug
    hide_cursor
    init_screen
    show_title
    clear_screen
    update_score
    draw_ownship
    create_enemy 2 2
    create_enemy 4 2
    #update_pos
    stty -echo
    tick=0
    while :
    do
        read -t 0.01 -n 1 key
        
        if [[ $key = q ]]; then
            goodbye
            break
        elif [[ $key = d ]]; then
            move_right
        elif [[ $key = a ]]; then
            move_left
        elif [[ $key = p ]]; then
            shoot
        fi
        draw_bullet
        sleep 0.04
        ((tick+=1))
        if [ $((tick % 10)) == 0 ]; then
            debug $tick
            move_enemy_right
        fi
    done
    stty echo
    show_cursor
    rm ~/temp/bhinv-debug
}

if [[ "$1" = "list_func" ]]; then
    showDocs
    exit
fi

main

##
