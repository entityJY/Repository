$data modify storage entityjy:repository temp.ui.new_ui set from block ~ ~ ~ Items[{Slot:$(slot)b}].components.minecraft:custom_data.terminal_drive.inventory
$data modify storage entityjy:repository terminals[{id:$(id)}].inventory set from storage entityjy:repository temp.ui.new_ui
$data modify storage entityjy:repository terminals[{id:$(id)}].drive_slot set value $(slot)b
data modify block ~ ~ ~ Items set from storage entityjy:repository temp.ui.new_ui
scoreboard players set @e[type=minecraft:marker, sort=nearest, limit=1] terminal_mode 3