/// @desc функция проверки, воспроизводится ли звук из группы
function isSilent(sndName)
{
    var num = 1;
    var index = asset_get_index(sndName + string(num));
    while (index != -1)
    {
        index = asset_get_index(sndName + string(num++));
        if (audio_is_playing(index)) return false;
    }
    return true;
}