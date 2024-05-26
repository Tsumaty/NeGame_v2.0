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
                            with (chatCloud) endChatEvent = EndChatEvents.DestroyChatCloud;
                            endChatChar = noone;
                            endChatEvent = EndChatEvents.Talk;
                            canBounce = true;
                        break;
                        
                        // говорение
                        case EndChatEvents.Talk:
                            if (chatCloud == noone)
                            {
                                chatCloud = instance_create_depth(bbox_right + 4, bbox_top,
                                    depth - 1, oDialogCloud);
                                with (chatCloud)
                                {
                                    msg = other.chatMsgSet[0];
                                    msgNumber = 0;
                                    isLookingRight = !other.isLookingRight;
                                    if (!isLookingRight)
                                        x = bbox_left - 4;
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
                        //break;
                    
                        // возможность отскакивать от персов
                        case EndChatEvents.CanBounce:
                            canBounce = true;
                        break;
                    }
                    endChatChar = noone;
                    endChatEvent = pointer_null;
                }
            }
        }
        else
        {
            // иначе запускается следующая реплика
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
/*
// если игрок стоит на месте
if (chatChar != noone && horsp == 0 && versp == GRAVITACCEL && !onMovingPlatform)
{
    with (chatChar.chatCloud) msgAnimPos = 0; // проиграть анимацию текста с начала
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
                if (object_is_ancestor(object_index, oCharacter))
                {
                    hasChatted = true;
                    with (buttonE) image_index = 1;
                }
                --chatCloud.msgNumber;
                deactivateChatCloud(chatCloud);
            }
            if (endChatChar == chatChar)
            {
                chatChar = noone;
                // событие конца разговора
                switch (endChatEvent)
                {
                    // говорение
                    case EndChatEvents.Talk:
                        if (chatCloud == noone)
                        {
                            chatCloud = instance_create_depth(bbox_right + 4, bbox_top, depth - 1,
                                oDialogCloud, {msg : chatMsgSet[0]});
                            chatCloud.msgNumber = 0;
                            activateChatCloud(chatCloud);
                            chatChar = id;
                            isChatting = true;
                            // удаление своего диалогового облака
                            with (chatCloud) endChatEvent = EndChatEvents.DestroyChatCloud;
                        }
                        canBounce = true;
                    break;
                    
                    // увеличение сылы прыжка
                    case EndChatEvents.IncreaseJumpForce:
                        jumpForce = increasedJumpForce;
                        increasedJumpsNum = 3;
                    //break;
                    
                    // возможность отскакивать от персов
                    case EndChatEvents.CanBounce:
                        canBounce = true;
                    break;
                }
                endChatChar = noone;
                endChatEvent = pointer_null;
            }
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
        // начинается разговор
        with (chatChar)
        {
            // персонаж разворачивается к игроку
            isLookingRight = bool(sign(other.x - x));
            //chatCloud.isLookingRight = !isLookingRight;
            if (chatCloud.msgNumber >= array_length(chatCloud.msg) - 1)
                chatCloud.msgNumber = 0;
            activateChatCloud(chatCloud);
            other.isChatting = true;
        }
    }
}
*/