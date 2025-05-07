# summon a slime when the barrel is opened to lock other players from opening it
$summon minecraft:slime $(x) $(y) $(z) {Invulnerable:1b, NoAI: 1b, attributes:[{id:"minecraft:generic.scale", base: 2.0d}, {id:"minecraft:generic.attack_damage", base: 0.0d}], CustomName:'{"text":"Terminal In Use"}', DeathLootTable:''}
# make it not collide with other entities so players can still stand on the terminal if they want
team join no_collision @e[type=minecraft:slime, sort=nearest, limit=1]