/// @desc функция сохранения
function saveGame(fileName)
{
    with (oCreature)
    {
        updateStartVars();
    }
    
    var data = array_create(0);
    
    with (oDoor)
    {
        var instData =
        {
            obj : "oDoor",
            identNum : id,
            open : isOpen
        };
        array_push(data, instData);
    }
    
    with (oActivator)
    {
        var instData =
        {
            obj : "oActivator",
            identNum : id,
            available : unlocked
        };
    }
    
    with (oMovingFloor)
    {
        var instData =
        {
            obj : "oMovingFloor",
            identNum : id,
            posX : x,
            posY : y,
            horSpeed : horsp,
            verSpeed : versp,
            maxHorSpeed : maxhorsp,
            maxVerSpeed : maxversp,
            backwards : movesCyclically,
            alarm0 : alarm[0],
            alarm1 : alarm[1]
        };
        array_push(data, instData);
    }
    
    if (room == rLevelJumpTrain) with (oPlayer)
    {
        var instData =
        {
            obj : "oPlayer",
            identNum : id,
            bounce : canBounce,
            deaths : deathsNumLevelJumpTrain
        };
        array_push(data, instData);
    }
    
    var dataString = json_stringify(data);
    var dataBuffer = buffer_create(string_byte_length(dataString) + 1, buffer_fixed, 1);
    buffer_write(dataBuffer, buffer_string, dataString);
    buffer_save(dataBuffer, fileName);
    buffer_delete(dataBuffer);
}