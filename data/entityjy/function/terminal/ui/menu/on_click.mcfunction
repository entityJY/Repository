# run function on button
$data modify storage entityjy:repository temporary set from storage entityjy:repository terminals[{ID:$(ID)}].ui.temp[0].components.minecraft:custom_data.ui_item
$function entityjy:run_cmd with storage entityjy:repository terminals[{ID:$(ID)}].ui.temp[0].components.minecraft:custom_data.ui_item
# clear data of ui.temp
$data remove storage entityjy:repository terminals[{ID:$(ID)}].ui.temp