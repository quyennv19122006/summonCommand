Split = require('modules').Split;
IsNumber = require('modules').IsNumber;
TypeChecking = require('modules').TypeChecking;

local summonCommand = function(str)

    local words = Split(str);

    local commandType = words[1];

    if (commandType == '/summon') then
        local id = tonumber(words[2]);

        local pos = {
            x = tonumber(words[3]),
            y = tonumber(words[4]),
            z = tonumber(words[5])
        };

        local result = TypeChecking({id, pos.x, pos.y, pos.z}, "numbe");

        if result.isOk then
            -- logic
        else
            print(result.errors.msg);
        end

    end
end

summonCommand('/summon 140001 12 3 43');
