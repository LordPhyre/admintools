minetest.register_tool("admintools:admin_sword", {
    description = "Admin Sword",
    inventory_image = "admintools_admin_sword.png",
    groups = {not_in_creative_inventory = 1},
    on_drop = function() end,
    
    tool_capabilities = {
        full_punch_interval = 0,
        max_drop_level = 3,
        groupcaps = {
            snappy = {times = {0.0, 0.0, 0.0}, uses = 0, maxlevel = 2},
        },
        damage_groups = {fleshy = 5000, burns = 5000},
    },
})


minetest.register_tool("admintools:admin_multitool", {
    description = "Admin Multitool",
    inventory_image = "admintools_admin_multitool.png",
    groups = {not_in_creative_inventory = 1},
    on_drop = function() end,

    tool_capabilities = {
        full_punch_interval = 0,
        max_drop_level = 3,
        groupcaps = {
	    cracky = {times = {[1] = 0, [2] = 0, [3] = 0}, uses = 0, maxlevel = 3},
	    crumbly = {times = {[1] = 0.0, [2] = 0.0, [3] = 0.0}, uses = 0, maxlevel = 3},
	    choppy = {times = {[1] = 0.0, [2] = 0.0, [3] = 0.0}, uses = 0, maxlevel = 3},
            snappy = {times = {0.0, 0.0, 0.0}, uses = 0, maxlevel = 3},
        },
        damage_groups = {fleshy = 50, burns = 0},
    },
})


dofile(minetest.get_modpath("admintools") .. "/nodes.lua")
dofile(minetest.get_modpath("admintools") .. "/kstick.lua")
dofile(minetest.get_modpath("admintools") .. "/magicstick.lua")

