-- 當玩家生成時 --
-- When spawn player ped --
AddEventHandler('playerSpawned', function()
    TriggerServerEvent('FW:SpawnPlayer')
end)

-- 設定玩家位置 --
-- Setup player position --
RegisterNetEvent('FW:lastPosition')
AddEventHandler('FW:lastPosition', function(PosX, PosY, PosZ)
    Citizen.Wait(1)

    local defaulModel = GetHashKey('mp_m_freemode_01')
    RequestModel(defaulModel)
    while not HasModelLoaded(defaulModel) do
        Citizen.Wait(1)
    end
    SetPlayerModel(PlayerId(), defaulModel)
    SetPedDefaultComponentVariation(PlayerPedId())
    SetModelAsNoLongerNeeded(defaulModel)

    SetEntityCoords(GetPlayerPed(-1), PosX, PosY, PosZ, 1, 0, 0, 1)
end)

-- 更新玩家位置 --
-- Update player position 
Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(5000)

        lastX, lastY, lastZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
        TriggerServerEvent('FW:SavePlayerPosition', lastX, lastY, lastZ)
    end
end)