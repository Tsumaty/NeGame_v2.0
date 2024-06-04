/// @desc проверка смены направления
alarm[0] = changeDirPeriod;

if (canChangeDir)
{
    if ((maxhorsp < 0 && x <= movingBorderLeft) || (maxhorsp > 0 && x >= movingBorderRight))
    {
        canChangeDir = false;
        alarm[1] = canChangeDirTime;
        if (movesCyclically)
        {
            maxhorsp *= -1;
        }
        else
        {
            maxhorsp = 0;
        }
    }
    if ((maxversp < 0 && y <= movingBorderTop) || (maxversp > 0 && y >= movingBorderBottom))
    {
        canChangeDir = false;
        alarm[1] = canChangeDirTime;
        if (movesCyclically)
        {
            maxversp *= -1;
        }
        else
        {
            maxversp = 0;
        }
    }
}