# clear temp.ui
data remove storage entityjy:repository temp.ui
# save container data of previous frame
$data modify storage entityjy:repository temp.ui.prev set from storage entityjy:repository terminals[{id:$(id)}].inventory
# compare container data to previous frame, store result terminal_change_data score, 0 for fail, 1 for pass
execute store result score @s terminal_change_data run data modify storage entityjy:repository temp.ui.prev set from block ~ ~ ~ Items
# run ui_update function of an update is detected
execute if score @s terminal_change_data matches 1.. run function entityjy:terminal/ui/ui_update
# clear temp.ui
data remove storage entityjy:repository temp.ui