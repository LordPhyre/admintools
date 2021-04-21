local stick_knockback = 35 --how hard the stick smacks kids. recommended min: 35
local stick_pointing_distance = 10 --selecting distance of smacking
local stick_bounce_reach = 15 --selecting distance of bouncing
admintools_invincible = {}
admintools_timeouts = {}
admintools_jumpouts = {}


minetest.register_tool("admintools:admin_sword", {
    description = "Admin Sword",
    inventory_image = "admintools_admin_sword.png",
    
    tool_capabilities = {
        full_punch_interval = 0,
        max_drop_level = 3,
        groupcaps = {
            snappy = {times = {0.0, 0.0, 0.0}, uses = 0, maxlevel = 2},
        },
	groups = {not_in_creative_inventory=1},
        damage_groups = {fleshy = 5000, burns = 5000},
    },
})


minetest.register_tool("admintools:admin_multitool", {
    description = "Admin Multitool",
    inventory_image = "admintools_admin_multitool.png",
    
    tool_capabilities = {
        full_punch_interval = 0,
        max_drop_level = 3,
        groupcaps = {
	    cracky = {times = {[1] = 0, [2] = 0, [3] = 0}, uses = 0, maxlevel = 2},
	    crumbly = {times = {[1] = 0.0, [2] = 0.0, [3] = 0.0}, uses = 0, maxlevel = 2},
	    choppy = {times = {[1] = 0.0, [2] = 0.0, [3] = 0.0}, uses = 0, maxlevel = 2},
            snappy = {times = {0.0, 0.0, 0.0}, uses = 0, maxlevel = 2},
        },
	groups = {not_in_creative_inventory=1},
        damage_groups = {fleshy = 50, burns = 0},
    },
})


minetest.register_craftitem("admintools:magicstick", {
    description = "Magic Stick",
    inventory_image = "admintools_magicstick.png^[colorize:#F200FF:50",
    stack_max = 1,
    wield_scale = {x = 2, y = 2, z = 2},
    on_drop = function() end,
    range = stick_pointing_distance,

    on_use = function(itemstack, user, pointed_thing)

        local p_name = user:get_player_name()
        local last_push_time = admintools_timeouts[p_name] or 0.0
        local current_time = minetest.get_us_time()/1000000.0
        local time_from_last_push = current_time-last_push_time
        local force = stick_knockback

        if pointed_thing == nil then return end
        if pointed_thing.type == 'node' then return end
        if not pointed_thing.type == 'object' then return end

        if pointed_thing.type == 'object' then
            
            --this only works on players
            if minetest.is_player(pointed_thing.ref) == true then

                local dir = user:get_look_dir()
                local keys = user:get_player_control()
                local hitted_pos = pointed_thing.ref:get_pos()
                local hitter_pos = user:get_pos()

                if vector.distance(hitted_pos,hitter_pos) < stick_pointing_distance then

                    local pointed_name = pointed_thing.ref:get_player_name()
                    if not admintools_invincible[pointed_name] then
                        pointed_thing.ref:add_player_velocity(vector.multiply(dir, force))
                        admintools_timeouts[p_name] = current_time

                    end
                    
                end

            end
        end
        
        
    
    end,

    on_place = function(itemstack, placer, pointed_thing)

        local p_name = placer:get_player_name()
        local last_jump_time = admintools_jumpouts[p_name] or 0.0
        local current_time = minetest.get_us_time()/1000000.0

        
        local time_from_last_jump = current_time-last_jump_time
        
        if pointed_thing.type == 'node' then
            if vector.distance(pointed_thing.under, placer:get_pos()) < stick_bounce_reach then

                    local lookvect = placer:get_look_dir()
                    local pushvect = vector.normalize( {x=lookvect.x, z=lookvect.z, y= math.sqrt(1-(lookvect.y*lookvect.y))})
                    local force = 10 * vector.length(vector.normalize( {x=lookvect.x, z=lookvect.z, y= 0}))
                    admintools_jumpouts[p_name] = current_time
                    placer:add_player_velocity(vector.multiply(pushvect, force))
            end
        end
        
    end,

})


dofile(minetest.get_modpath("admintools") .. "/nodes.lua")
