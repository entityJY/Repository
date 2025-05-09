# remove ui items from players
clear @a *[minecraft:custom_data~{ui_item:{}}]

# clear data of ui.temp
$data remove storage entityjy:repository terminals[{ID:$(ID)}].ui.temp
# save current inventory of terminal to ui.temp
$data modify storage entityjy:repository terminals[{ID:$(ID)}].ui.temp set from block ~ ~ ~ Items
# delete all items from ui.temp with that contains the component ui_item
$data remove storage entityjy:repository terminals[{ID:$(ID)}].ui.temp[{components:{"minecraft:custom_data":{ui_item:{}}}}]
# if there are items remaining in ui.temp, return that item to the player
$execute if data storage entityjy:repository terminals[{ID:$(ID)}].ui.temp[0] run function entityjy:terminal/ui/menu/return_item with storage entityjy:repository terminals[{ID:$(ID)}]

# clear data of ui.temp
$data remove storage entityjy:repository terminals[{ID:$(ID)}].ui.temp
# copy over items with ui_item component to temporary storage
$data modify storage entityjy:repository terminals[{ID:$(ID)}].ui.temp append from block ~ ~ ~ Items[{components:{"minecraft:custom_data":{ui_item:{}}}}]
# copy over items from temporary storage to inventory of block
$data modify block ~ ~ ~ Items set from storage entityjy:repository terminals[{ID:$(ID)}].ui.temp

# clear data of ui.temp.selected_items
$data remove storage entityjy:repository terminals[{ID:$(ID)}].ui.temp
# copy previous tick's inventory to ui.temp.selected_items
$data modify storage entityjy:repository terminals[{ID:$(ID)}].ui.temp.selected_items set from storage entityjy:repository terminals[{ID:$(ID)}].inventory
# give items in ui.temp.selected_items prev:1b data
$data modify storage entityjy:repository terminals[{ID:$(ID)}].ui.temp.selected_items[].components."minecraft:custom_data" merge value {prev:1b}
# insert ui.temp.selected_items into inventory of terminal, only changed items should be updated
$data modify block ~ ~ ~ Items insert 0 from storage entityjy:repository terminals[{ID:$(ID)}].ui.temp.selected_items[]
# clear data of ui.temp.selected_items
$data remove storage entityjy:repository terminals[{ID:$(ID)}].ui.temp.selected_items
# append items in inventory of terminal with data prev:1b into ui.temp.selected_items
$data modify storage entityjy:repository terminals[{ID:$(ID)}].ui.temp.selected_items append from block ~ ~ ~ Items[{components:{"minecraft:custom_data":{prev:1b}}}]
# if item contains no data in ui_item, remove item from ui.temp.selected_items
$execute if data storage entityjy:repository terminals[{ID:$(ID)}].ui.temp.selected_items[0].components."minecraft:custom_data".ui_item.empty run data remove storage entityjy:repository terminals[{ID:$(ID)}].ui.temp.selected_items[0]
# if only one button is clicked, execute on_click
$execute if data storage entityjy:repository terminals[{ID:$(ID)}].ui.temp.selected_items[0] unless data storage entityjy:repository terminals[{ID:$(ID)}].ui.temp.selected_items[1] run function entityjy:terminal/ui/menu/on_click with storage entityjy:repository terminals[{ID:$(ID)}]
# refresh menu by removing prev:1b data from all items
data remove block ~ ~ ~ Items[].components."minecraft:custom_data".prev