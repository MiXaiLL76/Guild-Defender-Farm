Global("Defenders", {})

Defenders.easy = nil
Defenders.normal = nil
Defenders.hard = nil

function Defenders.load_defaults()
    Defenders.last_unit_state = 0
    Defenders.last_unit_name = ""
    -- Defenders.last_chat_msg = ""

    if not Defenders.IsRegisteredLogUnits then
        Defenders.IsRegisteredLogUnits = false
    end

    if not Defenders.last_chat_msg then Defenders.last_chat_msg = "" end
end

function Defenders.UpdateCurrencies()
    local Currencies = avatar.GetCurrencies()

    for _, currencyId in pairs(Currencies) do
        local info = currencyId:GetInfo()

        local cur_name = getNormalString(info.name)

        if cur_name == nil then cur_name = tostring('empty name') end

        local is_find = not (nil == cur_name:find(Utf8ToAnsi(
                                                      'Приглашение в Колизей Хранителя')))

        if is_find then
            local is_easy = not (nil ==
                                cur_name:find(Utf8ToAnsi('Низкий')))
            local is_normal = not (nil ==
                                  cur_name:find(Utf8ToAnsi('Средний')))
            local is_hard = not (nil ==
                                cur_name:find(Utf8ToAnsi('Высокий')))

            if is_easy then Defenders.easy = currencyId end

            if is_normal then Defenders.normal = currencyId end

            if is_hard then Defenders.hard = currencyId end
        end
    end

    -- LogToChat(dump(avatar.GetCurrencyValue(Defenders.easy)))
    -- LogToChat(dump(avatar.GetCurrencyValue(Defenders.normal)))
    -- LogToChat(dump(avatar.GetCurrencyValue(Defenders.hard)))
    if Defenders.easy then
        local easy_info = avatar.GetCurrencyValue(Defenders.easy)
        if easy_info then
            local wt_easy = mainForm:GetChildChecked("easy", true)
            wt_easy:ClearValues()
            wt_easy:SetVal("value",
                           Utf8ToAnsi(
                               getNormalString(easy_info.value) .. " из " ..
                                   getNormalString(easy_info.maxValue)))
        end

        local normal_info = avatar.GetCurrencyValue(Defenders.normal)
        if normal_info then
            local wt_normal = mainForm:GetChildChecked("normal", true)
            wt_normal:ClearValues()
            wt_normal:SetVal("value",
                             Utf8ToAnsi(
                                 getNormalString(normal_info.value) .. " из " ..
                                     getNormalString(normal_info.maxValue)))
        end

        local hard_info = avatar.GetCurrencyValue(Defenders.hard)
        if hard_info then
            local wt_hard = mainForm:GetChildChecked("hard", true)
            wt_hard:ClearValues()
            wt_hard:SetVal("value",
                           Utf8ToAnsi(
                               getNormalString(hard_info.value) .. " из " ..
                                   getNormalString(hard_info.maxValue)))
        end
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
                Defenders.last_unit_id = unitId

                local color = "LogColor" ..
                                  StateToColor[defender['defender']['state']]

                msg = StateToText[defender['defender']['state']] .. " " ..
                          defender['name']

                showMsgAnnounce(msg, color)

                if tostring(defender['defender']['info']):len() > 3 then
                    msg =
                        msg .. " [" .. tostring(defender['defender']['info']) ..
                            "];"
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
    Defenders.UpdateCurrencies()

    if (getZoneName() == tostring(locales['locName'])) then
        common.RegisterEventHandler(Defenders.LogUnits, "EVENT_UNITS_CHANGED")
        Defenders.IsRegisteredLogUnits = true
        Defenders.LogUnits()
        Chest.Register()
    else
        if Defenders.IsRegisteredLogUnits == true then
            common.UnRegisterEventHandler(Defenders.LogUnits,
                                          "EVENT_UNITS_CHANGED")
            Defenders.last_unit_id = nil
        end
        Defenders.IsRegisteredLogUnits = false
        showMsgAnnounce()
        Chest.UnRegister()
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
    end

    showMsgAnnounce()
end

