/// @desc движение по алгоритму
if (isMoving != 0)
{
    moveRight = bool(isMoving);
    moveLeft = !moveRight;
}

event_inherited();

// если прыгнул
if (jumped)
{
    if (buttonE.activated)
        deactivateButtonE(buttonE); // отключаем кнопку
    if (chatCloud.activated)
        deactivateChatCloud(chatCloud); // отключаем облако
    // игрок с нами больше не разговаривает
    with (oPlayer)
    {
        if (chatChar == other.id)
        {
            isChatting = false;
            chatChar = noone;
        }
    }
}

buttonE.hspeed = x - xprevious;
buttonE.vspeed = y - yprevious;
chatCloud.isLookingRight = !isLookingRight;
chatCloud.x = (isLookingRight) ? bbox_left - 4 : bbox_right + 4;