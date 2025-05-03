# store ID to temporary storage
execute store result storage repository:data temporary.ID int 1 run scoreboard players get @s terminal_id
# save data
function entityjy:terminal/storage/data_set_macro with storage repository:data temporary
# reset tag, reset scoreboard
tag @s remove set_storage
scoreboard players reset @s terminal_set_data