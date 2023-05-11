function getNormalString(input_string)
    if not input_string then return nil end
    if (common.IsWString(input_string)) then
        input_string = userMods.FromWString(input_string);
    end
    return tostring(input_string);
end

function compareString(string1, string2)
    string1 = getNormalString(string1);
    string2 = getNormalString(string2);
    return not not string1:find(string2)
end


function LogToChat(text, addonName, chatColor)
    local wtChat = nil
    local valuedText = common.CreateValuedText()

    if (addonName == nil) then addonName = "Guild Defender Farm" end
    if not wtChat then
        wtChat = stateMainForm:GetChildUnchecked("ChatLog", false)
        wtChat = wtChat:GetChildUnchecked("Container", true)
        local formatVT =
            "<html fontname='AllodsFantasy' fontsize='14' shadow='1'><rs class='color'><r name='addon'/><r name='text'/></rs></html>"
        valuedText:SetFormat(userMods.ToWString(formatVT))
    end
    if wtChat and wtChat.PushFrontValuedText then
        if not common.IsWString(text) then
            text = userMods.ToWString(text)
        end
        valuedText:ClearValues()
        valuedText:SetClassVal("color", chatColor or "LogColorYellow")
        valuedText:SetVal("text", text)
        valuedText:SetVal("addon", userMods.ToWString(addonName .. ": "))
        wtChat:PushFrontValuedText(valuedText)
    end
end

function logArray(array, array_name)
    common.LogInfo('common', 'Логируемый массив: ' ..
                       tostring(array_name))
    for k, v in pairs(array) do
        common.LogInfo('common', '    ', tostring(k), ' -> ', tostring(v))
    end
end

function existsValue(array, value)
    local isset = 0;
    local i = 1;
    while array[i] do
        if compareString(value, array[i]) then
            isset = 1;
            break
        end
        i = i + 1;
    end
    if isset == 1 then return true; end
    return false;
end

local wtMessage = mainForm:GetChildChecked("Announce", true)

function showMsgAnnounce(value, color)
    if (color == nil) then color = "LogColorRed" end

    if (value) then
        local tstText = common.CreateValuedText()
        tstText:ClearValues()
        local formatVT =
            "<html fontname='AllodsFantasy' fontsize='28' shadow='2'><rs class='color'><r name='text'/></rs></html>"
        tstText:SetFormat(userMods.ToWString(formatVT))
        tstText:SetClassVal("color", color)
        tstText:SetVal("text", userMods.ToWString(value))
        -- tstText:SetVal( "addon", userMods.ToWString("AM: ") )
        -- wtMessage:SetVal( "value", tstText )
        wtMessage:SetValuedText(tstText)
        -- wtMessage:SetTextColor( userMods.ToWString(value), "ffff0000" )
        wtMessage:Show(true)
    else
        wtMessage:Show(false)
    end
end

function toLog(data, name)
    if (not name) then name = 'this' end
    common.LogInfo('common', name .. ' - ', tostring(getNormalString(data)))
end

function dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then k = '"' .. k .. '"' end
            s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

function Set(list)
    local set = {}
    for _, l in ipairs(list) do set[l] = true end
    return set
end
