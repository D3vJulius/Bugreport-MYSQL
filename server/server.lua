    -- Command register
RegisterCommand("bugreport", function(source, args)
    local argString = table.concat(args, " ")
    -- MySQL Insert to table
    MySQL.Async.fetchAll("INSERT INTO bugs (id, name, bug) VALUES(@source, @name, @bug)",     
    {["@source"] = GetPlayerIdentifiers(source)[1], ["@name"] = GetPlayerName(source), ["@bug"] = argString},

    -- ReturnMessage
    function (result)
        TriggerClientEvent("returnmessage", source, "".. argString.. "^0")

    end)
end)