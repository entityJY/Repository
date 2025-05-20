# remove ui items from players
clear @a *[minecraft:custom_data~{ui_item:{}}]


# save Items to temp.ui.Items
data modify storage entityjy:repository temp.ui.Items set from block ~ ~ ~ Items


# save stored items

# set Items to internals.repository.drive_inventory.empty_no_buttons
data modify block ~ ~ ~ Items set from storage entityjy:repository internals.repository.drive_inventory.empty_no_buttons
# insert temp.ui.Items into Items
data modify block ~ ~ ~ Items insert 0 from storage entityjy:repository temp.ui.Items[]
# delete items with ui_item from Items
data remove block ~ ~ ~ Items[{components:{"minecraft:custom_data":{ui_item:{}}}}]
# save Items to temp.ui.stored_items
data modify storage entityjy:repository temp.ui.stored_items set from block ~ ~ ~ Items


# return items to player if they were inserted in place of ui_items

# set Items to internals.repository.drive_inventory.open_slots
data modify block ~ ~ ~ Items set from storage entityjy:repository internals.repository.drive_inventory.open_slots
# insert temp.ui.Items into Items
data modify block ~ ~ ~ Items insert 0 from storage entityjy:repository temp.ui.Items[]
# delete items with open:1b from Items
data remove block ~ ~ ~ Items[{components:{"minecraft:custom_data":{open:1b}}}]
# set temp.ui.current_ui from Items with ui_item
data modify storage entityjy:repository temp.ui.current_ui append from block ~ ~ ~ Items[{components:{"minecraft:custom_data":{ui_item:{}}}}]
# clear items with ui_item from Items
data remove block ~ ~ ~ Items[{components:{"minecraft:custom_data":{ui_item:{}}}}]
# return remaining items in Items to player
execute if data block ~ ~ ~ Items[0] run function entityjy:repository/ui/return_items


# save pressed items with ui_item

# set Items from internals.repository.drive_inventory.open_slots
data modify block ~ ~ ~ Items set from storage entityjy:repository internals.repository.drive_inventory.open_slots
# insert inventory into Items
$data modify block ~ ~ ~ Items insert 0 from storage entityjy:repository repositories[{id:$(id)}].inventory[]
# delete items with open:1b from Items
data remove block ~ ~ ~ Items[{components:{"minecraft:custom_data":{open:1b}}}]
# tag items in Items with prev:1b
data modify block ~ ~ ~ Items[].components.minecraft:custom_data merge value {prev:1b}
# set temp.ui.previous_ui to Items
data modify storage entityjy:repository temp.ui.previous_ui set from block ~ ~ ~ Items
# set Items to temp.ui.current_ui
data modify block ~ ~ ~ Items set from storage entityjy:repository temp.ui.current_ui
# insert temp.ui.previous_ui into Items
data modify block ~ ~ ~ Items insert 0 from storage entityjy:repository temp.ui.previous_ui[]
# return stored items to Items
data modify block ~ ~ ~ Items append from storage entityjy:repository temp.ui.stored_items[]


# run function of pressed ui_item

# append temp.ui.selected_items with Items containing prev:1b tag
data modify storage entityjy:repository temp.ui.selected_items append from block ~ ~ ~ Items[{components:{"minecraft:custom_data":{prev:1b}}}]
# remove items in temp.ui.selected_items containing ui_item:{empty:1b}
data remove storage entityjy:repository temp.ui.selected_items[{components:{"minecraft:custom_data":{ui_item:{empty:1b}}}}]
# if only one button is pressed, execute on_click
execute if data storage entityjy:repository temp.ui.selected_items[0] unless data storage entityjy:repository temp.ui.selected_items[1] run function entityjy:repository/ui/on_button_press with block ~ ~ ~ components.minecraft:custom_data


# refresh menu
data remove block ~ ~ ~ Items[].components."minecraft:custom_data".prev