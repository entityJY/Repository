##
 # tick.mcfunction
 # entityjy
 #
 # Created by entityJY.
##

# detect broken terminals
execute at @e[type=minecraft:marker, tag=terminal] \
    as @e[type=minecraft:marker, tag=terminal, distance=0...1] \
    unless data block ~ ~ ~ components.minecraft:custom_data.terminal \
    run function entityjy:terminal/breaking/detect_storage_broken

# detect if a terminal is currently opened, run ui loop
execute at @e[type=minecraft:marker, tag=terminal] \
    if block ~ ~ ~ minecraft:barrel[open=true] \
    as @e[type=minecraft:marker, tag=terminal, distance=0...1] \
    if data block ~ ~ ~ components.minecraft:custom_data.terminal \
    run function entityjy:terminal/ui/loop_terminal_ui

# remove ui_item component from terminal_drives on the floor
execute as @e[type=minecraft:item] if data entity @s Item.components.minecraft:custom_data.terminal_drive run data remove entity @s Item.components.minecraft:custom_data.ui_item
# kill ui elements
execute as @e[type=minecraft:item] if data entity @s Item.components.minecraft:custom_data.ui_item run kill @s