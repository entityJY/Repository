summon minecraft:marker ~ ~ ~ {Tags:["terminal"], CustomName:'Terminal'}

# store level of table to scoreboard
execute store result score @s placed_terminal_level run data get block ~ ~ ~ components.minecraft:custom_data.terminal

execute if score @s placed_terminal_level matches 3 run function entityjy:terminal/placing/storage_setters/terminal_3