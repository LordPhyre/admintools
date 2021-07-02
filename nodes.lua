minetest.register_node("admintools:barrier", {
    description = "Barrier Block",
    inventory_image = "admintools_barrier.png",
    wield_image = "admintools_barrier.png",
    drawtype = "airlike",
    paramtype = "light",
    sunlight_propagates = true,

    walkable     = true,
    pointable    = true,
    diggable     = true,
    buildable_to = false,
    drop = "admintools:barrier",
    sounds = default.node_sound_metal_defaults(),
    groups = {cracky = 1, level = 3},
})


minetest.register_craft({
    type = "shapeless",
    output = "admintools:barrier",
    recipe = {"air"}
})


minetest.register_node("admintools:burningair", {
    description = "Burning Air",
    drawtype = "airlike",
    inventory_image = "admintools_burningair.png",
    wield_image = "admintools_burningair.png",
    groups = {not_in_creative_inventory = 1},
    paramtype = "light",
    walkable = false,
    buildable_to = true,
    sunlight_propagates = true,
    pointable = false,
    damage_per_second = 4,
    drop = "",
})

minetest.register_node("admintools:obamium", { --the obamium bloc
    description = "Obamium",
    drawtype = "nodebox",
    tiles = {
		"obamiumtop.png",
		"obamiumbottom.png",
		"obamiumright.png",
		"obamiumleft.png",
		"obamiumback.png",
		"obamiumfront.png"
	},
    sounds = default.node_sound_ice_defaults(),
    groups = {fleshy = 1, level = 3},
})

minetest.register_node("admintools:obamiumore", { --the obamium ore
    description = "Raw Obamium",
    tiles = {"default_stone.png^obamiumore.png"},
    sounds = default.node_sound_stone_defaults(),
    groups = {cracky = 1, level = 3, not_in_creative_inventory = 1},
    drop = "admintools:obamium"
})

minetest.register_craft({
	type = "fuel",
	recipe = "admintools:obamium",
	burntime = 69420123,
})
