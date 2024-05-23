/// @desc функция включения диалогового облака
function activateChatCloud(chatCloud)
{
    with (chatCloud)
    {
        activated = true;
        // проигрываем анимацию с начала
        animPos = 0;
        playAnim = 1;
        // анимацию сообщения временно отключаем
        msgVisible = false;
        msgAnimPos = 0;
        playMsgAnim = 0;
        msgTimer = FPS / 4;
    }
}