/// @desc переход на следующий уровень
if (y < 0 && (room == rMenu || room == rLevel1 || room == rTest))
    exit;

if (room == rLevelJumpTrain && y >= room_height)
{
    /*++deathsNumLevelJumpTrain;
    room_restart();
    playerCanBounce = canBounce;
    playerIncreasedJumpsNum = increasedJumpsNum;*/
    deathNum = playSound(deathName, deathNum, deathMaxNum);
    initVars();
    // увеличиваем счётчик смертей на этом уровне
    if (++deathsNumLevelJumpTrain >= 2)
    {
        with (inst_7E52E5C7)
        {
            chatCloud.msg = ["Всё равно не\nполучается?",
                             "А если так?",
                             "У тебя есть\nтри попытки"];
            // усиливаем силу прыжка игрока
            other.endChatChar = id;
            other.endChatEvent = EndChatEvents.IncreaseJumpForce;
            // (жел-но ещё чтоб ноги засветились синим)
        }
    }
    else if (deathsNumLevelJumpTrain >= 1)
    {
        with (inst_7E52E5C7)
        {
            chatCloud.msg = ["Не допрыгиваешь, да?",
                             "Попробуй от чего-\nнибудь отскочить",
                             "...или от кого-нибудь"];
            // теперь игрок может отталкиваться от персонажей
            other.endChatChar = id;
            other.endChatEvent = EndChatEvents.CanBounce;
        }
    }
    exit;
}

var nextLevel, newX, newY, newHorsp, newVersp;
nextLevel = room;
newX = x;
newY = y;
newHorsp = horsp;
newVersp = versp;

switch (room)
{
    case rMenu:
        if (x >= room_width)
        {
            nextLevel = rLevelJumpTrain;
            newX = 4;
            newY = median(138, y - 114, 840);
        }
        else if (y >= room_height)
        {
            nextLevel = rTest;
            newX = median(130, x - 300, 860);
            newY = 4;
        }
    break;
        
    case rLevelJumpTrain:
        if (x < 0)
        {
            nextLevel = rMenu;
            newX = 1595;
            newY = median(4, y + 110, 922);
        }
        else if (x >= room_width)
        {
            nextLevel = rLevel1;
            newX = 4;
            newY = median(660, y - 150, 690);
        }
    break;
        
    case rLevel1:
        if (x < 0)
        {
            nextLevel = rLevelJumpTrain;
            newX = 1995;
            newY = median(810, y + 150, 840);
        }
        else if (x >= room_width)
        {
            nextLevel = rMenu;
            newX = 804;
            newY = 16;
            newHorsp = 0;
            newVersp = 0;
        }
    break;
    
    case rTest:
        if (y >= room_height)
        {
            nextLevel = rLevel1;
            newX = median(140, x - 888, 2030);
            newY = 4;
        }
    break;
}

if (nextLevel == room || !room_exists(nextLevel))
    exit;

room_goto(nextLevel);
x = newX;
y = newY;
horsp = newHorsp;
versp = newVersp;

with (oMovingFloor)
{
    if (!movesCyclically) arrived = true;
}

saveGame(string("negamesave{0}.nes", nextLevel));
/*
//prevLevel = room;
curLevel = nextLevel;
playerHp = hp;
playerX = newX;
playerY = newY;
playerHorsp = horsp * FPS;
playerVersp = versp * FPS;
playerRight = isLookingRight;
playerIncreasedJumpsNum = increasedJumpsNum;

ini_open("options.ini");
ini_write_string("GameOptions", "level", curLevel);
ini_write_real("GameOptions", "enter_leveljump_count", enterLevelJumpTrainCount);
ini_write_real("PlayerVariables", "hp", playerHp);
ini_write_real("PlayerVariables", "x", playerX);
ini_write_real("PlayerVariables", "y", playerY);
ini_write_real("PlayerVariables", "horsp", playerHorsp);
ini_write_real("PlayerVariables", "versp", playerVersp);
ini_write_real("PlayerVariables", "right", playerRight);
ini_write_real("PlayerVariables", "can_bounce", playerCanBounce);
ini_write_real("PlayerVariables", "increasedjumps_num", playerIncreasedJumpsNum);
*/