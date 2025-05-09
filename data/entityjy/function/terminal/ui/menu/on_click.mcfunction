# save function on button to ui.temp.button.cmd
$data modify storage entityjy:repository terminals[{ID:$(ID)}].ui.temp.button.cmd set from storage entityjy:repository terminals[{ID:$(ID)}].ui.temp.selected_items[0].components.minecraft:custom_data.ui_item.cmd
# save slot of ui_item to ui.temp.button.slot
$data modify storage entityjy:repository terminals[{ID:$(ID)}].ui.temp.button.slot set from storage entityjy:repository terminals[{ID:$(ID)}].ui.temp.selected_items[0].Slot
# run function on button
$function entityjy:run_cmd with storage entityjy:repository terminals[{ID:$(ID)}].ui.temp.button
# clear data of ui.temp
$data remove storage entityjy:repository terminals[{ID:$(ID)}].ui.temp