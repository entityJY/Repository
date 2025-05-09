# remove ui items from players
clear @a *[minecraft:custom_data~{ui_item:{}}]

# clear temp.ui
data remove block ~ ~ ~ components.minecraft:custom_data.temp.ui


# Mark drives inserted in valid locations with ui_item

# save copy of Items to ui.temp.inventory
data modify block ~ ~ ~ components.minecraft:custom_data.temp.ui.inventory set from block ~ ~ ~ Items
# copy default scheme of drives to Items
data modify block ~ ~ ~ Items set from block ~ ~ ~ components.minecraft:custom_data.default_drive_scheme
# insert ui.temp.inventory into Items, only items with open slots available should be copied
data modify block ~ ~ ~ Items insert 0 from block ~ ~ ~ components.minecraft:custom_data.temp.ui.inventory[]
# give drives in Items the ui_item component to prevent them from being returned to the player later
data modify block ~ ~ ~ Items[{components:{"minecraft:custom_data":{terminal_drive:{}}}}].components.minecraft:custom_data merge value {ui_item:{cmd:"function entityjy:terminal/ui/drives/load_drive"}}


# append drives with ui_item component to ui.temp.inventory
data modify block ~ ~ ~ components.minecraft:custom_data.temp.ui.inventory append from block ~ ~ ~ Items[{components:{"minecraft:custom_data":{terminal_drive:{}}}}] 
# ui_item?


# set Items to ui.temp.inventory
data modify block ~ ~ ~ Items set from block ~ ~ ~ components.minecraft:custom_data.temp.ui.inventory




# return items to player

# save current inventory of terminal to ui.temp.return_items
data modify block ~ ~ ~ components.minecraft:custom_data.temp.ui.return_items set from block ~ ~ ~ Items
# delete all items from ui.temp with that contains the component ui_item
data remove block ~ ~ ~ components.minecraft:custom_data.return_items[{components:{"minecraft:custom_data":{ui_item:{}}}}]
# if there are items remaining in ui.temp, return that item to the player
execute if data block ~ ~ ~ components.minecraft:custom_data.temp.ui.return_items[0] run function entityjy:terminal/ui/return_items


# remove non-ui items from Items

# set Items to ui.temp.inventory
data modify block ~ ~ ~ Items set from block ~ ~ ~ components.minecraft:custom_data.temp.ui.inventory
# save items in Items with data component ui_item to ui.temp.inventory2
data modify block ~ ~ ~ components.minecraft:custom_data.temp.ui.inventory2 append from block ~ ~ ~ Items[{components:{"minecraft:custom_data":{ui_item:{}}}}]
# clear Items
data remove block ~ ~ ~ Items
# copy ui.temp.inventory2 to Items
data modify block ~ ~ ~ Items set from block ~ ~ ~ components.minecraft:custom_data.temp.ui.inventory2


# append default scheme of drives to Items
data modify block ~ ~ ~ Items append from block ~ ~ ~ components.minecraft:custom_data.default_drive_scheme[]


# fill remaining slots in Items with open_drive_slot item
data modify block ~ ~ ~ Items insert 0 from storage entityjy:repository internals.terminal.open_drive_slots[]
# save Items to terminal.main_page
data modify block ~ ~ ~ components.minecraft:custom_data.main_menu set from block ~ ~ ~ Items
# remove open_drive_slot items from Items
data remove block ~ ~ ~ Items[{components:{"minecraft:custom_name":"No Drive Input","minecraft:custom_data": {ui_item:{cmd:"say Please enter a drive"}}}}]

# clear ui_item component from drives
data remove block ~ ~ ~ Items[{components:{"minecraft:custom_data":{terminal_drive:{}}}}].components.minecraft:custom_data.ui_item

# save current ui to drives
data modify block ~ ~ ~ components.minecraft:custom_data.drives set from block ~ ~ ~ Items