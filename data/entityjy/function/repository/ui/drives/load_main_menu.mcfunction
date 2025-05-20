say load main menu
$function entityjy:repository/ui/drives/save_drive_inventory with storage entityjy:repository repositories[{id:$(id)}]
$data modify storage entityjy:repository repositories[{id:$(id)}].inventory set from storage entityjy:repository repositories[{id:$(id)}].main_menu
$data modify block ~ ~ ~ Items set from storage entityjy:repository repositories[{id:$(id)}].main_menu
scoreboard players set @e[type=minecraft:marker, sort=nearest, limit=1] repository_mode 1