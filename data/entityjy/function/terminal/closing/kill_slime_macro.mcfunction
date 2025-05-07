$execute at @e[type=marker, scores={terminal_id=$(ID)}] run tp @e[type=minecraft:slime, distance=..1] ~ -90 ~
data remove storage entityjy:repository temporaryClosing
scoreboard players reset @s terminal_open_id