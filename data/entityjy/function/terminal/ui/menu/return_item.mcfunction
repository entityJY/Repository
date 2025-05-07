data remove block 29999990 -64 29999990 Items
$data modify block 29999990 -64 29999990 Items set from storage entityjy:repository terminals[{ID:$(ID)}].ui.temp
# change to use raycast
loot give @e[type=player, distance=0..6, limit=1,sort=nearest] mine 29999990 -64 29999990 stick[minecraft:custom_data={drop_contents:1b}]