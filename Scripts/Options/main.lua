Global("Main", {})
Main.CfgName = "Main:"
Main.Cfg = {}

Main.Cfg.wtMainWindowShowed = false

local wtMainWindow = nil
local wtOptionButton = nil
local wtWindowHeader = nil

function Main.OnButtonPressed(options)
    -- LogToChat(dump(options) .. tostring(wtMainWindow))

    if options['sender'] == "CornerCross" then
        wtMainWindow:Show(false)
        Main.Cfg.wtMainWindowShowed = false
    end

    if options['sender'] == "OptionButton" then
        Main.Cfg.wtMainWindowShowed = not Main.Cfg.wtMainWindowShowed
        wtMainWindow:Show(Main.Cfg.wtMainWindowShowed)
        -- local rect = wtMainWindow:GetRealRect()
        -- LogToChat(dump(rect))
    end

    if Main.Cfg.use_cfg then SetConfig(Main.CfgName, Main.Cfg) end
end

function Main.Init(use_cfg)
    if use_cfg then
        local Cfg = GetConfig(Main.CfgName)
        if Cfg ~= nil then Main.Cfg = Cfg end
    end

    Main.Cfg.use_cfg = use_cfg

    -- LogToChat("Main.cfg: " .. dump(Main.Cfg))

    wtOptionButton = mainForm:GetChildChecked("OptionButton", true)
    DnD.Init(wtOptionButton, nil, use_cfg)

    wtMainWindow = mainForm:GetChildChecked("MainWindow", false)
    wtWindowHeader = wtMainWindow:GetChildChecked("WindowHeader", false)

    DnD.Init(wtMainWindow, wtWindowHeader, use_cfg)

    common.RegisterReactionHandler(Main.OnButtonPressed, 'button_pressed')
    common.RegisterReactionHandler(Main.OnButtonPressed, 'cross_close')

    if Main.Cfg["wtMainWindowShowed"] ~= nil then
        wtMainWindow:Show(Main.Cfg.wtMainWindowShowed)
    end

end
