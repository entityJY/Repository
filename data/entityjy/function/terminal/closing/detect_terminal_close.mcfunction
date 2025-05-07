execute at @s store success score @s looking_at_terminal anchored eyes positioned ^ ^ ^ anchored feet run function entityjy:terminal/raycast_terminal/terminal_raycast
execute if score @s looking_at_terminal matches 1.. run scoreboard players reset @s terminal_open_id
# execute if score @s looking_at_terminal matches 1.. run