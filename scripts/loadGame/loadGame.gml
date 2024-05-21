/// @desc функция загрузки
function loadGame(fileName)
{
    with (oCreature)
    {
        initVars();
    }
    with (oPlayer)
    {
        chatChar = noone;
        increasedJumpsNum = increasedJumpsNumstart;
        initCamera();
    }
    with (inst_7E52E5C7)
    {
        with (oPlayer)
        {
            if (deathsNumLevelJumpTrain >= 2)
            {
                other.chatCloud.msg = teacherMsgSet[2];
                endChatChar = other.id;
                endChatEvent = EndChatEvents.IncreaseJumpForce;
            }
            else if (deathsNumLevelJumpTrain >= 1)
            {
                other.chatCloud.msg = teacherMsgSet[1];
                endChatChar = other.id;
                endChatEvent = EndChatEvents.CanBounce;
            }
        }
        var player = instance_find(oPlayer, 0);
        if (player.deathsNumLevelJumpTrain >= 2)
        {
            chatCloud.msg = ["Всё равно не\nполучается?",
                             "А если так?",
                             "У тебя есть\nтри попытки"];
            player.endChatChar = id;
            player.endChatEvent = EndChatEvents.IncreaseJumpForce;
        }
    }
    
    var dataBuffer = buffer_load(fileName);
    if (dataBuffer == -1)
    {
        show_message("При загрузке произошла ошибка:\nФайл сохранения не найден!");
        exit;
    }
    var dataString = buffer_read(dataBuffer, buffer_string);
    buffer_delete(dataBuffer);
    
    var data = json_parse(dataString);
    for (var i = 0; i < array_length(data); ++i) 
    {
        switch (data[i].obj)
        {
            case "oDoor":
                with (data[i].identNum)
                {
                    isOpen = data[i].isOpen;
                    y = (isOpen) ? openPos : closedPos;
                    with (surface) y = (other.isOpen) ? openPos : closedPos;
                }
            break;
            
            case "oMovingFloor":
                with (data[i].identNum)
                {
                    horsp = data[i].horsp;
                    versp = data[i].versp;
                    alarm[0] = data[i].alarm0;
                    alarm[1] = data[i].alarm1;
                }
            break;
        }
    }
    
    with (oPlayer)
    {
        if (place_meeting(x, y, oObstacle))
        {
            do {
                y -= 2;
            } until (!place_meeting(x, y, oObstacle));
        }
    }
    /* СТАРЫЙ КОД (НЕ РАБОТАЕТ)
    var file = file_text_open_read(fileName);
    if (!file_exists(file))
    {
        exit;
    }
    var saveStr = file_text_read_string(file);
    file_text_close(file);

    // десериализуем строку json обратно в данные
    var saveData = json_decode(saveStr);
    // проверяем, что файл сохранения существует и содержит данные
    if (saveData == undefined)
    {
        show_message("Файл сохранения повреждён");
        exit;
    }
    var instanceList = ds_map_find_value(saveData, "instances");
    
    // восстанавливаем состояние динамических объектов
    for (var i = 0; i < ds_list_size(instanceList); ++i) {
        var instData = ds_list_find_value(instanceList, i);
        
        with (oDoor)
        {
            isOpen = ds_map_find_value(instData, "isopen");
            var openLength = bbox_bottom - bbox_top;
            with (surface) openLength = bbox_bottom - bbox_top;
            if (isOpen)
            {
                openPos = y;
                closedPos = y - openLength;
                surfaceOpenPos = openPos;
                surfaceClosedPos = closedPos;
                with (surface)
                {
                    other.surfaceOpenPos = y;
                    other.surfaceClosedPos = y - openLength;
                }
            }
            else
            {
                openPos = y + openLength;
                closedPos = y;
                surfaceOpenPos = openPos;
                surfaceClosedPos = closedPos;
                with (surface)
                {
                    other.surfaceOpenPos = y + openLength;
                    other.surfaceClosedPos = y;
                }
            }
        }
        with (oMovingFloor)
        {
            arrived = ds_map_find_value(instData, "arrived");
            if (arrived)
            {
                x = (maxhorsp > 0) ? movingBorderRight : movingBorderLeft;
                y = (maxversp > 0) ? movingBorderBottom : movingBorderTop;
                horsp = 0;
                versp = 0;
                maxhorsp = 0;
                maxversp = 0;
                changeDirPeriod = -1;
            }
        }
    }
    
    // освобождаем ресурсы
    ds_list_destroy(instanceList);
    ds_map_destroy(saveData);
    */
}