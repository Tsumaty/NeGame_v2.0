/// @desc диалог
// если игрок стоит на месте
if (chatChar != noone && horsp == 0 && versp == GRAVITACCEL && !onMovingPlatform)
{
    /*// ближайший персонаж
    //chatChar = instance_nearest(x, y, oCharacter);
    // если он существует, не двигается и достаточно близко
    if (chatChar && chatChar.horsp == 0 && chatChar.versp == GRAVITACCEL && !chatChar.onMovingPlatform
        && !chatChar.isMoving && distance_to_object(chatChar) < chatChar.chatDist)
    {*/
    chatChar.chatCloud.msgAnimPos = 0; // проиграть анимацию текста с начала
    // если игрок уже разговаривает
    if (isChatting)
    {
        // номер реплики увеличивается
        // и если он превышает максимальное количество реплик персонажа
        if (++chatChar.chatCloud.msgNumber >= array_length(chatChar.chatCloud.msg))
        {
            // разговор прекращается
            isChatting = false;
            with (chatChar)
            {
                hasChatted = true;
                --chatCloud.msgNumber;
                deactivateChatCloud(chatCloud);
                with (buttonE) image_index = 1;
            }
            if (endChatChar == chatChar)
            {
                switch (endChatEvent)
                {
                    case EndChatEvents.IncreaseJumpForce:
                        jumpForce = increasedJumpForce;
                        increasedJumpsNum = 3;
                    //break;
                    
                    case EndChatEvents.CanBounce:
                        canBounce = true;
                    break;
                }
            }
            chatChar = noone;
        }
        else
        {
            // иначе запускается следующая реплика
            chatChar.chatCloud.msgTimer = 0;
        }
    }
    // если игрок не в разговоре
    else
    {
        // персонаж разворачивается к игроку
        chatChar.isLookingRight = bool(sign(x - chatChar.x));
        // начинается разговор
        with (chatChar)
        {
            //chatCloud.isLookingRight = !isLookingRight;
            if (chatCloud.msgNumber == array_length(chatCloud.msg) - 1)
                chatCloud.msgNumber = 0;
            activateChatCloud(chatCloud);
        }
        isChatting = true;
    }
    //}
}