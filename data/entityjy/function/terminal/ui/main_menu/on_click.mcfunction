# save command to temp.ui.button.cmd
data modify block ~ ~ ~ components.minecraft:custom_data.temp.ui.button.cmd set from block ~ ~ ~ components.minecraft:custom_data.temp.ui.selected_items[0].components.minecraft:custom_data.ui_item.cmd
# save slot to temp.ui.button.slot
data modify block ~ ~ ~ components.minecraft:custom_data.temp.ui.button.slot set from block ~ ~ ~ components.minecraft:custom_data.temp.ui.selected_items[0].Slot
# run function on button
function entityjy:run_cmd with block ~ ~ ~ components.minecraft:custom_data.temp.ui.button