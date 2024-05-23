/// @desc переход на следующий уровень
if (y < 0)
    exit;

if (room == rLevelJumpTrain && y >= room_height)
{
    // увеличиваем счётчик смертей на этом уровне
    ++deathsNumLevelJumpTrain;
    killPlayer(); // умираем
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
            newY = median(4, y + 114, 926);
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
            nextLevel = rLevel2;
            newX = 4;
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