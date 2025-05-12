# save command to temp.ui.button.cmd
data modify storage entityjy:repository temp.ui.button.cmd set from storage entityjy:repository temp.ui.selected_items[0].components.minecraft:custom_data.ui_item.cmd
# save slot to temp.ui.button.slot
data modify storage entityjy:repository temp.ui.button.slot set from storage entityjy:repository temp.ui.selected_items[0].Slot
# save id to temp.ui.button.id
$data modify storage entityjy:repository temp.ui.button.id set value $(id)
# run function on button
function entityjy:run_cmd with storage entityjy:repository temp.ui.button