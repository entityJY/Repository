# if in drive_editor mode save current drive ui
$execute if score @e[type=minecraft:marker, sort=nearest, limit=1] repository_mode matches 3 run function entityjy:repository/ui/drives/save_drive_inventory with storage entityjy:repository repositories[{id:$(id)}]
# reset raycast steps
scoreboard players set @s raycast_steps_repository 0
scoreboard players set @e[type=minecraft:marker, limit=1, sort=nearest] repository_mode 2
# load drives page of repository
$data modify storage entityjy:repository repositories[{id:$(id)}].inventory set from storage entityjy:repository repositories[{id:$(id)}].drives
$data modify block ~ ~ ~ Items set from storage entityjy:repository repositories[{id:$(id)}].drives