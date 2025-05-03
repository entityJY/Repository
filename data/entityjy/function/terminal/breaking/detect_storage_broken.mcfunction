execute as @e[type=minecraft:marker, tag=terminal] at @e[type=minecraft:marker, tag=terminal] unless block ~ ~ ~ minecraft:barrel run say terminal broken
execute as @e[type=minecraft:marker, tag=terminal] at @e[type=minecraft:marker, tag=terminal] unless block ~ ~ ~ minecraft:barrel run kill @s
# unless data block ~ ~ ~ components.minecraft:custom_data.terminal