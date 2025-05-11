$data modify block ~ ~ ~ components.minecraft:custom_data.inventory set from block ~ ~ ~ Items[{Slot:$(slot)b}].components.minecraft:custom_data.terminal_drive.inventory
$data modify block ~ ~ ~ Items set from block ~ ~ ~ Items[{Slot:$(slot)b}].components.minecraft:custom_data.terminal_drive.inventory
# remove editing_drives tag
tag @e[type=minecraft:marker, limit=1, sort=nearest] remove editing_drives
# remove main_menu tag
tag @e[type=minecraft:marker, limit=1, sort=nearest] remove main_menu
# add editing_drive_storage tag
tag @e[type=minecraft:marker, limit=1, sort=nearest] add editing_drive_storage