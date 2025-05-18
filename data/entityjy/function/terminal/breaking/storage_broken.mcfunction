# save id to temp.id
execute store result storage entityjy:repository temp.id int 1 run scoreboard players get @s terminal_id
execute if score @s terminal_mode matches 3 run function entityjy:terminal/breaking/drop_drives with storage entityjy:repository temp
# modify data of dropped barrel
function entityjy:terminal/breaking/save_level with storage entityjy:repository temp
# clear data
function entityjy:terminal/breaking/delete_storage_macro with storage entityjy:repository temp
# kill self
kill @s