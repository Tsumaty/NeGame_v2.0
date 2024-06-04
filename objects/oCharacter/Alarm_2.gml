/// @desc проверка смены направления
alarm[2] = changeDirPeriod;

if (canChangeDir &&
    ((isMoving < 0 && x <= movingBorderLeft) || (isMoving > 0 && x >= movingBorderRight)))
{
    canChangeDir = false;
    alarm[4] = canChangeDirTime;
    if (movesCyclically)
    {
        isLookingRight = !isLookingRight;
        isMoving = -isMoving;
    }
    else
    {
        isMoving = 0;
        alarm[2] = -1;
    }
}