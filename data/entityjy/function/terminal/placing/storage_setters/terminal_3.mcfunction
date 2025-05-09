# set Items from main_menu_scheme
data modify block ~ ~ ~ Items set from storage entityjy:repository internals.terminal.main_menu_scheme_3
# set inventory from main_menu_scheme
data modify block ~ ~ ~ components.minecraft:custom_data.inventory set from storage entityjy:repository internals.terminal.main_menu_scheme_3
# set main_page from main_menu_scheme
data modify block ~ ~ ~ components.minecraft:custom_data.main_menu set from storage entityjy:repository internals.terminal.main_menu_scheme_3
# set drives page from drive_scheme
data modify block ~ ~ ~ components.minecraft:custom_data.drives set from storage entityjy:repository internals.terminal.drive_scheme_3
# set default_drives from drive_scheme
data modify block ~ ~ ~ components.minecraft:custom_data.default_drive_scheme set from storage entityjy:repository internals.terminal.drive_scheme_3