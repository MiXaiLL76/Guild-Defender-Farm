Global("Items", {})
Items.CfgName = "Items:"
Items.Cfg = {}

function Items.OnCheckbox(options)
    local item = mainForm:GetChildChecked(options['sender'], true)
    -- LogToChat(dump(options))

    if options['name'] == 'check_box_disable' then
        item:SetVariant(1)

        if options['sender'] == 'Item1CheckBox' then
            Defenders.Register()
            Items.Cfg.Item1CheckBox = 1
        end

        if options['sender'] == 'Item2CheckBox' then
            Leaver.Register()
            Items.Cfg.Item2CheckBox = 1
        end
        
    elseif options['name'] == 'check_box_enable' then
        item:SetVariant(0)

        if options['sender'] == 'Item1CheckBox' then
            Defenders.UnRegister()
            Items.Cfg.Item1CheckBox = 0
        end

        if options['sender'] == 'Item2CheckBox' then
            Leaver.UnRegister()
            Items.Cfg.Item2CheckBox = 0
        end
    end
    if Items.Cfg.use_cfg then SetConfig(Items.CfgName, Items.Cfg) end
end

function Items.Init(use_cfg)
    if use_cfg then 
        local Cfg = GetConfig(Items.CfgName) 
        if Cfg ~= nil then
            Items.Cfg = Cfg
        end
    end

    Items.Cfg.use_cfg = use_cfg

    if Items.Cfg["Item1CheckBox"] == 1 then
        Items.OnCheckbox({
            ["sender"] = "Item1CheckBox",
            ["name"] = "check_box_disable"
        })
    end

    if Items.Cfg["Item2CheckBox"] == 1 then
        Items.OnCheckbox({
            ["sender"] = "Item2CheckBox",
            ["name"] = "check_box_disable"
        })
    end

    -- LogToChat("Items.cfg: " .. dump(Items.Cfg))

    common.RegisterReactionHandler(Items.OnCheckbox, 'check_box_disable')
    common.RegisterReactionHandler(Items.OnCheckbox, 'check_box_enable')
end
