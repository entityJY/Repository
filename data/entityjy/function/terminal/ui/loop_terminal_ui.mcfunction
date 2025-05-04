# reset result variable
$data modify storage entityjy:repository players[{ID:$(ID)}].result set value 0
# compare container data, store result terminal_change_data score, 0 for fail, 1 for pass
$execute store result score @s terminal_change_data run data modify storage entityjy:repository players[{ID:$(ID)}].inventory set from block ~ ~ ~ Items
# if a difference is found
$execute if score @s terminal_change_data matches 1.. run function entityjy:terminal/ui/on_ui_change with storage entityjy:repository players[{ID:$(ID)}]
# save container data
$data modify storage entityjy:repository players[{ID:$(ID)}].inventory set from block ~ ~ ~ Items