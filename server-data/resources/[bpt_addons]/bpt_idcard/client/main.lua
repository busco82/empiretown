local open = false

-- Open ID card
RegisterNetEvent("bpt_idcard:open")
AddEventHandler("bpt_idcard:open", function(data, type)
    open = true
    SendNUIMessage({
        action = "open",
        array = data,
        type = type,
    })
end)

-- Key events
CreateThread(function()
    while true do
        Wait(0)
        if IsControlJustReleased(0, 322) and open or IsControlJustReleased(0, 177) and open then
            SendNUIMessage({
                action = "close",
            })
            open = false
        end
    end
end)
