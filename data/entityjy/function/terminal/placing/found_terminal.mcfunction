$summon minecraft:marker $(x) $(y) $(z) {Tags:["terminal"], CustomName:'Terminal'}

# clear temp data
data remove storage entityjy:repository temporary
# assign id
execute as @e[type=minecraft:marker,sort=nearest,limit=1] store result score @s terminal_id store result storage entityjy:repository temporary.ID int 1 run scoreboard players add #new terminal_id 1
# assign storage
data modify storage entityjy:repository terminals append from storage entityjy:repository temporary
# assign id to terminal block
data modify block ~ ~ ~ components.minecraft:custom_data.ID set from storage entityjy:repository temporary.ID
# modify data in terminal personal storage
execute as @s run function entityjy:terminal/placing/data_modify_macro with block ~ ~ ~ components.minecraft:custom_data