-- 當玩家登錄並在數據庫中註冊Steam --
-- When player login and register steam in datebase --

AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    local source = source
    local identifiers = GetPlayerIdentifiers(source)
    local identifier

    -- you can use [steam, license] --
    -- 你可以使用[steam, license] --

    for k, v in ipairs(identifiers) do 
        if string.match(v, 'steam:') then
            identifier = v
            break
        end
    end

    if not identifier then
        deferrals.done('You need open steam')
    else
        deferrals.done()

        exports.ghmattimysql:scalar('SELECT 1 FROM users WHERE identifier = @identifier', {
            ['@identifier'] = identifier
        }, function(result)
            if not result then
                exports.ghmattimysql:execute('INSERT INTO users (identifier) VALUES (@identifier)', {
                    ['@identifier'] = identifier
                })
            end
        end)
    end
end)