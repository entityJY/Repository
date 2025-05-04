##
 # tick.mcfunction
 # entityjy
 #
 # Created by entityJY.
##

# detect broken terminals
execute at @e[type=minecraft:marker, tag=terminal] as @e[type=minecraft:marker, tag=terminal, distance=0...1] unless block ~ ~ ~ minecraft:barrel run function entityjy:terminal/breaking/detect_storage_broken

# detect if a terminal is currently opened
execute at @e[type=minecraft:marker, tag=terminal] if block ~ ~ ~ minecraft:barrel[open=true] as @e[type=minecraft:marker, tag=terminal, distance=0...1] if data block ~ ~ ~ components.minecraft:custom_data.terminal run function entityjy:terminal/ui/loop_terminal_ui with block ~ ~ ~ components.minecraft:custom_data

# kill ui elements
execute as @e[type=item] if data entity @s Item.components.minecraft:custom_data.ui_item run kill @s