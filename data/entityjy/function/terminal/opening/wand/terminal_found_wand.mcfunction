# reset raycast steps
scoreboard players set @s raycast_steps_terminal 0
# remove main_menu tag
tag @e[type=minecraft:marker, limit=1, sort=nearest] remove main_menu
# remove editing_drive_storage tag
tag @e[type=minecraft:marker, limit=1, sort=nearest] remove editing_drive_storage
# add editing_drives tag
tag @e[type=minecraft:marker, limit=1, sort=nearest] add editing_drives
# load drives page of terminal
data modify block ~ ~ ~ components.minecraft:custom_data.inventory set from block ~ ~ ~ components.minecraft:custom_data.drives
data modify block ~ ~ ~ Items set from block ~ ~ ~ components.minecraft:custom_data.drives
