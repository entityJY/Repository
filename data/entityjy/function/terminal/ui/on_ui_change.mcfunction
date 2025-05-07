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

# remove non ui items from chest
data modify block ~ ~ ~ Items prepend from block ~ ~ ~ Items[{components:{"minecraft:custom_data":{ui_item:{}}}}]

# clear data of ui.temp
$data remove storage entityjy:repository terminals[{ID:$(ID)}].ui.temp
# copy previous tick's inventory to ui.temp
$data modify storage entityjy:repository terminals[{ID:$(ID)}].ui.temp set from storage entityjy:repository terminals[{ID:$(ID)}].inventory
# give items in ui.temp prev:1b data
$data modify storage entityjy:repository terminals[{ID:$(ID)}].ui.temp[].components."minecraft:custom_data" merge value {prev:1b}
# insert ui.temp into inventory of terminal, only changed items should be updated
$data modify block ~ ~ ~ Items insert 0 from storage entityjy:repository terminals[{ID:$(ID)}].ui.temp[]
# clear data of ui.temp
$data remove storage entityjy:repository terminals[{ID:$(ID)}].ui.temp
# append items in inventory of terminal with data prev:1b into ui.temp
$data modify storage entityjy:repository terminals[{ID:$(ID)}].ui.temp append from block ~ ~ ~ Items[{components:{"minecraft:custom_data":{prev:1b}}}]
# if item contains no data in ui_item, remove item from ui.temp
$execute if data storage entityjy:repository terminals[{ID:$(ID)}].ui.temp[0].components."minecraft:custom_data".ui_item.empty run data remove storage entityjy:repository terminals[{ID:$(ID)}].ui.temp[0]
# refresh menu by removing prev:1b data from all items
data remove block ~ ~ ~ Items[].components."minecraft:custom_data".prev
# if only one button is clicked, execute on_click
$execute if data storage entityjy:repository terminals[{ID:$(ID)}].ui.temp[0] unless data storage entityjy:repository terminals[{ID:$(ID)}].ui.temp[1] run return run function entityjy:terminal/ui/menu/on_click with storage entityjy:repository terminals[{ID:$(ID)}]