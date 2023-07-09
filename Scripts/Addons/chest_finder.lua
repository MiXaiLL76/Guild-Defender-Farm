Global("Chest", {})
Chest.activated = false
Chest.registered = false

Chest.wtMessage = mainForm:GetChildChecked("AnnounceChest", true)
function Chest.showMsg(value, color, object_id)
    if (color == nil) then color = "LogColorRed" end
    if (object_id == nil) then object_id = avatar.GetId() end

    local wtControl3D =
        stateMainForm:GetChildChecked("MainAddonMainForm", false)
            :GetChildChecked("MainScreenControl3D", false)

    if (value) then
        local size = {['sizeX'] = 1, ['sizeY'] = 1}
        wtControl3D:AddWidget3D(Chest.wtMessage, size,
                                object.GetPos(avatar.GetId()), false, false,
                                75.0, WIDGET_3D_BIND_POINT_HIGH, 1, 1)

        object.AttachWidget3D(object_id, wtControl3D, Chest.wtMessage, 3)

        local tstText = common.CreateValuedText()
        tstText:ClearValues()
        local formatVT =
            "<html fontname='AllodsFantasy' fontsize='28' shadow='2'><rs class='color'><r name='text'/></rs></html>"
        tstText:SetFormat(userMods.ToWString(formatVT))
        tstText:SetClassVal("color", color)
        tstText:SetVal("text", userMods.ToWString(value))
        Chest.wtMessage:SetValuedText(tstText)
        Chest.wtMessage:Show(true)
    else
        wtControl3D:RemoveWidget3D(Chest.wtMessage)
        -- wtMessage:Show(false)
    end
end

function Chest.Find()
    if Chest.activated then
        local devices = avatar.GetDeviceList()
        Chest.Changed({['spawned'] = devices})
    end
end

function Chest.Changed(pars)
    if Chest.activated then
        Chest.showMsg()
        for _, deviceId in pairs(pars.spawned) do
            local IsUsable = device.IsUsable(deviceId)
            if IsUsable then
                Chest.showMsg(Utf8ToAnsi(
                                  'Не забудь забрать сундук!'),
                              nil, nil)
            end
        end
    end
end

function Chest.Deactivate()
    Chest.activated = false
    Chest.UnRegister()
end

function Chest.Register()
    Chest.Find()
    if Chest.registered == false then
        common.RegisterEventHandler(Chest.Changed, "EVENT_DEVICES_CHANGED")
    end
    Chest.registered = true
end

function Chest.UnRegister()
    Chest.showMsg()
    if Chest.registered then
        common.UnRegisterEventHandler(Chest.Changed, "EVENT_DEVICES_CHANGED")
    end
    Chest.registered = false
end

function Chest.Activate()
    Chest.activated = true
    Chest.Register()
end
