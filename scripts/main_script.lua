function getZoneName()
    local zoneInfo = cartographer.GetCurrentZoneInfo();
    if (zoneInfo) then
        local zoneName = getNormalString(zoneInfo.zoneName);
        return zoneName
    end
    return ''
end

function isLoc()
    local zoneName = getZoneName()

    if (compareString(zoneName, locales["locName"])) then return true end

    return false
end

function GetUnitName(unitId)
    local unit_name = object.GetName(unitId)
    return getNormalString(unit_name)
end

local last_logget_msg = "!"

function LogUnits()
    local showed = false

    local units = avatar.GetUnitList()
    for _, unitId in ipairs(units) do
        local isEnemy = object.IsEnemy(unitId)
        if isEnemy then
            local msg = ""
            local unit_name = GetUnitName(unitId)
            local defender = locales["defenders"][unit_name]
            
            if defender == nil then
                for defenders_name, defender_item in pairs(locales["defenders"]) do
                    
                    if lev_iter_based(defenders_name, unit_name) < 2 then
                        local msg_end = 'Неверное написание хранителя ' .. defenders_name .. ' должно быть ' .. unit_name .. "; Для исправления пишите MiXaiLL76 / БезумныйЧайник"
                        LogToChat(msg_end, nil, "LogColorRed")

                        unit_name = defenders_name
                        defender  = defender_item
                        break
                    end
                end
            end

            if defender ~= nil then
                local color = "LogColorRed"

                if defender['state'] == '0' then
                    msg = msg .. tostring(locales["passable"])
                    color = "LogColorGreen"
                elseif defender['state'] == '1' then
                    msg = msg .. tostring(locales["passable"])
                    color = "LogColorGreen"
                elseif defender['state'] == '2' then
                    msg = msg .. tostring(locales["impassable"])
                    color = "LogColorRed"
                elseif defender['state'] == '3' then
                    msg = msg .. tostring(locales["passable"])
                    color = "LogColorOrange"
                elseif defender['state'] == '4' then
                    msg = msg .. tostring(locales["passable"])
                    color = "LogColorOrange"
                end

                msg = msg .. " " .. unit_name

                showMsgAnnounce(msg, color)
                showed = true

                if defender['info'] ~= nil then
                    msg =
                        msg .. " [" .. defender['state_title'] .. "]; Info: " ..
                            tostring(defender['info'])
                end

                if compareString(last_logget_msg, msg) == false then
                    LogToChat(msg)
                    
                    last_logget_msg = msg
                end

                break

            end
        end
    end

    if showed == false then showMsgAnnounce(nil) end
end

function FindNeededLocation()
    if isLoc() then
        LogToChat(locales["startMsg"])
        common.RegisterEventHandler(LogUnits, "EVENT_UNITS_CHANGED")
        LogUnits()
    else
        common.UnRegisterEventHandler(LogUnits, "EVENT_UNITS_CHANGED")
        showMsgAnnounce(nil)
    end
end

function Init()
    -- LogToChat(locales["startMsg"])
    -- common.RegisterEventHandler(LogUnits, "EVENT_UNITS_CHANGED")
    common.RegisterEventHandler(FindNeededLocation,
                                "EVENT_AVATAR_CLIENT_ZONE_CHANGED")

    FindNeededLocation()
end

if (avatar.IsExist()) then
    Init()
else
    common.RegisterEventHandler(Init, "EVENT_AVATAR_CREATED")
end

