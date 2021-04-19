local stick_knockback = sumo.stick_knockback --multiplier for how hard the stick hits
local stick_pointing_distance = sumo.stick_pointing_distance
local stick_push_timeout = sumo.stick_push_timeout --(float)--in seconds
sumo.timeouts={}
sumo.jumpouts = {}


minetest.register_tool("admintools:Admin Sword", {
    description = "Admin Sword",
    inventory_image = "admintools_admin_sword.png",
    
    tool_capabilities = {
        full_punch_interval = 0,
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
        full_punch_interval = 0,
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


minetest.register_craftitem("admintools:magicstick", {
    description = "Magic Stick",
    inventory_image = "admintools_magicstick.png^[colorize:#F200FF:90",
    stack_max = 1,
    wield_scale = {x = 2, y = 2, z = 2},
    on_drop = function() end,
    range = stick_pointing_distance,

    on_use = function(itemstack, user, pointed_thing)
        
        
        --local imeta = itemstack:get_meta()
        local p_name = user:get_player_name()
        local last_push_time = sumo.timeouts[p_name] or 0.0
        local current_time = minetest.get_us_time()/1000000.0

        local time_from_last_push = current_time-last_push_time

        
        local force = 1 --hey, lets give the jitter-clickers "something" but not much: force of 2 is tiny, which makes jitterclicking completely ineffectual

        if time_from_last_push > stick_push_timeout then
            local time_factor = 0
            if time_from_last_push >= 0.3 and time_from_last_push < 0.4 then
                time_factor = 4
            elseif time_from_last_push >=  0.4 and time_from_last_push <  0.5 then
                time_factor = 9
            elseif time_from_last_push >= 0.5 and time_from_last_push < 0.7 then
                time_factor = 14

            elseif time_from_last_push >  0.7 then
                time_factor = 20
            elseif time_from_last_push > 2.0 then
                time_factor = 25
            end
            force = stick_knockback + time_factor
        end

        
        


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


                else --not pressing shift, add velocity "force"

                    local pointed_name = pointed_thing.ref:get_player_name()
                    if not sumo.invincible[pointed_name] then
                        pointed_thing.ref:add_player_velocity(vector.multiply(dir, force))
                        sumo.timeouts[p_name] = current_time
                    end
                    
                end

            end
        end
}   end
end


    on_place = function(itemstack, placer, pointed_thing)


        local p_name = placer:get_player_name()
        local last_jump_time = sumo.jumpouts[p_name] or 0.0
        local current_time = minetest.get_us_time()/1000000.0 --microsec converted to sec

        
        local time_from_last_jump = current_time-last_jump_time
        
        if pointed_thing.type == 'node' then
            if vector.distance(pointed_thing.under, placer:get_pos()) < stick_vault_reach then

                if last_jump_time == 0.0 or time_from_last_jump >= stick_vault_timeout then
                    local lookvect = placer:get_look_dir()
                    local pushvect = vector.normalize( {x=lookvect.x, z=lookvect.z, y= math.sqrt(1-(lookvect.y*lookvect.y))})
                    --gives a unit vector that is 90 deg offset in the vert direction
                    local force = 10 * vector.length(vector.normalize( {x=lookvect.x, z=lookvect.z, y= 0}))
                    sumo.jumpouts[p_name] = current_time
                    placer:add_player_velocity(vector.multiply(pushvect, force))
                    --update the staff time for next check
                    local sound = 'jump'..math.random(1,2)
                    minetest.sound_play(sound, {
                        pos = placer:get_pos(),
                        max_hear_distance = 10,
                        gain = 10.0,
                    })
                end
            end
        end
        
    end,

})
