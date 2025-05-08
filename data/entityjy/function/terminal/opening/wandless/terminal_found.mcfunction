# set terminal_open_id to match opened terminal
$scoreboard players set @s terminal_open_id $(ID)
# reset raycast steps
scoreboard players set @s raycast_steps_terminal 0
# remove editing_drives tag if the terminal contains it
tag @e[type=marker, sort=nearest, limit=1] remove editing_drives
# load main page of terminal
$data modify storage entityjy:repository terminals[{ID:$(ID)}].inventory set from storage entityjy:repository terminals[{ID:$(ID)}].main_page
$data modify block ~ ~ ~ Items set from storage entityjy:repository terminals[{ID:$(ID)}].main_page

# # run function to summon slime
# execute run function entityjy:terminal/opening/summon_slime with block ~ ~ ~