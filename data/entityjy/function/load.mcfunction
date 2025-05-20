##
 # load.mcfunction
 # entityjy
 #
 # Created by entityJY.
##

## structure of personal data storage for repositories, located at entityjy:repository repositories.[ID]
 # drives       - contains loaded drives
 # main_menu    - contains main page of repository
 # inventory    - contains the currently loaded repository page
 # repository     - an integer containing the number of open drive slots
 # id           - contains the id of the repository for personal player storage
 # drive_slot   - contains the slot of the drive currently being edited, null if no drive is being edited contains a byte corresponding to the drive slot if one is being edited
 # level        - the level of the repository (the number of open drive slots)

## structure of custom_data for repository blocks
 # id           - contains the id of the repository for personal player storage

say Thank you for using Repository!

# scoreboard for raycasting
scoreboard objectives add raycast_steps_repository dummy
scoreboard objectives add raycast_steps_repository2 dummy

# scoreboard for personal data storage for players
scoreboard objectives add player_id dummy

# scoreboard for personal data storage for repositories
scoreboard objectives add repository_id dummy

# scoreboard for mode of the repository       1 - main_menu, 2 - editing_drives, 3 - editing_drive_storage
scoreboard objectives add repository_mode dummy

# scoreboard for detecting when the ui of the repository is changed
scoreboard objectives add repository_change_data dummy

# team for slimes used to lock repositories when in use
team add no_collision
team modify no_collision collisionRule never

# load function in charge of making repository storage work
function entityjy:repository/repository_load

forceload add 29999990 29999990 29999990 29999990
setblock 29999990 -64 29999990 yellow_shulker_box