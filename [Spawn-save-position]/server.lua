-- 生成玩家 --
-- Spawn player --
RegisterServerEvent('FW:SpawnPlayer')
AddEventHandler('FW:SpawnPlayer', function()
    local source = source
    exports.ghmattimysql:execute('SELECT * FROM users WHERE identifier = @identifier', {
        ['@identifier'] = GetPlayerIdentifier(source)
    }, function(result)
        local SpawnPos = json.decode(result[1].position)
        TriggerClientEvent('FW:lastPosition', source, SpawnPos[1], SpawnPos[2], SpawnPos[3])
    end)
end)

-- 保存玩家位置 --
-- Save player position --
RegisterServerEvent('FW:SavePlayerPosition')
AddEventHandler('FW:SavePlayerPosition', function(PosX, PosY, PosZ)
    local source = source
    exports.ghmattimysql:execute('UPDATE users SET position = @position WHERE identifier = @identifier', {
        ['@identifier'] = GetPlayerIdentifier(source),
        ['@position'] = '{ ' .. PosX  .. ', ' .. PosY .. ', ' .. PosZ .. '}'
    })
end)