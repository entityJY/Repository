advancement revoke @s only entityjy:open_terminal

# run raycast function
execute if function entityjy:terminal/opening/terminal_raycast_start run say Opened terminal
# clear players score
scoreboard players reset @s raycast_steps_terminal