ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

for k, v in pairs(Config.Jobs) do
    v['taken'] = false
end

RegisterServerEvent('esx_ets:startJob')
AddEventHandler('esx_ets:startJob', function(id)
    local xPlayer, hasJob = ESX.GetPlayerFromId(source), true
    if Config.Job['jobRequired'] then
        if xPlayer.job.name == Config.Job['jobName'] then
            hasJob = true
        else
            hasJob = false
        end
    end
    if hasJob then
        if not Config.Jobs[id]['taken'] then
            Config.Jobs[id]['taken'] = true
            TriggerClientEvent('esx_ets:start', xPlayer.source, Config.Jobs[id], id)
        else
            TriggerClientEvent('esx:showNotification', xPlayer.source, Strings['somebody_doing'])
        end
    else
        TriggerClientEvent('esx:showNotification', xPlayer.source, Strings['not_job'])
    end
end)

RegisterServerEvent('esx_ets:jobMenu')
AddEventHandler('esx_ets:jobMenu', function()
    local elements, xPlayer = {}, ESX.GetPlayerFromId(source)
    for k, v in pairs(Config.Jobs) do
        if not v['taken'] then
            table.insert(elements, {label = v.title, value = k})
        end
    end
    TriggerClientEvent('esx_ets:menu', xPlayer.source, elements)
end)

RegisterServerEvent('esx_ets:jobFinished')
AddEventHandler('esx_ets:jobFinished', function(id, damages)
    local xPlayer = ESX.GetPlayerFromId(source)
    if Config.Jobs[id]['taken'] then
        local price, health = Config.Jobs[id].payment, (damages['body_health'] + damages['engine_health']) / 2
        for k, v in pairs(damages['windows']) do health = health - 30 end
        for k, v in pairs(damages['tires']) do health = health - 35 end
        for k, v in pairs(damages['doors']) do health = health - 40 end
        if health <= 900 and health > 800 then price = price - 50 elseif health <= 800 and health > 700 then price = price - 75 elseif health <= 700 and health > 600 then price = price - 100 elseif health <= 600 and health > 300 then price = price - 150 elseif health <= 300 then price = price - 350 end
        if price >= 0 then
            xPlayer.addMoney(price)
            TriggerClientEvent('esx:showNotification', xPlayer.source, (Strings['reward']):format(price))
        else
            xPlayer.removeMoney(price)
            TriggerClientEvent('esx:showNotification', xPlayer.source, (Strings['paid_damages']):format(price))
        end
        Wait(Config.ReAdd * 1000)
        Config.Jobs[id]['taken'] = false
    end
end)

-- Version Checking - DON'T TOUCH THIS

local CurrentVersion = '1.0'
local GithubResourceName = 'Staff-Chat'

PerformHttpRequest('https://github.com/ChemaSanchez/chema_truckjob/' .. GithubResourceName .. '/VERSION', function(Error, NewestVersion, Header)
    PerformHttpRequest('https://github.com/ChemaSanchez/chema_truckjob/' .. GithubResourceName .. '/CHANGELOG', function(Error, Changes, Header)
        print('^0')
        print('^6[chema_truckjob]^0 Comprobando actualizaciones...')
        print('^0')
        print('^6[chema_truckjob]^0 Version: ^5' .. CurrentVersion .. '^0')
        print('^0')
        if CurrentVersion ~= NewestVersion then
            print('^6[chema_truckjob]^0 Your script is ^8outdated^0!')
            print('^0')
            print('^6[chema_truckjob] ^3Nueva Version ^5' .. NewestVersion .. ':^0')
            print('^3')
            print('^0')
            print('^6[chema_truckjob]^0 Tu ^8no tienes^0 la ultima version de ^5chema_truckjob^0. Actualizalo: https://github.com/ChemaSanchez/chema_truckjob')
        else
            print('^6[chema_truckjob]^0 Esta ^2actualizado^0')
        end
        print('^0')
    end)
end)