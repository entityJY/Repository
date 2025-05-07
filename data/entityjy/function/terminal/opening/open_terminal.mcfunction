advancement revoke @s only entityjy:open_terminal

# run raycast function
execute at @s unless predicate entityjy:holding_terminal_wand anchored eyes positioned ^ ^ ^ anchored feet run function entityjy:terminal/opening/terminal_raycast
# clear players score
execute unless predicate entityjy:holding_terminal_wand run scoreboard players reset @s raycast_steps_terminal