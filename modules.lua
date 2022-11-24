local M = {};

M.Split = function(str, delimiter)
    local result = {};
    local delimiter = delimiter or ' ';
    for match in (str .. delimiter):gmatch("(.-)" .. delimiter) do
        table.insert(result, match);
    end
    return result;
end

M.TypeChecking = function(valuesArr, typesArr)
    local result = {
        isOk = false,
        errors = {}
    };

    local defaultType = nil;

    if type(typesArr) ~= "table" then
        defaultType = typesArr;
    end

    for k, v in ipairs(valuesArr) do
        if type(v) == (defaultType or valuesArr[k]) then
            print('Yay!');
            result.isOk = true;
        else
            print('Oops!');
            result.isOk = false;
            result.errors = {
                msg = 'Value ' .. v .. ' at index ' .. k .. ' must be ' .. (defaultType or typesArr[k]) ' type'
            };
            return result;
        end
    end

    return result;
end

return M;
