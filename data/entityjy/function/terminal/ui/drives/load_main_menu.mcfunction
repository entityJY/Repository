$function entityjy:terminal/ui/drives/save_drive_inventory with storage entityjy:repository terminals[{id:$(id)}]
$data modify storage entityjy:repository terminals[{id:$(id)}].inventory set from storage entityjy:repository terminals[{id:$(id)}].main_menu
$data modify block ~ ~ ~ Items set from storage entityjy:repository terminals[{id:$(id)}].main_menu
scoreboard players set @e[type=minecraft:marker, sort=nearest, limit=1] terminal_mode 1