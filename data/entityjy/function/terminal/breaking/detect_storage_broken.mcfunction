# remove data from storage

# store ID to temporary storage
execute store result storage repository:data temporary.ID int 1 run scoreboard players get @s terminal_id
# save data
function entityjy:terminal/storage/data_delete_macro with storage repository:data temporary

kill @s
