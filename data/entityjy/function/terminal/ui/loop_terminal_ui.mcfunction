# clear ui.temp
$data remove storage entityjy:repository terminals[{ID:$(ID)}].ui.temp
# save container data of previous frame
$data modify storage entityjy:repository terminals[{ID:$(ID)}].ui.temp.prev set from storage entityjy:repository terminals[{ID:$(ID)}].inventory
# compare container data to previous frame, store result terminal_change_data score, 0 for fail, 1 for pass
$execute store result score @s terminal_change_data run data modify storage entityjy:repository terminals[{ID:$(ID)}].ui.temp.prev set from block ~ ~ ~ Items
# if a difference is found and in default mode
execute if score @s terminal_change_data matches 1.. if entity @s[tag=!editing_drives] at @s run function entityjy:terminal/ui/menu/on_ui_change with block ~ ~ ~ components.minecraft:custom_data
# if a difference is found and in drive editor mode
execute if score @s terminal_change_data matches 1.. if entity @s[tag=editing_drives] at @s run function entityjy:terminal/ui/drive_menu/on_ui_drive_change with block ~ ~ ~ components.minecraft:custom_data
# clear temp data
$data remove storage entityjy:repository terminals[{ID:$(ID)}].ui.temp
# save current ui to inventory
$data modify storage entityjy:repository terminals[{ID:$(ID)}].inventory set from block ~ ~ ~ Items