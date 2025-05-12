# if a difference is found and in default mode
execute if score @s terminal_mode matches 1 at @s run return run function entityjy:terminal/ui/main_menu/on_ui_change with block ~ ~ ~ components.minecraft:custom_data
# if a difference is found and in drive editor mode
execute if score @s terminal_mode matches 2 at @s run return run function entityjy:terminal/ui/drive_menu/on_ui_drive_change with block ~ ~ ~ components.minecraft:custom_data
# if a difference is found and in drive storage editor mode
execute if score @s terminal_mode matches 3 at @s run return run function entityjy:terminal/ui/drive_editor/on_ui_drive_inv_change with block ~ ~ ~ components.minecraft:custom_data