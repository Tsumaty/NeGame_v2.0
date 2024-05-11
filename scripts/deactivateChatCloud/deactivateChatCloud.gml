/// @desc функция отключения диалогового облака
function deactivateChatCloud(chatCloud)
{
    with (chatCloud)
    {
        activated = false;
        // проигрываем анимацию с конца (почти)
        animPos = 0.52;
        //animSpeed = animDefaultSpeed * 1.5; // немного ускоряем
        playAnim = -1;
        //playAnimForwards = false;
        msgAnimPos = 0.52; // анимацию текста тоже проигрываем с конца
        playMsgAnim = -1;
        msgTimer = -1; // отключаем включение анимации текста
    }
}