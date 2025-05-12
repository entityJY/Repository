# if in drive_editor mode save current drive ui
$execute if score @e[type=minecraft:marker, sort=nearest, limit=1] terminal_mode matches 3 run function entityjy:terminal/ui/drives/save_drive_inventory with storage entityjy:repository terminals[{id:$(id)}]
# reset raycast steps
scoreboard players set @s raycast_steps_terminal 0
scoreboard players set @e[type=minecraft:marker, limit=1, sort=nearest] terminal_mode 2
# load drives page of terminal
$data modify storage entityjy:repository terminals[{id:$(id)}].inventory set from storage entityjy:repository terminals[{id:$(id)}].drives
$data modify block ~ ~ ~ Items set from storage entityjy:repository terminals[{id:$(id)}].drives