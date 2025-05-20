##
 # tick.mcfunction
 # entityjy
 #
 # Created by entityJY.
##

# detect broken terminals
execute at @e[type=minecraft:marker, tag=terminal] \
    unless block ~ ~ ~ minecraft:barrel \
    as @e[type=minecraft:marker, tag=terminal, sort=nearest,limit=1] \
    run function entityjy:repository/breaking/storage_broken

# detect if a terminal is currently opened, run ui loop
execute at @e[type=minecraft:marker, tag=terminal] \
    if block ~ ~ ~ minecraft:barrel[open=true] \
    if data block ~ ~ ~ components.minecraft:custom_data.terminal \
    as @e[type=minecraft:marker, tag=terminal, distance=0...1] \
    run function entityjy:repository/ui/loop_terminal_ui with block ~ ~ ~ components.minecraft:custom_data

# remove ui_item component from terminal_drives on the floor
execute as @e[type=minecraft:item] if data entity @s Item.components.minecraft:custom_data.terminal_drive run data remove entity @s Item.components.minecraft:custom_data.ui_item
# kill ui elements
execute as @e[type=minecraft:item] if data entity @s Item.components.minecraft:custom_data.ui_item run kill @s

# find players with a non converted drive in their inventory
execute as @p[predicate=entityjy:unconverted_drive] run function entityjy:repository/convert_drive