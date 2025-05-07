# clear temp data
data remove storage entityjy:repository temporary
# assign id
execute as @s store result score @s player_id store result storage entityjy:repository temporary.ID int 1 run scoreboard players add #new player_id 1
# assign storage
data modify storage entityjy:repository players append from storage entityjy:repository temporary