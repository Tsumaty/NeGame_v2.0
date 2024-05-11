/// @desc функция сохранения
function saveGame(fileName)
{
    var instanceList = ds_list_create();
    
    // собираем данные динамических объектов
    with (oPlayer)
    {
        var instMap = ds_map_create();
        ds_map_add(instMap, "hp", hp);
        ds_map_add(instMap, "x", x);
        ds_map_add(instMap, "y", y);
        ds_map_add(instMap, "horsp", horsp);
        ds_map_add(instMap, "versp", versp);
        ds_map_add(instMap, "right", isLookingRight);
        ds_map_add(instMap, "can_bounce", canBounce);
        ds_map_add(instMap, "increasedjumps_num", increasedJumpsNum);
        ds_list_add(instanceList, instMap);
    }
    
    with (oDoor)
    {
        var instMap = ds_map_create();
        ds_map_add(instMap, "isopen", isOpen);
        ds_list_add(instanceList, instMap);
    }
    
    with (oMovingFloor)
    {
        var instMap = ds_map_create();
        ds_map_add(instMap, "arrived", arrived);
        ds_list_add(instanceList, instMap);
    }

    // сохраняем список объектов в главной карте
    var mainMap = ds_map_create();
    ds_map_add(mainMap, "instances", instanceList);

    // сериализуем данные в строку json
    var saveStr = json_encode(mainMap);

    // записываем строку в файл
    var file = file_text_open_write(fileName);
    file_text_write_string(file, saveStr);
    file_text_close(file);

    // освобождаем ресурсы
    for (var i = 0; i < ds_list_size(instanceList); ++i)
    {
        var instMap = ds_list_find_value(instanceList, i);
        ds_map_destroy(instMap);
    }
    ds_list_destroy(instanceList);
    ds_map_destroy(mainMap);
}