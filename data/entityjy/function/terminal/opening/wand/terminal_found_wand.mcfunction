# set terminal_open_id to match opened terminal
$scoreboard players set @s terminal_open_id $(ID)
# reset raycast steps
scoreboard players set @s raycast_steps_terminal 0
# give terminal editing_drives tag
tag @e[type=marker, sort=nearest, limit=1] add editing_drives
# load drives page of terminal
$data modify block ~ ~ ~ Items set from storage entityjy:repository terminals[{ID:$(ID)}].drives
$data modify storage entityjy:repository terminals[{ID:$(ID)}].inventory set from storage entityjy:repository terminals[{ID:$(ID)}].drives
