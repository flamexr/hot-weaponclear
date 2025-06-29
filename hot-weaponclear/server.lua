RegisterCommand('agirsilahlarsil', function(source, args, rawCommand)
    if source == 0 then
        local weapons = {
            "weapon_assaultrifle2",
            "WEAPON_ASSAULTRIFLE2",
            "weapon_assaultrifle",
            "WEAPON_ASSAULTRIFLE",
            "weapon_carbinerifle",
            "WEAPON_CARBINERIFLE",
            "weapon_advancedrifle",
            "WEAPON_ADVANCEDRIFLE",
            "weapon_specialcarbine",
            "WEAPON_SPECIALCARBINE",
            "weapon_bullpuprifle",
            "WEAPON_BULLPUPRIFLE",
            "weapon_combatpdw",
            "WEAPON_COMBATPDW",
            "weapon_heavyrifle",
            "WEAPON_HEAVYRIFLE",
            "weapon_smg",
            "WEAPON_SMG",
            "weapon_militaryrifle",
            "WEAPON_MILITARYRIFLE",
            "weapon_marksmanrifle",
            "WEAPON_MARKSMANRIFLE",
            "weapon_marksmanrifle_mk2",
            "WEAPON_MARKSMANRIFLE_MK2",
            "weapon_sniperrifle",
            "WEAPON_SNIPERRIFLE",
            "weapon_heavysniper",
            "WEAPON_HEAVYSNIPER",
            "weapon_heavysniper_mk2",
            "WEAPON_HEAVYSNIPER_MK2",
            "weapon_combatmg",
            "WEAPON_COMBATMG",
            "weapon_combatmg_mk2",
            "WEAPON_COMBATMG_MK2",
            "weapon_gusenberg",
            "WEAPON_GUSENBERG",
            "weapon_rpg",
            "WEAPON_RPG",
            "weapon_grenadelauncher",
            "WEAPON_GRENADELAUNCHER",
            "weapon_minigun",
            "WEAPON_MINIGUN"
        }

        for _, weapon in ipairs(weapons) do
            MySQL.query('SELECT COUNT(*) as count FROM ox_inventory WHERE data LIKE ?', {'%' .. weapon .. '%'}, function(result)
                if result[1] and result[1].count > 0 then
                    MySQL.query('UPDATE ox_inventory SET data = REPLACE(data, ? , ?)', {weapon, "phone"})
                    print(weapon .. " changed " .. result[1].count .. " times in the whole database")
                end
            end)
        end
        print("Ağır silahlar başarıyla temizlendi.")
    end
end, false) 