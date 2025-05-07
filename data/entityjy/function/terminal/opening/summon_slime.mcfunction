# summon a slime when the barrel is opened to lock other players from opening it
$summon minecraft:slime $(x) $(y) $(z) {Invulnerable:1b, NoAI: 1b, attributes:[{id:"minecraft:scale", base: 2.0d}, {id:"minecraft:attack_damage", base: 0.0d}], CustomName:'Terminal In Use', DeathLootTable:''}
# make it not collide with other entities so players can still stand on the terminal if they want
team join no_collision @e[type=minecraft:slime, sort=nearest, limit=1]

# switch slime to use interaction entities?