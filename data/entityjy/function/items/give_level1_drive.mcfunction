give @s music_disc_far[\
    lore=[[{"text":"Level 1","italic":false}]],\
    item_name=[{"text":"Drive","italic":false}],\
    enchantment_glint_override=true,\
    item_model="minecraft:writable_book",\
    minecraft:custom_data={terminal_drive:{\
        pages:1,\
        inventory:[\
            {components:{"minecraft:custom_name":"Save Drive","minecraft:custom_data": {ui_item:{cmd:"function entityjy:terminal/ui/drives/load_main_menu with storage entityjy:repository temp.ui.button"}}}, count: 1, Slot:0b, id: "minecraft:magenta_stained_glass_pane"},\
            {components:{"minecraft:custom_name":"","minecraft:custom_data": {ui_item:{empty:1b}}}, count: 1, Slot:8b, id: "minecraft:black_stained_glass_pane"},\
            {components:{"minecraft:custom_name":"","minecraft:custom_data": {ui_item:{empty:1b}}}, count: 1, Slot:9b, id: "minecraft:black_stained_glass_pane"},\
            {components:{"minecraft:custom_name":"","minecraft:custom_data": {ui_item:{empty:1b}}}, count: 1, Slot:17b, id: "minecraft:black_stained_glass_pane"},\
            {components:{"minecraft:custom_name":"","minecraft:custom_data": {ui_item:{empty:1b}}}, count: 1, Slot:18b, id: "minecraft:black_stained_glass_pane"},\
            {components:{"minecraft:custom_name":"","minecraft:custom_data": {ui_item:{empty:1b}}}, count: 1, Slot:26b, id: "minecraft:black_stained_glass_pane"},\
        ]\
    }},\
    !jukebox_playable\
]