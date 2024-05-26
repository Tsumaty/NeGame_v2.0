/// @desc начальное состояние уровня
/*
if (room == rInit)
    exit;
*/
if (level2Open && room == rMenu)
    with (inst_lock_level2)
        with (activator)
            unlocked = true;
stopGrindingSound();
if (!firstLaunch)
    loadGame(string("negamesave{0}.nes", room));