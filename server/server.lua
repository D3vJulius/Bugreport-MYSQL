  -- MYSQL Security

    function escape_sqli(source)
        local replacements = { ['"'] = '\\"', ["'"] = "\\'" }
        return source:gsub( "['\"]", replacements )
    end

    -- Command register

    RegisterCommand("bugreport", function(source, args)
    local argString = table.concat(args, " ")

    -- MySQL Insert to table

    MySQL.Async.fetchAll("INSERT INTO bugs (id, name, bug) VALUES(@source, @name, @bug)",     
    {["@source"] = GetPlayerIdentifiers(source)[1], ["@name"] = GetPlayerName(source), ["@bug"] = escape_sqli(argString)},
    
    -- ReturnMessage

    function (result)
        TriggerClientEvent("chatMessage", source, "[BUG REPORT]", {204, 0, 0}, argString)
    end)
end)