# update drive in main page
$data modify storage entityjy:repository terminals[{id:$(id)}].main_menu[{Slot:$(drive_slot)b}].components.minecraft:custom_data.terminal_drive.inventory set from block ~ ~ ~ Items
$data modify storage entityjy:repository terminals[{id:$(id)}].main_menu_prev[{Slot:$(drive_slot)b}].components.minecraft:custom_data.terminal_drive.inventory set from block ~ ~ ~ Items
# update drive in drives page
$data modify storage entityjy:repository terminals[{id:$(id)}].drives[{Slot:$(drive_slot)b}].components.minecraft:custom_data.terminal_drive.inventory set from block ~ ~ ~ Items
# clear drive_slot
$data remove storage entityjy:repository terminals[{id:$(id)}].drive_slot