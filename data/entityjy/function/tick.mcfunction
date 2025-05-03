##
 # tick.mcfunction
 # entityjy
 #
 # Created by entityJY.
##

# detect broken terminals
execute at @e[type=minecraft:marker, tag=terminal] as @e[type=minecraft:marker, tag=terminal, distance=0...1] unless block ~ ~ ~ minecraft:barrel run function entityjy:terminal/breaking/detect_storage_broken

# detect when a terminal wants to modify storage data
execute as @e[tag=set_storage, type=minecraft:marker] at @s run function entityjy:terminal/storage/data_set