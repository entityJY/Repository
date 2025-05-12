say update pages
# update drive in main page
$data modify storage entityjy:repository terminals[{id:$(id)}].inventory[{Slot:$(drive_slot)}].components.minecraft:custom_data.terminal_drive.inventory
# update drive in drives page
$data modify storage entityjy:repository terminals[{id:$(id)}].drives[{Slot:$(drive_slot)}].components.minecraft:custom_data.terminal_drive.inventory
# clear drive_slot
$data remove storage entityjy:repository terminals[{id:$(id)}].drive_slot