/// @desc проверка смены направления
alarm[0] = changeDirPeriod;

if (canChangeDir)
{
    if (x <= movingBorderLeft || x >= movingBorderRight)
    {
        if (movesCyclically)
            maxhorsp *= -1;
        else
        {
            maxhorsp = 0;
            alarm[0] = -1; // останавливаем эту проверку
        }
        canChangeDir = false;
        alarm[1] = canChangeDirTime;
    }
    if (y <= movingBorderTop || y >= movingBorderBottom)
    {
        if (movesCyclically)
            maxversp *= -1;
        else
        {
            maxversp = 0;
            alarm[0] = -1; // останавливаем эту проверку
        }
        canChangeDir = false;
        alarm[1] = canChangeDirTime;
    }
}