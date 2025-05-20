advancement revoke @s only entityjy:open_repository

# if player is holding wand
execute if predicate entityjy:holding_repository_wand run return run function entityjy:repository/opening/wand/open_repository_wand
# if player isn't holding a wand
function entityjy:repository/opening/wandless/open_repository_wandless