minetest.register_tool("admintools:Admin Sword", {
    description = "Admin Sword",
    inventory_image = "admintools_admin_sword.png",
    
    tool_capabilities = {
        full_punch_interval = 0.4,
        max_drop_level = 1,
        groupcaps = {
            snappy = {times = {0.01, 0.07, 0.06}, uses = 0, maxlevel = 2},
        },
	groups = {not_in_creative_inventory=1},
        damage_groups = {fleshy = 5000, burns = 5000},
    },
})


minetest.register_tool("admintools:Admin Multitool", {
    description = "Admin Multitool",
    inventory_image = "admintools_admin_multitool.png",
    
    tool_capabilities = {
        full_punch_interval = 0.4,
        max_drop_level = 1,
        groupcaps = {
	        cracky = {times = {[1] = 2.25, [2] = 0.55, [3] = 0.35}, uses = 0, maxlevel = 2},
	        crumbly = {times = {[1] = 0.70, [2] = 0.35, [3] = 0.20}, uses = 0, maxlevel = 2},
	        choppy = {times = {[1] = 1.75, [2] = 0.45, [3] = 0.45}, uses = 0, maxlevel = 2},
            snappy = {times = {0.01, 0.07, 0.06}, uses = 0, maxlevel = 2},
        },
	groups = {not_in_creative_inventory=1},
        damage_groups = {fleshy = 25, burns = 0},
    },
})



minetest.register_tool("admintools:magicstick", {
    description = "Magic Stick",
    inventory_image = "admintools_magicstick.png^[colorize:#F200FF:90",

        
