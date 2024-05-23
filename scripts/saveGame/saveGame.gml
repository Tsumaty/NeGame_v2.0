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
    
    var dataString = json_stringify(data);
    var dataBuffer = buffer_create(string_byte_length(dataString) + 1, buffer_fixed, 1);
    buffer_write(dataBuffer, buffer_string, dataString);
    buffer_save(dataBuffer, fileName);
    buffer_delete(dataBuffer);
    /* СТАРЫЙ КОД (НЕ РАБОТАЕТ)
    var instanceList = ds_list_create();
    
    // собираем данные динамических объектов
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
    
    // получение массива ключей
    var keysArray = ds_map_keys_to_array(mainMap);
    
    // перебор ключей и вывод их значений
    for (var i = 0; i < array_length(keysArray); i++) {
        var key = keysArray[i];
        show_debug_message(string("Key: {0}, value: {1}", key, ds_map_find_value(mainMap, key)));
    }

    // сериализуем данные в строку json
    var saveStr = json_encode(mainMap);

    // записываем строку в файл
    var file = file_text_open_write(fileName);
    file_text_write_string(file, saveStr);
    file_text_close(file);

    // освобождаем ресурсы
    for (var i = 0; i < ds_list_size(instanceList); ++i)
    {
        ds_map_destroy(ds_list_find_value(instanceList, i));
    }
    ds_list_destroy(instanceList);
    ds_map_destroy(mainMap);
    */
}