/// @desc сохранение состояния уровня
/*
if (room == rInit)
    exit;
*/
firstLaunch = false;
ini_open("options.ini");
ini_write_real("GameOptions", "firstLaunch", false);
ini_close();

with (oPlayer) updateStartVars();

saveGame(string("negamesave{0}.nes", room));

var file = file_text_open_write(ulFileName);
var arrayToSave = json_stringify(unlockedLevels);
file_text_write_string(file, arrayToSave);
file_text_close(file);

file = file_text_open_write(kkFileName);
var arrayToSave = json_stringify(killedKoluchs);
file_text_write_string(file, arrayToSave);
file_text_close(file);