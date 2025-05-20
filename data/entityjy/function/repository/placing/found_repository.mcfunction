summon minecraft:marker ~ ~ ~ {Tags:["terminal"], CustomName:'Terminal'}

# repository storage set up
execute store result storage entityjy:repository temp.repository_placed.id int 1 run scoreboard players add #new repository_id 1

# store level of table to temp.repository_placed.level
data modify storage entityjy:repository temp.repository_placed.level set from block ~ ~ ~ components.minecraft:custom_data.repository

function entityjy:repository/placing/set_repository_storage with storage entityjy:repository temp.repository_placed