/// @desc диалог
with (chatChar)
{
// если игрок стоит на месте
if (instance_exists(chatCloud) && other.horsp == 0 && other.versp == GRAVITACCEL &&
    !other.onMovingPlatform)
{
    chatCloud.msgAnimPos = 0; // проиграть анимацию текста с начала
    if (other.isChatting)
    {
        // номер реплики увеличивается
        // и если он превышает максимальное количество реплик персонажа
        if (++chatCloud.msgNumber >= array_length(chatCloud.msg))
        {
            // разговор прекращается
            other.isChatting = false;
            if (object_is_ancestor(object_index, oCharacter))
            {
                hasChatted = true;
                with (buttonE) image_index = 1;
            }
            --chatCloud.msgNumber;
            deactivateChatCloud(chatCloud);
            
            with (other)
            {
                if (endChatChar == chatChar)
                {
                    chatChar = noone;
                    // событие конца разговора
                    switch (endChatEvent)
                    {
                        // удаление своего диалогового облака
                        case EndChatEvents.DestroyChatCloud:
                            endChatEvent = EndChatEvents.Talk;
                            canBounce = true;
                        break;
                        
                        // говорение
                        case EndChatEvents.Talk:
                            if (instance_exists(chatCloud))
                            {
                                with (chatCloud)
                                {
                                    msg = other.chatMsgSet[0];
                                    msgNumber = 0;
                                    isLookingRight = !other.isLookingRight;
                                    x = (isLookingRight) ? other.bbox_right + 4 : other.bbox_left - 4;
                                    y = other.bbox_top;
                                }
                                activateChatCloud(chatCloud);
                                chatChar = id;
                                isChatting = true;
                                endChatChar = id;
                                endChatEvent = EndChatEvents.DestroyChatCloud;
                            }
                            canBounce = true;
                        break;
                    
                        // увеличение сылы прыжка
                        case EndChatEvents.IncreaseJumpForce:
                            jumpForce = increasedJumpForce;
                            increasedJumpsNum = 3;
                            canBounce = true;
                        break;
                    
                        // возможность отскакивать от персов
                        case EndChatEvents.CanBounce:
                            canBounce = true;
                        break;
                    }
                }
            }
        }
        // если реплики не закончились
        else
        {
            // запускается следующая
            chatCloud.msgTimer = 0;
        }
    }
    // если игрок не в разговоре
    else
    {
        // начинается разговор
        other.isChatting = true;
        // персонаж разворачивается к игроку
        if (id != other.id)
            isLookingRight = bool(sign(other.x - x));
        //chatCloud.isLookingRight = !isLookingRight;
        if (chatCloud.msgNumber >= array_length(chatCloud.msg) - 1)
            chatCloud.msgNumber = 0;
        activateChatCloud(chatCloud);
    }
}
}