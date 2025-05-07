advancement revoke @s only entityjy:open_terminal

# if player is holding wand
execute if predicate entityjy:holding_terminal_wand run return run function entityjy:terminal/opening/wand/open_terminal_wand
# if player isn't holding a wand
function entityjy:terminal/opening/wandless/open_terminal_wandless