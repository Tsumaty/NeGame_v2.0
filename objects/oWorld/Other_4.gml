/// @desc начальное состояние уровня
/*
if (room == rInit)
    exit;
*/
stopGrindingSound();

if (!firstLaunch)
    loadGame(string("negamesave{0}.nes", room));

with (oKoluch)
{
    if (ds_list_find_index(killedKoluchs, id) != -1)
        instance_destroy();
}