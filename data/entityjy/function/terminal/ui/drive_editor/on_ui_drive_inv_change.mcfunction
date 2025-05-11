# remove ui items from players
clear @a *[minecraft:custom_data~{ui_item:{}}]

# clear temp.ui
data remove block ~ ~ ~ components.minecraft:custom_data.temp.ui


# save Items to temp.ui.Items
data modify block ~ ~ ~ components.minecraft:custom_data.temp.ui.Items set from block ~ ~ ~ Items


# save stored items

# set Items to internals.terminal.drive_inventory.empty_no_buttons
data modify block ~ ~ ~ Items set from storage entityjy:repository internals.terminal.drive_inventory.empty_no_buttons
# insert temp.ui.Items into Items
data modify block ~ ~ ~ Items insert 0 from block ~ ~ ~ components.minecraft:custom_data.temp.ui.Items
# delete items with ui_item from Items
data remove block ~ ~ ~ Items[{components:{"minecraft:custom_data":{ui_item:{}}}}]
# save Items to temp.ui.stored_items
data modify block ~ ~ ~ components.minecraft:custom_data.temp.ui.stored_items set from block ~ ~ ~ Items


# return items to player if they were inserted in place of ui_items

# set Items to internals.terminal.drive_inventory.open_slots
data modify block ~ ~ ~ Items set from storage entityjy:repository internals.terminal.drive_inventory.open_slots
# insert temp.ui.Items into Items
data modify block ~ ~ ~ Items insert 0 from block ~ ~ ~ components.minecraft:custom_data.temp.ui.Items
# delete items with open:1b from Items
data remove block ~ ~ ~ Items[{components:{"minecraft:custom_data":{open:1b}}}]
# set temp.ui.current_ui from Items with ui_item
data modify block ~ ~ ~ components.minecraft:custom_data.temp.ui.current_ui set from block ~ ~ ~ Items[{components:{"minecraft:custom_data":{ui_item:{}}}}]
# clear items with ui_item from Items
data remove block ~ ~ ~ Items[{components:{"minecraft:custom_data":{ui_item:{}}}}]
# set temp.ui.return_items to Items
data modify block ~ ~ ~ components.minecraft:custom_data.temp.ui.return_items set from block ~ ~ ~ Items
# return remaining items in Items to player
execute if data block ~ ~ ~ Items[0] run function entityjy:terminal/ui/return_items


# save pressed items with ui_item

# set Items from internals.terminal.drive_inventory.open_slots
data modify block ~ ~ ~ Items set from storage entityjy:repository internals.terminal.drive_inventory.open_slots
# insert inventory into Items
data modify block ~ ~ ~ Items insert 0 from block ~ ~ ~ components.minecraft:custom_data.inventory
# delete items with open:1b from Items
data remove block ~ ~ ~ Items[{components:{"minecraft:custom_data":{open:1b}}}]
# tag items in Items with prev:1b
data modify block ~ ~ ~ Items[].components.minecraft:custom_data merge value {prev:1b}
# set temp.ui.previous_ui to Items
data modify block ~ ~ ~ components.minecraft:custom_data.temp.ui.previous_ui set from block ~ ~ ~ Items
# set Items to temp.ui.current_ui
data modify block ~ ~ ~ Items set from block ~ ~ ~ components.minecraft:custom_data.temp.ui.current_ui
# insert temp.ui.previous_ui into Items
data modify block ~ ~ ~ Items insert 0 from block ~ ~ ~ components.minecraft:custom_data.temp.ui.previous_ui
# append temp.ui.selected_items with Items containing prev:1b tag
data modify block ~ ~ ~ components.minecraft:custom_data.temp.ui.selected_items append from block ~ ~ ~ Items[{components:{"minecraft:custom_data":{prev:1b}}}]


# run function of pressed ui_item

# remove items in temp.ui.selected_items containing ui_item:{empty:1b}
data remove block ~ ~ ~ components.minecraft:custom_data.temp.ui.selected_items[{components:{"minecraft:custom_data":{ui_item:{empty:1b}}}}]
# if only one button is pressed, execute on_click
execute if data block ~ ~ ~ components.minecraft:custom_data.temp.ui.selected_items[0] unless data block ~ ~ ~ components.minecraft:custom_data.temp.ui.selected_items[1] run function entityjy:terminal/ui/on_button_press


# refresh menu
data remove block ~ ~ ~ Items[].components."minecraft:custom_data".prev
# append temp.ui.stored_items to Items
data modify block ~ ~ ~ Items append from block ~ ~ ~ components.minecraft:custom_data.temp.ui.stored_items[]