Global("Defenders", {})

function Defenders.load_defaults()
    Defenders.last_unit_state = 0
    Defenders.last_unit_name = ""
    -- Defenders.last_chat_msg = ""
    
    if not Defenders.IsRegisteredLogUnits then
        Defenders.IsRegisteredLogUnits = false
    end

    if not Defenders.last_chat_msg then
        Defenders.last_chat_msg = ""
    end
end

function Defenders.FindDefenderByName(unit_name)
    local defender = locales["defenders"][unit_name]

    if defender == nil then
        for defenders_name, defender_item in pairs(locales["defenders"]) do

            if lev_iter_based(defenders_name, unit_name) < 2 then
                unit_name = defenders_name
                defender = defender_item
                break
            end
        end
    end

    return {["name"] = unit_name, ["defender"] = defender}
end

function Defenders.LogUnits()
    local units = avatar.GetUnitList()
    for _, unitId in ipairs(units) do
        local isEnemy = object.IsEnemy(unitId)
        -- LogToChat(GetUnitName(unitId) .. " | " .. tostring(isEnemy))

        if isEnemy then
            local msg = ""
            local defender = Defenders.FindDefenderByName(GetUnitName(unitId))

            if defender['defender'] ~= nil then
                if Defenders.last_unit_name == defender['name'] then
                    break
                end

                Defenders.last_unit_name = defender['name']
                Defenders.last_unit_state = defender['defender']['state']

                local color = "LogColor" ..
                                  StateToColor[defender['defender']['state']]

                msg = StateToText[defender['defender']['state']] .. " " ..
                          defender['name']

                showMsgAnnounce(msg, color)

                if tostring(defender['defender']['info']):len() > 3 then
                    msg = msg .. " [" .. tostring(defender['defender']['info']) .. "];"
                end
                
                if msg ~= Defenders.last_chat_msg then
                    LogToChat(msg)
                    Defenders.last_chat_msg = msg
                end

                break
            end
        end
    end
end

function Defenders.FindNeededLocation(params)
    if (getZoneName() == tostring(locales['locName'])) then
        common.RegisterEventHandler(Defenders.LogUnits, "EVENT_UNITS_CHANGED")
        Defenders.IsRegisteredLogUnits = true
        Defenders.LogUnits()
    else
        if Defenders.IsRegisteredLogUnits == true then
            common.UnRegisterEventHandler(Defenders.LogUnits, "EVENT_UNITS_CHANGED")
        end
        Defenders.IsRegisteredLogUnits = false
    end
end

function Defenders.Register()
    Defenders.load_defaults()

    common.RegisterEventHandler(Defenders.FindNeededLocation,
                                "EVENT_AVATAR_CLIENT_ZONE_CHANGED")

    Defenders.FindNeededLocation()
end

function Defenders.UnRegister()
    common.UnRegisterEventHandler(Defenders.FindNeededLocation,
                                  "EVENT_AVATAR_CLIENT_ZONE_CHANGED")

    if Defenders.IsRegisteredLogUnits then
        common.UnRegisterEventHandler(Defenders.LogUnits, "EVENT_UNITS_CHANGED")
        Leaver.UnRegister()
    end

    showMsgAnnounce()
end

