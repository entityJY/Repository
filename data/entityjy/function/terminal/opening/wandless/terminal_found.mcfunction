# reset raycast steps
scoreboard players set @s raycast_steps_terminal 0
# remove editing_drives tag
tag @e[type=minecraft:marker, limit=1, sort=nearest] remove editing_drives
# remove editing_drive_storage tag
tag @e[type=minecraft:marker, limit=1, sort=nearest] remove editing_drive_storage
# add main_menu tag
tag @e[type=minecraft:marker, limit=1, sort=nearest] add main_menu
# load main page of terminal
data modify block ~ ~ ~ components.minecraft:custom_data.inventory set from block ~ ~ ~ components.minecraft:custom_data.main_menu
data modify block ~ ~ ~ Items set from block ~ ~ ~ components.minecraft:custom_data.main_menu