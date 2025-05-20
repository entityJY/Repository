# remove ui items from players
clear @a *[minecraft:custom_data~{ui_item:{}}]


# return items

# save items in Items with ui_item to temp.ui.current_ui
data modify storage entityjy:repository temp.ui.current_ui append from block ~ ~ ~ Items[{components:{"minecraft:custom_data":{ui_item:{}}}}]
# remove items with ui_item from Items
data remove block ~ ~ ~ Items[{components:{"minecraft:custom_data":{ui_item:{}}}}]
# return remaining items in Items to player
execute if data block ~ ~ ~ Items[0] run function entityjy:repository/ui/return_items


# get function of selected ui_item

# set Items to temp.ui.current_ui
data modify block ~ ~ ~ Items set from storage entityjy:repository temp.ui.current_ui
# insert main_menu_prev into Items
$data modify block ~ ~ ~ Items insert 0 from storage entityjy:repository repositories[{id:$(id)}].main_menu_prev[]
# append items in Items with prev:1b tag to temp.ui.selected_items
data modify storage entityjy:repository temp.ui.selected_items append from block ~ ~ ~ Items[{components:{"minecraft:custom_data":{prev:1b}}}]
# if only one button is clicked, execute on_click
execute if data storage entityjy:repository temp.ui.selected_items[0] unless data storage entityjy:repository temp.ui.selected_items[1] run function entityjy:repository/ui/on_button_press with block ~ ~ ~ components.minecraft:custom_data
# refresh menu by removing prev:1b data from all items
data remove block ~ ~ ~ Items[].components."minecraft:custom_data".prev