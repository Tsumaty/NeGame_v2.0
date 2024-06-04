/// @desc функция отключения диалогового облака
function deactivateChatCloud(chatCloud)
{
    with (chatCloud)
    {
        activated = false;
        // проигрываем анимацию с конца (почти)
        animPos = 0.52;
        playAnim = -1;
        // анимацию текста тоже проигрываем с конца
        msgAnimPos = 0.52;
        playMsgAnim = -1;
        // отключаем включение анимации текста
        msgTimer = -1;
    }
}