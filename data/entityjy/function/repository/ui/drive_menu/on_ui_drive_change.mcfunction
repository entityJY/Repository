# remove ui items from players
clear @a *[minecraft:custom_data~{ui_item:{}}]


# Mark drives inserted in valid locations with ui_item

# save copy of Items to temp.ui.inventory
data modify storage entityjy:repository temp.ui.inventory set from block ~ ~ ~ Items
# copy default scheme of drives to Items
$data modify block ~ ~ ~ Items set from storage entityjy:repository internals.repository.drive_scheme_$(terminal)
# insert ui.temp.inventory into Items, only items with open slots available should be copied
data modify block ~ ~ ~ Items insert 0 from storage entityjy:repository temp.ui.inventory[]
# give drives in Items the ui_item component to prevent them from being returned to the player later
data modify block ~ ~ ~ Items[{components:{"minecraft:custom_data":{terminal_drive:{}}}}].components.minecraft:custom_data merge value {ui_item:{cmd:"function entityjy:repository/ui/drives/load_drive with storage entityjy:repository temp.ui.button"}}
# append drives with ui_item component to ui.temp.inventory
data modify storage entityjy:repository temp.ui.inventory append from block ~ ~ ~ Items[{components:{"minecraft:custom_data":{terminal_drive:{}}}}] 
# set Items to ui.temp.inventory
data modify block ~ ~ ~ Items set from storage entityjy:repository temp.ui.inventory


# return items to player

# save items with ui_item in Items to temp.ui.current_ui
data modify storage entityjy:repository temp.ui.current_ui append from block ~ ~ ~ Items[{components:{"minecraft:custom_data":{ui_item:{}}}}]
# remove items with ui_item from Items
data remove block ~ ~ ~ Items[{components:{"minecraft:custom_data":{ui_item:{}}}}]
# return items
execute if data block ~ ~ ~ Items[0] run function entityjy:repository/ui/return_items


# update drives page of terminal

# set Items to default drive scheme
$data modify block ~ ~ ~ Items set from storage entityjy:repository internals.repository.drive_scheme_$(terminal)
# insert temp.ui.current_ui into Items
data modify block ~ ~ ~ Items insert 0 from storage entityjy:repository temp.ui.current_ui[]
# fill remaining slots in Items with open_drive_slot item
data modify block ~ ~ ~ Items insert 0 from storage entityjy:repository internals.repository.open_drive_slots[]
# save Items to terminal.main_menu
$data modify storage entityjy:repository repositories[{id:$(id)}].main_menu set from block ~ ~ ~ Items
# save Items to terminal.main_menu_prev, append prev:1b
$data modify storage entityjy:repository repositories[{id:$(id)}].main_menu_prev set from block ~ ~ ~ Items
$data modify storage entityjy:repository repositories[{id:$(id)}].main_menu_prev[].components.minecraft:custom_data merge value {prev:1b}
# remove open_drive_slot items from Items
data remove block ~ ~ ~ Items[{components:{"minecraft:custom_name":"No Drive Input","minecraft:custom_data": {ui_item:{cmd:"say Please enter a drive"}}}}]
# clear ui_item component from drives
data remove block ~ ~ ~ Items[{components:{"minecraft:custom_data":{terminal_drive:{}}}}].components.minecraft:custom_data.ui_item

# save current ui to drives
$data modify storage entityjy:repository repositories[{id:$(id)}].drives set from block ~ ~ ~ Items