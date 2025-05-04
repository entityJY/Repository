# store ID to temporary storage
execute store result storage entityjy:repository temporary.ID int 1 run scoreboard players get @s terminal_id
# delete data at id
function entityjy:terminal/storage/data_delete_macro with storage entityjy:repository temporary
# kill self
kill @s