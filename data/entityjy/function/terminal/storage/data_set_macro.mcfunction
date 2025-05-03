# store trigger value to temp
execute store result storage repository:data temporary.test_data int 1 run scoreboard players get @s terminal_set_data
# save to storage
$data modify storage repository:data players[{ID:$(ID)}].test_data set from storage repository:data temporary.test_data
# message for debugging
tellraw @a [{"text":"Player "},{"score":{"name":"@s","objective":"ID"}},{"text":": Set to "},{"storage":"repository:data","nbt":"temporary.test_data"}]