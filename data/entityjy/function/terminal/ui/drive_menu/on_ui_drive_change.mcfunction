# remove ui items from players
clear @a *[minecraft:custom_data~{ui_item:{}}]

# clear ui.temp
$data remove storage entityjy:repository terminals[{ID:$(ID)}].ui.temp

# save copy of Items to ui.temp.inventory
$data modify storage entityjy:repository terminal[{ID:$(ID)}].ui.temp.inventory set from block ~ ~ ~ Items
# copy default scheme of drives to Items
$data modify block ~ ~ ~ Items set from storage entityjy:repository internals.terminal.driveScheme$(terminal)
# insert ui.temp.inventory into Items, only items with open slots available should be copied
$data modify block ~ ~ ~ Items insert 0 from storage entityjy:repository terminal[{ID:$(ID)}].ui.temp.inventory[]
# give drives in Items the ui_item component to prevent them from being returned to the player later
data modify block ~ ~ ~ Items[{components:{"minecraft:custom_data":{terminal_drive:{}}}}].components.minecraft:custom_data merge value {ui_item:{}}
# append drives with ui_item component to ui.temp.inventory
$data modify storage entityjy:repository terminal[{ID:$(ID)}].ui.temp.inventory append from block ~ ~ ~ Items[{components:{"minecraft:custom_data":{terminal_drive:{}, ui_item:{}}}}]
# set Items to ui.temp.inventory
$data modify block ~ ~ ~ Items set from storage entityjy:repository terminal[{ID:$(ID)}].ui.temp.inventory

# save current inventory of terminal to ui.temp.return_items
$data modify storage entityjy:repository terminals[{ID:$(ID)}].ui.temp.return_items set from block ~ ~ ~ Items
# delete all items from ui.temp with that contains the component ui_item
$data remove storage entityjy:repository terminals[{ID:$(ID)}].ui.temp.return_items[{components:{"minecraft:custom_data":{ui_item:{}}}}]
# if there are items remaining in ui.temp, return that item to the player
$execute if data storage entityjy:repository terminals[{ID:$(ID)}].ui.temp.return_items[0] run function entityjy:terminal/ui/drive_menu/return_items with storage entityjy:repository terminals[{ID:$(ID)}]
# set Items to ui.temp.inventory
$data modify block ~ ~ ~ Items set from storage entityjy:repository terminals[{ID:$(ID)}].ui.temp.inventory
# save items in Items with data component ui_item to ui.temp.inventory2
$data modify storage entityjy:repository terminals[{ID:$(ID)}].ui.temp.inventory2 append from block ~ ~ ~ Items[{components:{"minecraft:custom_data":{ui_item:{}}}}]
# clear Items
data remove block ~ ~ ~ Items
# copy ui.temp.inventory2 to Items
$data modify block ~ ~ ~ Items set from storage entityjy:repository terminals[{ID:$(ID)}].ui.temp.inventory2

# append default scheme of drives to Items
$data modify block ~ ~ ~ Items append from storage entityjy:repository internals.terminal.driveScheme$(terminal)[]

# clear ui_item component from drives
data remove block ~ ~ ~ Items[{components:{"minecraft:custom_data":{terminal_drive:{}}}}].components.minecraft:custom_data.ui_item

# save current ui to drives
$data modify storage entityjy:repository terminals[{ID:$(ID)}].drives set from block ~ ~ ~ Items