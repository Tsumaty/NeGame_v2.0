// @desc функция загрузки
function loadGame(fileName)
{
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
        show_message("Файл сохранения не найден или повреждён");
        exit;
    }
    
    var instanceList = ds_map_find_value(saveData, "instances");
    
    // восстанавливаем состояние динамических объектов
    for (var i = 0; i < ds_list_size(instanceList); ++i) {
        var instData = ds_list_find_value(instanceList, i);
        
        with (oPlayer)
        {
            hp = ds_map_find_value(instData, "hp");
            x = ds_map_find_value(instData, "x");
            y = ds_map_find_value(instData, "y");
            horsp = ds_map_find_value(instData, "horsp");
            versp = ds_map_find_value(instData, "versp");
            isLookingRight = ds_map_find_value(instData, "right");
            canBounce = ds_map_find_value(instData, "can_bounce");
        }
        
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
}