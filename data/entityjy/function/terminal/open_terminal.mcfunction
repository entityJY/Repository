advancement revoke @s only entityjy:open_terminal

# run raycast function
execute if function entityjy:terminal/terminal_raycast_start run say passed
# clear players score
scoreboard players reset @s raycast_steps_terminal