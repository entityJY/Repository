# set terminal_open_id to match opened terminal
$scoreboard players set @s terminal_open_id $(ID)
# reset raycast steps
scoreboard players set @s raycast_steps_terminal 0

# # run function to summon slime
# execute run function entityjy:terminal/opening/summon_slime with block ~ ~ ~