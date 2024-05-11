/**
@func                   initSound(sndName)
@desc                   Инициализация звуков, начинающихся на sndName
@param {String} sndName Название искомой группы звуков
@return {Array}         Возвращает массив из случайного и максимального номеров группы
*/
function initSound(sndName)
{
    var maxNum = 0;
    while (asset_get_index(sndName + string(++maxNum)) != -1) {}
    var num = irandom_range(1, --maxNum);
    return [num, maxNum];
}