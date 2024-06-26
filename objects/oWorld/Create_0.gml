/// @desc глобальные переменные
globalvar BTN_D, BTN_A, BTN_W, FPS, WINDAGE, MAXMOVESP, GRAVITACCEL;
BTN_D = ord("D");
BTN_A = ord("A");
BTN_W = ord("W");
FPS = game_get_speed(gamespeed_fps); // скорость игры
WINDAGE = 12.0 / FPS; // сопротивление воздуха
MAXMOVESP = 3000.0 / FPS; // предел скорости передвижения
GRAVITACCEL = 60.0 / FPS; // ускорение свободного падения

enum EndChatEvents
{
    CanBounce,
    IncreaseJumpForce,
    Talk,
    DestroyChatCloud
}

globalvar teacherMsgSet;
teacherMsgSet =
[
    ["Что ж, вот твоё\nпервое испытание",
        "Давай, перепрыгни\nэту пропасть"],
    ["Не допрыгиваешь, да?",
        "Попробуй от чего-\nнибудь отскочить",
        "...или от кого-нибудь"],
    ["Всё равно не\nполучается?",
        "А если так?",
        "У тебя есть\nтри попытки"],
    ["А почему ты\nмолчишь?",
        "Вроде ж не немой"]
];

globalvar firstLaunch;
ini_open("options.ini");
firstLaunch = ini_read_real("GameOptions", "firstLaunch", true);
ini_close();

globalvar playerStartX, playerStartY, playerStartHp;
playerStartX = 810;
playerStartY = -16;
playerStartHp = 10;

globalvar unlockedLevels, killedKoluchs;
// список открытых уровней
unlockedLevels = [1];
ulFileName = "unlocked_levels.nes";
if (file_exists(ulFileName))
{
    var file = file_text_open_read(ulFileName);
    var text = file_text_read_string(file);
    unlockedLevels = json_parse(text);
    file_text_close(file);
}

// список убитых колючей
killedKoluchs = array_create(0);
kkFileName = "killed_koluchs.nes";
if (file_exists(kkFileName))
{
    var file = file_text_open_read(kkFileName);
    var text = file_text_read_string(file);
    killedKoluchs = json_parse(text);
    file_text_close(file);
}
/*
ini_open("options.ini");
room_goto(ini_read_real("GameOptions", "level", rMenu));
ini_close();
*/
//room_goto(rMenu);
/*
// переменные игрока, которые
// меняются при переходе между румами
globalvar curLevel, playerHp, playerHorsp, playerVersp, playerRight, playerX, playerY,
          playerCanBounce, playerIncreasedJumpsNum;
//curLevel = rMenu;
//globalvar prevLevel = rMenu;

ini_open("options.ini");
var level = ini_read_real("GameOptions", "level", rMenu); // текущий уровень
curLevel = room_exists(level) ? level : rMenu;
playerHp = ini_read_real("PlayerVariables", "hp", 10);
playerX = ini_read_real("PlayerVariables", "x", 804);
playerY = ini_read_real("PlayerVariables", "y", 16);
playerHorsp = ini_read_real("PlayerVariables", "horsp", 0);
playerVersp = ini_read_real("PlayerVariables", "versp", 0);
playerRight = ini_read_real("PlayerVariables", "right", true);;
playerCanBounce = ini_read_real("PlayerVariables", "can_bounce", false);
playerIncreasedJumpsNum = ini_read_real("PlayerVariables", "increasedjumps_num", 0);
//enterLevelJumpTrainCount = ini_read_real("GameOptions", "enter_leveljump_count", 0);
ini_close();

room_goto(curLevel);
*/