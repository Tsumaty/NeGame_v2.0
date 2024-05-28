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

ini_open("killed_koluchs.ini");
for (var i = 0; i < ds_list_size(killedKoluchs); ++i)
{
    ini_write_real("List", string("kol{0}", i), int64(ds_list_find_value(killedKoluchs, i)));
}
ini_close();