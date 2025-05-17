say hello
data remove storage entityjy:repository temp.drive_stuff
$data modify storage entityjy:repository temp.drive_stuff append from storage entityjy:repository terminals[{id:$(id)}].main_menu[{Slot:$(slot)b}].components.minecraft:custom_data.terminal_drive.inventory[{components:{"minecraft:custom_data":{ui_item:{}}}}]
$data modify storage entityjy:repository terminals[{id:$(id)}].main_menu[{Slot:$(slot)b}].components.minecraft:custom_data.terminal_drive.inventory set from storage entityjy:repository temp.drive_stuff
$data modify storage entityjy:repository testing.drive_inv set from storage entityjy:repository terminals[0].main_menu[$(slot)]
data modify storage entityjy:repository testing.replace set from storage entityjy:repository temp.drive_stuff