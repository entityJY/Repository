##
 # load.mcfunction
 # entityjy
 #
 # Created by entityJY.
##

say Thank you for using Repository!

# scoreboard for raycasting
scoreboard objectives add raycast_steps_terminal dummy
scoreboard objectives add raycast_steps_terminal2 dummy

# scoreboard for personal data storage for terminals
scoreboard objectives add terminal_id dummy

# scoreboard for personal data storage for players
scoreboard objectives add player_id dummy

# scoreboard for detecting when the ui of the terminal is changed
scoreboard objectives add terminal_change_data dummy

# scoreboard for showing which terminal a player has opened
scoreboard objectives add terminal_open_id dummy

# team for slimes used to lock terminals when in use
team add no_collision
team modify no_collision collisionRule never

# load function in charge of making terminal storage work
function entityjy:terminal/terminal_load

forceload add 29999990 29999990 29999990 29999990
setblock 29999990 -64 29999990 yellow_shulker_box