/// @desc проверка на наличие игрока поблизости
alarm[1] = checkPlayerPeriod;

// var nearestPlayer = instance_nearest(x, y, oPlayer);
if (!onMovingPlatform && isMoving == 0 && horsp == 0 && versp == GRAVITACCEL)
{
    with (instance_nearest(x, y, oPlayer))
    {
        if (distance_to_object(other) < other.chatDist)
        {
            if (chatChar == noone || chatChar != id)
            {
                chatChar = other.id;
                if (!other.buttonE.activated)
                    activateButtonE(other.buttonE);
            }
        }
        else if (chatChar != id && (chatChar == other.id || chatChar == noone))
        {
            isChatting = false;
            chatChar = noone;
            if (other.buttonE.activated)
                deactivateButtonE(other.buttonE);
            if (other.chatCloud.activated)
                deactivateChatCloud(other.chatCloud);
        }
    }
}
else
{
    if (buttonE.activated)
        deactivateButtonE(buttonE);
    if (chatCloud.activated)
        deactivateChatCloud(chatCloud);
    with (instance_nearest(x, y, oPlayer))
    {
        isChatting = false;
        chatChar = noone;
    }
}