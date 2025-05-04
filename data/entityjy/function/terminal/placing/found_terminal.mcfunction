summon minecraft:marker ~ ~ ~ {Tags:["terminal"], CustomName:"Terminal"}

# clear temp data
data remove storage entityjy:repository temporary
# assign id
execute as @e[type=minecraft:marker,sort=nearest,limit=1] store result score @s terminal_id store result storage entityjy:repository temporary.ID int 1 run scoreboard players add #new terminal_id 1
# assign storage
data modify storage entityjy:repository players append from storage entityjy:repository temporary
# assign id to terminal block
data modify block ~ ~ ~ components.minecraft:custom_data.ID set from storage entityjy:repository temporary.ID