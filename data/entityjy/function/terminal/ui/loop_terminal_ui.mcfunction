# clear ui.temp
$data remove storage entityjy:repository terminals[{ID:$(ID)}].ui.temp
# save container data of previous frame
$data modify storage entityjy:repository terminals[{ID:$(ID)}].ui.temp.prev set from storage entityjy:repository terminals[{ID:$(ID)}].inventory
# compare container data to previous frame, store result terminal_change_data score, 0 for fail, 1 for pass
$execute store result score @s terminal_change_data run data modify storage entityjy:repository terminals[{ID:$(ID)}].ui.temp.prev set from block ~ ~ ~ Items
# if a difference is found
$execute if score @s terminal_change_data matches 1.. at @s run function entityjy:terminal/ui/on_ui_change with storage entityjy:repository terminals[{ID:$(ID)}]