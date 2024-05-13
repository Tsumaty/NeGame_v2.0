/// @desc проверка на наличие игрока поблизости
alarm[1] = checkPlayerPeriod;

if (!onMovingPlatform && isMoving == 0 && horsp == 0 && versp == GRAVITACCEL)
{
    var nearestPlayer = instance_nearest(x, y, oPlayer);
    if (nearestPlayer != noone)
    {
        if (distance_to_object(nearestPlayer) < chatDist)
        {
            nearestPlayer.chatChar = id;
            if (!buttonE.activated)
                activateButtonE(buttonE);
        }
        else if (nearestPlayer.chatChar == id || nearestPlayer.chatChar == noone)
        {
            nearestPlayer.isChatting = false;
            nearestPlayer.chatChar = noone;
            if (buttonE.activated)
                deactivateButtonE(buttonE);
            if (chatCloud.activated)
                deactivateChatCloud(chatCloud);
        }
    }
}