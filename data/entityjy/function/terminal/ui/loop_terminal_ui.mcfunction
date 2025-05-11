# clear temp.ui
data remove block ~ ~ ~ components.minecraft:custom_data.temp.ui
# save container data of previous frame
data modify block ~ ~ ~ components.minecraft:custom_data.temp.ui.prev set from block ~ ~ ~ components.minecraft:custom_data.inventory
# compare container data to previous frame, store result terminal_change_data score, 0 for fail, 1 for pass
execute store result score @s terminal_change_data run data modify block ~ ~ ~ components.minecraft:custom_data.temp.ui.prev set from block ~ ~ ~ Items
# if a difference is found and in default mode
execute if score @s terminal_change_data matches 1.. if entity @s[tag=!editing_drive_storage, tag=!editing_drives, tag=main_menu] at @s run function entityjy:terminal/ui/main_menu/on_ui_change
# if a difference is found and in drive editor mode
execute if score @s terminal_change_data matches 1.. if entity @s[tag=!editing_drive_storage, tag=editing_drives, tag=!main_menu] at @s run function entityjy:terminal/ui/drive_menu/on_ui_drive_change
# if a difference is found and in drive storage editor mode
execute if score @s terminal_change_data matches 1.. if entity @s[tag=editing_drive_storage, tag=!main_menu, tag=!editing_drives] at @s run function entityjy:terminal/ui/drive_editor/on_ui_drive_inv_change
# clear temp.ui
data remove block ~ ~ ~ components.minecraft:custom_data.temp.ui
# save current ui to inventory
data modify block ~ ~ ~ components.minecraft:custom_data.inventory set from block ~ ~ ~ Items