summon minecraft:marker ~ ~ ~ {Tags:["terminal"], CustomName:'Terminal'}

# terminal storage set up
execute store result storage entityjy:repository temp.terminal_placed.id int 1 run scoreboard players add #new terminal_id 1

# store level of table to temp.terminal_placed.level
data modify storage entityjy:repository temp.terminal_placed.level set from block ~ ~ ~ components.minecraft:custom_data.terminal

function entityjy:terminal/placing/set_terminal_storage with storage entityjy:repository temp.terminal_placed