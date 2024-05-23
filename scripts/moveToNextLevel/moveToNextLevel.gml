/// @desc функция перехода на следующий уровень
// (вызывается игроком)
function moveToNextLevel(newLevel, newX, newY)
{
    if (room_exists(newLevel))
    {
        x = newX;
        y = newY;
        room_goto(newLevel);
    }
}