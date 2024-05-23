/// @desc начальное состояние уровня
/*
if (room == rInit)
    exit;
*/
stopGrindingSound();
if (!firstLaunch)
    loadGame(string("negamesave{0}.nes", room));