/// @desc сохранение состояния уровня
/*
if (room == rInit)
    exit;
*/
firstLaunch = false;
ini_open("options.ini");
ini_write_real("GameOptions", "firstLaunch", false);
ini_close();
saveGame(string("negamesave{0}.nes", room));