##
 # load.mcfunction
 # entityjy
 #
 # Created by entityJY.
##

## terminal structure
 # drives       - contains loaded drives
 # main_menu    - contains main page of terminal
 # inventory    - contains the currently loaded terminal page
 # terminal     - an integer containing the number of open drive slots

say Thank you for using Repository!

# scoreboard for raycasting
scoreboard objectives add raycast_steps_terminal dummy
scoreboard objectives add raycast_steps_terminal2 dummy

# scoreboard for personal data storage for players
scoreboard objectives add player_id dummy

# scoreboard for detecting when the ui of the terminal is changed
scoreboard objectives add terminal_change_data dummy

# scoreboard for tracking what level terminal was placed
scoreboard objectives add placed_terminal_level dummy

# team for slimes used to lock terminals when in use
team add no_collision
team modify no_collision collisionRule never

# load function in charge of making terminal storage work
function entityjy:terminal/terminal_load

forceload add 29999990 29999990 29999990 29999990
setblock 29999990 -64 29999990 yellow_shulker_box