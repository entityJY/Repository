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

# scoreboards for data modification of the terminals
scoreboard objectives add terminal_change_data dummy
scoreboard objectives add terminal_id dummy
scoreboard objectives add terminal_set_data dummy
scoreboard objectives add terminal_open_id dummy
scoreboard objectives add looking_at_terminal dummy

# team for slimes used to lock terminals when in use
team add no_collision
team modify no_collision collisionRule never

forceload add 29999990 29999990 29999990 29999990
setblock 29999990 -64 29999990 yellow_shulker_box