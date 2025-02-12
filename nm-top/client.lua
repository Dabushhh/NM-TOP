local NMCore = exports['nm-core']:GetCoreObject()

local function updateHUD()
    local playerId = GetPlayerServerId(PlayerId())
    local playerName = GetPlayerName(PlayerId())
    local playerData = NMCore.Functions.GetPlayerData()


    local playerJob = "Unemployed"
    if playerData.job and playerData.job.label then
        playerJob = playerData.job.label
    end

    local playerJobGrade = "None"
    if playerData.job then
        if type(playerData.job.grade) == "table" then
            if playerData.job.grade.name then
                playerJobGrade = playerData.job.grade.name
            end
        elseif playerData.job.grade then
            playerJobGrade = tostring(playerData.job.grade)
        end
    end


    local cash = playerData.money and playerData.money.cash or 0
    local bank = playerData.money and playerData.money.bank or 0



    SendNUIMessage({
        action = "updateHUD",
        id = playerId,
        job = playerJob .. " - " .. playerJobGrade, 
        name = playerName,
        cash = cash,
        bank = bank,
    })
end

Citizen.CreateThread(function()
    SetNuiFocus(false, false)
    while true do
        Citizen.Wait(5000)
        updateHUD()
    end
end)
