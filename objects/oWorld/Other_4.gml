/// @desc начальное состояние уровня
/*
if (room == rInit)
    exit;
*/
stopGrindingSound();

if (!firstLaunch)
    loadGame(string("negamesave{0}.nes", room));

with (oCreature)
{
    initVars();
}
    
with (oPlayer)
{
    initCamera();
    changeTeacherMsg();
    if (place_meeting(x, y, oObstacle))
    {
        do {
            y -= 2;
        } until (!place_meeting(x, y, oObstacle));
    }
}

// убиваем всех колючей из списка
with (oKoluch)
{
    if (array_index(killedKoluchs, id) != -1)
        instance_destroy();
}

// открываем уровень 2
with (inst_activ_level2)
{
    unlocked = (array_index(unlockedLevels, 2) != -1);
    if (unlocked) with (device) if (!isOpen) activated = true;
}

// меняем фразы круглика на уровне 2
with (inst_croogl_level2)
{
    if (array_index(killedKoluchs, inst_koluch_level2) != -1)
        chatCloud.msg = ["Надо же, ты его\nодолел", "Теперь здесь только\nты и я"];
}