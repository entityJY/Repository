summon minecraft:chest_minecart ~ ~ ~
# remove Items in the currently active drive
$data modify storage entityjy:repository temp.slot set from storage entityjy:repository repositories[{id:$(id)}].drive_slot
function entityjy:repository/breaking/delete_drive_data with storage entityjy:repository temp
# set chest minecraft Items to main_menu
$data modify entity @e[type=minecraft:chest_minecart, sort=nearest, limit=1] Items set from storage entityjy:repository repositories[{id:$(id)}].main_menu
# kill chest to return items to player
kill @e[type=minecraft:chest_minecart, sort=nearest, limit=1]
kill @e[type=item, nbt={Item:{id:"minecraft:chest_minecart"}}]