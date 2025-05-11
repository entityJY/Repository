# remove ui items from players
clear @a *[minecraft:custom_data~{ui_item:{}}]

# clear temp.ui
data remove block ~ ~ ~ components.minecraft:custom_data.temp.ui


# return items

# save current inventory of terminal to temp.ui
data modify block ~ ~ ~ components.minecraft:custom_data.temp.ui.return_items set from block ~ ~ ~ Items
# delete all items from ui.temp with that contains the component ui_item
data remove block ~ ~ ~ components.minecraft:custom_data.temp.ui.return_items[{components:{"minecraft:custom_data":{ui_item:{}}}}]
# if there are items remaining in ui.temp, return that item to the player
execute if data block ~ ~ ~ components.minecraft:custom_data.temp.ui.return_items[0] run function entityjy:terminal/ui/return_items


# delete no ui items

# copy over items with ui_item component to temporary storage
data modify block ~ ~ ~ components.minecraft:custom_data.temp.ui.saved_ui append from block ~ ~ ~ Items[{components:{"minecraft:custom_data":{ui_item:{}}}}]
# copy over items from temporary storage to inventory of block
data modify block ~ ~ ~ Items set from block ~ ~ ~ components.minecraft:custom_data.temp.ui.saved_ui


# get function of selected ui_item

# copy previous tick's inventory to ui.temp.selected_items
data modify block ~ ~ ~ components.minecraft:custom_data.temp.ui.selected_items set from block ~ ~ ~ components.minecraft:custom_data.inventory
# give items in ui.temp.selected_items prev:1b data
data modify block ~ ~ ~ components.minecraft:custom_data.temp.ui.selected_items[].components.minecraft:custom_data merge value {prev:1b}
# insert ui.temp.selected_items into inventory of terminal, only changed items should be updated
data modify block ~ ~ ~ Items insert 0 from block ~ ~ ~ components.minecraft:custom_data.temp.ui.selected_items[]
# clear data of ui.temp.selected_items
data remove block ~ ~ ~ components.minecraft:custom_data.temp.ui.selected_items
# append items in inventory of terminal with data prev:1b into ui.temp.selected_items
data modify block ~ ~ ~ components.minecraft:custom_data.temp.ui.selected_items append from block ~ ~ ~ Items[{components:{"minecraft:custom_data":{prev:1b}}}]
# if item contains no data in ui_item, remove item from ui.temp.selected_items
data remove block ~ ~ ~ components.minecraft:custom_data.temp.ui.selected_items[{components:{"minecraft:custom_data":{ui_item:{empty:1b}}}}]
# if only one button is clicked, execute on_click
execute if data block ~ ~ ~ components.minecraft:custom_data.temp.ui.selected_items[0] unless data block ~ ~ ~ components.minecraft:custom_data.temp.ui.selected_items[1] run function entityjy:terminal/ui/on_button_press
# refresh menu by removing prev:1b data from all items
data remove block ~ ~ ~ Items[].components."minecraft:custom_data".prev