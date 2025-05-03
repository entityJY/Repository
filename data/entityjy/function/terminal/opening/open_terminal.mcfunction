advancement revoke @s only entityjy:open_terminal

# run raycast function
execute at @s anchored eyes positioned ^ ^ ^ anchored feet run function entityjy:terminal/opening/terminal_raycast
# clear players score
scoreboard players reset @s raycast_steps_terminal