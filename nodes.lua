minetest.register_craft({
    type = "shapeless",
    output = "admintools:barrier",
    recipe = {"air"}
})


minetest.register_node("admintools:barrier", {
    description = "Barrier Block",
    drawtype = "airlike",
    paramtype = "light",
    sunlight_propagates = true,

    walkable     = true,
    pointable    = true,
    diggable     = true,
    buildable_to = false,
    drop = "admintools:barrier",
    sounds = default.node_sound_stone_defaults(),
    groups = {cracky = 1, level = 2},
})


minetest.register_node("admintools:lavawater_source", {
    description = "Lava-Water Source",
    drawtype = "liquid",
    waving = 3,
    tiles = {
        {
            name = "default_water_source_animated.png",
            backface_culling = false,
            animation = {
                type = "vertical_frames",
                aspect_w = 16,
                aspect_h = 16,
                length = 2.0,
            },
        },
        {
            name = "default_water_source_animated.png",
            backface_culling = true,
            animation = {
                type = "vertical_frames",
                aspect_w = 16,
                aspect_h = 16,
                length = 2.0,
            },
        },
    },
    damage_per_second = 8 * 2,
    alpha = 191,
    paramtype = "light",
    walkable = false,
    pointable = false,
    diggable = false,
    buildable_to = true,
    is_ground_content = false,
    drop = "",
    drowning = 1,
    liquidtype = "source",
    liquid_alternative_flowing = "admintools:lavawater_flowing",
    liquid_alternative_source = "admintools:lavawater_source",
    liquid_viscosity = 1,
    post_effect_color = {a = 103, r = 30, g = 60, b = 90},
    groups = {water = 3, liquid = 3, cools_lava = 1},
    sounds = default.node_sound_water_defaults(),
})



minetest.register_node("admintools:lavawater_flowing", {
    description = "Lava-Water Flowing",
    drawtype = "flowingliquid",
    waving = 3,
    tiles = {"default_water.png"},
    special_tiles = {
        {
            name = "default_water_flowing_animated.png",
            backface_culling = false,
            animation = {
                type = "vertical_frames",
                aspect_w = 16,
                aspect_h = 16,
                length = 0.5,
            },
        },
        {
            name = "default_water_flowing_animated.png",
            backface_culling = true,
            animation = {
                type = "vertical_frames",
                aspect_w = 16,
                aspect_h = 16,
                length = 0.5,
            },
        },
    },
    damage_per_second = 8 * 2,
    alpha = 191,
    paramtype = "light",
    walkable = false,
    pointable = false,
    diggable = false,
    buildable_to = true,
    is_ground_content = false,
    drop = "",
    drowning = 1,
    liquidtype = "flowing",
    liquid_alternative_flowing = "admintools:lavawater_flowing",
    liquid_alternative_source = "admintools:lavawater_source",
    liquid_viscosity = 1,
    post_effect_color = {a = 103, r = 30, g = 60, b = 90},
    groups = {water = 3, liquid = 3, not_in_creative_inventory = 1, cools_lava = 1},
    sounds = default.node_sound_water_defaults(),
})
