#!/bin/bash

source lib/utils
source lib/cursor_move
source lib/title
source lib/ownship
source lib/bullet
source lib/enemy

SCORE=0
HIGH=0
LIVES=3

function main() {
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
    done
    stty echo
    show_cursor
}

main
