RegisterNetEvent("returnmessage")
AddEventHandler("returnmessage", function(argument)
    TriggerEvent("chatMessage", "[BUG REPORT]", {204, 0, 0}, argument)
end)