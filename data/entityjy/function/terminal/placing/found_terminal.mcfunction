summon minecraft:marker ~ ~ ~ {Tags:["terminal"], CustomName:'Terminal'}

# clear temp data
data remove storage repository:data temporary
# assign id
execute as @e[type=minecraft:marker,sort=nearest,limit=1] store result score @s terminal_id store result storage repository:data temporary.ID int 1 run scoreboard players add #new terminal_id 1
# assign storage
data modify storage repository:data players append from storage repository:data temporary