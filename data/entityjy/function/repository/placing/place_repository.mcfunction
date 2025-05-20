advancement revoke @s only entityjy:place_terminal

# run raycast function, don't use the function in raycast_terminal folder because we need to do additional things at the placing
execute at @s anchored eyes positioned ^ ^ ^ anchored feet run function entityjy:repository/placing/terminal_raycast
# clear players score
scoreboard players reset @s raycast_steps_repository