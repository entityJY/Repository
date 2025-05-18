# id - terminal_id for personal storage; level - level of the terminal, corresponds to amount of open drive slots

# set Items from main_menu_scheme
$data modify block ~ ~ ~ Items set from storage entityjy:repository internals.terminal.main_menu_scheme_$(level)
# set id of terminal
$data modify storage entityjy:repository terminals append value {id:$(id)}
# set inventory from main_menu_scheme
$data modify storage entityjy:repository terminals[{id:$(id)}].inventory set from storage entityjy:repository internals.terminal.main_menu_scheme_$(level)
# set main_menu from main_menu_scheme
$data modify storage entityjy:repository terminals[{id:$(id)}].main_menu set from storage entityjy:repository internals.terminal.main_menu_scheme_$(level)
# set main_menu_prev from main_menu_scheme
$data modify storage entityjy:repository terminals[{id:$(id)}].main_menu_prev set from storage entityjy:repository internals.terminal.main_menu_prev_scheme_$(level)
# set drives page from drive_scheme
$data modify storage entityjy:repository terminals[{id:$(id)}].drives set from storage entityjy:repository internals.terminal.drive_scheme_$(level)
# set id of block
$data modify block ~ ~ ~ components.minecraft:custom_data.id set value $(id)
# set id of marker
$scoreboard players set @e[type=marker,sort=nearest,limit=1] terminal_id $(id)
# save level of terminal
$data modify storage entityjy:repository terminals[{id:$(id)}].level set value $(level)