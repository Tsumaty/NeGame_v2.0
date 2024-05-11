/// @desc функция включения диалогового облака
function activateChatCloud(chatCloud)
{
    with (chatCloud)
    {
        activated = true;
        // проигрываем анимацию с начала
        animPos = 0;
        //animSpeed = animDefaultSpeed;
        playAnim = 1;
        //playAnimForwards = true;
        // анимацию сообщения временно отключаем
        msgVisible = false;
        msgAnimPos = 0;
        playMsgAnim = 0;
        msgTimer = FPS / 4;
    }
}