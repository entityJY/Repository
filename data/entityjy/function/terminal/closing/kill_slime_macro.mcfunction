say hello
$execute at @e[type=marker, scores={terminal_id=$(ID)}] run kill @e[type=minecraft:slime, distance=..1]
data remove storage entityjy:repository temporaryClosing
scoreboard players reset @s terminal_open_id