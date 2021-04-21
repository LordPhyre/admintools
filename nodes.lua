minetest.register_craft({
    type = "shapeless",
    output = "admintools:barrier",
    recipe = {"air"}
})


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
