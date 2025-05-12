say storage deleted
# save id to temp.id
execute store result storage entityjy:repository temp.id int 1 run scoreboard players get @s terminal_id
# clear data
function entityjy:terminal/breaking/delete_storage_macro with storage entityjy:repository temp
# kill self
kill @s