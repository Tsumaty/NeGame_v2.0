/// @desc начальное состояние уровня
/*
if (room == rInit)
    exit;
*/
stopGrindingSound();

loadGame(string("negamesave{0}.nes", room)); // обновляем динамические объекты

with (oPlayer)
{
    updateStartVars();
    initCamera();
    
    if (room == rLevelJumpTrain)
    {
        if (deathsNumLevelJumpTrain >= 2)
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
    }
}
/*
with (oDoor)
{
    isOpen = ini_read_real("MenuOptions", string("door{0}_isopen", int64(id)), isOpen);
    if (isOpen)
    {
        isOpening = false;
        y = openPos;
        with (surface)
            y = other.surfaceOpenPos;
    }
    else
    {
        isOpening = true;
        y = closedPos;
        with (surface)
            y = other.surfaceClosedPos;
    }
}

with (oMovingFloor)
{
    arrived = ini_read_real("PlatformStates", string("platf{0}_arrived", int64(id)), arrived);
    if (arrived)
    {
        x = (maxhorsp > 0) ? movingBorderRight : movingBorderLeft;
        y = (maxversp > 0) ? movingBorderBottom : movingBorderTop;
        horsp = 0;
        versp = 0;
        maxhorsp = 0;
        maxversp = 0;
        changeDirPeriod = -1;
    }
}
*/