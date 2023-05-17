Global("Leaver", {})

Leaver.LastLeader = nil
Leaver.RAID_count = 0
Leaver.IsRegisteredFindLeader = false

function Leaver.Clean()
    Leaver.LastLeader = nil
    Leaver.RAID_count = 0
end

function Leaver.FindLeader()
    if Defenders.IsRegisteredLogUnits == true then
        LogToChat('LeaderChanged')

        local leaderIndex = raid.GetLeader()
        if Leaver.LastLeader == nil then Leaver.LastLeader = leaderIndex end

        if Leaver.LastLeader ~= leaderIndex then
            LogToChat('В группе сменился лидер.')

            local members = raid.GetMembers()

            if #members >= Leaver.RAID_count then
                Leaver.RAID_count = #members
                Leaver.LastLeader = leaderIndex
            else
                LogToChat('Предыдущий лидер ливнул.')
                showMsgAnnounce(
                    "Ливаем! Лидер покинул нас!")
            end
        end
    end
end

function Leaver.Register()
    LogToChat('Register')
    if Leaver.IsRegisteredFindLeader == false then
        common.RegisterEventHandler(Leaver.FindLeader, "EVENT_UNITS_CHANGED")
        Leaver.IsRegisteredFindLeader = true
    end
end

function Leaver.UnRegister()
    LogToChat('UnRegister')

    if Leaver.IsRegisteredFindLeader == true then
        common.UnRegisterEventHandler(Leaver.FindLeader, "EVENT_UNITS_CHANGED")
        Leaver.Clean()
        Leaver.IsRegisteredFindLeader = false
    end
end

